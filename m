Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC3BC98315
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 22:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 290A9606FF;
	Sun, 18 Jan 2026 22:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ei8iHJzLkNiq; Sun, 18 Jan 2026 22:21:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76C33606F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768774884;
	bh=jbyNS6vUwyvP9N660XjMU5S6ufjjg6wy6bb/wtRIEf4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XoOTLcV9SbIhbXd0/bSN6GugHhDz6UtkAKmFvKr791SUVi0JmPTZ+E4+szNY6piI2
	 xt0Gb7ES5KY+LZnXzaUelr4a7k86Y7NJs5c8oeM9O2obJgi1O+EhyQzqCE7pnFP3ut
	 xI4FxWjJRlogkrs5lAZfJgRDrHB3jxTcZDawb6/YzqExPykdDefnD0hqL3iYpasNdL
	 rdNTzMqOYZaz+TUPTXNZ6e8hdMMrvnUZu5uRDqF3dznyQjBu/hFgoHfGF894tIetOL
	 Z1pwJ6yOfcnOrWacQ7Z3uWYByD76PyUv0wdeVVFvSHpYLbHa1yjsKw+oEbUD5b2+hP
	 h/I8gu6+up3rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C33606F3;
	Sun, 18 Jan 2026 22:21:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C539C2CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADB434022E
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7RyXrZRPzaZ for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 22:21:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BABB54022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BABB54022B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BABB54022B
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:21:21 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:17d1:a908:70b9:90c3])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id CA90720039E;
 Sun, 18 Jan 2026 23:21:17 +0100 (CET)
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com,
	Vincent Jardin <vjardin@free.fr>
Date: Sun, 18 Jan 2026 23:21:14 +0100
Message-ID: <20260118222115.71411-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107233633.2870caea@windsurf>
References: <20260107233633.2870caea@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768774879;
 bh=JgQazBaVCy9PXGBsYCQL1/IpRqCczgIlve9GVDZmKhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DaG3BZjLbmyDLQ4CJrIrwAJXkjYd3ai/6ZDNsG8Zt8+Fe1IUcuD1qNLwbhNYc7R79
 z2HJY85/5T93Wz/FGU1aaeqWexQF2MT2ML2U5Sc04oiUraGT05mFSPSBYguUpeNA5V
 ZOCeLOibZ2oyFtyyTwv56JtVzS0GeGkqL93SdtcPy2xIymfcSTlNrHTvQT/4IWerDm
 hchrJNoyF/D1u1S8ktnd+mnUb3+fgIN0/xZGipgumBdVVyrJImkkvZAP/ygmQIy2p2
 MRMxtyrOv4l1w+XO1szucAVp+WI5F+GjHwOgZQ6Ar6GQ8R+jzvDY6q8r/gQ4d4eEc/
 IzLz8tkaSwVxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DaG3BZjL
Subject: [Buildroot] [PATCH v3 0/1] package/dot1ag-utils: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dot1ag-utils is an open source implementation of the IEEE 802.1ag
protocol providing Ethernet OAM (Operations, Administration, and
Maintenance) utilities including ethping, ethtrace, dot1agd, and
dot1ag_ccd.

Changes since v2:
  - Fix CI URL

Changes since v1:
  - Added `Upstream: not yet submitted` tag to patch
  - Simplified bool label to just "dot1ag-utils"
  - Fixed .mk file formatting (single space around =, no empty lines)
  - Note: libpcap does not have BR2_USE_MMU dependency, so despite
    Thomas' suggestion, this dependency was not added to dot1ag-utils.

CI: https://gitlab.com/vjardin/buildroot/-/pipelines/2270183801

Vincent Jardin (1):
  package/dot1ag-utils: new package

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...0001-fix-strncpy-truncation-warnings.patch | 60 +++++++++++++++++++
 package/dot1ag-utils/Config.in                | 11 ++++
 package/dot1ag-utils/dot1ag-utils.hash        |  3 +
 package/dot1ag-utils/dot1ag-utils.mk          | 14 +++++
 6 files changed, 90 insertions(+)
 create mode 100644 package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch
 create mode 100644 package/dot1ag-utils/Config.in
 create mode 100644 package/dot1ag-utils/dot1ag-utils.hash
 create mode 100644 package/dot1ag-utils/dot1ag-utils.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
