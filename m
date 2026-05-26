Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B6BCD5BC8
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 20:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C84AD610B0;
	Tue, 26 May 2026 20:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FO5Lud4aBQjN; Tue, 26 May 2026 20:07:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF384610A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779826046;
	bh=fVibKaN5iGVhgmPR/xo2nBvVnUKROdbs5ZL/9Xaxobc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3x9iGQeItnKR/zWudtmeoTPmfRevnGcgcRr2qh9tm3t2tpBK23Wa41cDv6BYXKD5
	 5Kb/Tji9sExelT03uFY2vouZtbxn/rwKya35FoDjxcjwtF+Kzme72639VfNuDUSuKo
	 CSfQbG4ROZptiqWaTrNvoHV9FkdNg8HJeKXefVbSjPPmhckgpqo6CVYz0VLOI38lDM
	 bc+iLTzZV13TkL2gmWjM5AbbuDEC/rnxlynvTLENTYyEqbPSB5tISJAy6nmAG6yhRi
	 QEoZVozLArx97hdBDWnkvjfout2qhDwYYEWszzlBydkd/VPWJdEItxOaiF4d0cmLId
	 6qDc/iKXVgn/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF384610A1;
	Tue, 26 May 2026 20:07:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78696297
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 765FD610A1
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DhzYPK4BVoT for <buildroot@buildroot.org>;
 Tue, 26 May 2026 20:07:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66C7B61099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66C7B61099
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66C7B61099
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:07:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C28A3A4C2BF4
 for <buildroot@buildroot.org>; Tue, 26 May 2026 22:07:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39036)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRy2z-000000000xj-3dBK
 for buildroot@buildroot.org; Tue, 26 May 2026 20:06:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 22:06:41 +0200
Message-ID: <20260526200641.939539-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526200641.939539-1-bernd@kuhls.net>
References: <20260526200641.939539-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779826021;
 bh=g6xztXEVaVdlxc+X72jpY9jJdHbL9v8Zfioc3d6wn40=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=EpfFA0RyjovdZmRzPpQpmGrXeWa8eTu4ONz+LLGQiqu25rf+CCDABecK3ix9d2ZkL
 bMpkM2TT+ekzMYxF7x0yo90hqoeMV9q4ug6z1Xl5ny0QXnqLGVnJTyo/xl50xKV5S9
 XC2iXOtNXbS+snklqe7m/5CQ5QRULdr/Wsb1FvcBY00lZMBitFXUmcsg7eyYEP3U3z
 0OKedL2VaQa/Bjh9c94KBegIS83YDfEMH9dd5olmVbBPJrfkoFe58roQiHC8hUqrTO
 OPZXkF7IOncnKHueMEmQmpz6HQx741OEXnZhbZJFOx155XvLA6uiSAw6Ianp/v8Ykd
 jw9RRN1OLuhIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=EpfFA0Ry
Subject: [Buildroot] [PATCH 4/4] package/libde265: security bump version to
 1.1.0
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

https://github.com/strukturag/libde265/releases/tag/v1.1.0

"Security fixes

- CVE TBD (GHSA-g2rg-wj66-w594) - Out-of-bounds write in
 process_reference_picture_set via predicted short-term RPS
- CVE TBD (GHSA-vv8h-932h-7r86) - Heap buffer overflow in
 de265_image_get_buffer via SPS dimension integer overflow
- CVE TBD (GHSA-g5hj-rf9f-7vxm) - Unbounded memory accumulation via
 orphaned slice headers in read_slice_NAL
- (GHSA-x27c-jp65-g395) - Quadratic CPU consumption in NAL parser
 (remove_stuffing_bytes, resize)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipeline:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2554360744

 package/libde265/libde265.hash | 4 ++--
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index 0412936d42..71a0221089 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libde265/releases/tag/v1.0.19
-sha256  bb19a0b485d2643e0eeb7e91f3ab32d1ad617e7c487dbedc91214ca3dbd8d7eb  libde265-1.0.19.tar.gz
+# From https://github.com/strukturag/libde265/releases/tag/v1.1.0
+sha256  afc19dd28e2fc523de5952bba5224ee1d28e286c72436d2843df126cca1181fd  libde265-1.1.0.tar.gz
 # Locally computed
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index b559a9f607..2a10dce6d0 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.19
+LIBDE265_VERSION = 1.1.0
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
