Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2358CC6B1A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 18:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1816B60874;
	Wed, 14 Oct 2026 18:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LlqWwNrhzX91; Wed, 14 Oct 2026 18:13:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 993B260855
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792001596;
	b=WTiAiIUek8BykZ8aSoffSt+4DqOwyPSJF5Slu9y7WBrT4gEmgfw3FhU3dY18DM3tF8Dl
	 XlPwA3FYyJRBkCT7LNZngCokb6qPiWNCe66SifObAZoeQ1vhuyLmCjhjNRc/L1cu9FoV8
	 2m7opc63nTj8pTOvOOeG5aMDsBhAFdZezq+FBJGQoCpHulpURc041Cl2f01UaRnjPyZ9U
	 28rxMBv6375jYg2re3YnHidBEoX6qVmZ1oGaJuwGs3XWun11U4FA43pNjiJXNb3QycU6D
	 HjmJDjTkm3Ex1MG+bi4Dv5m1xeh/AkS4oIsZM9jzTVL/5ZVrX1DPwipAsP71dqdTv/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792001596;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=fCCSNysL11j3gWJO6rapmi9L2Zfk0XVLjBOOGMh1PX4=;
	b=iX7N/XvT74UthNwsDZVdr3CrA/GqfKb07NKAJKfxyNs4G2CmvGmL7GfzjzHoyLuoV1Pv
	 hMSPqbsG9Urcpna35qDVVGtQOb+iZXqVq0yn8seuvuMHH+Fy8zXgh9eGR9dMMk9ZMWQL8
	 siIHgELIBinR1SfHa3kj65SqsAth1ckbewXsr5BawswD41ae19zQB7/ajDu3kZV7/feq1
	 or7JDdNTIOthftIuOGvySsnFCWTazg414c3S1vbJ2cb3MTTg2W8F0HgFnKZtFxC9spSHE
	 +aRiowGLEhDFRz6zM7Ngxil96tqsWMtnQTMlNTamCufq2wT+/q9k1frPSeeQ8834Xgg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792001596;
	bh=fCCSNysL11j3gWJO6rapmi9L2Zfk0XVLjBOOGMh1PX4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MmaGtuZuxjREF6edrk4j7v+5oSZXYI3vt/KhfVYlCGVVh1BUQN2AlDsYgFWNmoQ++
	 CVmKXmpJt+Cp4DsdiiDzBwqoK772trpDk4RwrShE9E2/cBlSmDrSBDJjZ+dhABFG3A
	 rocaP3BFZKgIYXJ0PcuayjXnbqldk6AQVsZAXtCkk+Ywa0/W51EnQdYBqdgpsTph+n
	 Q9g8/Z1ASuLzo80WlhBRWzrGRlR0ObHYW6ZgD1TKSrBUL2LD6Jm22hk8yD6L+TYSEE
	 BXYkVmABU06be1+No0/NVmmAh99Ao1+vrEZkNeHkdhun5bIGnEWi1JUbwdbBW0xYSn
	 wcahduOiHGNOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 993B260855;
	Wed, 14 Oct 2026 18:13:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55A472AC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47BC680FA6
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRyuvkrRXGEb for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 18:13:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 801A380F41
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792001594;
 b=Dprya/RHKaOZH8K0pxCLtAEBMZP7gnG6PFG4qHtggq5QhaF4srasR6ef/JqKfAC691+v
 yRgtK3FNza7fg1nZyqirXr24MsobLCB9GmBSrmQa5m6yUetkzxThwOIAlY29REK1//dIc
 ldrUBoyUaA2DI/Im7CO6E1IEUWQkzchC/SAGKe3/EPupdNWeNIbJ0sJsTCpWoLmUp51p3
 VSR5mNdDELbHTDklrEXQDfAlFK085tndZ8AeB0C8xiRN8Zn4ulL7jjbrB4s+j1d7BOpmL
 JdCirEojbSgIsI+7aINXGoFukuDqake2KiOo8iLlxgJ6luemq4PLu2C4daaZ6H5iJrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792001594;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CDgwe1CmDGQ/IBqbtJpeoxZqcBalM2p7YVKtK4tdZkg=;
 b=dc0LF/5OiE46w3zuVia0lep4tSV/I6+UDthAIfVssPvvNKM7YO6a5gR1vlx3uYIW61ae
 ou4y2imFbHpan6WxZjBYMLaFIbzAZY94GSBBrRw1TLE4SqUtTHUKg19HbuZqveAlowdJq
 4DT05LPYPhFErDgZLc+rjraAU7NeTmL+FkBwjCNxIcHLUQINjsDCdiPPckTT/UQWEi0lu
 TMpXAVz0atQd26AIVMZVL7y1Bk6r5z9SqUyPw5Zx4BOX00r2w4TZUk/MR3kHe3CLV1ycH
 3/iArnuKwPG6RhQPblbhCW5OnyWpapoMxCt9fz748SwFjavMxnA791hyRhs2VLqSScA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 801A380F41
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:13:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BC7295C41; Wed, 14 Oct 2026 18:11:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 20:12:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58e72377a0eaa0b76f252c6351d25cf31c25a7ee
X-Git-Newrev: 57f40e5f6e9838d1da8882d0f18996e83ac856e9
X-Patchwork-Hint: ignore
Message-Id: <20261014181154.4BC7295C41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: security bump version to
 8.23.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/57f40e5f6e9838d1da8882d0f18996e83ac856e9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerabilities:

