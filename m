Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA917C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 467FB407C7;
	Fri,  4 Sep 2026 16:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HhXWJB1vI-Rw; Fri,  4 Sep 2026 16:12:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 575FA4084E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538354;
	b=SPiAv1KYx7+aNZVYiClCFOjx/r4B3pg5Jzl7LWmgCxcgMd/XA0Gk1TmUf/zRcZlbUvDv
	 WP49Q9siLzcS2s3JYRYBS3q7vm6RfZe+DGXw5nCSpcZIGHQYLZ75+kapFZG/HFEsFYRSr
	 TwHeqvi1lnI/VyDN4kqSMS1vv1ifj8cMOVK1KNfhO3A44jPmRO6X+T1zfNooFFQfSyTgI
	 qC3GKEYGwDvQs+u5zz5efbkfZ7fVmJElqCpCwa56aXXIXE4tlnD6f0ENfy5bl4lSw53K0
	 +OsUrydZafomPOx0768QvnxflF2JvEPn2y2sOGk/gyCzK3pz6Zg4OxSS9AVOBMGi/Hw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538354;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=SisPD81OCiArp7Z19nfx7H1QysbJWFOOZMA+ovf48Mw=;
	b=MSPyQnzJ5tbICBSanGOEeliVH1/LCAC+koFyZxb4mXbWSasRfsSjPkI5Un+v2/TwVpS2
	 kN/b63gKoEcF+uJLldiI4geZ0MAvRDuf+JcmWfAER9kJOemofDGQMbHlp5iub25PpLWHY
	 SHWha/XvaW6kk7IDg2TrZoSF/XUWMPjZtREBuIx1ZZynZ/6FTh+IkkdCRUkY6ZNUNZbUC
	 Of08sFrMIitiLx5nvuvbPH9IAyKnG4SqkeICDCWYgtR9SWmexJoaYM8txoqtaUd0LoPhR
	 U9yMGHqQHqCXDsK5XgryEIau8yQfQ6iXmZzbdfVtyes2JVtLDlmyNm7GwMLTwF3g+Rg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538354;
	bh=SisPD81OCiArp7Z19nfx7H1QysbJWFOOZMA+ovf48Mw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S1alTkQT2YRD6UdD6+TwkcceMvBc38vD9uUl93MZb6NgB3Sb+Zbp3og8oa3axm4XA
	 ttQCNOYwqqsupMho7llzTvwsTkl8q1hOHP4v6946Dm8IizGnBWxAOI/sVJoNApeTwo
	 ETHbCUD0w8v+1W5GfJ+lbd4VYUpjeYKzp75nzvxfRjajkB4dbBMjV24QupSRnHIYay
	 FOktKFlU84FaqmbVGjdAJ4zgE2JMOy4lAA1dReLZ9S+i7tMDYmjWZdff0yzNdkeNSr
	 2MgSWjidoJky111erzdlPf7xvHgMAv3OhiGMaGmQFg9T0froLrX41ErEmhwFeIVZrl
	 u+AXqWargO3hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 575FA4084E;
	Fri,  4 Sep 2026 16:12:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D17CB2FD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B79FC6063F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDhpIi3lNATG for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:12:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A967D60638
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538351;
 b=Fq0bhc0uVTuw1F1QxvrwSk+LkHKEelij3VUz69PTV4wZDUYwcQewalNgTjuV+ZXt8UBJ
 2XcrgPESrN1Q7cd3sie+L4gYLh03Ghh//08cN5nTzY4Mhf8cXgmH4ovkZZP/OdXCO76Of
 vZ6Sb/LT/og/HJbE3sR3Ir03KXWL97efHKRyOdFusdNXk/DVWT1ltFpJnRRuNqH0PyI69
 CGe4a64z/Xn45UuF/RsbfC6GJtg8tfNq5OCJBWvDzdiKSKGtpnCZB/2Bgbsqu3+h3vI6s
 fAG3YHQoJdY5XCFvsVNGVJ8YLz3ffw2HdfsZUEU6SYCvhKF5o6A7apRb8mb1O1+13wA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538351;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=9R0/PyQ2iV3Y+QSHewkpFa5eRQrIRlNxRHA2wqS0ONQ=;
 b=QQSQCJbRgZBq8tH0/eDUtBELK35HdOyYYN9tzk39CXnifZSdOOTmfF5/YLX6H/N7acwz
 0TS6FZQwXgNKR/nror8JZrbKqwpWfpO1Y5I+hI+eU0zmneZ0M5J023pANOF6l4hgPfgeL
 U3gPEUB+bWbkBrkiaaX/actjwgkdI0TGTYnjMIJpQCD9IhWY4pwx3ed2YEnofTz/PWWrM
 aYk/xhi09tsRy4IpwiOUVhkeNVLsZ6zzq5d0x42rAgi1ghecr+LoU/KttbuVngZOfUUS5
 vAcFeRZQfcETP9oxud7l52KQuoI2BMqeQOWuMgUsBG0I+o1YiYjSeEgs/IgeV8tmxfQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=eYQhaTys; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=eYQhaTys
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A967D60638
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788538348;
 bh=9R0/PyQ2iV3Y+QSHewkpFa5eRQrIRlNxRHA2wqS0ONQ=;
 h=From:To:Subject:Date:From;
 b=eYQhaTysThccFRB2lqO2FU5xCAFHaBRRB4xtbMT5+m/hvsvSt7vavm2vCGYkiz4pn
 6k0csHGtzWsMWzMOIFES8gcLqgtaOjMujS5FK0wXNOoZvXLU7OAAPMCxA7W0td1l2t
 6UjbIUluXcUChRTpBagZpBsL3naNl/qrPiGeKXCFGdyqirWQt/JY5zqPZ2RNQlG0In
 Nwrwe1lKw0xSq9jY6GH1fwPQcSdDzBnBYzoZZ0v+K4BWDTBN1ym9oJ64fkMyDu9zDG
 5/ZMGGWNP4IN5vBgWbePT4iVF9T8KUY2JARQ7NcyXHgZGC1l3nlWsR6YheeiKOa5DQ
 4nwmMBYxyqWqg==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 86F24A4C2E98
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 18:12:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34836)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2WWi-000000002f7-16xf
 for buildroot@buildroot.org; Fri, 04 Sep 2026 16:12:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 18:12:28 +0200
