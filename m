Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F058FC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 16:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 890398149A;
	Sun,  7 Aug 2022 16:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 890398149A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 65_G0QwL89XI; Sun,  7 Aug 2022 16:09:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFDB88142A;
	Sun,  7 Aug 2022 16:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFDB88142A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74E811BF96B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DD04402D7
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DD04402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CE7npNsjKZx for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 16:08:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79B99400B9
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 16:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79B99400B9
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EB28986F84; Sun,  7 Aug 2022 15:54:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 16:56:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acf68180de66c710a8e19bae7325cf253e0b5849
X-Git-Newrev: c99545867a58b96d7b7525a7c10ff78940255477
X-Patchwork-Hint: ignore
Message-Id: <20220807155430.EB28986F84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-twised: add conch and
 serial support
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

commit: https://git.buildroot.net/buildroot/commit/?id=c99545867a58b96d7b7525a7c10ff78940255477
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The conch subpackage is required by python-crossbar.

Added the serial subpackage while at it, even if it is not required by
Crossbar.

Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-twisted/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 8596025e9c..c0acf35560 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -29,4 +29,16 @@ config BR2_PACKAGE_PYTHON_TWISTED_TLS
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 
+config BR2_PACKAGE_PYTHON_TWISTED_CONCH
+	bool "Conch support"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_APPDIRS # runtime
+	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
+
+config BR2_PACKAGE_PYTHON_TWISTED_SERIAL
+	bool "Serial support"
+	select BR2_PACKAGE_PYTHON_SERIAL # runtime
+
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
