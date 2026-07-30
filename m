Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBE8C54FDF
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 10:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0B2D80F50;
	Thu, 30 Jul 2026 10:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDPSeZNqsepp; Thu, 30 Jul 2026 10:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED19D80F35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785408409;
	bh=/GdmBmcTSmOoCbucVg6puwRjH+E6BYkzg8Fm/b+f/jo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GZAVd1KX7sfrrZquC+8vsPnmYqGNLsEerxJ/Rthgxmn1/kIBv9BROEKh5vqInoZv2
	 qjNv67EIQ8nBx9NJlxB/foQBVGeJEtodj9ehT8Tp3aRGopiRqNb68EtLqhDZXVatYk
	 5G3ubXHqEkEPmF4sr/HOHxLxyhm9O9mHtXaLp7Tel7Ww2ki5YgKgVpqsxYvnxFJ1AR
	 m6CqXiQkUdNAU1Luby/WKWWNAYsZJADvMvShzWVXFg29vPGWZx16JgxzEMGGVLqvaq
	 sfAcCRhKrhI1mB20IlI48KdlularF9f5TUMol88K9S+wmH4As+yZ+bT0G81k8wgPC5
	 r8lqBafRkce7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED19D80F35;
	Thu, 30 Jul 2026 10:46:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A38627B
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 10:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BAFF6064A
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 10:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWFK3-JJCiHA for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 10:46:45 +0000 (UTC)
X-Greylist: delayed 520 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 30 Jul 2026 10:46:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19FC6605DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19FC6605DE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.148;
 helo=fout-b5-smtp.messagingengine.com; envelope-from=mcdev@playlinux.net;
 receiver=<UNKNOWN> 
