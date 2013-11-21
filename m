From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Nov 2013 16:42:42 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <1385046971-7707-2-git-send-email-rebillout@syscom.ch>
References: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>
 <1385046971-7707-2-git-send-email-rebillout@syscom.ch>
Message-ID: <20131121164242.64981c00@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnaud R?billout,

On Thu, 21 Nov 2013 16:16:11 +0100, Arnaud R?billout wrote:
> LFTP is a sophisticated ftp/http client, and a file transfer program
> supporting a number of network protocols. Like BASH, it has job
> control and uses the readline library for input. It has bookmarks,
> a built-in mirror command, and can transfer several files in parallel.
> It was designed with reliability in mind.
> 
> Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>

Thanks, looks pretty good! A few comments below.


> +config BR2_PACKAGE_LFTP_CMD_TORRENT
> +	bool "Torrent command"
> +	help
> +	  Enable torren command

Typo.

> +
> +comment "Protocols"
> +
> +config BR2_PACKAGE_LFTP_PROTO_FISH
> +	bool "FISH protocol"
> +	default y
> +	help
> +	  Enable FILE protocol

FILE ? or FISH ?

> +
> +config BR2_PACKAGE_LFTP_PROTO_FTP
> +	bool "FTP protocol"
> +	default y
> +	help
> +	  Enable FTP protocol
> +
> +config BR2_PACKAGE_LFTP_PROTO_HTTP
> +	bool "HTTP protocol"
> +	default y
> +	help
> +	  Enable HTTP protocol
> +
> +config BR2_PACKAGE_LFTP_PROTO_SFTP
> +	bool "SFTP protocol"
> +	default y
> +	help
> +	  Enable SFTP protocol

Is the dependency on OpenSSL or GnuTLS always needed? Or is it only
needed if you enable SFTP or some specific protocol?

> diff --git a/package/lftp/lftp-disable-posix_fallocate.patch b/package/lftp/lftp-disable-posix_fallocate.patch
> new file mode 100644
> index 0000000..29bb780
> --- /dev/null
> +++ b/package/lftp/lftp-disable-posix_fallocate.patch
> @@ -0,0 +1,21 @@
> +diff -pruN lftp-4.4.10.orig/configure lftp-4.4.10/configure
> +--- lftp-4.4.10.orig/configure	2013-10-31 15:40:04.716111900 +0100
> ++++ lftp-4.4.10/configure	2013-10-31 15:41:37.431445424 +0100

All patches need a description + Signed-off-by.

Moreover, we typically don't patch the configure script, but the source
of it, i.e configure.in or configure.ac, and we mark the package as
<pkg>_AUTORECONF = YES.

