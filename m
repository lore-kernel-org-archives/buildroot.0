Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78F4F433D6
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 07:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B8A580E89;
	Fri, 17 Apr 2026 07:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbfZIgi3AbiX; Fri, 17 Apr 2026 07:58:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13E4B80E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776412711;
	bh=ry2ETcDLjUsODjyRi5m3noB8Rddow/VhxF55vQqvNzM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RvuvBndCzAcR9DOc9pdsZ48V0bEWs7ZuUBmkQR3MfrBrJCwdVmVz9H9FFvutQdX7T
	 ZWj2gibtkswS8LRY/tFaplpOHwmP/0jLk72jpy770bSe+r1lbaj3xHMmWliXgwEyer
	 7NaxGb/wT69JV9lmNYympGDaBlbmCuuuAWMDIOBCXKWkbHOoME0FlhJvhROYKIG7ef
	 3XElO5kPCcfCWmNOImFZhTmAgdIgcdF7jMY5X5VAejAB4OlmNI7thoJaxXoZeYxLIJ
	 dj41nPEcL22McO3FaqP5QuDErdF49Q4rev59Af/OnuP+3QuKc5kRXn6SfkJYxfZWVS
	 TVKhv0ZxLl04Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13E4B80E4D;
	Fri, 17 Apr 2026 07:58:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49005270
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AB5C40565
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCo0kp3DP-ct for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 07:58:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77717400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77717400B9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77717400B9
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:58:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf30.dip0.t-ipconnect.de [84.161.191.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 04F4DA4C16B3;
 Fri, 17 Apr 2026 09:58:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33478)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wDe5o-0000000073S-1Hcd;
 Fri, 17 Apr 2026 07:58:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Will Newton <will.newton@gmail.com>
Date: Fri, 17 Apr 2026 09:58:24 +0200
Message-ID: <20260417075824.3538852-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776412705;
 bh=ET+iLN5YUSDv/K7/bmj4xrKdzrmYuGo2EMlAV5l1xo4=;
 h=From:To:Cc:Subject:Date:From;
 b=nKwxIEsTHjXPT/OWdrq72Dr/Tv1NlhGE/X7bijGrbmQ7cxLL+3IWv6QUzpSyLXqsB
 rvp+2jAiaxEQXLkiYHHVCxIpBHUS76aA1YMxqjXCVkQ8UWKuY+rJXbWdVidbwNyA0C
 p8paebeFM3KA5XnHs6zHrKxJlAVRlYYkuvCqAiIcLxI8biFvxNylFfm3sa9Isgqh8y
 5TGosWAz9gRc3+zIZKCKaJDBO98LnttPYczj0Rj4JO8VAN0ESEFL0wz2Y7ZRrqh8Ia
 UMK2RhfblqYIFPL4tFZ69PTE918hxLx2PXIwwljAa+mIOUaSI9i4wqEdxH4adC6Wc3
 2QOsZ+gVhqRQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nKwxIEsT
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: security bump
 version to 1.0.5
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

https://lists.gnu.org/archive/html/libmicrohttpd/2026-04/msg00003.html

Fixes CWE-444: https://cwe.mitre.org/data/definitions/444.html

Version 1.0.4 contains a bug and was never officially announced:
https://lists.gnu.org/archive/html/libmicrohttpd/2026-04/msg00002.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index bd5d0b3e8b..4dfe62deeb 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7816b57aae199cf5c3645e8770e1be5f0a4dfafbcb24b3772173dc4ee634126a  libmicrohttpd-1.0.3.tar.gz
+sha256  b46d00f58efa6f497b97d2e782c4ee66301d412ddd855dd3068518b3a2cd3ea2  libmicrohttpd-1.0.5.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index b74a7a1338..7a243b42cf 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.3
+LIBMICROHTTPD_VERSION = 1.0.5
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