Message-ID: <20260904161228.115468-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/libde265: security bump version to
 1.1.2
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

https://github.com/strukturag/libde265/releases/tag/v1.1.2

Security fixes:
(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-xp3h-6f5r-8cxp) Heap use-after-free and double free
 in multi-threaded (WPP) decoding. A crafted stream whose slice segments
 repeat or rewind their slice_segment_address within a picture re-ran
 CTB rows that were already marked finished, so the CABAC context handoff
 between rows was no longer ordered and the shared context table was
 released twice. Slice segments that do not follow the previous one in
 tile-scan order are now rejected with the new warning
 DE265_WARNING_SLICE_SEGMENT_ADDRESS_NOT_INCREASING, and the WPP row
 progress is reset for each slice segment. (medium)

CVE-2026-XXXXX (GHSA-mm7m-v26f-wf8x) Heap use-after-free after
 de265_reset(): the pointer to the previous slice header was left
 dangling when the DPB was cleared, and a dependent slice pushed after
 the reset copied from freed memory. (medium)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/f1ed6b24ee8be990d146d7f4ad1f267e25d3afef

 package/libde265/libde265.hash | 4 ++--
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index 0385364e2e..6f6d33840d 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libde265/releases/tag/v1.1.1
-sha256  fd48a927e94ed74fc7ce8829d222b9d8599fcbfe8b6448ba66705babc56ab219  libde265-1.1.1.tar.gz
+# From https://github.com/strukturag/libde265/releases/tag/v1.1.2
+sha256  eaacd1943ab0c452c19f6136a36ca227e6b761b39a81eaca8454d48c147e1f67  libde265-1.1.2.tar.gz
 # Locally computed
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 81ffb39501..eabdd45939 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.1.1
+LIBDE265_VERSION = 1.1.2
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
