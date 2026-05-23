Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5ACCD5BB8
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 15:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D236086F;
	Sat, 23 May 2026 15:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZlN5Is9J5O6; Sat, 23 May 2026 15:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1ECA6088C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779549580;
	bh=x6mTNzDD8CT41P69Z1RT/rJ+AcXzqUOV262fgjBgV+k=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=eNrYhTx5uENoM+nPKEnbXz6iaKvST6Y4S/hdXIwb1DeOVdYphLT98qK67aKg7VvDo
	 YXPf2WoyJfizYn0i8zBwY+Rd8qnFO9t6z2VgnU9CEeiQKOmNys177K5ZLWU9MoVu64
	 R69kifnkoNgNSSa5dlw6eO29S/cZAqOzw0ftCxQFsmDul9JBHL4js/eqIxrD0NbHaz
	 j9avjfwzaPeZyGJBCJjXUN/AQQR0fVopmfvzqjYDEndVAfQPtjzeugitj+jo/wN0PB
	 m1wJXyH3YVmY7aUvk5KlfQvdtgerC2TclW4aGnERV5nky2L6hz11e4tw/3lC6ijyht
	 6m7qeDbjVWnNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1ECA6088C;
	Sat, 23 May 2026 15:19:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EEC93B9
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C57440EFA
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmXsABdyckX0 for <buildroot@buildroot.org>;
 Sat, 23 May 2026 15:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 158A6406D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 158A6406D9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 158A6406D9
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKFk-1waC4V0dQw-007zut; Sat, 23
 May 2026 17:19:33 +0200
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 15:19:06 +0000
Message-ID: <20260523151911.10285-4-and@gmx.li>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523151911.10285-1-and@gmx.li>
References: <20260523151911.10285-1-and@gmx.li>
MIME-Version: 1.0
X-Provags-ID: V03:K1:bOEacyZAQAmzyXXGpG/rpA0Vvxyn59uwsRddUensydtoSPMEU0p
 sSW8scgbMmtTv0FNze/LYXe6WMQxMYUG1nKp+jI6SvDiiYmLDUw4s5OXLCLjuPEsd4LOOzd
 ia7hxO0kiPFrLnN50CznFu6z3UbewIHtmJgmP1tcd5eA7GWtbmdou5j14nhsn9m20I0yrgC
 09QJZCD9dwnuuNcf4gS0Q==
UI-OutboundReport: notjunk:1;M01:P0:/WR1jYrm2lI=;g3HHS6pciAA+EFDBE4pkWwXFynD
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779549573; x=1780154373; i=and@gmx.li;
 bh=9XjmCLzXHvmUr8GojwPyJWynknxA6nyYSnH/Iv8ZW/4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gd6EuGEgFyZigy/yHYCMohlj8hW8KHj3z0i3COeNsmeNIUxaYGRNz9DuFPSjGZgA
 vrxuxOGxndEExvGRtbhY4QC9U/V+jHI7gp6bg83A/k/EdZaf+WaoXDuzSlayHpSgl
 7QkwnTXZ67S11Jw+nR3p7/aerPEvpP+EJ5ZQRk1BADBNREYbxtdmrBOhtvTKfqhnM
 s8BVWtsNPyn0l9/7C9gVgo+sOWqX0wtD51O+IKGNhDOgKn36hPs7IifG2e8nbUkJ6
 bSlVRcuNQYRtA2xEyhcECav4xDIVJ6KzwVd73PE/Xyj6uFwfKOh059y8SNZaia760
 jWHWFzKn0zVcYl47JA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=gd6EuGEg
Subject: [Buildroot] [PATCH/next v2 4/9] package/docker-engine: remove lvm2
 !BR2_STATIC_LIBS entry
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Laurent Vivier <laurent@vivier.eu>, Sen Hastings <sen@hastings.org>,
 Christian Stewart <christian@aperture.us>, Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove lvm2 !BR2_STATIC_LIBS dependency

(It still depends on !BR2_STATIC_LIBS by BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS)

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/docker-engine/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index ae07b5e1..541472d9 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -30,7 +30,6 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
 	bool "devicemapper filesystem driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
-	depends on !BR2_STATIC_LIBS # lvm2
 	select BR2_PACKAGE_LVM2
 	help
 	  Build the devicemapper filesystem driver for Docker.
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
