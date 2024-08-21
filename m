Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA8AC52D7C
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 13:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFD8A405BE;
	Wed, 21 Aug 2024 13:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FaxIIMB9QC5q; Wed, 21 Aug 2024 13:15:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D90F9405D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D90F9405D9;
	Wed, 21 Aug 2024 13:15:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D71D21BF3C0
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 13:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6CA94016A
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 13:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tF4z6bSr6gbA for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 13:15:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6707340216
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6707340216
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6707340216
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 13:15:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id BAD08FF809;
 Wed, 21 Aug 2024 13:15:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Aug 2024 15:15:24 +0200
Message-ID: <20240821131525.2038862-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821131525.2038862-1-thomas.petazzoni@bootlin.com>
References: <20240821131525.2038862-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724246127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAOZR789RhqBXnaDEaj9WFgtBMIHBvItbilzS5nDb68=;
 b=JfLbcvh913k8BagnrP26VhODq9mVdK4MeEQUUBA1TFOKANssuHEtUWV5CNsnnK7dFhcIEe
 /9vmbuFYqBvBDpnmqhxaErzmyNZYDSwISTFJyyuWej5N0wuzhJ2vPFE/LwDEFG72aR2p/N
 0Z9GXKq8LTI2R9e06V+Ixny2C4pz3JkQ8KzYNUmSLKrsMRn4AKu8q0FnEmcBu+719TEhYB
 uQsz1WYbJzBMPJYVQSXW8k71n/uBNxPxg80TohKTzwn0JzMkDTM7Sw3mz31rQj7iqF8qFx
 dx7CGt1P3cu2L6qWPjwzTixmmjyPvl1gSVwjdPj9h77IwpGztutTaF+hh3fs3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JfLbcvh9
Subject: [Buildroot] [PATCH 2/2] boot/grub2: ignore CVE-2023-4001
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

This vulnerability is irrelevant to Buildroot, as it affects only some
downstream changes from Redhat.

See:

  https://security-tracker.debian.org/tracker/CVE-2023-4001
  https://www.openwall.com/lists/oss-security/2024/01/15/3

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/grub2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 19544b6e12..1263c63cfd 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -25,6 +25,9 @@ GRUB2_IGNORE_CVES += CVE-2019-14865
 GRUB2_IGNORE_CVES += CVE-2020-15705
 # vulnerability is specific to the SUSE distribution
 GRUB2_IGNORE_CVES += CVE-2021-46705
+# vulnerability is specific to the Redhat distribution, affects a
+# downstream change from Redhat related to password authentication
+GRUB2_IGNORE_CVES += CVE-2023-4001
 # vulnerability is specific to the Redhat distribution, affects the
 # grub2-set-bootflag tool, which doesn't exist upstream
 GRUB2_IGNORE_CVES += CVE-2024-1048
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
