Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D33CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 20:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBB7140B99;
	Wed, 10 Sep 2025 20:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afUy4SzbnAl2; Wed, 10 Sep 2025 20:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E67F040BA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E67F040BA0;
	Wed, 10 Sep 2025 20:06:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BAD42BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E1D68415C
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cd3BMahW3UyG for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 20:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A96E84151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A96E84151
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A96E84151
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:06:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0bb.dip0.t-ipconnect.de [84.161.176.187])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54968A4C30F7;
 Wed, 10 Sep 2025 22:06:09 +0200 (CEST)
Received: from [192.168.1.144] (port=47702 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uwR4y-000000008AP-2uon;
 Wed, 10 Sep 2025 20:06:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 22:06:08 +0200
Message-ID: <20250910200608.2114508-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250910200608.2114508-1-bernd@kuhls.net>
References: <20250910200608.2114508-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757534769;
 bh=DMs1ei5/lONlD9IMLAO7KTuaq1Shjik1hIW/BYTWVzM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=xeSm96gRymjt4ZR3l6SBDpkYXFcU8cNdg7nyWS8japEOLiAopWmhNcgQ2BiMFJSPm
 9OAjb98iK0BspI5ZDtCfjlv4XXEbEiLvhyGyboE3pmxWLcIXKNKFQJ9ZtPQwSL3iVm
 FZdvlq+fKZh9GPztAoErfu6AyFFxHca9uY40UV1axpJa6m1g1fxfkYAdG5Fmy2x0nz
 0uL9hf1HWjMVhKJfgJKGaMm2gC19jUF864bQlVG6AgswZO1z0ZiLsMXwo0uL22RuWv
 PuMHY+ZffaQNNcCTSDoFBEZL9kUK1958HTAFvrBNdNa7JwdiROC6K3NJTpPLCJ/rAd
 PSwLsa+FnUuEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=xeSm96gR
Subject: [Buildroot] [PATCH 2/2] package/kodi: Fix build with curl 8.16.0
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

curl 8.16.0 bumped the enums to long, see
https://github.com/curl/curl/pull/18054

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/0002-curl-8.16.0.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/kodi/0002-curl-8.16.0.patch

diff --git a/package/kodi/0002-curl-8.16.0.patch b/package/kodi/0002-curl-8.16.0.patch
new file mode 100644
index 0000000000..ad71f339ca
--- /dev/null
+++ b/package/kodi/0002-curl-8.16.0.patch
@@ -0,0 +1,21 @@
+Fix build with curl 8.16.0
+
+Downloaded from
+https://gitlab.alpinelinux.org/alpine/aports/-/commit/106a02411488e3f71b9f2085a4a857e4be27b9ea
+
+Upstream: https://github.com/xbmc/xbmc/pull/27224
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/xbmc/filesystem/CurlFile.cpp
++++ b/xbmc/filesystem/CurlFile.cpp
+@@ -44,7 +44,7 @@ using namespace std::chrono_literals;
+ 
+ #define FITS_INT(a) (((a) <= INT_MAX) && ((a) >= INT_MIN))
+ 
+-curl_proxytype proxyType2CUrlProxyType[] = {
++long proxyType2CUrlProxyType[] = {
+     CURLPROXY_HTTP,   CURLPROXY_SOCKS4,          CURLPROXY_SOCKS4A,
+     CURLPROXY_SOCKS5, CURLPROXY_SOCKS5_HOSTNAME, CURLPROXY_HTTPS,
+ };
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
