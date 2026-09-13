Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69235C88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 07:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20056605EF;
	Sun, 13 Sep 2026 07:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToBmXt4jRjCX; Sun, 13 Sep 2026 07:53:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F03AB60602
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789286033;
	b=T5pZjYmxgcmhcxlP98U2ppqPtQ+bZjs7NA6GSy2Qg+kJjqKjZrglcqIHD6S+rrNQ9AY+
	 enrLzMtkBKX/3ANbys9CMj1lIVt3owfJWCtsLWydu7Zf4D0denqdYnt40eD1GxuKoWtQS
	 by/mTGUodMCL0czfVktjS42CbD15YxoOH+NN26TqtuJ//3bGjL1H1D/pn5R0ZjKo5IUpB
	 GAiZnPbXNpx72lXTgYZdh4qL6DyjnOJd8LQGOLdvMzAlMpof2MtHQFFIkZc9sTT6Gni/V
	 CFtU19yi81JlNWFmfBJSt39J7RbpInDUWf0PbOYKrJavvRskE8hUNG4a2fFpB5LgoLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789286033;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=M6r0neBMJgB6F8EPAFCOS/2HPW4S9bjexC6zCClV8VA=;
	b=ZmffbT8vg+XPk5njqNSQ8jCrolgBkvGHewNDiq8FNTloVP/qsn90EG6Qs1ZU26JFNRSl
	 OteqL0Q0VMvFSBONQbiYmxdyzoVFcNilhV5CaqCpZGUw5qluQEXuxbatVQpf9mH76qjnx
	 cxkCw2SZSCjGCpRJ9+gUoWmNCBMVQmOk9nyX+im5Trp6BkNxs+5panvfGdsmeKgWoEWR2
	 jjex9pMCmulAO74nbQ4xNnUxPpFrt6Xt8qODvqi6N6qPQWIzNqOgVqveQ9Wzam7yEn+9+
	 F5vpEC5ojspkOg4t4Mwf5gWggtzUU+TtTLnnTUTArZ/4sqSIuR8/Ij3y9xdbNQivq7w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789286033;
	bh=M6r0neBMJgB6F8EPAFCOS/2HPW4S9bjexC6zCClV8VA=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g7U+FafKZUQfNhrSrq51Uqfhj4pDl41a25akxINTX3s+pn1xxJrGm6QG2M6clcg2o
	 ZGF7VaT6/xvPQYZOn5wh6n25We+PTip01ztQwQVW8AuiS/KETC7Mjrqt6qy9pbpXpD
	 GA++ZkQBXlEUsM8Nk4lwpW04gy3eEMyTgu63HflOnKaWUSdQsBNQ5WvrXpNYHJTRmQ
	 3eFBrss/VoNWp4ZpwHHElPfEc7nSc5rPKKadtnyRQyY8WjykK37wB7lubBJ9k1Wf3Q
	 I+7WjmsoHR7GRnumnhYpXgRQuaSSvFLOkn/2SIrNXkvP0fsAqe9P8bDwAUf1e97vHa
	 kVXlsf3ivVJhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F03AB60602;
	Sun, 13 Sep 2026 07:53:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 847E0109
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81C9E400AC
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_j_CSg93gYZ for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 07:53:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4267A40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789286030;
 b=E1OtchULUY4E483Mw47Oh978UFP44qBWeXbwNrsjkvfeUSKDkUZz/Zo8Lj+aCRPqNfN3
 NO7F1xKMmmNBUEdaCMIUyofozuj1MgcQTNMNkS5uitZIqaa1qVkFn+vuutzOFjHVHI0Ie
 se8UA2jiLsz1XhWJWHHOZ36eniaLoaEGYkvIpdOuZknIFofo4PanLYSAZ7OR1EuCI78Z2
 2c3fy3iZ59fEvZGfE9P4kBlZvZvifXZJfG4XSBoYGRIz1xuW0VC0lCdhOhkf+/WnRSN7a
 wToz7HTfEXyhtaqC91UDoPCwg+xLedKDY3qaVDz60c3bv5dqO0/7u25VzsmM/P+kbGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789286030;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=OZJGdYaJ1gR67iPVDRjeP1QGPFOaj/BrHsnajB1dAtQ=;
 b=GXODTn9KmpknJ2t8cYfwzvLCyGBbQ+AXwWVGp1CHWuI1eSuiJE65tGUfY4tL5OtilLlz
 x58DQl/QOp25V4/x9LixD1QojCNo0xL6kzxYund7CaH/5BFBDAz7XrBiu4AVI4hKy07iP
 Lmkk2ncUoAoa4A/HNqCHXGGbdJiRYhI7qEnNNDE9Upb8ov0Ae5yj1VLPfrpVATvCmK439
 8y9IBIPqoEPuVp0dITRSV5XqHw0Ks+Ln/sEp8of+q3rQpPhHIwq8F7/wvHRLV0WB5ijhP
 JOdzp3ZcxQa5nS8WUuZgU2hNZiUFGXujqJiFokBvrEsxBfsEMkYLMIgrQIJKDCz34Dw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=openadk.org; 
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4267A40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1789286027; bh=7SAujHI05fhXeKZLuOmHjcQvDy2ZxPFp3di4jVUMFk0=;
 h=Date:From:To:Subject:From;
 b=Gcd98TwRNYmuXWwmmHF4+8zpqq+QkAUiVkyTx6IWs6cjChJRiajDcPetfkqW/36Fl
 7kwPdHzyo0Iy7NVwRgyP8lWvzUxvG9TtOdkxupPy+yW+7nIpX8Pi78sQTC594nb7Xg
 rqFD5AtUE9143dBs2Y1IVwNsZyOsbZ3PhI6LRAG7J/tWBpBx739dNvTLv88Yn0+CIc
 U7qGORBtaz4PK/AKDfeFGMG1mox358azD4vpunlReD3PvqsyCwSbNWGFMIyVmrCqDT
 AjPXbcmd+t4+Qa95xotHwo3V+2DAdZlbNiYt6GcM0i3Hetqzz3WSVNLUFRgzNBvUUA
 rBwi7h7IKSHDA==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 38F0331E0BBE; Sun, 13 Sep 2026 09:53:47 +0200 (CEST)
