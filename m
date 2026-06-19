Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBD4CD4F26
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 17:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 520ED859DF;
	Fri, 19 Jun 2026 17:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMthrSUw3HaN; Fri, 19 Jun 2026 17:26:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4485859D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781889982;
	bh=FcF7q3/MosEKsWI+PTb+C2bT1ukTknIHK9fXl3lMmBo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QblBmlL+ih1mgJzKb/WVdlu9jVuVdOy2uOrbqGGJ2fIrKvjbY9m/1KzE/xl+uBDz+
	 f4JjvVXuHjC/pjtEWzZb64VzMULC2s6DfQ/n4ONe/Cly7gNMQ8Sodqg7b6laQ96ICn
	 aBkbpGg/6Ti68VCXlEcmbi3ikbPBjYEeB4jQqTuVVLIzVyGu4Hat6x5ZpfOo4GMU5u
	 kKSevkS8StjmUwf/lrzfASn8UA7Kvoo8kKW21A/9y4+RiAisN0WUMZaQswF10TkgjZ
	 AxlJSWDwZ5IRta++4BhqCey+9dO2+EMeIRiiTLEPLAhwC+pXeHb3ODbDmDSSgOcj7P
	 PElhozvnvDpNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4485859D3;
	Fri, 19 Jun 2026 17:26:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC9E1367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 17:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE3B4428BE
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 17:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMBEycAO6FuF for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 17:26:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10204428A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10204428A2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10204428A2
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 17:26:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a031f.dip0.t-ipconnect.de [91.58.3.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4A564A4C060A
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 19:26:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34318)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wacyr-000000007OU-3wJM
 for buildroot@buildroot.org; Fri, 19 Jun 2026 17:26:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 19:26:14 +0200
Message-ID: <20260619172614.3337248-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781889975;
 bh=mRSAAmNQkDuR3nOoyOut7UDbYFZZZaLDsm2JB6ESwpo=;
 h=From:To:Subject:Date:From;
 b=HtjEwSxYv0hj6TKFiEsWyii0gSPKWx3Y53zX+pC8rGKODQqfuIQKDtCMxsQGX1CpQ
 SJCXT/4s72qnk4gq6mTKfCcDTNEtW9sr5zPpt2NsYDjIvlKMIOuc5389+obLWgyr0i
 jypj+F+3Tzwe07Puq6X0WSQgUS0RyJGWdCmyJy2qVpU/Nl3XHHOTiCBTOihfweWsGS
 O/DXqxe8EJp0ji89KyDS9hz+u0GQuJYWxu5hWctd9TLiatukPHR/ETIhLGu6TuopDo
 HHxNS1Ja5WAMNcX4LiKl23XTJVq6d1ahi43BGoJ0R2ysXuxN4D0c2LUVdGMVjaBu35
 3IVoSJotQX0xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HtjEwSxY
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: link with libatomic if
 needed
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

Fixes:
https://autobuild.buildroot.net/results/eed/eed88a2a77cb8c4ff8c59bac5091221e6873004c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/c8d2b19b5056b6c45bad1aa7de174aa211fbf927
with the exception of an unrelated build error with the
bootlin-arcle-hs38-uclibc toolchain.

 package/ghostscript/ghostscript.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 159e06db91..23dd3d3860 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -37,6 +37,11 @@ GHOSTSCRIPT_CONF_ENV = \
 	CFLAGSAUX="$(HOST_CFLAGS) $(HOST_LDFLAGS)" \
 	PKGCONFIG="$(PKG_CONFIG_HOST_BINARY)"
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GHOSTSCRIPT_MAKE_ENV += XTRALIBS=-latomic
+endif
+
 GHOSTSCRIPT_CONF_OPTS = \
 	--disable-compile-inits \
 	--enable-fontconfig \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
