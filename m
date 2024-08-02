Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F776C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AB246069C;
	Fri,  2 Aug 2024 21:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCaTxhiJxx0C; Fri,  2 Aug 2024 21:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DE79606A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DE79606A5;
	Fri,  2 Aug 2024 21:41:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C38C1BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09B86820A8
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CI4xA3a6a3QY for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 407A681C19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 407A681C19
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:41:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25EA583BF4; Fri,  2 Aug 2024 21:41:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 23:36:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6aa6d1a5f7d57f65d47e3eb250a18ae23662b02
X-Git-Newrev: 1941fe3d82236f4b4e92eedf6e7f7a34db70016e
X-Patchwork-Hint: ignore
Message-Id: <20240802214120.25EA583BF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mokutil: force libopenssl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1941fe3d82236f4b4e92eedf6e7f7a34db70016e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
