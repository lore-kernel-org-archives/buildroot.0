From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Apr 2016 23:04:41 +0200
Subject: [Buildroot] [PATCH 4/4 v2] core/pkg-infra: download git
 submodules if the package wants them
In-Reply-To: <5702440F.5030707@barix.com>
References: <cover.1459541702.git.yann.morin.1998@free.fr>
 <8373904cdf1fee9724d6834b56efaa706a92fc31.1459541702.git.yann.morin.1998@free.fr>
 <CAFt09wNKtUSyEcQzL1o+p+f5m_bPwctndV8OKrQOXBqQBmsCpQ@mail.gmail.com>
 <5702440F.5030707@barix.com>
Message-ID: <20160404210441.GA3500@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aleksandar, All,

On 2016-04-04 12:38 +0200, Aleksandar Simeonov spake thusly:
> Have you checked that this patch does not affect the download of packages
> not using GIT? For me it breaks the download of anything using WGET, for
> example dosfstools:

Yes, I just retried right now, and I can at least download packages
using:
  - wget (gcc, binutils... and dosfstools)
  - mercurial (eigen)
  - git with no submodules (opkg)
  -git with sub-modules (a local package to test submodules)

and they all downloaded fine, especially dosfstools:

    >>> dosfstools 3.0.28 Downloading
    --2016-04-04 22:59:53--  https://github.com/dosfstools/dosfstools/releases/download/v3.0.28/dosfstools-3.0.28.tar.xz
    Connecting to 127.0.0.1:8080... connected.
    Proxy request sent, awaiting response... 302 Found
    Location: https://github-cloud.s3.amazonaws.com/releases/26462150/579f8e7e-fb7e-11e4-88ca-bc3c6ebe56b6.xz?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAISTNZFOVBIJMK3TQ%2F20160404%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20160404T205953Z&X-Amz-Expires=300&X-Amz-Signature=20455f9da857c4f99c4fc5dd74a12238c53958c728cf469bdc80cb0e7c69e272&X-Amz-SignedHeaders=host&actor_id=0&response-content-disposition=attachment%3B%20filename%3Ddosfstools-3.0.28.tar.xz&response-content-type=application%2Foctet-stream [following]
    --2016-04-04 22:59:53--  https://github-cloud.s3.amazonaws.com/releases/26462150/579f8e7e-fb7e-11e4-88ca-bc3c6ebe56b6.xz?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAISTNZFOVBIJMK3TQ%2F20160404%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20160404T205953Z&X-Amz-Expires=300&X-Amz-Signature=20455f9da857c4f99c4fc5dd74a12238c53958c728cf469bdc80cb0e7c69e272&X-Amz-SignedHeaders=host&actor_id=0&response-content-disposition=attachment%3B%20filename%3Ddosfstools-3.0.28.tar.xz&response-content-type=application%2Foctet-stream
    Connecting to 127.0.0.1:8080... connected.
    Proxy request sent, awaiting response... 200 OK
    Length: 82980 (81K) [application/octet-stream]
    Saving to: ?/home/ymorin/dev/buildroot/O/build/.dosfstools-3.0.28.tar.xz.wMTT4G/output?

    100%[================================================================>] 82,980       228KB/s   in 0.4s

    2016-04-04 22:59:55 (228 KB/s) - ?/home/ymorin/dev/buildroot/O/build/.dosfstools-3.0.28.tar.xz.wMTT4G/output? saved [82980/82980]

    dosfstools-3.0.28.tar.xz: OK (sha256: ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2)

> >>> dosfstools 3.0.28 Downloading
> BACKEND=wget

We have nothing in Buildroot that outputs this "BACKEND" string.

> --2016-04-04 12:28:06--  http://package/dosfstools//dosfstools.hash
> Resolving package (package)... failed: Name or service not known.
> wget: unable to resolve host address ?package?
> BACKEND=wget
> --2016-04-04 12:28:06--  http://package/dosfstools//dosfstools.hash
> Resolving package (package)... failed: Name or service not known.
> wget: unable to resolve host address ?package?
> make[1]: *** [/home/alex/workspace/BR2_merge/buildroot/output/build/dosfstools-3.0.28/.stamp_downloaded]
> Error 1
> make: *** [_all] Error 2
> 
> I will try to find out what is wrong, but I strongly suspect it is the
> ${recurse} option we add in the command.

${recurse} should only be set for a git download. And even if it was
passed to the wget backend, you'd have a failure in the backend, because
it does not know the -r option.

