Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F5BC61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 16:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A16780DF2;
	Tue,  1 Sep 2026 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlVXy7Dw3NIg; Tue,  1 Sep 2026 16:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788281037;
	bh=psu6ysfVwiGo0ZfV5s8iU0skgG20fnfvNTQiNrACzxA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NxiYk0nwbzx2DpzclCTEkBUFJHDR59dzPrvHp3T8Phg4j16+gqmZt3eD5SUvyxsCj
	 6V7xhVlynMJgmjYCDcSWAorxe0x05SUBJHRNajKVqt96EUDjKw6LAz/8wb0oo3H3Qo
	 cHMfyThOW8KqvFDNB58ObWjzhvVv/nv7MRC3Zx3Ur+gnGfqRzdqJtDQqb0U3G4a+Wf
	 Ca6ip34ARq8kry/YD1nrY7g3xhuCB6nFlYKvJkBa8dDC1slJ9ED5V4117VzZ9CRTYB
	 IskOkdbY5yKB96nxJ1uzo1qEOz15jXMlkgU1QAIO0dkXg2CM/OfXqJa2aoJAIa/4B3
	 Wlew+b7mYrU2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E71780DB3;
	Tue,  1 Sep 2026 16:43:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E4522FE
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 16:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 601C140757
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 16:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsnGfWYtg1D5 for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 16:43:55 +0000 (UTC)
X-Greylist: delayed 64 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 01 Sep 2026 16:43:53 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=207.54.77.50;
 helo=esa3.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com
 [207.54.77.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C296740754
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 16:43:53 +0000 (UTC)
X-CSE-ConnectionGUID: Ieh3fPJ7SK22upHy0j3hsQ==
X-CSE-MsgGUID: rWwnWdvzTLCnC/L3064udg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
 by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 19:42:46 +0300
X-CSE-ConnectionGUID: C+ByPYPlQXiktFiifcqWTg==
X-CSE-MsgGUID: d0CoG47BT8urUAivhj62pg==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.3])
 by ces02_data.me-corp.lan with SMTP; 01 Sep 2026 19:49:21 +0300
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Tue, 01 Sep 2026 19:42:44 +0300
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>, guenther.harrasser@mobileye.com,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 Chris Packham <judge.packham@gmail.com>
Date: Tue,  1 Sep 2026 19:42:30 +0300
Message-ID: <20260901164232.3771190-1-jimmy.wesolowski@mobileye.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260311173338.167112-1-jimmy.wesolowski@mobileye.com>
References: <20260311173338.167112-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5] package/coremark: use USE_PTHREAD when
 possible, allow custom CFLAGS
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This passes -DUSE_PTHREAD to coremark CFLAGS
BR2_TOOLCHAIN_HAS_THREAD is set, and allows passing any additional custom
ones defined in the Buildroot configuration.

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>

---
Changes v1 -> v2:
  - do not add mips-i6500 through a patch, but copy it through rsync
    in POST_EXTRACT_HOOKS (suggested by
    Andreas Ziegler <br025@umbiko.net>)
  - allow specifying a port directory to use through kconfig, such as
    mips-i6500. The default stays linux for 32-bits architecture,
    linux64 for 64.
  - allow passing extra PORT_CFLAGS through kconfig  (suggested by
    Andreas Ziegler <br025@umbiko.net>)

Changes v2 -> v3:
  - do not include the mips-i6500 files as they are redundant with
    the linux port. (suggested by Andreas Ziegler <br025@umbiko.net>)
  - fix indentation in Config.in and coremark.mk
  - drop the ability to pass custom port (no longer necessary).
  - adapt the name and description of the patch accordingly.
  - author and signed-off-by reset due to patch significant changes.

Changes v3 -> v4:
  - add -lpthread in CFLAGS (since only CFLAGS are used to compile
    and link).

Changes v4 -> v5:
  - add custom kconfig options for ITERATIONS, MULTITHREAD, and
    USE_THREAD/USE_FORK to reduce the risk of incorrect CFLAGS.
  - use "-pthread" instead of -lpthread, as recommended in the
    documentation.
---
 package/coremark/Config.in   | 56 ++++++++++++++++++++++++++++++++++++
 package/coremark/coremark.mk | 22 ++++++++++++--
 2 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/package/coremark/Config.in b/package/coremark/Config.in
index f0e13eda63..60b7d44b44 100644
--- a/package/coremark/Config.in
+++ b/package/coremark/Config.in
@@ -6,3 +6,59 @@ config BR2_PACKAGE_COREMARK
 	  used in embedded systems
 
 	  https://www.eembc.org/coremark/
