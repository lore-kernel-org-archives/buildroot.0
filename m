From: Touhtarian, Eric <etouhtarian@distech-controls.com>
Date: Fri, 2 Oct 2020 13:07:39 +0000
Subject: [Buildroot] TR: [PATCH 1/1] Set external version into os-release
In-Reply-To: <20201001205054.GH11621@scaer>
References: <20200917153243.8745-1-etouhtarian@distech-controls.com>
 <DM6PR01MB4137169BE8F2D5C93A2D89DA8A300@DM6PR01MB4137.prod.exchangelabs.com>,
 <20201001205054.GH11621@scaer>
Message-ID: <DM6PR01MB413787A929C5DC1300BC0BA38A310@DM6PR01MB4137.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Actually, we have in our structure a repo containing our external tree and submodule of buildroot.
So we have buildroot version but we would prefer get our "main repo" in /Etc/os-release

Regards
Eric

________________________________________
De : Yann E. MORIN <yann.morin.1998@free.fr>
Envoy? : jeudi 1 octobre 2020 22:50
? : Touhtarian, Eric <etouhtarian@distech-controls.com>
Cc?: buildroot at buildroot.org <buildroot@buildroot.org>
Objet : Re: [Buildroot] TR: [PATCH 1/1] Set external version into os-release 
?
Eric, All,

Thanks again for your contribution. :-)

On 2020-10-01 14:49 +0000, Touhtarian, Eric via buildroot spake thusly:
> Signed-off-by: Eric Touhtarian <etouhtarian@distech-controls.com>
> ---
>? Makefile??????????????????????? | 16 ++++++++++++++--
>? support/scripts/setlocalversion | 15 ++++++++++++---
>? 2 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index b2afe5bcfb..e6693d2f45 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -111,9 +111,12 @@ CONFIG_CONFIG_IN = Config.in? CONFIG = support/kconfig? DATE := $(shell date +%Y%m%d)
>? 
> +define setlocalversion
> +$(shell $(TOPDIR)/support/scripts/setlocalversion $(1) $(2)) endef
>? # Compute the full local version string so packages can use it as-is? # Need to export it, so it can be got from environment in children (eg. mconf) -export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
> +export BR2_VERSION_FULL := $(BR2_VERSION)$(call setlocalversion)

This patch is also badly mangled. Please use git send-email.

Also, this part of the Makefile has silghtly changed recently, with
commit 98c99556e3e (Makefile: properly account for custom tags in
BR2_VERSION_FULL), that was applied two months ago (July 27th).

>? # List of targets and target patterns for which .config doesn't need to be read in? noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \ @@ -740,6 +743,14 @@ host-finalize: $(PACKAGES) $(HOST_DIR) $(HOST_DIR_SYMLINK)
>? .PHONY: staging-finalize
>? staging-finalize: $(STAGING_DIR_SYMLINK)
>? 
> +define set-external-info
> +index=1; \
> +$(foreach ext, $(BR2_EXTERNAL_DIRS), \
> +???? echo "EXTERNAL_$${index}_PATH=$(ext)"; \
> +???? echo "EXTERNAL_$${index}_VERSION=\"$(call setlocalversion,"--unmodify-version", $(ext))\""; \
> +???? index=$$(expr $$index + 1); )

The set of fields in the os-release file is predefined by the spec:

??? https://urldefense.com/v3/__https:/www.freedesktop.org/software/systemd/man/os-release.html__;!!Po4YltK3bPMkYw!gJ8RpNC2442nn2dlFXtaaPWmgtb78Sfin82rlcGqrPl8D6ajSpImfMJ2JI9g3iGNiZcEiyHb$ 

Extensions are allowed, but "[i]t is highly recommended to prefix new
fields with an OS specific name in order to avoid name clashes". In our
case, that prefix would probably have to be 'BR2_EXTERNAL_'.

Still, I am not 100% sure we want that... What would be the use-case to
have the versions of all br2-external trees?

Usually, there is a "main" repository, which has buildroot and all
br2-external trees as sub-modules, or in a manifest file. The version
of that "main: repo is then sufficient to derive the versions of all
the others.

In which case it would be simple to provide a post-build script that
basically echoes that version in os-release.

If you can come up with a good commit log that makes a point that the
versions of all br2-external trees is important, I would not mind having
it too much either.

Ergo, at your keyboard, and go for some poesy. ;-)

[--SNIP--]
> diff --git a/support/scripts/setlocalversion b/support/scripts/setlocalversion index b39b751f03..459b4765fa 100755
> --- a/support/scripts/setlocalversion
> +++ b/support/scripts/setlocalversion
> @@ -10,10 +10,16 @@
>? #
>? 
>? usage() {
> -???? echo "Usage: $0 [srctree]" >&2
> +???? echo "Usage: $0 [--unmodify-version] [srctree]" >&2

What is the purpose of this new option? You need to explain it in the
commit log, and a comment in the script would bbe nice too.

>??????? exit 1
>? }
>? 
> +original_ver=false
> +if test "$1" = "--unmodify-version"; then
> +???? original_ver=true
> +???? shift
> +fi
> +
>? cd "${1:-.}" || usage
>? 
>? # Check for git and a git repo.
> @@ -26,8 +32,11 @@ if head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
>??????????????? # If we are past a tagged commit (like "v2.6.30-rc5-302-g72357d5"),
>??????????????? # we pretty print it.
>??????????????? if atag="`git describe 2>/dev/null`"; then
> -???????????????????? echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
> -
> +???????????????????? if $original_ver; then
> +???????????????????????????? printf $atag
> +???????????????????? else
> +???????????????????????????? echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
> +???????????????????? fi

This part of the scripr also changed with commit 98c99556e3e, and so
your '--unmodify-version' option is maybe no longer required.

I've now marked your patch as "changes requested" in patchwork.

Regards,
Yann E. MORIN.

>??????????????? # If we don't have a tag at all we print -g{commitish}.
>??????????????? else
>??????????????????????? printf '%s%s' -g $head
> --
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> https://urldefense.com/v3/__http:/lists.busybox.net/mailman/listinfo/buildroot__;!!Po4YltK3bPMkYw!gJ8RpNC2442nn2dlFXtaaPWmgtb78Sfin82rlcGqrPl8D6ajSpImfMJ2JI9g3iGNiSQh4ynY$ 

-- 
.-----------------.--------------------.------------------.--------------------.
|? Yann E. MORIN? | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software? Designer | \ / CAMPAIGN???? |? ___?????????????? |
| +33 561 099 427 `------------.-------:? X? AGAINST????? |? \e/? There is no? |
| https://urldefense.com/v3/__http:/ymorin.is-a-geek.org/__;!!Po4YltK3bPMkYw!gJ8RpNC2442nn2dlFXtaaPWmgtb78Sfin82rlcGqrPl8D6ajSpImfMJ2JI9g3iGNiXnpP7mO$? | _/*\_ | / \ HTML MAIL??? |?? v?? conspiracy.? |
'------------------------------^-------^------------------^--------------------'
