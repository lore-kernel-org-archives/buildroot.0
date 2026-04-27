Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8597CFF8868
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 19:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 706426073C;
	Mon, 27 Apr 2026 19:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofhKnbzgAdWY; Mon, 27 Apr 2026 19:11:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62D106072A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777317060;
	bh=FRSkNveFwyAhZ0E3Ue3rhVsHyxD5wCKtEO7RDyNTgd0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kw8qP6cPYR5/M2+x4hkeuYgRhEEL2RiNj7zuFdpEKcDdHefdFTmYB1E6jaGx+cUK8
	 R+aee3QeRPXieZSmrZaesswfdw1gvyUhEYwwZO6R4oU0P10wA/ShpQvxLLilHLaWx1
	 veGN0hfxc4jBh3yE9TK0L9hyypRTdnMkVGcjQgCkAqgXqyvwJfkGIzJ0cK7koREIG0
	 Voxvfu2o75pq0MoVXa4KwJC/C1NwS5sDX1FiRh//ovset06il1lS1KWKqwW14+qYvw
	 eO3DbZRd0SSmwobJXWwodX1lAsQzkKU92tqFPMOyCEJbNhjYj/OVjB3vKq8EPyOxAQ
	 UBmrAE1JPKMOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62D106072A;
	Mon, 27 Apr 2026 19:11:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 490412DF
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 19:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EDC26072A
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 19:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhNkQojGYG12 for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 19:10:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B01460729
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B01460729
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B01460729
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 19:10:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 85541A4C060E
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 21:10:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53402)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wHRM6-0000000032u-3NrL
 for buildroot@buildroot.org; Mon, 27 Apr 2026 19:10:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 21:10:55 +0200
Message-ID: <20260427191055.113258-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777317055;
 bh=8MC3T18h2UqXD9PmT26RlDKgd+aVtLkQ4OWKZRzzLLg=;
 h=From:To:Subject:Date:From;
 b=Zhy3FZBp+EF7RXKXWYvud2XlJoorpk4lgIVbCgMZnCqQ6NQINObvbRt9XSmWBM7AC
 QVKDML/DQiK6JLcSFO39oYKLmBGioVg+gP9gl0JYg6FV+aaW1RRqO7VTxZhfJxGf8m
 JQGophHRMhL04U2sNeeDcgcI6fDovN4ocv/Z/UTx+cla6MCRBUXhcTOiTWi7aOUpW0
 NM1FmGa2JGNNO9MpS5eZYr93UWjuA8lE44sHPZRrQd8kcoKg/1/FyGopqmpBkOKDtW
 WIGmXv3OAynzgdb6+6g1Nk+0jFQ/4n/y8sseyJpETvozXlb39SDVEwIXN224303fef
 4SZdshQUfDwOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Zhy3FZBp
Subject: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.7.3
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

https://github.com/OpenVPN/openvpn/blob/v2.7.3/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index edfd25bfc9..d2e72bbbc0 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  9c3e150a595fc9a375221f2fa9f10524a9c064536cf81c96e3ba66c735b86f26  openvpn-2.7.2.tar.gz
+sha256  24f54cb0759330762f1140b874c07c8542c6a08b13457d8570dafd387d49397a  openvpn-2.7.3.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 01e19b2627..7598c9430a 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.2
+OPENVPN_VERSION = 2.7.3
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
