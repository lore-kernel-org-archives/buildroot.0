From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 21 Mar 2018 11:04:50 +0100
Subject: [Buildroot] [PATCH v3 3/3] setools: update to add sedta and
 seinfoflow
In-Reply-To: <1521578383-56128-3-git-send-email-jared.bents@rockwellcollins.com>
References: <1521578383-56128-1-git-send-email-jared.bents@rockwellcollins.com>
 <1521578383-56128-3-git-send-email-jared.bents@rockwellcollins.com>
Message-ID: <CAGm1_kvah6O6t2gQT8y9AnQjXkGdPeJO23eDVep9scJuy8pDvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 20, 2018 at 9:39 PM, Jared Bents
<jared.bents@rockwellcollins.com> wrote:
> Update to add sedta and seinfoflow to setools
>
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Just curious what BR package is really uses host-setools with Python
functionality. I've built refpolicy without setools'
host-python-networx dependency and the build was successful.

Yegor

> --
> v2 -> v3: Update to remove target dependencies change but kept
>           the host package dependency as it is required for
>           host-python-networkx to be built and thus available
>           at runtime
> v1 -> v2: No change
>
> ---
>  package/setools/Config.in  |  2 ++
>  package/setools/setools.mk | 16 ++--------------
>  2 files changed, 4 insertions(+), 14 deletions(-)
>
> diff --git a/package/setools/Config.in b/package/setools/Config.in
> index ae0c45f..32a9315 100644
> --- a/package/setools/Config.in
> +++ b/package/setools/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_SETOOLS
>         depends on BR2_USE_MMU
>         select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
>         select BR2_PACKAGE_PYTHON_ENUM34 if !BR2_PACKAGE_PYTHON3
> +       select BR2_PACKAGE_PYTHON_NETWORKX
>         select BR2_PACKAGE_PYTHON_SETUPTOOLS
>         select BR2_PACKAGE_LIBSELINUX
>         help
> @@ -16,6 +17,7 @@ config BR2_PACKAGE_SETOOLS
>            * apol - analyze a SELinux policy. (requires python-qt5)
>            * sediff - semantic policy difference tool for SELinux.
>            * sedta - Perform domain transition analyses
> +          * seinfoflow - information flow analysis for SELinux
>            * sesearch - Search rules (allow, type_transition, etc.)
>
>           https://github.com/TresysTechnology/setools
> diff --git a/package/setools/setools.mk b/package/setools/setools.mk
> index 6748c95..1ed7e97 100644
> --- a/package/setools/setools.mk
> +++ b/package/setools/setools.mk
> @@ -11,7 +11,7 @@ SETOOLS_INSTALL_STAGING = YES
>  SETOOLS_LICENSE = GPL-2.0+, LGPL-2.1+
>  SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
>  SETOOLS_SETUP_TYPE = setuptools
> -HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol
> +HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-python-networkx
>
>  ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  SETOOLS_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
> @@ -36,14 +36,6 @@ define HOST_SETOOLS_FIX_SETUP
>  endef
>  HOST_SETOOLS_POST_PATCH_HOOKS += HOST_SETOOLS_FIX_SETUP
>
> -# sedta and seinfoflow depend on python-networkx. This package is not
> -# available in buildroot.
> -define SETOOLS_REMOVE_BROKEN_SCRIPTS
> -       $(RM) $(TARGET_DIR)/usr/bin/sedta
> -       $(RM) $(TARGET_DIR)/usr/bin/seinfoflow
> -endef
> -SETOOLS_POST_INSTALL_TARGET_HOOKS += SETOOLS_REMOVE_BROKEN_SCRIPTS
> -
>  # apol requires pyqt5. However, the setools installation
>  # process will install apol even if pyqt5 is missing.
>  # Remove these scripts from the target it pyqt5 is not selected.
> @@ -55,12 +47,8 @@ endef
>  SETOOLS_POST_INSTALL_TARGET_HOOKS += SETOOLS_REMOVE_QT_SCRIPTS
>  endif
>
> -# sedta and seinfoflow depend on python-networkx. This package is not
> -# available in buildroot. pyqt5 is not a host-package, remove apol
> -# from the host directory as well.
> +# pyqt5 is not a host-package, remove apol from the host directory.
>  define HOST_SETOOLS_REMOVE_BROKEN_SCRIPTS
> -       $(RM) $(HOST_DIR)/bin/sedta
> -       $(RM) $(HOST_DIR)/bin/seinfoflow
>         $(RM) $(HOST_DIR)/bin/apol
>  endef
>  HOST_SETOOLS_POST_INSTALL_HOOKS += HOST_SETOOLS_REMOVE_BROKEN_SCRIPTS
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
