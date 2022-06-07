Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4ECC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 20:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED5A240569;
	Tue,  7 Jun 2022 20:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iw_ehZTcCKt1; Tue,  7 Jun 2022 20:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DE5840332;
	Tue,  7 Jun 2022 20:37:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C7201BF9B4
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B3A260B60
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6t2fcFpewnz for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 20:36:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 610B160A9B
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 20:36:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 9C19E240005;
 Tue,  7 Jun 2022 20:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654634174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKrG5WNuzMorQNRJDZRxtWGnSbEKCPKxaD+xXQsnnpc=;
 b=QQke2Lew2RtmrM4RwjeLNpeqfibbS/tMkDCEE48hc0Ikz+mk+tz+Cd6E0Qe4Q+e4dZ5vFG
 XaesBWONgBkiznDf9t97vCpKjpjZ1IOLig7uCEK2MReO7bdcnA1SOVz7JEMwTS6UqsgJSG
 4y5X2/ES16iUNgPLt2Zs5mlqKJnYLE0C7rTLt8/DtWzo0mtoCPHDRegG7OMsbfcmsL9b3j
 18c6lZwjTzTH0Nep/v//bsTH0en91YZSteY1DpvuZ/U0UMwlYhIPM1G+WpBbYkGaEtRUgW
 ywRQfl3WpIIaYsnHfSsZaMzl6fodhiiYO4SqueYsyThs9O1GV/DXgE0O4u2+wA==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Tue,  7 Jun 2022 22:35:49 +0200
Message-Id: <20220607203553.3307479-9-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
References: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 08/11] support/scripts/gen-bootlin-toolchains:
 make use of BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
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
