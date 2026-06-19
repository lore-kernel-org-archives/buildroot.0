Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F661CD98F6
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 06:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A827285264;
	Fri, 19 Jun 2026 06:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laSHblXGFHQE; Fri, 19 Jun 2026 06:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CA8E8509C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781850675;
	bh=TTy6TjA4RB6udrmwh0p+HMXB0WwsGv88hlIv4B1+acw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jQr+KPs8Eza5BeRkAgemsoiwMaJ6dawxXpJjUn/q5B+bZw+aGf7u0IPfZMVnbUPw9
	 yxSqMhby8N4kzlNtL8A2j2hCiGtCeMgYU+vpC0p53e/++Rpaa1GsbgrRsb95xtvNrn
	 I/zVQ7zHbG9Q75H12xz71spjDfsWIafftyVrYoP39Du1vGesr16OWo5JjKipxx+fWy
	 oVUhh9F0E+dnVvPlV5aFL9IjAY2LjEQ1wDcYhYkCcHucnaQcIWOxislJEqRCC/FVKY
	 fmHCxxJ68L4K7kyeu8fgpWCNApQ6qZmPWwNT+1YGOLaPyjQ8OCaU3dxiWFOdFA2UG9
	 lvKeoYUjUZxyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CA8E8509C;
	Fri, 19 Jun 2026 06:31:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EDAA279
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 06:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84FF06F4E2
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 06:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZQ8G9Bt1WBq for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 06:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4561D6F493
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4561D6F493
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4561D6F493
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 06:31:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b4bc.dip0.t-ipconnect.de [84.161.180.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 762D0A4C10D2;
 Fri, 19 Jun 2026 08:30:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44582)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1waSkh-000000004uS-0nNk;
 Fri, 19 Jun 2026 06:30:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri, 19 Jun 2026 08:30:54 +0200
Message-ID: <20260619063054.2870792-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619063054.2870792-1-bernd@kuhls.net>
References: <20260619063054.2870792-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781850655;
 bh=R8RBEXGNVVGyoI215TiL4fhTj+PT3l0jt4Dp8m1pbjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=b2dEaLA7Y3wvfJkp+lZPeNx4J12ctGJxgVgqcyaUyzjn1N93Lkyi/eRFhzH/UNkCg
 8Ax6MND+nQDITTnH5sFXffHH7Y5eDOMOwch6so1iweKdoCjaWvOayCVieStOJN9EhL
 rkr7B1I6cX8GLYmodUqDWiddBi/NaXK3YcH34boxZBRiKKId6wJzQst+uByyvg3sTb
 IH0Kt1BnxslcDuWTLxh2D4SE6DLnKzVU9WkbNLwm1H+XDLyXjCGzF0WSmW7zybLUXh
 lfAlkv4AvJTtXokhxF1IykI/hbk90RO1elal+KEATGj/CGhi6B0+kyMBFJIleq0Dzw
 +MleuUGLxpj6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=b2dEaLA7
Subject: [Buildroot] [PATCH 2/2] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.3
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

https://lists.freedesktop.org/archives/mesa-announce/2026-June/000855.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipeline:
https://gitlab.com/bkuhls/buildroot/-/commits/36ff3d2605eb3ce64917b89a54e965204484a10b

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 3c6f2ee1f2..9781a1357c 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.2
+MESA3D_HEADERS_VERSION = 26.1.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index deb7ea7f7b..abc0527907 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-June/000853.html
-sha256  bac2bca9121897a2b8162e79636b50ac998fca799c8e6cf914edd85962babdf0  mesa-26.1.2.tar.xz
-sha512  08e7b6357c27bf6e13f59e6fb0f84b73ec25c2d1a01cd09ffcc35ab263f278f10f3bd36fde419f60e78e781abcb315a432d0d5ceb3bab0bca26b8a2a39758e03  mesa-26.1.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-June/000855.html
+sha256  7725004e724b34c6d4fbaf5c48fc6c6223aa9f2741d6d7782c699b049356fc45  mesa-26.1.3.tar.xz
+sha512  6dd452e8c7f2e7e9a26733f53dd0daf4df824f82de3d37c171581854dd419f519e104212aacdf8bdf94042a845d9ba5c45a1605d7cba1dc491570a9e72a91f83  mesa-26.1.3.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 23644cd7f5..4e7a5240c7 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.2
+MESA3D_VERSION = 26.1.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
