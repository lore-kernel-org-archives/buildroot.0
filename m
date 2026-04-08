Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61646FD5F99
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 08:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3158E40F76;
	Wed,  8 Apr 2026 08:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBe7eFvbSvWz; Wed,  8 Apr 2026 08:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 716A640C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775638549;
	bh=ocoHfty+gqP31oamVHN2WLgbABJWeMyoQBkfM5CmH40=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qmE5QJJrX2xELVOD3XMnTrAdKsY35r80PDXj/JRVxUxQOPhrlLMNcwouzP2RlTE1Q
	 fpcKetHJpkLIPW3d+rtHX202FgpIvi2uppVgypMUz7QrgmYwH+Xybxnmxw5k4dx9Xu
	 9LGdDKL9MZRRC+mP/ZRh0Rg8bO0hvrvPfTv5os9mm30ugYKXWh4zRm0WJKKEXv87fb
	 OhetL7R7Uiqjg+XZcs7HjO93A92S4XMVXw0oXxL84cxy+XLk3atZHu/Lv0oTJ1cHbe
	 Jj7R2+JOy/Mvm0NbnYKWiQXg1qjCytMxVtn5HK1ak5zW3n0rSZfOW3fFSK7WT1cPb4
	 55yFMV4xnhanQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 716A640C61;
	Wed,  8 Apr 2026 08:55:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FAE1237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D3634025D
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LOD_APPaOot for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 08:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77B524023D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77B524023D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77B524023D
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 08:55:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6EE9FA4C10EC
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 10:55:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60176)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAOhK-000000005DC-0aOs
 for buildroot@buildroot.org; Wed, 08 Apr 2026 08:55:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Apr 2026 10:55:42 +0200
Message-ID: <20260408085542.1641857-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775638542;
 bh=m1up9HlFKWSW1k1zmV6DkAtHOUbzPSzBFeDSRjeVTmI=;
 h=From:To:Subject:Date:From;
 b=r1yVE4q52aIveR9duPV6SZrsEmX593BmqEni4Uid10ZJ7q1EON3iH+DsyIkbxAs+4
 VwK1dkLPp4JdUtwaWqchX18IpOm3RPAIy0tgpIH4D+xgJuT2aRn9se2NzBX4PWaABo
 TNKNtlAN1V6+r/9orwH3iB6LUhPLKzS8OHLZ6RSPVy0VtN3HjkWVMznTaMlscIm4wo
 aIKDoRqDnf6bLQw1h8gTLFyqVPhQp+G+PC2es2SC/EPM485y8ORaevq4iXv4x3Wdz1
 Url2MsGv1Dn5vDsCHKRIf9I1bwvlb3YDLdSjVk0Ec1sE/Gr0NuWoAiYrwix77gF9YN
 KcMPG7Am4f2Vg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=r1yVE4q5
Subject: [Buildroot] [PATCH 1/1] package/libsoundtouch: bump version to 2.4.1
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

https://soundtouch.surina.net/README.html#changehistory

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libsoundtouch/libsoundtouch.hash | 2 +-
 package/libsoundtouch/libsoundtouch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
index 853f3b90bb..f208f350c9 100644
--- a/package/libsoundtouch/libsoundtouch.hash
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3dda3c9ab1e287f15028c010a66ab7145fa855dfa62763538f341e70b4d10abd  soundtouch-2.4.0.tar.gz
+sha256  e07abf20ce8f95850c280132e1f61ad400fc1f4011b7fac698a503de6aab6733  soundtouch-2.4.1.tar.gz
 sha256  84c6d82dc7de80f5b73f231edfd3ddc5b53513908117452bfa37ea36bb4b7e0a  COPYING.TXT
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index 3140d890f5..e7b25a69a5 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOUNDTOUCH_VERSION = 2.4.0
+LIBSOUNDTOUCH_VERSION = 2.4.1
 LIBSOUNDTOUCH_SOURCE = soundtouch-$(LIBSOUNDTOUCH_VERSION).tar.gz
 LIBSOUNDTOUCH_SITE = https://www.surina.net/soundtouch
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
