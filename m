From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 13 May 2014 19:58:59 +0200
Subject: [Buildroot] [PATCH 1/1] google-breakpad: added package to
	buildroot
In-Reply-To: <1399631550-4058-1-git-send-email-pascal.huerst@gmail.com>
References: <1399631550-4058-1-git-send-email-pascal.huerst@gmail.com>
Message-ID: <CAGduivwKX-9r5HOm9X5Y_fkU+_YEf4rE43O=GG3HYi5m_2RxzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pascal, all,

Thanks a lot for this patch !
Here are a few comments inlined:

On Fri, May 9, 2014 at 12:32 PM, Pascal Huerst <pascal.huerst@gmail.com> wrote:
> This adds all necessary host and target tools to use google-breakpad
> within buildroot. If the package is selected, the symbols needed by
> google-breakpad's stackwalk are deployed to:
>
> output/images/google_breakpad_symbols
>
> Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
> ---
>  Makefile                                   | 11 ++++++++++-
>  package/Config.in                          |  1 +
>  package/google-breakpad/Config.in          | 12 ++++++++++++
>  package/google-breakpad/google-breakpad.mk | 21 +++++++++++++++++++++
>  4 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 package/google-breakpad/Config.in
>  create mode 100644 package/google-breakpad/google-breakpad.mk
>
> diff --git a/Makefile b/Makefile
> index 2f18aab..613f451 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -530,9 +530,18 @@ define TARGET_PURGE_LOCALES
>  endef
>  endif
>
> +# Dump symbols and create directorytree for google breakpad
> +BREAKPAD_SEARCH_CMD = $(shell find $(STAGING_DIR) -type f \( -perm /111 -a ! -name "*.py" -a ! -name "*.sh" -a ! -type l -a ! -name "*~" -a ! -name "*.la" \) -print)
I think, it would be better if this could be splitted as a string
(without the call to shell) like STRIP_FIND_CMD.
> +
> +extract-breakpad-symbols: $(TARGETS)
> +ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
> +       mkdir -p $(BINARIES_DIR)/google_breakpad_symbols
> +       $(PYTHON) $(HOST_DIR)/usr/bin/symbolstore.py $(HOST_DIR)/usr/bin/dump_syms $(BINARIES_DIR)/google_breakpad_symbols $(BREAKPAD_SEARCH_CMD)
> +endif
And here instead of $(BREAKPAD_SEARCH_CMD) I would see:
$(shell $(BREAKPAD_SEARCH_CMD))

Also, I had an issues with symbolstore.py, it relies on /bin/env
whereas on my Debian, it's /usr/bin/env.

> +
>  $(TARGETS_ROOTFS): target-finalize
>
> -target-finalize: $(TARGETS)
> +target-finalize: extract-breakpad-symbols
>         $(TARGET_PURGE_LOCALES)
>         rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
>                 $(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \

Instead of defining a new targets, I would really do as split is done.
I would put this:
+ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
+       mkdir -p $(BINARIES_DIR)/google_breakpad_symbols
+       $(PYTHON) $(HOST_DIR)/usr/bin/symbolstore.py
$(HOST_DIR)/usr/bin/dump_syms $(BINARIES_DIR)/google_breakpad_symbols
$(BREAKPAD_SEARCH_CMD)
+endif
Right before calling STRIP_FIND_CMD.

> diff --git a/package/Config.in b/package/Config.in
> index 2da27ce..e2f04c6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -82,6 +82,7 @@ source "package/tinymembench/Config.in"
>  source "package/trace-cmd/Config.in"
>  source "package/valgrind/Config.in"
>  source "package/whetstone/Config.in"
> +source "package/google-breakpad/Config.in"
>  endmenu
>
>  menu "Development tools"
> diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
> new file mode 100644
> index 0000000..fc68e6a
> --- /dev/null
> +++ b/package/google-breakpad/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_GOOGLE_BREAKPAD
> +       bool "google-breakpad"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_USES_GLIBC
> +       help
> +         An open-source multi-platform crash reporting system
> +
> +         http://code.google.com/p/google-breakpad/
> +
> +comment "google-breakpad requires an (e)glibc toolchain with C++"
> +       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_USES_GLIBC)
> +
> diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
> new file mode 100644
> index 0000000..a1c4224
> --- /dev/null
> +++ b/package/google-breakpad/google-breakpad.mk
> @@ -0,0 +1,21 @@
> +#############################################################
> +#
> +# google-breakpad
> +#
> +#############################################################
> +GOOGLE_BREAKPAD_VERSION = 1320
> +GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
> +GOOGLE_BREAKPAD_SITE_METHOD = svn
> +GOOGLE_BREAKPAD_CONF_OPT = --disable-processor --disable-tools
> +GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad
> +HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-python
> +GOOGLE_BREAKPAD_INSTALL_STAGING = YES
You need to specify a LICENSE and the LICENSE_FILES, have a look at
http://buildroot.org/downloads/manual/manual.html#generic-package-reference
for more information about theses variables.
> +
> +define HOST_GOOGLE_INSTALL_MOZILLA_SYMBOLSTORE
> +       wget -O $(HOST_DIR)/usr/bin/symbolstore.py "http://mxr.mozilla.org/mozilla-central/source/toolkit/crashreporter/tools/symbolstore.py?raw=1" && chmod +x $(HOST_DIR)/usr/bin/symbolstore.py
> +endef
Here you are downloading a specific python scripts for a URL, why ? It
is not included in the main sources ? Could it be a patch that goes
along the package instead of downloading this like that ?
Also, if you need to download it, doing it step by step, is more
lisible than a really long line. Also the URL could maybe be a
variable.
> +
> +HOST_GOOGLE_BREAKPAD_POST_INSTALL_HOOKS += HOST_GOOGLE_INSTALL_MOZILLA_SYMBOLSTORE
> +
> +$(eval $(host-autotools-package))
> +$(eval $(autotools-package))
> --
> 1.9.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
