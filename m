Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ED1C982E6
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 17:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4200E60743;
	Mon, 21 Sep 2026 17:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJ45Nq2pra6Q; Mon, 21 Sep 2026 17:25:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5F3F960759
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790011528;
	b=j8pIUEHBtG8IwNW+vv2Ha+oM1HXv5JULxKJHnXCeLxWUpF7yph/7KuMbTkz9dVM3AOB3
	 NXOieMc1MHTgPd281lDv9WA3KXTGFkEgrtn+1LfdBItbRi9M6rCVRw//vUd0/DgDn2qt3
	 FFct2wNuxHjJV4Iu0LcLlqx1UwAwUQNvv5WPnxZ/NM8zcVb6foOsDoXeLMBUT8Q8z4KkX
	 GlC9XlMyal1Lr3qdHGpS1fPhobxCvgP0LinFDZhP1BqvPnTcLskC3FvMXQGeBuNW7yHOm
	 LHLUC/d4D6c42lqorg6A0bIysR8FPAlFNxCpKO1j0+n/ZryUDvC6YeSIXgtIsE/zQ5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790011528;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4Z3rVpGoIqlRXr6fNmxRRWVpOsA3Lnp2r9VWmK+ghPg=;
	b=aaNwu8nv/0wXbdY2EGSYJIW98ciFGWfDNb5eO6oXbWC+LQ/v1X/emOITtqpcyUZ2CtHT
	 gEkA1aqLhKXEwIzU0XUyEtH99w7Rv4s6jjrq7WmPy6RIylosLfUCujupXblgcR0IGg+JC
	 EZTO9y2VpD69fZtdDqk6mUpTk94gz/Oq/mQ1c5rNDkFKadJ0kEEwK9gwWKmEfpRjk3PTk
	 v1zexm5WadKC3+UW8JWikKHJOSPlRYRojP0yqIvC16BpIveRHpB8LE2EeFdoi3Y4RorPR
	 yK8lDEQCbg6LAQImrBRiEE7E+lLMWLkoqQ5f42QLBSTlcDV5DtJZZBoirXxBBPM3kLw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790011528;
	bh=4Z3rVpGoIqlRXr6fNmxRRWVpOsA3Lnp2r9VWmK+ghPg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BBDsZ+Zi6oErJTjWYs0D+Y1Rs9Rw5GjREd6pPxWa6yIXUubgzyvndypD902cBQd9d
	 YWjGGt5I7/TWfcKzUWsjg2lJcZViC9nfZJpp7ITDmWie/KwcYz4kSpHT8wJzCYKCqs
	 5kOFX9s3Gcu+Ganl4jeb8FeMa+bVKvLsbEWia7Ex+ecTxcsdzSBRqE/VMZD5ky34Md
	 J4e7znGER47kmVoY8lN1CmiiBaw13q6beC1s4CHj4XwzvZUEQSalXlFtklKxvjvtCl
	 ClQjMuECVLQaxJCalO8ybpqCd447TaYtC0i7vU4DPWbdiBXpXljM2DMn9sZ5GHfBCP
	 BgOzwnWk/6RSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F3F960759;
	Mon, 21 Sep 2026 17:25:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0B90224
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 17:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6D45407E7
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 17:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJXCH8Bekin7 for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 17:25:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DD01D407C5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790011525;
 b=Gh6ouf5uVs+itMOleMvJPTZm/3eCjb8mrmIAO9/l6ZYhRyMxshRVL833aAwuVwsuLihU
 uI/HxylXycL4toj3kGkNig6uxVqVowrIpVmJqmsnkI++Sts6ly8cA4900oqeGZBMHVjQ1
 BTfPVqBYS8oNrFUKb4z2Dn3Itb8V5Gu2m4dZQhmFmUkS+OzBDCjY1T+rBenvHKtsdZA03
 h4a5Mw3iqloRwLkBUfRdVAL89UJzP2m4cdUQMjvkuwgbw2oQIF8mnXYteRUwvdOTTI4P6
 PgcC1bhZgMtIq+dZA8igTeBfmFq5Z9nJYZce6kZ8XyobGeh4aDMrr7oGk0P88X3TgLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790011525;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=O9Q5Li3+8DJgTiaUPPzx1Q4zl0unF2c86WckwcHnxb4=;
 b=XUHmC/LI8IvhZXswLfZ9cAv1v9Fj4B0/unYKZl1qa73lW6Abj3ahOFIYOs8wjFq66c2a
 SxDSFQd6n3V3q4FT4FoSAXGhqDkXVrVDWBXxnMLbSfTYsyCHdmQQ/iRJFbEHOA53WIel9
 E0VfDg7eD1/OiXA1pRUc9qatZ9ZDTol9D++Lm9yrkm4CFtRQ5Oz9ZxZO9ownpdLPSULhS
 +fxIiNV/5NXsOOMKg4IMX46qiRMGXsQKLTpImFvYMvcRwtCWgDeVE1bmX67JRfjIqV2GG
 M6pHJLyJUx9xagKpo/dTvegmWBZBEFxybngTkWVpS+YYipK8ibvc+DvWJU60CKGk3xw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD01D407C5
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 17:25:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB02D935C8; Mon, 21 Sep 2026 17:24:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Sep 2026 19:19:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e88c26904bbdc604eff0cf3029f41de943f1f9d5
X-Git-Newrev: dbf3c1f7bf8a38ea9d3db18f9261cc74c27be73b
X-Patchwork-Hint: ignore
Message-Id: <20260921172416.EB02D935C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: bump version to
 20260916
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dbf3c1f7bf8a38ea9d3db18f9261cc74c27be73b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Updated the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index c9cb054689..4c9ac0f141 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  f3937ca282ba256242e2b6dbe523df8a80007d29ffd61f56d270190865492ea8  linux-firmware-20260910.tar.xz
+sha256  f80dcb757a623deda62200c08e0e1a88c76fb6b54964f31b35fa74da1c90ccc5  linux-firmware-20260916.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENSES/LICENCE.Abilis
@@ -50,7 +50,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSES/LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSES/LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSES/LICENSE.sdma_firmware
-sha256  8bc466434be59e1c044cb3821b30b7328859ca250a451bb6c799ffb21ae47f2e  WHENCE
+sha256  9350832c1e9afc35df50fa8b9793b31d60d78ef963152eec903fc0dbc6b4a559  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  LICENSES/NOTICE.qcom
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENSES/LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSES/LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c5749513c5..17fb565cb9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20260910
+LINUX_FIRMWARE_VERSION = 20260916
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