However, what you report is probably due to somthing else. Have you
applied on top of local changes? Can you reproduce the error without
this patchset?

Regards,
Yann E. MORIN.

> Cheers
> 
> Alex
> 
> 
> 
> On 4/2/16 7:01 AM, Matthew Weber wrote:
> >All,
> >
> >On Fri, Apr 1, 2016 at 3:25 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >>Add a new package variable that packages can set to specify that they
> >>need git submodules.
> >>
> >>Only accept this option if the download method is git, as we can not get
> >>submodules via an http download (via wget).
> >>
> >>Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >>Cc: Aleksandar Simeonov <aleksandar@barix.com>
> >Tested-by: Matt Weber <matt@thewebers.ws>
> >Reviewed-by: Matt Weber <matt@thewebers.ws>
> >
> >>---
> >>Changes v1 -> v2:
> >>   - properly accept the -r in the download wrapper  (Aleksandar)
> >>---
> >>  package/pkg-download.mk     | 1 +
> >>  package/pkg-generic.mk      | 8 ++++++++
> >>  support/download/dl-wrapper | 7 ++++---
> >>  3 files changed, 13 insertions(+), 3 deletions(-)
> >>
> >>diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> >>index 1332e66..2324a07 100644
> >>--- a/package/pkg-download.mk
> >>+++ b/package/pkg-download.mk
> >>@@ -76,6 +76,7 @@ export BR_NO_CHECK_HASH_FOR =
> >>  define DOWNLOAD_GIT
> >>         $(EXTRA_ENV) $(DL_WRAPPER) -b git \
> >>                 -o $(DL_DIR)/$($(PKG)_SOURCE) \
> >>+               $(if $($(PKG)_GIT_SUBMODULES),-r) \
> >>                 $(QUIET) \
> >>                 -- \
> >>                 $($(PKG)_SITE) \
> >>diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> >>index 3904c09..fee7eb0 100644
> >>--- a/package/pkg-generic.mk
> >>+++ b/package/pkg-generic.mk
> >>@@ -453,6 +453,14 @@ ifndef $(2)_SITE_METHOD
> >>   endif
> >>  endif
> >>
> >>+# Do not accept to download git submodule if not using the git method
> >>+ifneq ($$($(2)_GIT_SUBMODULES),)
> >>+ ifneq ($$($(2)_SITE_METHOD),git)
> >>+  $$(error $(2) declares having git sub-modules, but does not use the \
> >>+          'git' method (uses '$$($(2)_SITE_METHOD)' instead))
> >>+ endif
> >>+endif
> >>+
> >>  ifeq ($$($(2)_SITE_METHOD),local)
> >>  ifeq ($$($(2)_OVERRIDE_SRCDIR),)
> >>  $(2)_OVERRIDE_SRCDIR = $$($(2)_SITE)
> >>diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> >>index ef2d872..f944b71 100755
> >>--- a/support/download/dl-wrapper
> >>+++ b/support/download/dl-wrapper
> >>@@ -21,15 +21,16 @@ set -e
> >>
> >>  main() {
> >>      local OPT OPTARG
> >>-    local backend output hfile quiet
> >>+    local backend output hfile recurse quiet
> >>
> >>      # Parse our options; anything after '--' is for the backend
> >>-    while getopts :hb:o:H:q OPT; do
> >>+    while getopts :hb:o:H:rq OPT; do
> >>          case "${OPT}" in
> >>          h)  help; exit 0;;
> >>          b)  backend="${OPTARG}";;
> >>          o)  output="${OPTARG}";;
> >>          H)  hfile="${OPTARG}";;
> >>+        r)  recurse="-r";;
> >>          q)  quiet="-q";;
> >>          :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
> >>          \?) error "unknown option '%s'\n" "${OPTARG}";;
> >>@@ -82,7 +83,7 @@ main() {
> >>      # If the backend fails, we can just remove the temporary directory to
> >>      # remove all the cruft it may have left behind. Then we just exit in
> >>      # error too.
> >>-    if ! "${OLDPWD}/support/download/${backend}" ${quiet} "${tmpf}" "${@}"; then
> >>+    if ! "${OLDPWD}/support/download/${backend}" ${quiet} ${recurse} "${tmpf}" "${@}"; then
> >>          rm -rf "${tmpd}"
> >>          exit 1
> >>      fi
> >>--
> >>1.9.1
> >>
> >>_______________________________________________
> >>buildroot mailing list
> >>buildroot at busybox.net
> >>http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
