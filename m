From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 18 Oct 2019 20:26:22 +1300
Subject: [Buildroot] [PATCH 1/1] package/micropython: drop patch
In-Reply-To: <20191017165207.9018-1-fontaine.fabrice@gmail.com>
References: <20191017165207.9018-1-fontaine.fabrice@gmail.com>
Message-ID: <CAFOYHZCsW4hE+RjpzBmQcmNN=9LX4mBVbL23O1v6sB-jcYY4Jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Fri, Oct 18, 2019 at 5:52 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Drop patch and set GIT_DIR as suggested by upstream during review of an
> upstreamable solution, see
> https://github.com/micropython/micropython/pull/5002
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for taking the time to look at this. I take it this triggers
the get_version_info_from_docs_conf fallback, which Is what I was
going with in the original patch.

Reviewed-by: Chris Packham <judge.packham@gmail.com>

> ---
>  package/micropython/0001-fix-version.patch | 22 ----------------------
>  package/micropython/micropython.mk         | 11 ++++++++---
>  2 files changed, 8 insertions(+), 25 deletions(-)
>  delete mode 100644 package/micropython/0001-fix-version.patch
>
> diff --git a/package/micropython/0001-fix-version.patch b/package/micropython/0001-fix-version.patch
> deleted file mode 100644
> index 1bf2992169..0000000000
> --- a/package/micropython/0001-fix-version.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Always use the fallback behaviour for determining the version number
> -
> -When built from within buildroot the micropython build process detects
> -that it is inside a git repository and ends up using the buildroot
> -version number instead of the correct micropython version number.
> -
> -Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ----
> -diff -Naur micropython-v1.4.5-old/py/makeversionhdr.py micropython-v1.4.5/py/makeversionhdr.py
> ---- micropython-v1.4.5-old/py/makeversionhdr.py        2015-08-12 00:42:30.000000000 +1200
> -+++ micropython-v1.4.5/py/makeversionhdr.py    2015-09-16 10:21:06.698962836 +1200
> -@@ -70,9 +70,7 @@
> -
> - def make_version_header(filename):
> -     # Get version info using git, with fallback to docs/conf.py
> --    info = get_version_info_from_git()
> --    if info is None:
> --        info = get_version_info_from_docs_conf()
> -+    info = get_version_info_from_docs_conf()
> -
> -     git_tag, git_hash, ver = info
> -
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index d636d0e869..5824b4ab18 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -10,6 +10,11 @@ MICROPYTHON_LICENSE = MIT
>  MICROPYTHON_LICENSE_FILES = LICENSE
>  MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
>
> +# Set GIT_DIR so package won't use buildroot's version number
> +MICROPYTHON_MAKE_ENV = \
> +       $(TARGET_MAKE_ENV) \
> +       GIT_DIR=.
> +
>  # Use fallback implementation for exception handling on architectures that don't
>  # have explicit support.
>  ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
> @@ -22,15 +27,15 @@ MICROPYTHON_MAKE_OPTS = MICROPY_PY_BTREE=0
>  MICROPYTHON_MAKE_OPTS += MICROPY_PY_USSL=0
>
>  define MICROPYTHON_BUILD_CMDS
> -       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
> -       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
> +       $(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
> +       $(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
>                 $(MICROPYTHON_MAKE_OPTS) \
>                 CROSS_COMPILE=$(TARGET_CROSS) \
>                 CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS)
>  endef
>
>  define MICROPYTHON_INSTALL_TARGET_CMDS
> -       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
> +       $(MICROPYTHON_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
>                 $(MICROPYTHON_MAKE_OPTS) \
>                 CROSS_COMPILE=$(TARGET_CROSS) \
>                 CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
> --
> 2.23.0
>