- CVE-2026-86410: redirect to SFTP or SCP bypasses host verification
  https://curl.se/docs/CVE-2026-86410.html

- CVE-2026-86412: server-set cookie erases cookie jar
  https://curl.se/docs/CVE-2026-86412.html

- CVE-2026-86413: Negotiate credentials sent to redirected origin
  https://curl.se/docs/CVE-2026-86413.html

- CVE-2026-86414: leaking host credentials to HTTP proxy
  https://curl.se/docs/CVE-2026-86414.html

- CVE-2026-86415: auto client cert connection reuse mixup
  https://curl.se/docs/CVE-2026-86415.html

- CVE-2026-87861: cross-origin reuse of a Negotiate connection
  https://curl.se/docs/CVE-2026-87861.html

- CVE-2026-87862: HSTS cache import drops longer-lived child
  https://curl.se/docs/CVE-2026-87862.html

- CVE-2026-87863: HSTS response erases persisted entries
  https://curl.se/docs/CVE-2026-87863.html

- CVE-2026-87865: knownhost callback mismatches key as missing
  https://curl.se/docs/CVE-2026-87865.html

- CVE-2026-87866: wolfSSL public-key pinning bypass
  https://curl.se/docs/CVE-2026-87866.html

- CVE-2026-92386: server-set cookie aborts cookie jar load
  https://curl.se/docs/CVE-2026-92386.html

- CVE-2026-92387: never-ending loop via server response omission
  https://curl.se/docs/CVE-2026-92387.html

- CVE-2026-92388: FTP wildcard write callback mixup
  https://curl.se/docs/CVE-2026-92388.html

- CVE-2026-92389: TFTP direction confusion
  https://curl.se/docs/CVE-2026-92389.html

- CVE-2026-92390: -J no-clobber guarantee bypassed with 103 early hints
  https://curl.se/docs/CVE-2026-92390.html

- CVE-2026-92391: curl_mime_free stack overflow by recursion
  https://curl.se/docs/CVE-2026-92391.html

- CVE-2026-92392: HTTP/2 upload Use-After-Free
  https://curl.se/docs/CVE-2026-92392.html

- CVE-2026-94265: Authorization: Negotiate sent to foreign origin
  https://curl.se/docs/CVE-2026-94265.html

- CVE-2026-94266: password leak in CURLINFO_EFFECTIVE_URL
  https://curl.se/docs/CVE-2026-94266.html

- CVE-2026-107928: info leak uploading over WebSockets with GnuTLS
  https://curl.se/docs/CVE-2026-107928.html

- CVE-2026-107929: local interface connection reuse mixup
  https://curl.se/docs/CVE-2026-107929.html

- bump to version 8.23.0 (for details see [1], [2])
- drop '--enable-smb'/'--disable-smb' as smb support is gone (see [1])

[1] https://curl.se/changes.html
[2] https://daniel.haxx.se/blog/2026/10/14/curl-8-23-0/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Peter: add CVE info]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 4 +---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 0a7b9e0169..086f3d8978 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,7 +1,7 @@
-# From https://github.com/curl/curl/releases/tag/curl-8_22_0
+# From https://github.com/curl/curl/releases/tag/curl-8_23_0
 # after checking pgp signature:
-# https://curl.se/download/curl-8.22.0.tar.xz.asc
+# https://curl.se/download/curl-8.23.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  f7ef3ae8a22e521f289803fe93543eb64c329b58aa73a9e224dfd915a2a5f4f7  curl-8.22.0.tar.xz
+sha256  8dadd7d2536a314f982ad05a651b713f426bf7d02cc2c76cffb9796f2218e6c5  curl-8.23.0.tar.xz
 # Locally computed
 sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index c3590a8a9e..00f718fbec 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.22.0
+LIBCURL_VERSION = 8.23.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -161,7 +161,6 @@ LIBCURL_CONF_OPTS += \
 	--enable-imap \
 	--enable-pop3 \
 	--enable-rtsp \
-	--enable-smb \
 	--enable-smtp \
 	--enable-telnet \
 	--enable-tftp
@@ -172,7 +171,6 @@ LIBCURL_CONF_OPTS += \
 	--disable-imap \
 	--disable-pop3 \
 	--disable-rtsp \
-	--disable-smb \
 	--disable-smtp \
 	--disable-telnet \
 	--disable-tftp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
