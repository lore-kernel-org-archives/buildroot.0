Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2278ACAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 17:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA755849E1;
	Thu, 11 Sep 2025 17:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7Kdyxom6NLj; Thu, 11 Sep 2025 17:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F5B9849D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F5B9849D1;
	Thu, 11 Sep 2025 17:13:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1321B234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F065342378
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnGlqCwe9c8T for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 17:13:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57E90423F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57E90423F4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57E90423F4
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 17:13:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b21f.dip0.t-ipconnect.de [84.161.178.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74DC1A4C3942;
 Thu, 11 Sep 2025 19:13:34 +0200 (CEST)
Received: from [192.168.1.144] (port=53530 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uwkrW-000000006p8-1eUu;
 Thu, 11 Sep 2025 17:13:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 19:13:31 +0200
Message-ID: <20250911171334.593571-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757610814;
 bh=fETaHu08QBkbfSEPdtQDzYVumWVRsUmEiVppNCVFNGE=;
 h=From:To:Cc:Subject:Date:From;
 b=DFgMFKtMVTL1bRQbElD4a6GM4m9Ig8IxGfel+o0Nkj4iLoNki7k1Mf7bsQ+u+y/Jx
 i6gMxrnBvCRpgMvKCSft7MC+bqeKLvuquCZyzQF8bNJ1ropESPj4O8XaWiL7JZbkjX
 6QfGjh1svSWfIToXOskZSOyWKHEzje3yeHFQLQ4qllRBUnGmRP7alKKAUNIue0nLu6
 C3Z2SjDpcUsdq/RoGaDwUxW1sT3+9FZ607TVhVDKfctCThi7yhb9G34I/f5xEea3hE
 dJ3ndEYqbVCv3gd9d0pFTuPD3Fg1yEEkqWvvr7C+QfzsP/Ra7m+jd6Bevx5nYY25iO
 qwcJTnt1GeF7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=DFgMFKtM
Subject: [Buildroot] [PATCH v2 1/3] package/kodi: Fix build with curl 8.16.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

curl 8.16.0 bumped the enums to long, see
https://github.com/curl/curl/pull/18054

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added note in patch about patch origin (Baruch)

 package/kodi/0002-curl-8.16.0.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/kodi/0002-curl-8.16.0.patch

diff --git a/package/kodi/0002-curl-8.16.0.patch b/package/kodi/0002-curl-8.16.0.patch
new file mode 100644
index 0000000000..31ffa7b964
--- /dev/null
+++ b/package/kodi/0002-curl-8.16.0.patch
@@ -0,0 +1,24 @@
+Fix build with curl 8.16.0
+
+Downloaded from
+https://gitlab.alpinelinux.org/alpine/aports/-/commit/106a02411488e3f71b9f2085a4a857e4be27b9ea
+
+Upstream: https://github.com/xbmc/xbmc/pull/27224
+
+The upstream patch is aimed at the upcoming release of Kodi 22.0 which
+saw many changes to CurlFile.cpp so we use the fix from Alpine.
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
