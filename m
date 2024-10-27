Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951A6D13577
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC59C81363;
	Sun, 27 Oct 2024 18:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oksUeMG1v4i8; Sun, 27 Oct 2024 18:04:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 483BB8135C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 483BB8135C;
	Sun, 27 Oct 2024 18:04:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC88B971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAAE68135C
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLtz_12sF0cM for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:04:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06E7181358
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E7181358
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06E7181358
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:04:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 62440B00583;
 Sun, 27 Oct 2024 19:04:08 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58824])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 27 Oct 2024 19:04:08 +0100
MIME-Version: 1.0
Date: Sun, 27 Oct 2024 19:04:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, James Knight <james.knight@collins.com>
In-Reply-To: <ZrYgrzSPAcUueLsj@waldemar-brodkorb.de>
References: <ZrYgrzSPAcUueLsj@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <d9635c8f693876ae7b8e0ac940b5fbe8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730052250;
 bh=UWIDWRZMtNxRVS4tuoj5x5pMcZI1RH38iRsdIOSGWik=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SRUHMn4eHCvoEY8m2iuMYhsyniupcyJx4zfgA6bR6Uhg0oAPmdGHZGeB6ZqYEKg7b
 uUIfqa+JejRW+APLAwEX1s1RlGTvytOL7ceTIuP0Sm3idALhwDh4MfV57eomoK7Uuw
 1o6PbVAU34YLR9Yqy/zehmNQl9ppIDJVB3ASwqmA6clKnSmuqcm8FnJWSFYs2aj+DM
 WnoXNADCpsREjlkwVMsNUejRbUQbUFbZ+WQaw6JTBTuMj66hA7OQetJwQjf5sIsfLq
 Q3SawH36SGcV/jzP+lDtS9cjdc0atvp00XSvhRBO8hU2FeTh/jq3MmZNyhkSB5PnKp
 hFurhAHrdRSnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SRUHMn4e
Subject: Re: [Buildroot] [PATCH] package/rpm: update to 4.19.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

Thanks for this patch!

I quickly tested it with the following commands, on the master
branch:

     cat >rpm.config <<EOF
     BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
     BR2_PACKAGE_LUA=y
     BR2_PACKAGE_RPM=y
     BR2_PACKAGE_SQLITE=y
     EOF
     utils/test-pkg -a -c rpm.config -p rpm

At commit 71f36ef (without your patch, so with rpm-4.18), there is
only one build failure:

     ...
     bootlin-sh4-uclibc [21/41]: FAILED
     ...
     41 builds, 4 skipped, 1 build failed, 0 legal-info failed, 0 
show-info failed

Note: bootlin-sh4-uclibc fails with output:

     checking for fstatat... no
     configure: error: function required by rpm

When applying this patch, result becomes:

     ...
     bootlin-armv7-musl [ 7/41]: FAILED
     bootlin-sh4-uclibc [21/41]: FAILED
     bootlin-x86-64-musl [25/41]: FAILED
     bootlin-x86-i686-musl [27/41]: FAILED
     ...

It seems that all musl libc toolchains are failing with output:

     /br-test-pkg/bootlin-armv7-musl/build/rpm-4.19.1.1/rpmio/rpmglob.c: 
In function 'rpmGlobPath':
     
/br-test-pkg/bootlin-armv7-musl/build/rpm-4.19.1.1/rpmio/rpmglob.c:84:15: 
error: 'GLOB_BRACE' undeclared (first use in this function)
        84 |     gflags |= GLOB_BRACE;
           |               ^~~~~~~~~~

So there is possibly an incompatibility. This should be reflected in
the Config.in.

There is also two other failures:

     ...
     sourcery-mips64 [40/41]: FAILED
     sourcery-mips [41/41]: FAILED
     ...

with output:

     CMake Error at 
/usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:230 
(message):
       Could NOT find OpenMP_C: Found unsuitable version "4.0", but 
required is at
       least "4.5" (found -fopenmp)

It seems rpm now requires OpenMP >= 4.5 when used. This brings a
new requirement of gcc >= 6.0. See:
https://github.com/rpm-software-management/rpm/blob/rpm-4.19.1.1-release/INSTALL#L123

