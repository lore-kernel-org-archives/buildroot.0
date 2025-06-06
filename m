Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6600BC5B555
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 13:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31BE481E6B;
	Fri,  6 Jun 2025 13:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a527dxS9WGEf; Fri,  6 Jun 2025 13:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5076681EA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5076681EA8;
	Fri,  6 Jun 2025 13:48:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DBED1A4
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 13:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F60540D1E
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 13:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwMChpwgSU6j for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 13:48:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 658F540CD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 658F540CD1
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 658F540CD1
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 13:48:02 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-adb5cb6d8f1so341832666b.3
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 06:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749217680; x=1749822480;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wSJVB/VK/IU+sjbWohbtLXdiYlYXjxAt7kMDpigPiXA=;
 b=K5m+YWYRJIx862RZeqUCY3v50GQME0kzrl+Yf7cX9ySod+x4ynGFnJy3LP0nzhK7XL
 EndLrrw8pp6wtaR4IFJZeRQt682WFy5uWQqiGHndxuFRnX3qaTTNapDjzRRBdntJDi0V
 J72jktLJT02bU3ZlHPJtomq1ZYXVhaIEOlOtu+g9L31djn/Ndqtfd+tb9LSGWCQI0Vv0
 StcQpI/6qR8z7+6NsOGOnwdXFhHHAQ6YQPVuGe6YejubG1ZkLMrfxHf/HH1twXVx8PBn
 CY1Sn3NNPnVQp2J1Z6r4MbHtnl6w88HbUUPqM/lix2GN1QdBd7Y8dUCYrS/hTEfNpikm
 DgFQ==
X-Gm-Message-State: AOJu0YyYtUL9ZizZEdABMjb8Gpv1COwiEcCTOp8fNxJuv44fOYDAncu1
 lkomiJS29yuA4O5/peboASywawxs8Yp1UWyMOZa//Skv/veNIIQRkkqnJH494dwi3NO1ybP7mDX
 ApP/sWePKZFnzM38UGH+MWsRoRn8ESknPSVPxByU=
X-Gm-Gg: ASbGncssK3CGm2kYpVFGk6HBHVPRPGN3rZUjefoKQv749Qgpq0H2EzQxKF+ecBDNEiv
 fY4V027mUe61BQv8Eu9uZQVcwpiR1WX7J1Jht5GpJJS9UxRWHQkAj3PMwWzUVhXp/AtTnq5NEvf
 rS4x8fTB/sG5sXyfemFjcE2SndPMG8jNLUonfMT2RLQ/Ac
X-Google-Smtp-Source: AGHT+IHXAogigHaI68yusQJSiy5D+RAPrOlBlvcpaubWMk/MBAVHcFgWS+a2RjA8IGk+n8lieGF4PhXVevyF3I4lTyc=
X-Received: by 2002:a17:907:3e0f:b0:ad8:a512:a9eb with SMTP id
 a640c23a62f3a-ade1aa5bcabmr277474666b.8.1749217680026; Fri, 06 Jun 2025
 06:48:00 -0700 (PDT)
MIME-Version: 1.0
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
Date: Fri, 6 Jun 2025 15:47:48 +0200
X-Gm-Features: AX0GCFsmZmkLDvgDJhcHohKc6sicqIA6Ojqws5UO_MYfiqO2_sEThprRy1iKcSE
Message-ID: <CAGkXw1WRrcVzq2WE+WgdCaktu__M5tMxdrvX2-+oaSPezKD8RA@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749217680; x=1749822480; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wSJVB/VK/IU+sjbWohbtLXdiYlYXjxAt7kMDpigPiXA=;
 b=UFO0X7xOMjlphxsyZmZM7J4OOPEu6TQ1jYkDFVxi2NruPufPsdc/RiETAshIj3qUDM
 qGN49ovzVTyyfA5b0iSZBgZobTSBut92Wxx0Lp+Md+3CvIe7X61kRIJ+c21cIL3VgK5N
 UlEGkXaM6GVRVexYYumqeHTw5ptdgFAru73q5TXvKrpXIC22IzXE/UX9a5gC8PrAOIRY
 PWQUXCEXDS6BONCTUxm9BM+eddZJqBQGZXPJOz3gwocrO5EVywC3rc/WrJhVJhMwpBm2
 zZIO4UrUefOxBR/v7dGJGLlN9vFRT+aWov6iQh/oLvLkvicOvOp7lVbX/iSAieiiH9eX
 mR4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UFO0X7xO
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump version to 2.6.22
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

Changelog: http://www.haproxy.org/download/2.6/src/CHANGELOG
Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 74390c2ff5..42f340fa80 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.15.tar.gz.sha256
-sha256  41f8e1695e92fafdffe39690a68993f1a0f5f7f06931a99e9a153f749ea39cfd
 haproxy-2.6.15.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.22.tar.gz.sha256
+sha256  4c0797f450f997dc287d2c7aafa7a0e5b7a2d71593a2cd58e664e8f3aea614fa
 haproxy-2.6.22.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28
 LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a
 doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 61a9ebebe4..77195d966b 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################

 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).15
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).22
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
