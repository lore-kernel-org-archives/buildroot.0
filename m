Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8394CC369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 21:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDCB480520;
	Fri, 18 Apr 2025 21:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkorTeORYhJi; Fri, 18 Apr 2025 21:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9BDB804FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BDB804FD;
	Fri, 18 Apr 2025 21:41:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 72779228
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 21:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63A46804E3
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 21:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKsJAG38JYDC for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 21:41:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E620E804E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E620E804E2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E620E804E2
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 21:41:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 07D3241B42;
 Fri, 18 Apr 2025 21:41:44 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 18 Apr 2025 23:41:43 +0200
Message-ID: <20250418214143.2790625-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduvdfhveevhfehvdfgveefteevfedtgfeiudevuefhgfduleelfffhhfekteetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghuihhlughrohhothdrnhgvthenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhmpdhrtghpthhtohepsggvrhhnugeskhhuhhhlshdrnhgvth
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745012505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AE4JGe9KuxD2vyVseun3AcHe9VC7tU+BxiA3XgE1Mhk=;
 b=djfkg1YorkduCFAlOPc3BtaiDoooB8yDn7KNxXtkDJN6QsapyrYBy42NVb1DewranipfBb
 WKXJ4mVtRbuvgHshAvFKQA+P6WNn6uMLsoPy9lTd3WBh77buCI/9Wlo76mn5ZNuQ3o4UKv
 vauC/Dl4p/MgwCXrxNUKeHjuCPDwzOfbwm5qmjUfPjJSZvR9cqTXGZNHK/dhPNZueWWTLF
 8LTA0i+eB/LzFe+0Y02LHVVrNoc9jR3AdU0JdxBI0GAIR0GeF/pa+8avBPY3pwTXavpZxn
 +iKs6fFDnFxhIfE2Uw+MeDiVampe+2HvnZJrtQygsNfeyVdoH46IpecGtmwYuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=djfkg1Yo
Subject: [Buildroot] [PATCH] package/libcap: add patch to fix build on ARC,
 OpenRISC, Microblaze
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the bump of libcap to version 2.76 in commit
e2eb2ee58b9f70ebb83231537cca19bd28fa48de, the build started failing on
ARC, OpenRISC, Microblaze. The bug was reported upstream at
https://bugzilla.kernel.org/show_bug.cgi?id=219915 and was
subsequently fixed by upstream commit:

  https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=7a2eee56607218d017af8d26c2c41dba83629708

Which we backport in this commit.

Fixes:

  http://autobuild.buildroot.net/results/c99f461ac757d2934a353818a302a67ef3ad5cf5/ (ARC)
  http://autobuild.buildroot.net/results/8cae72f02d25a48287320d9c991f41761487e353/ (Microblaze)
  http://autobuild.buildroot.net/results/74e2c4d37c5b0ae2749c7d77ca7431bd0d510971/ (OpenRISC)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-PSX-support-for-microblaze-arc-and-.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/libcap/0001-First-attempt-at-PSX-support-for-microblaze-arc-and-.patch

diff --git a/package/libcap/0001-First-attempt-at-PSX-support-for-microblaze-arc-and-.patch b/package/libcap/0001-First-attempt-at-PSX-support-for-microblaze-arc-and-.patch
new file mode 100644
index 0000000000..3f569d6d2c
--- /dev/null
+++ b/package/libcap/0001-First-attempt-at-PSX-support-for-microblaze-arc-and-.patch
@@ -0,0 +1,56 @@
+From 7a2eee56607218d017af8d26c2c41dba83629708 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Thu, 17 Apr 2025 20:20:09 -0700
+Subject: [PATCH] First attempt at PSX support for microblaze, arc and
+ openrisc.
+
+I found some confusing macrology for openrisc. I'm optimistic that
+this is recognized with the __or1k__ gcc macro.
+
+See for details:
+
+  https://bugzilla.kernel.org/show_bug.cgi?id=219915
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+Upstream: https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=7a2eee56607218d017af8d26c2c41dba83629708
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ psx/psx_calls.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/psx/psx_calls.c b/psx/psx_calls.c
+index 9662fbd..8195964 100644
+--- a/psx/psx_calls.c
++++ b/psx/psx_calls.c
+@@ -48,7 +48,8 @@
+     || defined(__mips__) || defined(__loongarch__) \
+     || defined(__powerpc__) || defined(__s390__) || defined(__riscv) \
+     || defined(__alpha__) || defined(__hppa__) || defined(__sh__) \
+-    || defined(__m68k__) || defined(__sparc__)
++    || defined(__m68k__) || defined(__sparc__) || defined(__arc__) \
++    || defined(__microblaze__) || defined(__or1k__)
+ 
+ #undef _NSIG
+ #undef _NSIG_BPW
+@@ -69,7 +70,8 @@
+ 
+ #if defined(__x86_64__) || defined(__i386__) \
+     || defined(__arm__) \
+-    || defined(__powerpc__)
++    || defined(__powerpc__) \
++    || defined(__arc__)
+ /* field used */
+ #define SA_RESTORER  0x04000000
+ #endif /* architectures that use SA_RESTORER */
+@@ -201,6 +203,8 @@ static void psx_posix_syscall_actor(int signum, siginfo_t *info, void *ignore) {
+ 	    __asm__ __volatile__("\npsx_restorer:\n\tmov r7,#173\n\tswi 0\n");
+ #elif defined(__powerpc__)
+ 	    __asm__ __volatile__("\npsx_restorer:\n\tli 0, 172\n\tsc\n");
++#elif defined(__arc__)
++	    __asm__ __volatile__("\npsx_restorer:\n\tmov r8, 139\n\ttrap_s 0\n");
+ #else
+ #error "unsupported architecture - https://bugzilla.kernel.org/show_bug.cgi?id=219687"
+ #endif /* supported architectures */
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