If this requirement is not met, then OpenMP could simply be disabled.

Could you also add this reference in the commit log of your updated
patch please?

On 09/08/2024 15:59, Waldemar Brodkorb wrote:
> For a full Changelog see:
> https://github.com/rpm-software-management/rpm/compare/rpm-4.18.1-release...rpm-4.19.1.1-release
> 
> Upstream project switched to Cmake buildsystem.
> Patch 0001 is already upstream.
> 
> To make use of rpm on the target /var/lib/rpm/rpmrc and other macros
> must exist, so modify top level Makefile so that this directory is
> not removed when package rpm is choosen. The removal was added in
> commit 960fc93df2f7981e13a1bb7fb76fd958e36b8611.
> 
> Use old deprecated openpgp implementation as the newer rpm-sequoia
> needs rust / cargo library support. See the comment in the rpm.mk file.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  Makefile                                      |  5 +-
>  .../0001-fix-var-declare-in-label-error.patch | 40 ---------
>  package/rpm/rpm.hash                          |  4 +-
>  package/rpm/rpm.mk                            | 82 +++++++++----------
>  4 files changed, 44 insertions(+), 87 deletions(-)
>  delete mode 100644 
> package/rpm/0001-fix-var-declare-in-label-error.patch
> 
> diff --git a/Makefile b/Makefile
> index f51e8f690f..8755831bd3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -734,10 +734,13 @@ target-finalize: $(PACKAGES) $(TARGET_DIR) 
> host-finalize
>  	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
>  		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
>  		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake \
> -		$(TARGET_DIR)/usr/lib/rpm $(TARGET_DIR)/usr/doc
> +		$(TARGET_DIR)/usr/doc
>  	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs 
> -0 rm -f
>  	find $(TARGET_DIR)/lib/ $(TARGET_DIR)/usr/lib/ 
> $(TARGET_DIR)/usr/libexec/ \
>  		\( -name '*.a' -o -name '*.la' -o -name '*.prl' \) -print0 | xargs 
> -0 rm -f
> +ifneq ($(BR2_PACKAGE_RPM),y)
> +	rm -rf $(TARGET_DIR)/usr/lib/rpm
> +endif
>  ifneq ($(BR2_PACKAGE_GDB),y)
>  	rm -rf $(TARGET_DIR)/usr/share/gdb
>  endif
> diff --git a/package/rpm/0001-fix-var-declare-in-label-error.patch 
> b/package/rpm/0001-fix-var-declare-in-label-error.patch
> deleted file mode 100644
> index 648040c663..0000000000
> --- a/package/rpm/0001-fix-var-declare-in-label-error.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From b960c0b43a080287a7c13533eeb2d9f288db1414 Mon Sep 17 00:00:00 2001
> -From: Florian Festi <ffesti@redhat.com>
> -Date: Thu, 16 Mar 2023 19:05:04 +0100
> -Subject: [PATCH] Fix compiler error on clang
> -
> -Turns out variable declarations are not allowed after a label, even in
> -C99. And while some compilers don't seem to care others do.
> -
> -Moving the declaration of mayopen to the start of the function to 
> avoid
> -this problem.
> -
> -Resolves: #2435
> -
> -Upstream: b960c0b43a080287a7c13533eeb2d9f288db1414
> -Signed-off-by: James Knight <james.d.knight@live.com>
> ----
> - lib/fsm.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/lib/fsm.c b/lib/fsm.c
> -index 5671ac642d..183293edb0 100644
> ---- a/lib/fsm.c
> -+++ b/lib/fsm.c
> -@@ -879,6 +879,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, 
> rpmfiles files,
> -     int nodigest = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOFILEDIGEST) ? 1 
> : 0;
> -     int nofcaps = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOCAPS) ? 1 : 0;
> -     int firstlinkfile = -1;
> -+    int mayopen = 0;
> -     char *tid = NULL;
> -     struct filedata_s *fdata = xcalloc(fc, sizeof(*fdata));
> -     struct filedata_s *firstlink = NULL;
> -@@ -1016,7 +1017,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, 
> rpmfiles files,
> -
> - setmeta:
> - 	    /* Special files require path-based ops */
> --	    int mayopen = S_ISREG(fp->sb.st_mode) || 
> S_ISDIR(fp->sb.st_mode);
> -+	    mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
> - 	    if (!rc && fd == -1 && mayopen) {
> - 		int flags = O_RDONLY;
> - 		/* Only follow safe symlinks, and never on temporary files */
> diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
> index fd03f062bc..59cc66bba6 100644
> --- a/package/rpm/rpm.hash
> +++ b/package/rpm/rpm.hash
> @@ -1,5 +1,5 @@
> -# From https://rpm.org/wiki/Releases/4.18.1.html
> -sha256  
> 37f3b42c0966941e2ad3f10fde3639824a6591d07197ba8fd0869ca0779e1f56  
> rpm-4.18.1.tar.bz2
> +# From https://rpm.org/wiki/Releases/4.19.1.1.html
> +sha256  
> 874091b80efe66f9de8e3242ae2337162e2d7131e3aa4ac99ac22155e9c521e5  
> rpm-4.19.1.1.tar.bz2
> 
>  # Hash for license file
>  sha256  
> 171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  
> COPYING
> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
> index c66ce6992d..46467fc4e0 100644
> --- a/package/rpm/rpm.mk
> +++ b/package/rpm/rpm.mk
> @@ -4,8 +4,8 @@
>  #
>  
> ################################################################################
> 
> -RPM_VERSION_MAJOR = 4.18
> -RPM_VERSION = $(RPM_VERSION_MAJOR).1
> +RPM_VERSION_MAJOR = 4.19
> +RPM_VERSION = $(RPM_VERSION_MAJOR).1.1
>  RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
>  RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x

The download link at:
https://rpm.org/download.html
points to:
https://ftp.osuosl.org/pub/rpm/releases/rpm-4.19.x/rpm-4.19.1.1.tar.bz2

Could you update the _SITE to
RPM_SITE = 
https://ftp.osuosl.org/pub/rpm/releases/rpm-$(RPM_VERSION_MAJOR).x
so we could use https?

>  RPM_DEPENDENCIES = \
> @@ -23,98 +23,92 @@ RPM_LICENSE_FILES = COPYING
>  RPM_CPE_ID_VENDOR = rpm
>  RPM_SELINUX_MODULES = rpm
> 
> -# Don't set --{dis,en}-openmp as upstream wants to abort the build if
> -# --enable-openmp is provided and OpenMP is < 4.5:
> -# https://github.com/rpm-software-management/rpm/pull/1433
>  RPM_CONF_OPTS = \
> -	--disable-rpath \
> -	--with-gnu-ld \
> -	--without-fapolicyd \
> -	--without-fsverity \
> -	--without-imaevm
> +	-DWITH_FSVERITY=OFF \
> +	-DWITH_FAPOLICYD=OFF \
> +	-DWITH_IMAEVM=OFF \
> +	-DENABLE_TESTSUITE=OFF
> +
> +# use deprecated openpgp implementation instead of rpm-sequoia,
> +# because otherwise we need to use a rust library, which is not yet
> +# supported by cargo-package infrastructure
> +RPM_CONF_OPTS += -DWITH_INTERNAL_OPENPGP=ON
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
> +RPM_CONF_OPTS += -DENABLE_OPENMP=ON
> +else
> +RPM_CONF_OPTS += -DENABLE_OPENMP=OFF
> +endif
> 
>  ifeq ($(BR2_PACKAGE_ACL),y)
>  RPM_DEPENDENCIES += acl
> -RPM_CONF_OPTS += --with-acl
> +RPM_CONF_OPTS += -DWITH_ACL=ON
>  else
> -RPM_CONF_OPTS += --without-acl
> +RPM_CONF_OPTS += -DWITH_ACL=OFF
>  endif
> 
>  ifeq ($(BR2_PACKAGE_AUDIT),y)
>  RPM_DEPENDENCIES += audit
> -RPM_CONF_OPTS += --with-audit
> +RPM_CONF_OPTS += -DWITH_AUDIT=ON
>  else
> -RPM_CONF_OPTS += --without-audit
> +RPM_CONF_OPTS += -DWITH_AUDIT=OFF
>  endif
> 
>  ifeq ($(BR2_PACKAGE_DBUS),y)
>  RPM_DEPENDENCIES += dbus
> -RPM_CONF_OPTS += --enable-plugins
> +RPM_CONF_OPTS += -DWITH_DBUS=ON
>  else
> -RPM_CONF_OPTS += --disable-plugins
> +RPM_CONF_OPTS += -DWITH_DBUS=OFF
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBCAP),y)
>  RPM_DEPENDENCIES += libcap
> -RPM_CONF_OPTS += --with-cap
> +RPM_CONF_OPTS += -DWITH_CAP=ON
>  else
> -RPM_CONF_OPTS += --without-cap
> +RPM_CONF_OPTS += -DWITH_CAP=OFF
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  RPM_DEPENDENCIES += libgcrypt
> -RPM_CONF_OPTS += --with-crypto=libgcrypt
> +RPM_CONF_OPTS += -DWITH_OPENSSL=OFF
>  else
>  RPM_DEPENDENCIES += openssl
> -RPM_CONF_OPTS += --with-crypto=openssl
> -endif
> -
> -ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
> -RPM_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
> -else
> -RPM_CONF_OPTS += --without-libintl-prefix
> +RPM_CONF_OPTS += -DWITH_OPENSSL=ON
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
>  RPM_DEPENDENCIES += libselinux
> -RPM_CONF_OPTS += --with-selinux
> +RPM_CONF_OPTS += -DWITH_SELINUX=ON
>  else
> -RPM_CONF_OPTS += --without-selinux
> +RPM_CONF_OPTS += -DWITH_SELINUX=OFF
>  endif
> 
>  ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  RPM_DEPENDENCIES += python3
> -RPM_CONF_OPTS += --enable-python
> +RPM_CONF_OPTS += -DENABLE_PYTHON=ON
>  else
> -RPM_CONF_OPTS += --disable-python
> +RPM_CONF_OPTS += -DENABLE_PYTHON=OFF
>  endif
> 
>  ifeq ($(BR2_PACKAGE_READLINE),y)
>  RPM_DEPENDENCIES += readline
> -RPM_CONF_OPTS += --with-readline
> +RPM_CONF_OPTS += -DWITH_READLINE=ON
>  else
> -RPM_CONF_OPTS += --without-readline
> +RPM_CONF_OPTS += -DWITH_READLINE=OFF
>  endif
> 
>  ifeq ($(BR2_PACKAGE_SQLITE),y)
>  RPM_DEPENDENCIES += sqlite
> -RPM_CONF_OPTS += --enable-sqlite
> -else
> -RPM_CONF_OPTS += --disable-sqlite
> -endif
> -
> -ifeq ($(BR2_PACKAGE_ZSTD),y)
> -RPM_DEPENDENCIES += zstd
> -RPM_CONF_OPTS += --enable-zstd
> +RPM_CONF_OPTS += -DENABLE_SQLITE=ON
>  else
> -RPM_CONF_OPTS += --disable-zstd
> +RPM_CONF_OPTS += -DENABLE_SQLITE=OFF
>  endif
> 
>  ifeq ($(BR2_PACKAGE_RPM_RPM2ARCHIVE),y)
>  RPM_DEPENDENCIES += libarchive
> -RPM_CONF_OPTS += --with-archive
> +RPM_CONF_OPTS += -DWITH_ARCHIVE=ON
>  else
> -RPM_CONF_OPTS += --without-archive
> +RPM_CONF_OPTS += -DWITH_ARCHIVE=OFF
>  endif
> 
>  # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
> @@ -122,4 +116,4 @@ RPM_CONF_ENV = \
>  	ac_cv_prog_cc_c99='-std=gnu99' \

RPM_CONF_ENV has a remaining autoconf variable
"ac_cv_prog_cc_c99='-std=gnu99'". Since you switch to CMake, I
believe this should be removed.

>  	LIBS=$(TARGET_NLS_LIBS)

Also, is the "LIBS=$(TARGET_NLS_LIBS)" still relevant
for CMake? Note: rpm-4.19.1.1 CMakeLists has a ENABLE_NLS
option. Should this be used when BR2_SYSTEM_ENABLE_NLS=y?

> -$(eval $(autotools-package))
> +$(eval $(cmake-package))
> --
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
