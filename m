From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 15 May 2014 11:40:55 +0200
Subject: [Buildroot] [PATCH v2 1/1] google-breakpad: added package to
	buildroot
In-Reply-To: <1400086277-18900-1-git-send-email-pascal.huerst@gmail.com>
References: <1400086277-18900-1-git-send-email-pascal.huerst@gmail.com>
Message-ID: <CAAXf6LU7v6TjmRanfhE4JYWkXsozmyu1wGoKwPy+LGJswuPqyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, May 14, 2014 at 6:51 PM, Pascal Huerst <pascal.huerst@gmail.com> wrote:
> Changes v1 -> v2 (All suggested by maxime.hadjinlian at gmail.com)
>         Added dependency from BR2_ENABLE_DEBUG
>         Removed symbolstore.py -> Its all done in Makefile now
>         Removed new Target -> It in target-finalize before stripping now
>         Added LICENSE and LICENSE_FILE to *.mk
>
> Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
> ---
>  Makefile                                   | 22 ++++++++++++++++++++++
>  package/Config.in                          |  1 +
>  package/google-breakpad/Config.in          | 12 ++++++++++++
>  package/google-breakpad/google-breakpad.mk | 16 ++++++++++++++++
>  4 files changed, 51 insertions(+)
>  create mode 100644 package/google-breakpad/Config.in
>  create mode 100644 package/google-breakpad/google-breakpad.mk
>
> diff --git a/Makefile b/Makefile
> index 6d97262..114c0e7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -530,6 +530,15 @@ define TARGET_PURGE_LOCALES
>  endef
>  endif
>
> +# Dump symbols for google-breakpad of these files
> +BREAKPAD_FIND_CMD = find $(STAGING_DIR) -type f \( -perm /111 \
> +-a ! -name "*.py" \
> +-a ! -name "*.sh" \
> +-a ! -name "*~" \
> +-a ! -name "*.la" \
> +-a ! -type l \
> +\) -print
> +
>  $(TARGETS_ROOTFS): target-finalize
>
>  target-finalize: $(TARGETS)
> @@ -555,6 +564,19 @@ endif
>  ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
>         find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
>  endif
> +ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
> +       mkdir -p $(BINARIES_DIR)/google_breakpad_symbols/tmp
> +       for GBP_BIN_PATH in $(shell $(BREAKPAD_FIND_CMD)); do \
> +               GBP_BIN=$$(basename $$GBP_BIN_PATH); \
> +               GBP_BIN+=.sym; \
> +               $(HOST_DIR)/usr/bin/dump_syms $$GBP_BIN_PATH > $(BINARIES_DIR)/google_breakpad_symbols/tmp/$$GBP_BIN 2>/dev/null; \
> +               GBP_HASH=$$(head -n1 $(BINARIES_DIR)/google_breakpad_symbols/tmp/$$GBP_BIN | cut -d ' ' -f 4); \
> +               mkdir -p $(BINARIES_DIR)/google_breakpad_symbols/$$(basename $$GBP_BIN_PATH)/$$GBP_HASH; \
> +               mv $(BINARIES_DIR)/google_breakpad_symbols/tmp/$$GBP_BIN $(BINARIES_DIR)/google_breakpad_symbols/$$(basename $$GBP_BIN_PATH)/$$GBP_HASH; \
> +       done
> +       rm -Rf $(BINARIES_DIR)/google_breakpad_symbols/tmp
> +endif
> +
>         rm -rf $(TARGET_DIR)/usr/lib/luarocks
>         $(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
>         if test -d $(TARGET_DIR)/lib/modules; then \
> diff --git a/package/Config.in b/package/Config.in
> index 3bc8d24..2e9babe 100644
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
> index 0000000..d998345
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
> +comment "google-breakpad requires an (e)glibc toolchain with C++ and Debug enabled"
> +       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_USES_GLIBC && BR2_ENABLE_DEBUG)

After some discussion on IRC, I'd like to comment on the dependency on
BR2_ENABLE_DEBUG: according to me, BR2_ENABLE_DEBUG is not a mandatory
dependency for breakpad and thus should not be placed in this comment
(nor in the config option itself). Rather, I would suggest users to
enable this option in the help text of the config option, explaining a
bit why it is needed.
Think about a situation where a user wants to use google-breakpad only
on his own applications, not on the standard linux
applications/libraries selected in buildroot. This could be in a
commercial product for example. In this case, the user could make sure
that -g is passed to the toolchain for these applications only, and
BR2_ENABLE_DEBUG is not needed.

Best regards,
Thomas
