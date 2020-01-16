From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jan 2020 16:29:48 +0100
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
In-Reply-To: <534f269547ead6d86e7a571978b54d79cd24cd0d.camel@orolia.com>
References: <20200115203753.12110-1-yann.morin.1998@free.fr>
 <534f269547ead6d86e7a571978b54d79cd24cd0d.camel@orolia.com>
Message-ID: <20200116152948.GH22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2020-01-16 09:11 +0000, Nicolas Carrier spake thusly:
> Hello Yann,
> One small remark, to be able to reproduce the build, on top of this
> mechanism, there should be:
> * a way to store the actual VCS revision used for the build (to at
> least know what was just built!)
> * a way to force the build to re-use a particular set of revisions
> 
> That's features not easy to get right, but which are already handled by
> tools like google's repo (or partly, by git submodules).

Well, that's already the case with Buildroot: setting _VERSION is what
guarantees you can rebuild the same thing again and again.

I don't know much of repo, but from what I grabbed, it uses a manifest
to identify packages, where they are, what changesset to use (and some
less interesting stuff). This is exactly what one has in Buildroot's
.mk files. The manifest is just builtin to the buildsystem.

> That's part of why I don't think that this kind of feature is a good
> thing to integrate into buildroot. I prefer to delegate it to tools
> meant for that (using a mix of local packages and OVERRIDE).

You don't need to convince me. But apparently, some people like to aim
at their feet with a loaded gun, just in case.. ;-)

On a more serious note, as Thomas explained, some people have expressed
the need for using a branch, and that a build would alkways pick the
latest version of that branch.

Of course, that means non-reproducibility.

I am even afraid that those people do not realise that they also need to
update the _VERSION in their packages once they want to tag and release
versions. And this has virtually no overhead in practice (damn...
copy-pasting a sha1 is not that complex. It would even be possible to
have a script that does it automatically...).

> And like said before, I think it's preferable to have a optional
> feature to prevent branches from being used, making the build fail.

Yeah, that was one of the comment by Thomas, and it is a good extension
to the transient mehcanism: either one uses a stable ref, or one needs
to explicitly identify it as transient.

Thanks for the feedback.

Regards,
Yann E. MORIN.

