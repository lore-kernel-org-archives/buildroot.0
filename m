Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D93C02193
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 02:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64A1381760;
	Wed,  5 Feb 2025 02:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0dUyMMym6T0; Wed,  5 Feb 2025 02:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8092681778
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8092681778;
	Wed,  5 Feb 2025 02:01:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D380712F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 02:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF05F61052
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 02:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDNgAGfZ8EwB for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 02:01:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DFE56104F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DFE56104F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DFE56104F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 02:01:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [212.166.21.66])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0EB202003BE;
 Wed,  5 Feb 2025 03:01:45 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Jardin <vjardin@free.fr>
Date: Wed,  5 Feb 2025 03:01:42 +0100
Message-ID: <20250205020143.72649-1-vjardin@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738720909;
 bh=3xEJaPZujImzVPthfuXEkggOpQ268rILm9lHqCYsHfA=;
 h=From:To:Cc:Subject:Date:From;
 b=tD18PAcK6fm+fQ1I5JT7IdYb7V/j8uOgv5WZzu08ylLtX0ySKZ8eaJzLbhG5dzLc8
 dV1ZS8BqgZ14lJSa/r3vezjSJrFkjvXStPnNFtDncVrqZtEIQOVQTspgzWgprhej1f
 L0vfIsuoplr/Yz/ah4Gh4Mb+AFVYTgyZNfrp6w3dkQOSIrREP3Zxs9bNsBDRtRvX36
 I4CGW8LM7jKH2Y/cV9P2QYJRgQ24E6P0fwtZT5kAaYFnUd53VxFk7z6lBdFxuo6uiR
 W9lRK3ufmzLVWhhj1Ihzo1ufNzVkP202ByzjX3vfC39UUxIsEdSMqINWrnSx+JIalt
 5tTMxDcoH0glQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tD18PAcK
Subject: [Buildroot] [PATCH v1 0/1] Fix buildroot build - binutils missing
 update
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v1:
  - since the commit a42041575e5, it seems 2.44 should have been used
  - example of build failure: https://gitlab.com/vjardin/buildroot/-/jobs/9043815781
  ERROR: No hash found for binutils-2.43.tar.xz

Vincent Jardin (1):
  package/binutils: bump to 2.44

 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
