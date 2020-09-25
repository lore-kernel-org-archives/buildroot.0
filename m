From: Andreas Naumann <dev@andin.de>
Date: Fri, 25 Sep 2020 15:12:28 +0200
Subject: [Buildroot] [PATCH] Makefile: properly account for custom tags
 in BR2_VERSION_FULL
In-Reply-To: <20200720115958.2564971-1-thomas.petazzoni@bootlin.com>
References: <20200720115958.2564971-1-thomas.petazzoni@bootlin.com>
Message-ID: <5d87a55e-a9b9-ec7f-7c67-499e57a1e45c@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

i now realize this change conflicts with my local hack, which produced 
something like this in os-release
VERSION=2020.02.4 (<custom overlay version>-gxxx)

I realized this with a line
BR2_VERSION_FULL += ($(OVERLAY_VERSION)$(shell 
$(TOPDIR)/support/scripts/setlocalversion $(BR2_EXTERNAL_OVERLAY_PATH)) 
in the external.mk file of an overlay.

So maybe this is hacky, but the point is that I didnt want to change 
that the VERSION in os-release mainly corresponds to the NAME line above 
it. And I dont want to change NAME in os-release either, full credit 
goes to Buildroot!

This is no complaint, just an input for thought.

In addition I just found 
https://www.freedesktop.org/software/systemd/man/os-release.html which 
says that VERSION should be "A string identifying the operating system 
version, excluding any OS name information...". This may be broken 
unintentionally when allowing custom tag names (which is why I actually 
stumbled over the issue).


best regards,
Andreas


On 20.07.20 13:59, Thomas Petazzoni wrote:
> BR2_VERSION_FULL is currently defined as follows:
> 
>    BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
> 
> This BR2_VERSION_FULL value then gets used as the "VERSION" variable
> in the /etc/os-release file.
> 
> The logic of "setlocalversion" is that if it is exactly on a tag, it
> returns nothing.
> 
> If it is on a tag + a number of commits, then it returns only
> -XYZ-gABC where XYZ is the number of commits since the last tag, and
> ABC the git commit hash (these are extracted from git describe).
> 
> This output then gets concatenated to BR2_VERSION which gives
> something like 2020.05 or 2020.05-00123-g5bc6a.
> 
> The issue is that when you're on a tag specific to your project, which
> is not a Buildroot YYYY.MM tag, then the output of setlocalversion is
> empty, and all you get as VERSION in os-release is $(BR2_VERSION)
> which is not really nice. Worse, if you have another non-official
> Buildroot tag between the last official Buildroot tag/version and
> where you are, you will get $(BR2_VERSION)-XYZ-gABC, but XYZ will not
> correspond to the number of commits since BR2_VERSION, but since the
> last tag that "git describe" as found, which is clearly incorrect.
> 
> Here is an example: you're on master, "make print-version" (which
> displays BR2_VERSION_FULL) will show:
> 
> $ make print-version
> 2020.08-git-00758-gc351877a6e
> 
> So far so good. Now, you create a tag say 5 commits "before" master,
> and show BR2_VERSION_FULL again:
> 
> $ git tag -a -m "dummy tag" dummy-tag HEAD~5
> $ make print-version
> 2020.08-git-00005-gc351877a6e
> 
> This makes you believe you are 5 commits above 2020.08, which is
> absolutely wrong.
> 
> So this commit simplifies the logic of setlocalversion to simply
> return what "git describe" provides, and not prepend $(BR2_VERSION) in
> the main Makefile. Since official Buildroot tags match official
> Buildroot version names, you get the same output when you're on an
> official Buildroot tag, or some commits above a Buildroot tag. An in
> other cases, you get a sensible output. The logic is also adjusted for
> the Mercurial case.
> 
> In the above situation, with this commit applied, we get:
> 
> $ make print-version
> dummy-tag-6-g6258cdddeb
> 
> (6 commits instead of 5 as we have this very commit applied, but at
> least it's 6 commits on top of the dummy-tag)
> 
> Finally, if you're not using a version control system, setlocalversion
> was already returning nothing, so in this case, the Makefile simply
> sets BR2_VERSION_FULL to BR2_VERSION to preserve this behavior.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   Makefile                        |  8 +++++++-
>   support/scripts/setlocalversion | 23 ++++++++++-------------
>   2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 12812526c7..036d4aa5c4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -113,7 +113,13 @@ DATE := $(shell date +%Y%m%d)
>   
>   # Compute the full local version string so packages can use it as-is
>   # Need to export it, so it can be got from environment in children (eg. mconf)
> -export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
> +
> +BR2_LOCALVERSION := $(shell $(TOPDIR)/support/scripts/setlocalversion)
> +ifeq ($(BR2_LOCALVERSION),)
> +export BR2_VERSION_FULL := $(BR2_VERSION)
> +else
> +export BR2_VERSION_FULL := $(BR2_LOCALVERSION)
> +endif
>   
>   # List of targets and target patterns for which .config doesn't need to be read in
>   noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
> diff --git a/support/scripts/setlocalversion b/support/scripts/setlocalversion
> index b39b751f03..e04c955d9e 100755
> --- a/support/scripts/setlocalversion
> +++ b/support/scripts/setlocalversion
> @@ -19,19 +19,14 @@ cd "${1:-.}" || usage
>   # Check for git and a git repo.
>   if head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
>   
> -	# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore it,
> -	# because this version is defined in the top level Makefile.
> -	if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
> -
> -		# If we are past a tagged commit (like "v2.6.30-rc5-302-g72357d5"),
> -		# we pretty print it.
> -		if atag="`git describe 2>/dev/null`"; then
> -			echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
> -
> -		# If we don't have a tag at all we print -g{commitish}.
> -		else
> -			printf '%s%s' -g $head
> -		fi
> +	atag="`git describe 2>/dev/null`"
> +
> +	# Show -g<commit> if we have no tag, or just the tag
> +	# otherwise.
> +	if [ -z "${atag}" ] ; then
> +		printf "%s%s" -g ${head}
> +	else
> +		printf ${atag}
>   	fi
>   
>   	# Is this git on svn?
> @@ -60,6 +55,8 @@ if hgid=`HGRCPATH= hg id --id --tags 2>/dev/null`; then
>   	if [ -z "$tag" -o "$tag" = tip ]; then
>   		id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
>   		printf '%s%s' -hg "$id"
> +	else
> +		printf ${tag}
>   	fi
>   
>   	# Are there uncommitted changes?
> 
