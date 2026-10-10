Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63250CA9EC7
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01F6560638;
	Sat, 10 Oct 2026 15:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFvDmm5ArnFQ; Sat, 10 Oct 2026 15:56:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E880960639
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791647777;
	b=QURK8Um5ZJB0CCq+R1ZpWDJHxXe22x4YhCdzGu83YRfVCfs90bApKv/RkozIe5JXqj1u
	 GmtCz4q/cxetGcErDvsqPUG4ALAY06rOtCxj5d4EH889XceCc+GAeGRUoGme8DwacPNGm
	 Iz5JkLFpc2kpG4jDo68cttc8sIFwfhQjY+nrZ0UsF51A86M2jYrImQX9CLvNAr9X1p/GT
	 f6Z/K5OAZXD8JkSXSud8TxmIqaJJ7vmC7J+OvNxKZekFTyCxEVYFTBzm3DSzMjgczLPCc
	 v6Cm81nRCLLCkf6JWqt5NNer1ILepn9CjWsu+shA6FJYM6EsWMlrzJmtrKjA/SbhzLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791647777;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UkJSG4aodQ27LDGC1lcw7Ie5d2Ji70HABqm6/etYOmg=;
	b=dLMNZkktTLWqqVsqKyZwdPqytZgv7/sh5T3WPCgJZiYSDnz5o+mf/IpxMLFaJeQUV3g7
	 I6L2Xnpmpi8c3obw4dgcW5bbENvBxYdnXdkJp0LrFHbhpRlEbdwvZDvk/6KaEL5JTr8yt
	 2qEb7msLX2TSsun44+qa4bqlnP73WLQpF3CJ0kG5VNpMeZHD/SJ8FURa5BUcDhLAJgagA
	 qdUp9/mdqTDQFJ+948teOzSp9Y4xmwVT2K9YXPpoKo1Llj39mzELZjgT04hm0OuknNx2j
	 c/wPLieGL+UYrfSY+yfMQNryySXrWhqVbDXmEPQAGh+EYJ+NbS/xoxt75x9H5tB4ivw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791647777;
	bh=UkJSG4aodQ27LDGC1lcw7Ie5d2Ji70HABqm6/etYOmg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jJuFHrUgeoBoVh/f+pGa1/2FcjZfBR91bSLUbuMBnvcNkJHKuD2Rmw3KKeaNBq5yM
	 3Y/12frD7YjwObqSwEsI9pnROVJwQtyc7mScPFNTI3tMi2ObsGEURASrF/sVDGkz86
	 z2og4EF3eUuXJxy83kER1solfku1emQWTFWDLUpDoZ/tr9Oyc5gfL4+mZySi4Y8QQZ
	 ZCOsc99ceQyk2os0XjDQKHMX174F8cKoRkhSfdSNX5LH577Os2XuxXUtPEa43Lhv5s
	 R1I02wAF+DgDSFNjIHU5EbV4/cp42fZUINXEyHlvSt5H8k7NHPgLerFvGsFah+ruwW
	 BPUnmLkpb4NlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E880960639;
	Sat, 10 Oct 2026 15:56:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C3BF9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 998CD81108
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNkkX2zaPZYX for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:56:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D197681106
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791647774;
 b=InQ42t5ipVDV1ktUNm6QSIOQTRVWYP+NGp9nebs0kOrLudp0Yae55XlodswFOHOaxuoo
 s/isHYYCVKYKuykMV7UoU5gTRAcAUIAmuW22YWblwPiVZ2YYIixHfHPouWkxF1kElXlGN
 6SPiLTlxiacuoUvMLrC7f9mBW3GAnvko1++lxMnDms+PeUqHV61GYk1rX5MAeFCGLBdTh
 TN+Tg2OJhZ8eLwHetCiBew+ThyAbt3Nst9/gAs7y4cFQrgTtix3cEFNpk9NNMVLt1jnny
 7k69uNd60wIicPtu5BbXUdln6vuweoQhsXHm4jbNFWJ7zzUqa4nhStmRwrk7BqUj2ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791647774;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=m2mIfPeO89PJfNMI5ogEJlkhKLsndRmDN4zjAMFebxI=;
 b=XWJoGvsRu9YEUtiKybMPhZmSM86KV4iTNHosJl17WQgXtBpiojAZdjA5J4iu4aBSgK/D
 KKfwDO4KZMe2wiHRAaT9ZAOX5PSgOrw8vQtFig7cIJVSkRrp/939Wjx+IrlYqxaYIwxCA
 xXUUERLgQMh5/zjhdm3yUEEABm2OFfAJ2ZEoeZ1cQifBe89PAUSz4ajhTpRAl6n+h4ST7
 M51N5zUKHAQ5UIO2HqrsN22yWIATaYozg/E/IWHUiANtDyDwIp9aWQCCXNZnNJU9MtUj5
 nDYrO7YuC4b4uXx0ragt9KRomQ0v0Dj9ivOJ1EFsC54OTGHKfds71zb9wragahmnCew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D197681106
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:56:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C18B9229B; Sat, 10 Oct 2026 15:54:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:46:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f454580f0f5f591f9a9edfdefb5c7ef4b0aa28db
X-Git-Newrev: 8ddf1d86477041f5cb3b32e18f6852d4d729e81a
X-Patchwork-Hint: ignore
Message-Id: <20261010155456.8C18B9229B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zstd: add pzstd support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ddf1d86477041f5cb3b32e18f6852d4d729e81a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add support for pzstd, the multi-threaded implementation of zstd.

