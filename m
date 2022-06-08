Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E5AC43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 07:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DF5360FFF;
	Wed,  8 Jun 2022 07:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahoHqD0QK_6y; Wed,  8 Jun 2022 07:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E3B860FF8;
	Wed,  8 Jun 2022 07:12:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 42F951BF3D2
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17DD94191A
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5odsNqBnXAHr for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 07:10:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2EBA4190C
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 07:10:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id BF41CFF814;
 Wed,  8 Jun 2022 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654672242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKrG5WNuzMorQNRJDZRxtWGnSbEKCPKxaD+xXQsnnpc=;
 b=Be1Xb7LJAUBQXiKz3cgDJETZGUUS/61m7UGT47dsA4o8SAdWEmhrQJCzOTGIYCIfEJAHWN
 fxqYGFFOnS3uc7RzWxMEmUfMcIz8tZZPI7iccl688u53GgW8SI94593XPAFu4wDxNBnhE/
 SaOUmGdyIzgzXl5m81vagwIt2Yx/xdXeJlDGSmgHiBIHPfjPykKbBEwDhqtBspL5cKUNJX
 dCvaJaymdkino282FXKvD4qBsOF5v5UMj5U75rpY48dzO0Y5Vtz7S9YeoAwdOE67xzxr5a
 c9/PHPQvK9GGs3Mosbx7ZCewjY8sf+xGUmbrOFGSkedRHEZENazFO3PZbpbDHQ==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed,  8 Jun 2022 09:10:20 +0200
Message-Id: <20220608071027.3384469-9-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 08/14]
 support/scripts/gen-bootlin-toolchains: make use of
 BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The microblazeel, microblazebe and openrisc toolchains need to select
this option as they don't have any gdb/gdbserver.

Helps in fixing:

  http://autobuild.buildroot.net/results/6315ef7b66ee4ae8f870c92186bc674d65f62f2c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index c96a388f84..ad65f9fe5e 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -73,10 +73,12 @@ arches = {
     'microblazebe': {
         'conditions': ['BR2_microblazebe'],
         'prefix': 'microblaze',
+        'gdbserver': False
     },
     'microblazeel': {
         'conditions': ['BR2_microblazeel'],
         'prefix': 'microblazeel',
+        'gdbserver': False
     },
     'mips32': {
         # Not sure it could be used by other mips32 variants?
@@ -122,6 +124,7 @@ arches = {
     'openrisc': {
         'conditions': ['BR2_or1k'],
         'prefix': 'or1k',
+        'gdbserver': False,
     },
     'powerpc-440fp': {
         # Not sure it could be used by other powerpc variants?
@@ -311,6 +314,9 @@ class Toolchain:
         for c in arches[self.arch]['conditions']:
             depends.append(c)
 
+        if not arches[self.arch].get('gdbserver', True):
+            selects.append("BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER")
+
         for frag in self.fragment:
             # libc type
             if frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC"):
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