Received: from fout-b5-smtp.messagingengine.com
 (fout-b5-smtp.messagingengine.com [202.12.124.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19FC6605DE
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 10:46:44 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id AB9DB1D0007C;
 Thu, 30 Jul 2026 06:38:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 30 Jul 2026 06:38:03 -0400
X-ME-Sender: <xms:iylramjSPByfAgBV2i4aQ8IK8P5QWT7EKBfR3XgyMS9ap2p-zA1jxg>
 <xme:iylranKHYN3WvZU_s7tAcqP0SLoYGTTE96ozyX8hzNhyCPSxdMQrxkXhpXZgdakeU
 UbQdJfNMnMGDoa5U1aRkhJ1cQX2I8XUDLAk-RGAX4Sty3KDa6HWpA>
X-ME-Received: <xmr:iylramAhtSIIJgbTxYO84ONWyBbxU6_xb8vTrV6cS9A8nnrop1gz6gvufxeqeuTKioOrQPS83YP5jtXD0DnGfETMue0eFFBDJVWNOtQ>
X-ME-Proxy-Cause: dmFkZTFloNaVn6QPUFMu/0jxOdzc3lxJnYuqRNE9rKKLjzhOfDRPxKg5c798SnNOsuEWjF
 rgJStqaknEZkseHlYoFmZi/clJY28CsN74XCagjbZOHC3Ja23b3O262WU0Ao62d23jCDyc
 VgLwhwMn74fq3W99oaQ+SIX8cPzISBmRJjMR9rh0kGt2ttyTecz0slr5VQqKpCEnpEN60H
 kWgwk9JaG+M+XQjHEl6h9pfJzYAQe8Y1G6MMuIH/Bg3W+nXGjeJBitF39LitreNWreQoYI
 Up6hIaHg+fHxqQMW7GEbqHrvOd2iHZeWPvo5/GvlobLRUztweus6HTIv+SOgHzZgc/JPC0
 qUWmhtcWc2cZK1wcWpBDod6kgX1qjF6J0GaUEVofI1Z2FeHMVGF5S1WRGyGLzyhRileejp
 UveJkpUNlIwlV5xdgy7Pqsb2kHeoSgQR9wNdFw5t/Z224vGrovj9H42rQPSvFIYIQNAK6D
 7BydnEij0bOCz1g5gEy+8FjBMkzsejeJoUws5WFTLjVJt7sNSYNm80Aj/XszVvQ0j1myLm
 KsnKuXJJ+7CxuRpWLxDCGDBwbdrbbsYNPBMliBP/F4++HOHtFi4s4KpuQ9mZ4buhYihd6w
 ULZccNkTz7cYz4DtC60L4dnBAyk/lVXNpImdlCX1U1p778Qj7kxUixmFmSlA
X-ME-Proxy: <xmx:iylrang2yuoKRq2c7V00lU-MFWNDg_SN5JodwkQHtUg99h0-PM251g>
 <xmx:iylraukOk1miXSA1KmNcXmB-RLzN8bMgRDHoE3dPQOq44m4Fh8O9LQ>
 <xmx:iylrajq97ugLJ8owvN_-bRZAZ0SRaQ8JS9gslikeeZEjU9dE4D9QmA>
 <xmx:iylranHjYRaIzWcLiH6lXaKKaLKa-ej8cuJqIu9ly7EK89egRnA-og>
 <xmx:iylraseLIxY_4IlmdnJ7T8Q9NIxL7BWSec7gpeGftXFRDqfCEeqA3GlU>
Feedback-ID: i0df9467b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 06:38:01 -0400 (EDT)
From: Michele Comignano <mcdev@playlinux.net>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>,
 Michele Comignano <mcdev@playlinux.net>
Date: Thu, 30 Jul 2026 12:37:37 +0200
Message-ID: <20260730103740.23943-1-mcdev@playlinux.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=playlinux.net; 
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm2; t=1785407883; x=1785494283; bh=RZPGdxvlsd
 FNpOjKdeyvhEn+0sOoJNK+VqSA765EmIw=; b=CdLz+v1oCDxXYbc/lRvitGVUAV
 HFZ+1Fok6fHh98ezx2hUmcnx2ltdh74URw7WSH7py9qgD2FGeu0nVP55yJzzUtrb
 u9xDC1aj1xiK43iLpfm3AR/k9f7GwB4pUGcv8KLqr71ohxHI+EeQALymAEYnHUQ6
 x8Gk8+pYtj5raxz1YoJrEo0PKDSv7tY/p53H208FB9llbcnuQVJaNbFCFjc5Ckmg
 K09lcVP9c4uOPQznbN0hIQbOJzXM2U5ErK9oCxArVHvFbdusAJODic3YfFBpkrpP
 eD1591l9qcvcpw4JAUruopkkQz3+IvKVUCS7fwJ1T3pbkM4VAcozoNbuv0Yw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1785407883; x=1785494283; bh=RZPGdxvlsdFNpOjKdeyvhEn+0sOoJNK+VqS
 A765EmIw=; b=AWEphb75QQz6kteuSHvowzeFKsLUVTUbvij84cu0BPbcpXqC29t
 HFIqzKGWfDYUM0rCOKkCvNoukEFLzKhKF7/pf0iQNwJf0RwOuoAVhGk6SySB/dZX
 ogLiTIfPAK7YlJUDePm17QP/ZVuVeTGfc5CT6tFy0tmcIKWuKxXmKEML1E8Kbp6W
 FqcQEEk8JFX2tDCQP84KWP0T94RgcDQSA1HuClc/pG76FNJ+9t3rp8f4apOLg3a9
 Ry/oB00M88ZrnGFjPuYHdzjVZgE2jlacreXZNFrozZzz/d8lRtwkydYJqq/P9kNm
 jaK/XE/i2pyI9dWO+aIGSUepsOjB1eOQNRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=playlinux.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=playlinux.net
 header.i=@playlinux.net header.a=rsa-sha256 header.s=fm2 header.b=CdLz+v1o; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=AWEphb75
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump to version 1.0.8
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

Signed-off-by: Michele Comignano <mcdev@playlinux.net>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index d342eddc9e..d96098cf08 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  827250db649546cdb04bea01f5f0560f0edffde9130e256387d1f977242eaf98  libmicrohttpd-1.0.7.tar.gz
+sha256  0763970a0e39f8f382123366e3cf5d03f70aa1e2208d3101e84da3e2cd674703  libmicrohttpd-1.0.8.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 605291c046..f9dd2964eb 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.7
+LIBMICROHTTPD_VERSION = 1.0.8
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
