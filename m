Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8D1C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 15:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C732440B41;
	Tue, 14 Jun 2022 15:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dvGM0l70GyG; Tue, 14 Jun 2022 15:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06BB940B53;
	Tue, 14 Jun 2022 15:44:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C90F1BF9B5
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C369832DB
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQolarFGlo22 for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 15:44:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D9B783022
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 15:44:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E608B86F75; Tue, 14 Jun 2022 15:32:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 17:28:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80a24d0965c543a7e32d338bd42c4ab10b71ae81
X-Git-Newrev: a5599d727e542d065784090830efaf99f1677df7
X-Patchwork-Hint: ignore
Message-Id: <20220614153200.E608B86F75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a5599d727e542d065784090830efaf99f1677df7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The microblazeel, microblazebe and openrisc toolchains need to select
this option as they don't have any gdb/gdbserver.

Helps in fixing:

  http://autobuild.buildroot.net/results/6315ef7b66ee4ae8f870c92186bc674d65f62f2c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
