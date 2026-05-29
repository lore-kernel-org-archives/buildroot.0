Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DB0CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2AB440A32;
	Fri, 29 May 2026 08:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZRXDdrug3AQ; Fri, 29 May 2026 08:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6163240A5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043788;
	bh=6eJbEBQOdWYcXdK99c67HnXCEzOvfjTiQ4KHN0IhMUM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=MrPyq626QdA8V+m2NYA7TWd1fHdC4472gS9FoSR+wEmaSXMK4XUalE/XIqIAt4zhs
	 i2yzfXsNMBveWkD9e0FFUoTqH0mKOHne2e068MZtMF+EYLtlrBaNc9wHoVmlE8Zk88
	 A8M5B7HBjWp7A14jQ7e8t9EwFsIJqCtiocqMAr5dXAfv4q9cwEHorYQ3GmdYXNnldX
	 qaXBSyj85PWuWHf2Bbi6Az45Ru3NhpL9eLevEOeRwiKk6yEB1H5AsM8BEejrfw+e4J
	 X6Z4CN91fPWUfQx1Jr0nOwpJOnU3GsHpFWaFZ4pukYuhQaVQ9h8YKetynxhnnVwIBG
	 L2tMHyoL1Zf3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6163240A5C;
	Fri, 29 May 2026 08:36:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B3A28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E23686134C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSuhdNAsbbuY for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:36:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DB8B61336
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DB8B61336
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DB8B61336
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:36:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 514B0B97C4B4; Fri, 29 May 2026 10:36:22 +0200 (CEST)
Message-ID: <b8b77093-83c7-413e-9bc6-ea6dc5bcea8e@rnout.be>
Date: Fri, 29 May 2026 10:36:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260523091156.112718-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260523091156.112718-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780043782; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ltbR+dLV1J3JTBCP0PnkDpga/9jlT015XFkAoxuGIGM=;
 b=E6NnUHf82Opz4/Xye1ik1Web5zGu/t2IXQvlJlertBXoI9pQSyB/XTPxWCwKVc2d5PCHzH
 mSGq95knC4hNj8ghvemiEfp6YNlXQPQCiVPRYqhndxxB2oRpRzvgne1L0tf4cDLtnPvsS3
 qEjx0VHau83qL61aNkZGYlhfmcjT0i7zEh32t6HmN6MDCcUFUgMQI/k4MmNMVAOvKs/sKW
 1FynbENBNC+lQS9c2WY466IwLd1KrSk+PiDVsst4f8wYuiY9Hu40yQuSKE30ZLRRsyYd07
 K1Tg29xeQwCmZL4LVpeo4//lY6XNIT78b5klG234sjD0cj4n81R31WUbP4tVVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=E6NnUHf8