> +@@ -48870,10 +48870,13 @@ if ${i_cv_posix_fallocate_works+:} false
> + else
> + 
> +      if test "$cross_compiling" = yes; then :
> +-  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
> +-$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
> +-as_fn_error $? "cannot run test program while cross compiling
> +-See \`config.log' for more details" "$LINENO" 5; }
> ++#  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
> ++#$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
> ++#as_fn_error $? "cannot run test program while cross compiling
> ++#See \`config.log' for more details" "$LINENO" 5; }
> ++
> ++# Can't test, assume it doesn't work
> ++i_cv_posix_fallocate_works=no
> + else
> +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */

Can you detail the posix_fallocate() problem you've seen? Maybe we can
solve it in a different/nicer way.

> diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
> new file mode 100644
> index 0000000..1ee8e89
> --- /dev/null
> +++ b/package/lftp/lftp.mk
> @@ -0,0 +1,87 @@
> +################################################################################
> +#
> +# lftp
> +#
> +################################################################################
> +
> +LFTP_VERSION = 4.4.10
> +LFTP_SOURCE  = lftp-$(LFTP_VERSION).tar.gz

This last line is not needed, as it is the default.

> +LFTP_SITE    = http://lftp.yar.ru/ftp
> +LFTP_LICENSE = GPLv3+
> +LFTP_LICENSE_FILES = COPYING
> +LFTP_DEPENDENCIES  = readline zlib
> +
> +LFTP_CONF_OPT += --with-modules
> +
> +ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +LFTP_DEPENDENCIES += gnutls
> +LFTP_CONF_OPT += --with-gnutls
> +else
> +LFTP_CONF_OPT += --without-gnutls
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LFTP_DEPENDENCIES += openssl
> +LFTP_CONF_OPT += --with-openssl
> +else
> +LFTP_CONF_OPT += --without-openssl
> +endif
> +
> +# Remove /usr/share/lftp
> +define LFTP_REMOVE_DATA
> +        $(RM) -fr $(TARGET_DIR)/usr/share/lftp
> +endef
> +LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_DATA
> +
> +# Optional commands
> +ifneq ($(BR2_PACKAGE_LFTP_CMD_MIRROR),y)
> +define LFTP_REMOVE_CMD_MIRROR
> +	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/cmd-mirror.so
> +endef
> +LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_CMD_MIRROR
> +endif
> +
> +ifneq ($(BR2_PACKAGE_LFTP_CMD_SLEEP),y)
> +define LFTP_REMOVE_CMD_SLEEP
> +	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/cmd-sleep.so
> +endef
> +LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_CMD_SLEEP
> +endif
> +
> +ifneq ($(BR2_PACKAGE_LFTP_CMD_TORRENT),y)
> +define LFTP_REMOVE_CMD_TORRENT
> +	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/cmd-torrent.so
> +endef
> +LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_CMD_TORRENT
> +endif
> +
> +# Optional protocols
> +ifneq ($(BR2_PACKAGE_LFTP_PROTO_FISH),y)
> +define LFTP_REMOVE_PROTO_FISH
> +	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/proto-fish.so
> +endef
> +LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_PROTO_FISH
> +endif
> +
> +ifneq ($(BR2_PACKAGE_LFTP_PROTO_FTP),y)
> +define LFTP_REMOVE_PROTO_FTP
> +	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/proto-ftp.so
> +endef
> +LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_PROTO_FTP
> +endif
> +
> +ifneq ($(BR2_PACKAGE_LFTP_PROTO_HTTP),y)
> +define LFTP_REMOVE_PROTO_HTTP
> +	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/proto-http.so
> +endef
> +LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_PROTO_HTTP
> +endif
> +
> +ifneq ($(BR2_PACKAGE_LFTP_PROTO_SFTP),y)
> +define LFTP_REMOVE_PROTO_SFTP
> +	$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/proto-sftp.so
> +endef
> +LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_PROTO_SFTP
> +endif

I think this can be factorized in a nicer way:

LFTP_FILES_TO_REMOVE-$(BR2_PACKAGE_LFTP_CMD_MIRROR) += cmd-mirror
LFTP_FILES_TO_REMOVE-$(BR2_PACKAGE_LFTP_CMD_SLEEP) += cmd-sleep
LFTP_FILES_TO_REMOVE-$(BR2_PACKAGE_LFTP_CMD_TORRENT) += cmd-torrent
LFTP_FILES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_FISH) += proto-fish
LFTP_FILES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_FTP) += proto-ftp
LFTP_FILES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_HTTP) += proto-http
LFTP_FILES_TO_REMOVE-$(BR2_PACKAGE_LFTP_PROTO_SFTP) += proto-sftp

define LFTP_REMOVE_FILES
	for f in $(LFTP_FILES_TO_REMOVE-y) ; do \
		$(RM) -f $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/$$f ; \
	done
endef

LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_FILES

or in a slightly more make-style way (but maybe not so readable) :

define LFTP_REMOVE_FILES
	$(if $(LFTP_FILES_TO_REMOVE-y), \
		$(RM) -f $(addprefix $(TARGET_DIR)/usr/lib/lftp/$(LFTP_VERSION)/,$(LFTP_FILES_TO_REMOVE-y)))
endef

LFTP_POST_INSTALL_TARGET_HOOKS += LFTP_REMOVE_FILES

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
