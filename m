Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA559C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:20:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50B860E0B
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A50B860E0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 660FD403DD;
	Mon, 25 Oct 2021 20:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AL65UuVMVd2J; Mon, 25 Oct 2021 20:20:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E6724014B;
	Mon, 25 Oct 2021 20:20:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29F6E1BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D72E6403DF
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lF3rCByij_ev for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E01BB403E0
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:18:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3FA9788984; Mon, 25 Oct 2021 20:15:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 22:17:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfdc91cac0d17442af0f06b8c894f896696f465b
X-Git-Newrev: 2d8c220bca22f91c5aa6404a37b50082548dae66
X-Patchwork-Hint: ignore
Message-Id: <20211025201509.3FA9788984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: fix build without
 eap-sim
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d8c220bca22f91c5aa6404a37b50082548dae66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build of eap-sim-file or eap-simaka-reauth fails without eap-sim since
commit 89f20c1c3f9d667ec0a40bcfe17db94ff098e6c0:

make[6]: *** No rule to make target '../../../../src/libsimaka/libsimaka.la', needed by 'libstrongswan-eap-sim-file.la'.  Stop.

make[6]: *** No rule to make target '../../../../src/libsimaka/libsimaka.la', needed by 'libstrongswan-eap-simaka-reauth.la'.  Stop.

So select eap-sim or eap-aka if needed to enable build of simaka library

Fixes:
 - http://autobuild.buildroot.org/results/0c550721c20946e5b9d07951a9698b88e9c53e7f
 - http://autobuild.buildroot.org/results/354a022f789067edfe7ebd464991d1695a697a7a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/strongswan/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 4f02efb79d..23334470fd 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -86,11 +86,13 @@ config BR2_PACKAGE_STRONGSWAN_EAP_SIM
 config BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE
 	bool "Enable EAP-SIM file backend"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
 
 config BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC
 	bool "Enable EAP-SIM smart card backend"
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
+	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
 
 config BR2_PACKAGE_STRONGSWAN_EAP_AKA
 	bool "Enable EAP-AKA"
@@ -100,18 +102,25 @@ config BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2
 	bool "Enable EAP-AKA 3GPP2 algorithms"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
 	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
 
 config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL
 	bool "Enable EAP-SIM/AKA backend based on a triplet/quintuplet SQL database"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
+	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
 
 config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM
 	bool "Enable EAP-SIM/AKA pseudonym storage"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
+	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
 
 config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_REAUTH
 	bool "Enable EAP-SIM/AKA reauthentication data storage"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
+	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
 
 config BR2_PACKAGE_STRONGSWAN_EAP_IDENTITY
 	bool "Enable EAP-Identity"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