Date: Sun, 13 Sep 2026 09:53:47 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aqZWi-3XxmbWmJbA@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/chawan: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Chawan is a text-mode web browser and pager for Unix-like systems, with
a focus on implementing modern web standards while remaining
self-contained, easy to understand and extensible.

It includes functionality such as CSS, inline images inside the
terminal, and JavaScript through a small, independent browser engine.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/chawan/Config.in   | 14 ++++++++++++++
 package/chawan/chawan.hash |  3 +++
 package/chawan/chawan.mk   | 39 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 package/chawan/Config.in
 create mode 100644 package/chawan/chawan.hash
 create mode 100644 package/chawan/chawan.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 97eb2d9cac..780577f091 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3461,6 +3461,7 @@ F:	board/stmicroelectronics/stm32f746-disco/
 F:	configs/qemu_riscv32_nommu_virt_defconfig
 F:	configs/stm32f746_disco_sd_defconfig
 F:	package/asterisk/
+F:	package/chawan/
 F:	package/evilwm/
 F:	package/fbv/
 F:	package/libpam-pkcs11/
diff --git a/package/Config.in b/package/Config.in
index 243b390d1c..76ae6f5810 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2441,6 +2441,7 @@ endif
 	source "package/casync/Config.in"
 	source "package/casync-nano/Config.in"
 	source "package/cfm/Config.in"
+	source "package/chawan/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
 	source "package/cloudflared/Config.in"
diff --git a/package/chawan/Config.in b/package/chawan/Config.in
new file mode 100644
index 0000000000..8bea79ef6d
--- /dev/null
+++ b/package/chawan/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CHAWAN
+	bool "chawan"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_PACKAGE_BROTLI
+	select BR2_PACKAGE_LIBSSH2
+	select BR2_PACKAGE_OPENSSL
+	help
+	  A TUI Web-Browser.
+
+	  https://chawan.net/
+
+comment "chawan needs a toolchain w/ gcc >= 11"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_11
diff --git a/package/chawan/chawan.hash b/package/chawan/chawan.hash
new file mode 100644
index 0000000000..95f996d10a
--- /dev/null
+++ b/package/chawan/chawan.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e0a06e1504e10a51c6009751d79b798c98d8274e559fe195d4b4b7ddadf91bb8  v0.4.4.tar.gz
+sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/chawan/chawan.mk b/package/chawan/chawan.mk
new file mode 100644
index 0000000000..d16499f91a
--- /dev/null
+++ b/package/chawan/chawan.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# chawan
+#
+################################################################################
+
+CHAWAN_VERSION = 0.4.4
+CHAWAN_SITE = https://git.sr.ht/~bptato/chawan/archive
+CHAWAN_SOURCE = v$(CHAWAN_VERSION).tar.gz
+CHAWAN_LICENSE = Public Domain
+CHAWAN_LICENSE_FILES = UNLICENSE
+
+CHAWAN_DEPENDENCIES = host-nim brotli libssh2 openssl
+
+ifeq ($(BR2_aarch64),y)
+CHAWAN_TARGET_ARCH = arm64
+else ifeq ($(BR2_x86_64),y)
+CHAWAN_TARGET_ARCH = amd64
+else
+CHAWAN_TARGET_ARCH = $(BR2_ARCH)
+endif
+
+TARGET_CONFIGURE_OPTS += \
+			 FLAGS="--os=linux \
+			 --cpu:$(CHAWAN_TARGET_ARCH) \
+			 --gcc.exe:$(TARGET_CROSS)gcc \
+			 --gcc.linkerexe:$(TARGET_CROSS)gcc" \
+			 PREFIX="/usr"
+
+define CHAWAN_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define CHAWAN_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
