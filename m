Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5022DF9D0E4
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 16:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB47B84C61;
	Tue, 14 Apr 2026 16:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVzya_LgOZ6t; Tue, 14 Apr 2026 16:20:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F79F84CB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776183659;
	bh=1qThaqUEmfhLNG9HaQrmZp2eO/DUFRmtQonUKNAu+gg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dv+at3QeCqDYIwrqxyZ6BQ9nMd67UHn5gvmR7AE/oppae+gWMQJ6AejQTXr/IbPo5
	 2NKpX5BgWa+HGvVoqyP1mhbjkhnGkgaETERQi5uNq3svyBL5q30BYR6XSY49GnpQhq
	 YCtho6Ss/o6AVik4h2vYAylcCugm/SS/cl8+36Us5AtEVy6vphIPBCGj3lYCWbFVhZ
	 VdGLfNEWboCmDFTtD9B/N2+vdKpZZLeRR7BHgcBq94Aqu07HMrsNJLxx5Xgj1ugcZB
	 oT5UU+C6WxnDxic8iLZEnDffidLvFhkSKrqyl4YP/xNx2EtG35cXzkx3A5HitFtAMY
	 6z+zUALAk4i+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F79F84CB7;
	Tue, 14 Apr 2026 16:20:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE300283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4AC042B5E
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EGVYDAk_cRAA for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 16:20:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6939D42B5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6939D42B5D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6939D42B5D
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:20:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be9a.dip0.t-ipconnect.de [84.161.190.154])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F416A4C2E24;
 Tue, 14 Apr 2026 18:20:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36316)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCgV2-000000005zN-2sSk;
 Tue, 14 Apr 2026 16:20:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 14 Apr 2026 18:20:27 +0200
Message-ID: <20260414162028.2141018-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414162028.2141018-1-bernd@kuhls.net>
References: <20260414162028.2141018-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776183629;
 bh=uz1lEKIhowCVlPqkC9SuGJrOZLE89BnelrzpXgX7DO4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bYgbwlMk+IZaGfzDSy3U3SKZvjKFgaeUB88O2+6gkivwQkVc0dZrc0QfeVYeJ2ngc
 xeKz+cyDbz6jJsHLlXp3VcxfDbMeEf9+YtnxVrnUmCJaqiLu4xcLae48XN93i6/A10
 Io1UcLMOvz0KxBkJkhxSeDXFJ22FGm0185KlsSX25osnAdscC4itDXClBO3voCv+Uj
 02Q0Pc8kpJiHRK171FriKJEsxHb+0jhGLkJFW6OmdVfQeX/0DHIdeyrnpc1PO6GmB2
 bWk1490TfmtsQU92h7Qu6G829fZP+rUIZVqGmuh2RICD0PVnJAC3yAVdVtbDPqb2tg
 s+GLFmp0He1cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=bYgbwlMk
Subject: [Buildroot] [PATCH 3/4] package/wireplumber: bump version to 0.5.14
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

https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/0.5.14/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wireplumber/wireplumber.hash | 2 +-
 package/wireplumber/wireplumber.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireplumber/wireplumber.hash b/package/wireplumber/wireplumber.hash
index a254b68cca..b180d9d2be 100644
--- a/package/wireplumber/wireplumber.hash
+++ b/package/wireplumber/wireplumber.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c89fa29694e89939c0e57cade5c9a7da8e5da21c19071862978ef5f3a346f1e7  wireplumber-0.5.10.tar.bz2
+sha256  2807a9d1e97075ba10f8b7b8156e31175817d620fa7fc84442b5474123eff5db  wireplumber-0.5.14.tar.bz2
 sha256  ff2eb9af5b05d92ac3a38cffcad27582ef555a31ff1781e1c1d4e087f77c9c81  LICENSE
diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
index 8818662059..2fc9098108 100644
--- a/package/wireplumber/wireplumber.mk
+++ b/package/wireplumber/wireplumber.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREPLUMBER_VERSION = 0.5.10
+WIREPLUMBER_VERSION = 0.5.14
 WIREPLUMBER_SOURCE = wireplumber-$(WIREPLUMBER_VERSION).tar.bz2
 WIREPLUMBER_SITE = https://gitlab.freedesktop.org/pipewire/wireplumber/-/archive/$(WIREPLUMBER_VERSION)
 WIREPLUMBER_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
