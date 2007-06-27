From: Julien Letessier <julien.letessier@technosens.fr>
Date: Wed, 27 Jun 2007 08:26:38 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntp
In-Reply-To: <20070626154103.37875A464C@busybox.net>
References: <20070626154103.37875A464C@busybox.net>
Message-ID: <f0528b5b0706262326o381263a7k6a9c6768861a9d1a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update:
- the actual current version of NTP is 4.2p2
- fixed the configure flag

2007/6/26, aldot at uclibc.org <aldot@uclibc.org>:
>
> Author: aldot
> Date: 2007-06-26 08:41:01 -0700 (Tue, 26 Jun 2007)
> New Revision: 18940
>
> Log:
> - bump version, make it compile. tickadjust has to be disabled. Closes
> #1029
>   Provide means for installing sntp
>
>
> Modified:
>    trunk/buildroot/package/ntp/Config.in
>    trunk/buildroot/package/ntp/ntp.mk
>
>
> Changeset:
> Modified: trunk/buildroot/package/ntp/Config.in
> ===================================================================
> --- trunk/buildroot/package/ntp/Config.in       2007-06-26 14:32:10 UTC
> (rev 18939)
> +++ trunk/buildroot/package/ntp/Config.in       2007-06-26 15:41:01 UTC
> (rev 18940)
> @@ -6,3 +6,10 @@
>           Provides things like ntpd, ntpdate, ntpq, etc...
>
>           http://www.ntp.org/
> +
> +config BR2_PACKAGE_NTP_SNTP
> +       bool "sntp"
> +       default n
> +       depends BR2_PACKAGE_NTP
> +       help
> +         Simple network time protocol program
>
> Modified: trunk/buildroot/package/ntp/ntp.mk
> ===================================================================
> --- trunk/buildroot/package/ntp/ntp.mk  2007-06-26 14:32:10 UTC (rev
> 18939)
> +++ trunk/buildroot/package/ntp/ntp.mk  2007-06-26 15:41:01 UTC (rev
> 18940)
> @@ -3,7 +3,7 @@
> # ntp
> #
> #############################################################
> -NTP_VERSION:=4.2.0
> +NTP_VERSION:=4.2.4
> NTP_SOURCE:=ntp-$(NTP_VERSION).tar.gz
> NTP_SITE:=http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
> NTP_DIR:=$(BUILD_DIR)/ntp-$(NTP_VERSION)
> @@ -16,18 +16,19 @@
>
> ntp-source: $(DL_DIR)/$(NTP_SOURCE)
>
> -$(NTP_DIR)/.unpacked: $(DL_DIR)/$(NTP_SOURCE)
> +$(NTP_DIR)/.patched: $(DL_DIR)/$(NTP_SOURCE)
>         $(NTP_CAT) $(DL_DIR)/$(NTP_SOURCE) | tar -C $(BUILD_DIR)
> $(TAR_OPTIONS) -
>         toolchain/patch-kernel.sh $(NTP_DIR) package/ntp/ ntp\*.patch
>         $(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," \
>                 $(NTP_DIR)/ntpd/refclock_pcf.c;
> -       touch $(NTP_DIR)/.unpacked
> +       $(SED)
> '/[[:space:](]index[[:space:]]*(/s/[[:space:]]*index[[:space:]]*(/
> strchr(/g' $(NTP_DIR)/libisc/*.c $(NTP_DIR)/arlib/sample.c
> +       $(SED)
> '/[[:space:](]rindex[[:space:]]*(/s/[[:space:]]*rindex[[:space:]]*(/
> strrchr(/g' $(NTP_DIR)/ntpd/*.c
> +       #$(SED) 's/\(^#[[:space:]]*include[[:space:]]*<sys\/var.h>\)/\/\/
> \1/' $(NTP_DIR)/util/tickadj.c
> +       touch $@
>
> -$(NTP_DIR)/.configured: $(NTP_DIR)/.unpacked
> +$(NTP_DIR)/.configured: $(NTP_DIR)/.patched
>         (cd $(NTP_DIR); rm -rf config.cache; \
>                 $(TARGET_CONFIGURE_OPTS) \
> -               CFLAGS="$(TARGET_CFLAGS)" \
> -               LDFLAGS="$(TARGET_LDFLAGS)" \
>                 ac_cv_lib_md5_MD5Init=no \
>                 ./configure \
>                 --target=$(GNU_TARGET_NAME) \
> @@ -45,11 +46,13 @@
>                 --mandir=/usr/man \
>                 --infodir=/usr/info \
>                 $(DISABLE_NLS) \
> +               $(DISABLE_IPV6) \
>                 --with-shared \
>                 --program-transform-name=s,,, \
>                 --without-crypto \
> +               --enable-tickadj=no \
>         );
> -       touch $(NTP_DIR)/.configured
> +       touch $@
>
> $(NTP_DIR)/$(NTP_BINARY): $(NTP_DIR)/.configured
>         $(MAKE) -C $(NTP_DIR)
> @@ -57,14 +60,18 @@
> $(TARGET_DIR)/$(NTP_TARGET_BINARY): $(NTP_DIR)/$(NTP_BINARY)
>         install -m 755 $(NTP_DIR)/ntpd/ntpd $(TARGET_DIR)/usr/sbin/ntpd
>         install -m 755 $(NTP_DIR)/$(NTP_BINARY)
> $(TARGET_DIR)/$(NTP_TARGET_BINARY)
> +ifeq ($(BR2_PACKAGE_NTP_SNTP),y)
> +       install -m 755 $(NTP_DIR)/sntp/sntp $(TARGET_DIR)/usr/bin/sntp
> +endif
>         install -m 755 package/ntp/ntp.sysvinit
> $(TARGET_DIR)/etc/init.d/S49ntp
>
> ntp: uclibc $(TARGET_DIR)/$(NTP_TARGET_BINARY)
>
> ntp-clean:
> -       rm -f $(TARGET_DIR)/usr/sbin/ntpd
> -       rm -f $(TARGET_DIR)/$(NTP_TARGET_BINARY)
> -       -$(MAKE) -C $(NTP_DIR) clean
> +       rm -f $(TARGET_DIR)/usr/sbin/ntpd $(TARGET_DIR)/usr/bin/sntp \
> +               $(TARGET_DIR)/etc/init.d/S49ntp \
> +               $(TARGET_DIR)/$(NTP_TARGET_BINARY)
> +       -$(MAKE) -C $(NTP_DIR) clean
>
> ntp-dirclean:
>         rm -rf $(NTP_DIR)
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>



-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070627/0d226fae/attachment.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_ntp.patch
Type: application/octet-stream
Size: 608 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070627/0d226fae/attachment.obj 
