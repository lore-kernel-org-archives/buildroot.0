Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11628D25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9E3C80E77;
	Mon, 12 Jan 2026 08:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GImZ0D46Ug3; Mon, 12 Jan 2026 08:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0393C80F88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205709;
	bh=Zk0VkoTSHAvB8gqCZZcVv3uKQyOd+yADxXNZn5jDQag=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HhTo352sNCdtATaeNn2GWp/joVfRQf6U2IB5fMt7Ki4Js5gNf8sCdVeDOmlumpU93
	 RkCBKsLzV5fZFqEzB6NyxniaW/iT+Ne/o1CDD/3DsOTO2esCYqFn0quYHt8cuoWfyF
	 GG2vg+SybxtsIdqxW1/7xOqqRDg1HNQM+jQheZ3RPqGK/6qsQtRFebPI43307xKNsq
	 AF3YuxAqwqbeKhpEfRxbmCKhEBVRRQ/kpagypnIt3Edy7zs0sT145qtt6t2x8RaVdR
	 M7GDnywFjuBu3luLy5E371k4bSlc64WkxTTGg2sBQudsQwkDTIjEh1Oiuiu7z6Rf7Q
	 WVAQaYlvXmQeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0393C80F88;
	Mon, 12 Jan 2026 08:15:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E85E218D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB47C414B2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUACXBlAHBnr for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D304D414A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D304D414A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D304D414A1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:15:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 19C28A4C3CB6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCub-000000003M6-3D4H
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:17 +0100
Message-ID: <20260112080419.2516889-102-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205134;
 bh=aQKx2myljMq+ydTZlYAelnShi0e90PRc19HGSNU5RpM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=KvUU09WO2bHlXtx290zSXjmyBcwR8cZazUcVf5BfWBWw8bORinKgweoTTGnVDs05L
 6/Q3KE3FK6diTDUMmJVZABtPr9qs6VoeQs1ZMV3kcMw85G+c3myp6JlhwK7GwdC5ZD
 fsCqWYn5jInGeXt1xEa27yW3P36N6ZrVUDhfp0izvLxFVtBZzKW6RWXXav6R3AktrO
 DpQuFjD7+BY6fZfEZLkeOJ+nL/TYrU0TZrx9Y1oHik5Qz/cj/FZfSUm5pJuBMRJqT+
 GwIuh6Em11g171oCN42BTax8VJIL4VindJTSJTZoiO2XWItCR5QMPv7mQKhuDym3MC
 6881D9sLA3g0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KvUU09WO
Subject: [Buildroot] [PATCH 102/104] package/x11r7/xutil_makedepend: bump
 version to 1.0.9
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

https://lists.x.org/archives/xorg-announce/2024-February/003457.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xutil_makedepend/xutil_makedepend.hash | 6 +++---
 package/x11r7/xutil_makedepend/xutil_makedepend.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.hash b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
index e2fe117f10..064bb0aadd 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.hash
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003300.html
-sha256  bfb26f8025189b2a01286ce6daacc2af8fe647440b40bb741dd5c397572cba5b  makedepend-1.0.8.tar.xz
-sha512  6707b1107c07d4ffbcf008181e877d18a0bcc4aea03860ee1158f5630c7fdce4cf9ad7bee3b38ee420c3a44819ed4b56a6f2428a5b695c0dbd17fb3e60825a6d  makedepend-1.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003457.html
+sha256  92d0deb659fff6d8ddbc1d27fc4ca8ceb2b6dbe15d73f0a04edc09f1c5782dd4  makedepend-1.0.9.tar.xz
+sha512  68d289656314dc9f12c792d0e394cfbc95404a0d01155dbcb38313d451b506da48a3d44183f568a2cbb2b1d1da9e26703a0d92f2bb658f72fc968eeb03bf2fe8  makedepend-1.0.9.tar.xz
 # Locally computed
 sha256  0530078db78c47ae978dc2bd77f4f427e6cd97df868672c95b1ef284113c8cb7  COPYING
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 0c4a32c006..e5b940422c 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_MAKEDEPEND_VERSION = 1.0.8
+XUTIL_MAKEDEPEND_VERSION = 1.0.9
 XUTIL_MAKEDEPEND_SOURCE = makedepend-$(XUTIL_MAKEDEPEND_VERSION).tar.xz
 XUTIL_MAKEDEPEND_SITE = https://xorg.freedesktop.org/archive/individual/util
 XUTIL_MAKEDEPEND_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
