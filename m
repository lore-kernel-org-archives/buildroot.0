Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8871CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B171940AD5;
	Tue,  3 Sep 2024 18:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMX1ESBIHVnm; Tue,  3 Sep 2024 18:38:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D08040A48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D08040A48;
	Tue,  3 Sep 2024 18:38:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E50A61BF59C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEDBE80ABE
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOP8wyHhVNUP for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07EFB80E62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07EFB80E62
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0158D86ABE; Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 20:03:45 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 83112fb33fcc88062962d58ab85ec5d7bc8eca82
X-Git-Newrev: 7389a013007d421c56934e8f8908d1cbbc94a630
X-Patchwork-Hint: ignore
Message-Id: <20240903183810.0158D86ABE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/mokutil: force
 libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=7389a013007d421c56934e8f8908d1cbbc94a630
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

mokutil unconditionally uses X509_get0_subject_key_id resulting in the
following build failure with libressl since its addition in commit
2e6e121496bfcbe09c018558be13733077b6df9b:

/home/autobuild/autobuild/instance-18/output-1/host/lib/gcc/i686-buildroot-linux-uclibc/13.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: mokutil-efi_x509.o: in function `get_cert_skid':
efi_x509.c:(.text+0x4e6): undefined reference to `X509_get0_subject_key_id'

Fixes: 2e6e121496bfcbe09c018558be13733077b6df9b
 - http://autobuild.buildroot.org/results/88b549734eae4b25de1b8e1c4f04bace0a7e7418
 - http://autobuild.buildroot.org/results/05ac319bfb2a252f3dcdc5d04761f276afb53b6f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1941fe3d82236f4b4e92eedf6e7f7a34db70016e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mokutil/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mokutil/Config.in b/package/mokutil/Config.in
index dd02078b4e..8895b66d20 100644
--- a/package/mokutil/Config.in
+++ b/package/mokutil/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_MOKUTIL
 	select BR2_PACKAGE_KEYUTILS
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  mokutil is a tool to import or delete the machines owner
 	  keys (MOK) stored in the database of shim.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