> On Wed, 2020-01-15 at 21:37 +0100, Yann E. MORIN wrote:
> > NOTE: NOT TO BE COMMITTED!
> > 
> > This patch is a proof of concept for the transient download
> > mechanism,
> > that would help using branches as versions, and keep using the head
> > of
> > the branch each time a build started.
> > 
> > A package declares its download as transient with:
> >   FOO_DOWNLOAD_TRANSIENT = YES
> > 
> > this means that the download infra will not use any already
> > downloaded
> > archive, and will instead always download it as if missing.
> > 
> > Since the check is done in the download wrapper, we have no TOCTOU
> > race
> > in case two bulds would attempt the same transient download: the
> > archive
> > is only replaced ato,mically as usual.
> > 
> > So, if the package uses a branch as version, the branch's HEAD at
> > that
> > very moment will be redownloaded.
> > 
> > This stil has the drawback that two builds in parallel may get
> > slightly
> > different content for the same branch, and the first build could end
> > up
> > using the download of the second build:
> > 
> >     build-1             build-2
> > 
> >     download
> >     |                   download
> >     |                   |
> >     save to dl-dir      |
> >     [...]               save to dl-dir
> >     extract
> > 
> > Furthermore, even with a single build, it might get what it expects:
> > 
> >     developer-1         developer-2
> > 
> >     git push branch
> >     trigger CI          git push branch
> >     [...]
> >     download
> > 
> > In that case the build of delopper-1 would get the code of
> > developper-2
> > who pushed on the same branch.
> > 
> > For people who are aiming at their feet, we're now providing them
> > with
> > a loaded gun. ;-]
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Vincent Fazio <vfazio@xes-inc.com>
> > Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
> > Cc: Chris Packham <judge.packham@gmail.com>
> > Cc: Nicolas Carrier <nicolas.carrier@orolia.com>
> > Cc: Adam Duskett <aduskett@gmail.com>
> > ---
> >  docs/manual/adding-packages-generic.txt | 16 +++++++++++++---
> >  package/busybox/busybox.mk              |  1 +
> >  package/pkg-download.mk                 |  1 +
> >  package/pkg-generic.mk                  |  8 +-------
> >  support/download/dl-wrapper             |  8 +++++---
> >  5 files changed, 21 insertions(+), 13 deletions(-)
> > 
> > diff --git a/docs/manual/adding-packages-generic.txt
> > b/docs/manual/adding-packages-generic.txt
> > index baa052e31c..afffb09bc8 100644
> > --- a/docs/manual/adding-packages-generic.txt
> > +++ b/docs/manual/adding-packages-generic.txt
> > @@ -206,12 +206,14 @@ information is (assuming the package name is
> > +libfoo+) :
> >    ** a tag for a git tree +LIBFOO_VERSION = v0.1.2+
> >  +
> >  .Note:
> > -Using a branch name as +FOO_VERSION+ is not supported, because it
> > does
> > -not and can not work as people would expect it should:
> > +Using a branch name as +FOO_VERSION+, although technically possible,
> > +is highly discouraged, because it does not and can not work as
> > people
> > +would expect it should:
> >  +
> >    1. due to local caching, Buildroot will not re-fetch the
> > repository,
> >       so people who expect to be able to follow the remote repository
> > -     would be quite surprised and disappointed;
> > +     would be quite surprised and disappointed (but see
> > +     +LIBFOO_DOWNLOAD_TRANSIENT+, later);
> >    2. because two builds can never be perfectly simultaneous, and
> > because
> >       the remote repository may get new commits on the branch
> > anytime,
> >       two users, using the same Buildroot tree and building the same
> > @@ -342,6 +344,14 @@ not and can not work as people would expect it
> > should:
> >    submodules when they contain bundled libraries, in which case we
> >    prefer to use those libraries from their own package.
> > 
> > +* +LIBFOO_DOWNLOAD_TRANSIENT+ can be set to +YES+ or +NO+ (the
> > default).
> > +  If set to +YES+, the download for that package will be attempted
> > at
> > +  every build; any already downloaded archive is ignored as if
> > missing.
> > +  This may help when a branch is specified in +LIBFOO_VERSION+, and
> > the
> > +  head/tip of the branch is to be built, like a CI pipeline would
> > need
> > +  for example. This still suffers from the other issues listed above
> > +  about using branches, though.
> > +
> >  * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
> >    (directories) that tar must strip from file names on extraction.
> >    The tarball for most packages has one leading component named
> > diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> > index 6283bc96ea..ee17febe48 100644
> > --- a/package/busybox/busybox.mk
> > +++ b/package/busybox/busybox.mk
> > @@ -9,6 +9,7 @@ BUSYBOX_SITE = http://www.busybox.net/downloads
> >  BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
> >  BUSYBOX_LICENSE = GPL-2.0
> >  BUSYBOX_LICENSE_FILES = LICENSE
> > +BUSYBOX_DOWNLOAD_TRANSIENT = YES
> > 
> >  define BUSYBOX_HELP_CMDS
> >         @echo '  busybox-menuconfig     - Run BusyBox menuconfig'
> > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> > index de619ba90a..c3a98ce7b0 100644
> > --- a/package/pkg-download.mk
> > +++ b/package/pkg-download.mk
> > @@ -108,6 +108,7 @@ define DOWNLOAD
> >                 -n '$($(2)_BASENAME_RAW)' \
> >                 -N '$($(2)_RAWNAME)' \
> >                 -o '$($(2)_DL_DIR)/$(notdir $(1))' \
> > +               $(if $($(2)_DOWNLOAD_TRANSIENT),-F) \
> >                 $(if $($(2)_GIT_SUBMODULES),-r) \
> >                 $(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u
> > $(uri)) \
> >                 $(QUIET) \
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 268d999efb..7c2e9db604 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -158,13 +158,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
> >         @$(call step_start,download)
> >         $(call prepare-per-package-
> > directory,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
> >         $(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call
> > $(hook))$(sep))
> > -# Only show the download message if it isn't already downloaded
> > -       $(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
> > -               if test ! -e $($(PKG)_DL_DIR)/`basename $$p` ; then \
> > -                       $(call MESSAGE,"Downloading") ; \
> > -                       break ; \
> > -               fi ; \
> > -       done
> > +       @$(call MESSAGE,"Downloading") ; \
> >         $(foreach p,$($(PKG)_ALL_DOWNLOADS),$(call
> > DOWNLOAD,$(p),$(PKG))$(sep))
> >         $(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call
> > $(hook))$(sep))
> >         $(Q)mkdir -p $(@D)
> > diff --git a/support/download/dl-wrapper b/support/download/dl-
> > wrapper
> > index 3315bd410e..ab22ca7e4f 100755
> > --- a/support/download/dl-wrapper
> > +++ b/support/download/dl-wrapper
> > @@ -21,11 +21,12 @@ export
> > BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:ru:qf:e"
> > 
> >  main() {
> >      local OPT OPTARG
> > -    local backend output hfile recurse quiet rc
> > +    local backend output hfile recurse quiet rc force
> >      local -a uris
> > 
> >      # Parse our options; anything after '--' is for the backend
> > -    while getopts ":c:d:D:o:n:N:H:rf:u:q" OPT; do
> > +    force=false
> > +    while getopts ":c:d:D:o:n:N:H:rf:u:qF" OPT; do
> >          case "${OPT}" in
> >          c)  cset="${OPTARG}";;
> >          d)  dl_dir="${OPTARG}";;
> > @@ -38,6 +39,7 @@ main() {
> >          f)  filename="${OPTARG}";;
> >          u)  uris+=( "${OPTARG}" );;
> >          q)  quiet="-q";;
> > +        F)  force=true;;
> >          :)  error "option '%s' expects a mandatory argument\n"
> > "${OPTARG}";;
> >          \?) error "unknown option '%s'\n" "${OPTARG}";;
> >          esac
> > @@ -67,7 +69,7 @@ main() {
> >      # - matches all its hashes: do not download it again and exit
> > promptly
> >      # - fails at least one of its hashes: force a re-download
> >      # - there's no hash (but a .hash file): consider it a hard error
> > -    if [ -e "${output}" ]; then
> > +    if ! ${force} && [ -e "${output}" ]; then
> >          if support/download/check-hash ${quiet} "${hfile}"
> > "${output}" "${output##*/}"; then
> >              exit 0
> >          elif [ ${?} -ne 2 ]; then
> > --
> > 2.20.1
> > 
> > ATTENTION: This email came from an external source.
> > Do not open attachments or click on links from unknown senders or
> > unexpected emails.
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
