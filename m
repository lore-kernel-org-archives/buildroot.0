Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F9CD68BC1
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 22:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF58260B89;
	Wed, 17 Dec 2025 22:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRUtArF0kIlf; Wed, 17 Dec 2025 22:05:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0145A6076B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766009145;
	bh=+CEXalW9mvHTQY5bWU8Hcpv8ctMEFnh+O5lbWHZrMZM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i70hB5D/5n70PdBQz8hYIlUTAONWiKCQ1HXBculJmwKu5GT/mBFkogbdbzR618/i+
	 r566ry/sih4YBEDDW5BE+TmUT2Xsu40z0Qu3k8Lt3jn3DdPk52RKAmCbX2z137gMrS
	 5gReQTIAproO56TKo4TDnRb3ahdF+9G0n55yFlu121vuWocEm6mbq/Vd21KAKn6VqU
	 S5qt541CIch+atD3fmt3h2uOVqJ2h1M2PXpFULGHpsSBRpNFYBIupyc65wQc4uKk0F
	 fJudRtwmv550enXeWRVQIlx0is8xBxrJWtCz8/M/2XcQ0Ix9qUcfnbygGNz9flzn9C
	 D/9Z4EC4/XKTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0145A6076B;
	Wed, 17 Dec 2025 22:05:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52643361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4494183C93
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xH2Ptz3r87n0 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 22:05:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 351E183C92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 351E183C92
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 351E183C92
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:05:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D28B7A4C4511
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 23:05:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42376)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVzeA-000000000hE-13hF
 for buildroot@buildroot.org; Wed, 17 Dec 2025 22:05:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 23:05:25 +0100
Message-ID: <20251217220525.3815471-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217220525.3815471-1-bernd@kuhls.net>
References: <20251217220525.3815471-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766009126;
 bh=dFrxfTu9xL0WWe/11ebGSXkYKAxz5i//NK7PYZhM6Ig=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=MD7ABqHqSd1GTy2z5i9Y3zDbwW7PuP/FYhemyVCAMXyp9pZpObOvhe3Lh10nfpCLs
 oVn1y9xxTLtVUJAiJBk7adeR756tTf90nza3yhsL40SIiK1FUn+B1KJOrE7D+Dc6Km
 r75mCdoVYfaeA38JtSHq/tSkI7scujHxZDgdIxX9UT1ca0tEi3galXqzpxfWQrlyNE
 RDcPSJe+r39DQzIjuj9Ni5dsSVmi97PzWepsH9CUnpm/eCZQwGFNJ+PIQ1HvsJaOI0
 Biiy1JFfbcSbGj3dYWgD8atvNX+P8iKz7PvTlKe42lGcFqWqESzdq3/mhiJcCcQv0+
 5rsYsUHnFSvKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=MD7ABqHq
Subject: [Buildroot] [PATCH v3 2/2] DEVELOPERS: add Bernd Kuhls for libid3tag
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: no changes
v2: initial revision

 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 62b093fe2b..282c88bfd2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -420,6 +420,7 @@ F:	package/libglew/
 F:	package/libglu/
 F:	package/libhdhomerun/
 F:	package/libheif/
+F:	package/libid3tag/
 F:	package/libilbc/
 F:	package/libldns/
 F:	package/libmicrohttpd/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