+
+if BR2_PACKAGE_COREMARK
+config BR2_PACKAGE_COREMARK_MULTITHREAD
+	int "coremark number of parallel executions"
+	default 4
+	help
+	  Additional CFLAGS to pass to CoreMark platform specific port.
+	  Any additional flags indicated here will be added to the
+	  CFLAGS_PORT variable.
+
+choice
+	prompt "coremark implementation"
+	help
+	  Coremark provides either POSIX thread API if supported by the
+	  toolchain, or forking.
+	  select BR2_PACKAGE_COREMARK_IMPLEMENTATION_THREAD if BR2_TOOLCHAIN_HAS_THREADS
+	  select BR2_PACKAGE_COREMARK_IMPLEMENTATION_FORK
+
+if BR2_TOOLCHAIN_HAS_THREADS
+config BR2_PACKAGE_COREMARK_IMPLEMENTATION_THREAD
+	bool "POSIX thread API"
+endif
+
+if !BR2_TOOLCHAIN_HAS_THREADS
+comment "POSIX thread API requires the toolchain to have threading support"
+endif
+
+config BR2_PACKAGE_COREMARK_IMPLEMENTATION_FORK
+	bool "Forking"
+endchoice
+
+
+config BR2_PACKAGE_COREMARK_ITERATIONS
+	int "number of coremark benchmark iterations"
+	default 0
+	help
+	  From Coremark documentation:
+	  By default, the benchmark will run between 10-100 seconds. To
+	  override, use ITERATIONS=N.
+	  Minimum required run time: Results are only valid for reporting
+	  if the benchmark ran for at least 10 secs!
+
+	  This option allows to indicate this number of iterations, 0
+	  being the default, and running the benchmark for 10-100 seconds.
+
+config BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA
+	string "coremark port extra CFLAGS"
+	default ""
+	help
+	  Additional CFLAGS to pass to CoreMark platform specific port.
+	  Any additional flags indicated here will be added to the
+	  CFLAGS_PORT variable.
+	  Please use with caution, since this can break Coremark build.
+	  Use only if you have additional flags unrelated to Coremark
+	  internal build.
+endif
diff --git a/package/coremark/coremark.mk b/package/coremark/coremark.mk
index 9ea8693e71..332091007b 100644
--- a/package/coremark/coremark.mk
+++ b/package/coremark/coremark.mk
@@ -9,14 +9,30 @@ COREMARK_SITE = $(call github,eembc,coremark,v$(COREMARK_VERSION))
 COREMARK_LICENSE = Apache-2.0
 COREMARK_LICENSE_FILES = LICENSE.md
 
+COREMARK_CFLAGS = \
+	$(TARGET_CFLAGS) \
+	$(call qstrip,$(BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA))
+
+ifeq ($(BR2_PACKAGE_COREMARK_IMPLEMENTATION_THREAD),y)
+  COREMARK_CFLAGS += -DUSE_PTHREAD -pthread -lpthread
+else # !BR2_PACKAGE_COREMARK_IMPLEMENTATION_THREAD
+  ifeq ($(BR2_PACKAGE_COREMARK_IMPLEMENTATION_FORK),y)
+    COREMARK_CFLAGS += -DUSE_FORK
+  else # !BR2_PACKAGE_COREMARK_IMPLEMENTATION_FORK
+    $(error Unknown Coremark implementation)
+  endif # !BR2_PACKAGE_COREMARK_IMPLEMENTATION_FORK
+endif # !BR2_PACKAGE_COREMARK_IMPLEMENTATION_THREAD
+COREMARK_CFLAGS += -DMULTITHREAD=$(call qstrip,$(BR2_PACKAGE_COREMARK_MULTITHREAD))
+COREMARK_CFLAGS += -DITERATIONS=$(call qstrip,$(BR2_PACKAGE_COREMARK_ITERATIONS))
+
 define COREMARK_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
-		PORT_CFLAGS="$(TARGET_CFLAGS)" \
+		PORT_CFLAGS="$(COREMARK_CFLAGS)" \
 		PORT_DIR=linux$(if $(BR2_ARCH_IS_64),64) EXE= link
-endef
+endef # COREMARK_BUILD_CMDS
 
 define COREMARK_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/coremark $(TARGET_DIR)/usr/bin/coremark
-endef
+endef # COREMARK_INSTALL_TARGET_CMDS
 
 $(eval $(generic-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