Subject: Re: [Buildroot] [PATCH 1/5] package/daq: remove package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/05/2026 11:11, Bernd Kuhls wrote:
> As discussed on the mailinglist:
> https://lists.buildroot.org/pipermail/buildroot/2026-April/799920.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Series applied to master, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                           |  2 -
>   Config.in.legacy                              |  7 +++
>   DEVELOPERS                                    |  1 -
>   package/Config.in                             |  1 -
>   ...Fix-build-against-the-musl-C-library.patch | 54 -------------------
>   package/daq/0002-parallel-grammar.patch       | 29 ----------
>   ...-fix-incompatible-pointer-type-error.patch | 31 -----------
>   package/daq/Config.in                         | 11 ----
>   package/daq/daq.hash                          |  7 ---
>   package/daq/daq.mk                            | 50 -----------------
>   package/daq3/Config.in                        |  2 -
>   11 files changed, 7 insertions(+), 188 deletions(-)
>   delete mode 100644 package/daq/0001-Fix-build-against-the-musl-C-library.patch
>   delete mode 100644 package/daq/0002-parallel-grammar.patch
>   delete mode 100644 package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
>   delete mode 100644 package/daq/Config.in
>   delete mode 100644 package/daq/daq.hash
>   delete mode 100644 package/daq/daq.mk
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 691e2b8138..822260dad0 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -269,8 +269,6 @@ package/dahdi-tools/0002-no-perl-manpages.patch lib_patch.Upstream
>   package/dante/0001-fix-sparc-compile.patch lib_patch.Upstream
>   package/dante/0002-osdep-m4-Remove-getaddrinfo-too-low-checks.patch lib_patch.Upstream
>   package/dante/S50dante Shellcheck lib_sysv.Indent lib_sysv.Variables
> -package/daq/0001-Fix-build-against-the-musl-C-library.patch lib_patch.Upstream
> -package/daq/0002-parallel-grammar.patch lib_patch.Upstream
>   package/darkhttpd/S50darkhttpd Shellcheck lib_sysv.Indent lib_sysv.Variables
>   package/davfs2/0001-src-Makefile.am-do-not-hardcode-fstack-protector-str.patch lib_patch.Upstream
>   package/dbus-cpp/0001-gcc4.7.patch lib_patch.Upstream
> diff --git a/Config.in.legacy b/Config.in.legacy
> index ef952ed524..12609ffb77 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>   
>   comment "Legacy options removed in 2026.05"
>   
> +config BR2_PACKAGE_DAQ
> +	bool "daq removed"
> +	select BR2_LEGACY
> +	help
> +	  The only dependee, snort, has been removed. Look at daq3
> +	  for an alternative.
> +
>   config BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
>   	bool "fwts efi_runtime kernel module removed"
>   	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 125e7f8248..c426563870 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3037,7 +3037,6 @@ F:	package/aoetools/
>   F:	package/asn1c/
>   F:	package/azure-iot-sdk-c/
>   F:	package/curlpp/
> -F:	package/daq/
>   F:	package/libgdiplus/
>   F:	package/pimd/
>   F:	package/sloci-image/
> diff --git a/package/Config.in b/package/Config.in
> index 9cae377fb5..d6a6490c6c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1984,7 +1984,6 @@ menu "Networking"
>   	source "package/cppzmq/Config.in"
>   	source "package/curlpp/Config.in"
>   	source "package/czmq/Config.in"
> -	source "package/daq/Config.in"
>   	source "package/daq3/Config.in"
>   	source "package/davici/Config.in"
>   	source "package/dht/Config.in"
> diff --git a/package/daq/0001-Fix-build-against-the-musl-C-library.patch b/package/daq/0001-Fix-build-against-the-musl-C-library.patch
> deleted file mode 100644
> index 25f2f9c498..0000000000
> --- a/package/daq/0001-Fix-build-against-the-musl-C-library.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 42efa6d76a3b52f35e576a6b941a9afb5b3879e9 Mon Sep 17 00:00:00 2001
> -From: Sergio Prado <sergio.prado@e-labworks.com>
> -Date: Tue, 9 Jan 2018 21:39:27 -0200
> -Subject: [PATCH] Fix build against the musl C library
> -
> -Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ----
> - os-daq-modules/daq_ipfw.c | 2 +-
> - os-daq-modules/daq_ipq.c  | 2 +-
> - os-daq-modules/daq_nfq.c  | 2 +-
> - 3 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/os-daq-modules/daq_ipfw.c b/os-daq-modules/daq_ipfw.c
> -index 016beb06ad61..98f67717f646 100644
> ---- a/os-daq-modules/daq_ipfw.c
> -+++ b/os-daq-modules/daq_ipfw.c
> -@@ -26,7 +26,7 @@
> -
> - #include <sys/types.h>
> - #include <sys/time.h>
> --#include <sys/unistd.h>
> -+#include <unistd.h>
> -
> - #include <netinet/in.h>
> - #include <sys/socket.h>
> -diff --git a/os-daq-modules/daq_ipq.c b/os-daq-modules/daq_ipq.c
> -index 77ec6e9505e5..b15e5cf82af0 100644
> ---- a/os-daq-modules/daq_ipq.c
> -+++ b/os-daq-modules/daq_ipq.c
> -@@ -27,7 +27,7 @@
> -
> - #include <sys/types.h>
> - #include <sys/time.h>
> --#include <sys/unistd.h>
> -+#include <unistd.h>
> -
> - #include <netinet/ip.h>
> -
> -diff --git a/os-daq-modules/daq_nfq.c b/os-daq-modules/daq_nfq.c
> -index 33021c0ec991..0df1e61c74c4 100644
> ---- a/os-daq-modules/daq_nfq.c
> -+++ b/os-daq-modules/daq_nfq.c
> -@@ -27,7 +27,7 @@
> -
> - #include <sys/types.h>
> - #include <sys/time.h>
> --#include <sys/unistd.h>
> -+#include <unistd.h>
> -
> - #include <netinet/ip.h>
> -
> ---
> -1.9.1
> -
> diff --git a/package/daq/0002-parallel-grammar.patch b/package/daq/0002-parallel-grammar.patch
> deleted file mode 100644
> index ba0e256f53..0000000000
> --- a/package/daq/0002-parallel-grammar.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Fix parallel build
> -
> -https://bugs.gentoo.org/673390
> -
> -Downloaded from
> -https://gitweb.gentoo.org/repo/gentoo.git/tree/net-libs/daq/files/daq-2.0.6-parallel-grammar.patch
> -
> -Patch was sent upstream: https://seclists.org/snort/2014/q3/1016
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -
> ---- a/sfbpf/Makefile.am
> -+++ b/sfbpf/Makefile.am
> -@@ -43,13 +43,14 @@
> - libsfbpf_la_LDFLAGS = -version-info 0:1:0 @XCCFLAGS@
> -
> - # use of $@ and $< here is a GNU idiom that borks BSD
> --sf_scanner.c: $(srcdir)/scanner.l
> -+sf_scanner.c: $(srcdir)/scanner.l tokdefs.h
> - 	@rm -f $(srcdir)/sf_scanner.c
> - 	$(srcdir)/runlex.sh $(V_LEX) -osf_scanner.c $(srcdir)/scanner.l
> -
> - sf_scanner.o: sf_scanner.c tokdefs.h
> -
> - tokdefs.h: sf_grammar.c
> -+
> - sf_grammar.c: $(srcdir)/grammar.y
> - 	@rm -f sf_grammar.c tokdefs.h
> - 	$(V_YACC) -d $(srcdir)/grammar.y
> diff --git a/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch b/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
> deleted file mode 100644
> index a15d325cd6..0000000000
> --- a/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Fix daq incompatible pointer type error when gcc option
> -'-Wincompatible-pointer-types is set:
> -
> -| ../../daq-2.0.7/os-daq-modules/daq_nfq.c: In function 'SetPktHdr':
> -| ../../daq-2.0.7/os-daq-modules/daq_nfq.c:394:37: error: passing argument 2
> -   of 'nfq_get_payload' from incompatible pointer type [-Wincompatible-pointer-types]
> -|   394 |     int len = nfq_get_payload(nfad, (char**)pkt);
> -|       |                                     ^~~~~~~~~~~
> -|       |                                     |
> -|       |                                     char **
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible-pointer-type-error.patch?h=master
> -Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ----
> - os-daq-modules/daq_nfq.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/os-daq-modules/daq_nfq.c b/os-daq-modules/daq_nfq.c
> -index 4de94b6..a6de2f3 100644
> ---- a/os-daq-modules/daq_nfq.c
> -+++ b/os-daq-modules/daq_nfq.c
> -@@ -391,7 +391,7 @@ static inline int SetPktHdr (
> -     DAQ_PktHdr_t* hdr,
> -     uint8_t** pkt
> - ) {
> --    int len = nfq_get_payload(nfad, (char**)pkt);
> -+    int len = nfq_get_payload(nfad, (unsigned char**)pkt);
> -
> -     if ( len <= 0 )
> -         return -1;
> diff --git a/package/daq/Config.in b/package/daq/Config.in
> deleted file mode 100644
> index ad294abd60..0000000000
> --- a/package/daq/Config.in
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -config BR2_PACKAGE_DAQ
> -	bool "daq"
> -	depends on !BR2_STATIC_LIBS # dlfcn.h
> -	help
> -	  DAQ is a Data Acquisition library for packet I/O from the
> -	  Snort project.
> -
> -	  https://www.snort.org
> -
> -comment "daq needs a toolchain w/ dynamic library"
> -	depends on BR2_STATIC_LIBS
> diff --git a/package/daq/daq.hash b/package/daq/daq.hash
> deleted file mode 100644
> index 82323ed404..0000000000
> --- a/package/daq/daq.hash
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# From https://www.snort.org/downloads/snort/md5s
> -md5  60e5ddcafb985fac7374884d28f299d1  daq-2.0.7-modified.tar.gz
> -# Locally computed:
> -sha256  d1f6709bc5dbddee3fdf170cdc1e49fb926e2031d4869ecf367a8c47efc87279  daq-2.0.7-modified.tar.gz
> -
> -# Hash for license files:
> -sha256  07f28289c09fd9eb5a6ff7bc710ff40363601b1bbc6f3637d8ed412150e90819  COPYING
> diff --git a/package/daq/daq.mk b/package/daq/daq.mk
> deleted file mode 100644
> index 27abd4d2f5..0000000000
> --- a/package/daq/daq.mk
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -################################################################################
> -#
> -# daq
> -#
> -################################################################################
> -
> -DAQ_VERSION = 2.0.7
> -# Upstream re-published a modified archive for the same 2.0.7 version, so change
> -# its name locally, to avoid conflict with older BR versions which had a hash
> -# for the previous archive.
> -DAQ_SOURCE = daq-2.0.7-modified.tar.gz
> -DAQ_SITE = https://www.snort.org/downloads/snort/daq-$(DAQ_VERSION).tar.gz?buildroot-path=filename
> -DAQ_LICENSE = GPL-2.0
> -DAQ_LICENSE_FILES = COPYING
> -DAQ_INSTALL_STAGING = YES
> -DAQ_DEPENDENCIES = host-bison host-flex
> -# 0002-parallel-grammar.patch
> -# 2.0.7 needs autoreconf due to configure being older than configure.ac
> -DAQ_AUTORECONF = YES
> -
> -# disable ipq module as libipq is deprecated
> -DAQ_CONF_OPTS += --disable-ipq-module
> -
> -# Set --with-dnet-{includes,libraries} even if ipq and nfq modules are disabled
> -# otherwise daq will call 'dnet-config --cflags' and 'dnet-config --libs' which
> -# will result in a build failure if libdnet is installed on host
> -DAQ_CONF_OPTS += \
> -	--with-dnet-includes=$(STAGING_DIR)/usr/include \
> -	--with-dnet-libraries=$(STAGING_DIR)/usr/lib
> -
> -ifeq ($(BR2_PACKAGE_LIBDNET)$(BR2_PACKAGE_LIBNETFILTER_QUEUE),yy)
> -DAQ_DEPENDENCIES += libdnet libnetfilter_queue
> -DAQ_CONF_OPTS += --enable-nfq-module
> -else
> -DAQ_CONF_OPTS += --disable-nfq-module
> -endif
> -
> -ifeq ($(BR2_PACKAGE_LIBPCAP),y)
> -DAQ_DEPENDENCIES += libpcap
> -# assume these flags are available to prevent configure from running
> -# test programs while cross compiling
> -DAQ_CONF_ENV += \
> -	ac_cv_lib_pcap_pcap_lib_version=yes \
> -	daq_cv_libpcap_version_1x=yes
> -DAQ_CONF_OPTS += --enable-pcap-module
> -else
> -DAQ_CONF_OPTS += --disable-pcap-module
> -endif
> -
> -$(eval $(autotools-package))
> diff --git a/package/daq3/Config.in b/package/daq3/Config.in
> index b53e5508fd..8025e48bc7 100644
> --- a/package/daq3/Config.in
> +++ b/package/daq3/Config.in
> @@ -1,6 +1,5 @@
>   config BR2_PACKAGE_DAQ3
>   	bool "daq3"
> -	depends on !BR2_PACKAGE_DAQ
>   	depends on !BR2_STATIC_LIBS # dlfcn.h
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
> @@ -11,6 +10,5 @@ config BR2_PACKAGE_DAQ3
>   	  https://www.snort.org
>   
>   comment "daq3 needs a toolchain w/ dynamic library, gcc >= 4.9, threads"
> -	depends on !BR2_PACKAGE_DAQ
>   	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
>   		|| !BR2_TOOLCHAIN_HAS_THREADS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