The pzstd build requires C++ and threads support. On some architectures
(e.g., Microblaze, SPARC), it also requires linking against libatomic
due to the use of atomic operations.

Ensure that -latomic is passed in LDFLAGS during both the build and
install phases. Consistently passing LDFLAGS is necessary because the
pzstd Makefile re-links the binary during the 'install' target due to
its dependency on the static library.

Fixes build failures reported with bootlin-microblazeel-uclibc and
bootlin-sparc-uclibc toolchains:
Pzstd.cpp:(.text+0x17e8): undefined reference to '__atomic_compare_exchange_1'
Pzstd.cpp:(.text._ZN5pzstd15BufferWorkQueue3popERNS_6BufferE): undefined reference to '__atomic_fetch_sub_4'

For host-zstd, always build pzstd. It just adds a few seconds of
build time.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Reviewed-by: Joseph Kogut <joseph.kogut@gmail.com>
Tested-by: Joseph Kogut <joseph.kogut@gmail.com>
[Arnout: unconditionally build pzstd for the host]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 DEVELOPERS             |  3 +++
 package/zstd/Config.in | 15 +++++++++++++++
 package/zstd/zstd.mk   | 20 ++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 26e0d66a26..e7e5af92ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3634,3 +3634,6 @@ F:	package/tinc/
 F:	support/testing/tests/package/test_libusb_compat.py
 F:	support/testing/tests/package/test_libusb_compat/
 F:	support/testing/tests/package/test_quazip.py
+
+N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:	package/zstd/
diff --git a/package/zstd/Config.in b/package/zstd/Config.in
index 9fa70c65cc..0331c5e446 100644
--- a/package/zstd/Config.in
+++ b/package/zstd/Config.in
@@ -10,3 +10,18 @@ config BR2_PACKAGE_ZSTD
 	  compression formats
 
 	  https://facebook.github.io/zstd
+
+if BR2_PACKAGE_ZSTD
+
+config BR2_PACKAGE_ZSTD_PZSTD
+	bool "pzstd"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  PZstandard, or pzstd, is a multi-threaded implementation
+	  of the Zstandard (zstd) compression algorithm.
+
+comment "pzstd needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index 70da1e7354..c5a19c76f3 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -78,11 +78,26 @@ ZSTD_BUILD_LIBS = \
 		$(addsuffix $(ZSTD_BUILD_LIBS_THREAD_SUFFIX), \
 			$(ZSTD_BUILD_LIBS_BASENAMES)))
 
+ifeq ($(BR2_PACKAGE_ZSTD_PZSTD),y)
+ZSTD_PZSTD_LDFLAGS = $(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_HAS_LIBATOMIC),-latomic)
+define ZSTD_BUILD_PZSTD
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		LDFLAGS="$(ZSTD_PZSTD_LDFLAGS)" \
+		HAVE_THREAD=1 -C $(@D)/contrib/pzstd
+endef
+define ZSTD_INSTALL_PZSTD
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
+		LDFLAGS="$(ZSTD_PZSTD_LDFLAGS)" \
+		DESTDIR=$(TARGET_DIR) -C $(@D)/contrib/pzstd install
+endef
+endif
+
 define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D)/lib $(ZSTD_BUILD_LIBS)
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
+	$(ZSTD_BUILD_PZSTD)
 endef
 
 define ZSTD_INSTALL_STAGING_CMDS
@@ -96,6 +111,7 @@ define ZSTD_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) -C $(@D)/programs install
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		DESTDIR=$(TARGET_DIR) -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
+	$(ZSTD_INSTALL_PZSTD)
 endef
 
 HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
@@ -107,11 +123,15 @@ HOST_ZSTD_ENV += CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)"
 define HOST_ZSTD_BUILD_CMDS
 	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
 		-C $(@D) zstd-release lib-release
+	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
+		HAVE_THREAD=1 -C $(@D)/contrib/pzstd
 endef
 
 define HOST_ZSTD_INSTALL_CMDS
 	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
 		-C $(@D) install
+	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
+		-C $(@D)/contrib/pzstd install
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
