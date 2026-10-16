Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7E2CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C90F60AC9;
	Fri, 16 Oct 2026 13:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAJPoINqerkE; Fri, 16 Oct 2026 13:08:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 341DA60B51
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156129;
	b=WQt9rQfhfBRg1YOLVanbFGeuFMLhJbgfQDQaauRiIEMB7GWyIMVqDu99E4GWNurnMApt
	 Kvwc7P99zD/VtLSagjesa5BgdGEV7yOvTXthfRrIF9CdLj/Uw2te85ErC5Zigu8PgUkxq
	 qCvDmJbmApqA57fTOa/jbY9b8RU1LpCnJWcGdP9Mw47DppMQ8yaUzcjMPBwBef9VGrfQD
	 PvHqkfs6r4ViWdDgugPUTorNldFMVqwxBvASp4OF6SnKaYHGnTVU06j/4EBbtaqX9TR36
	 al6yR28G1Dj7SXE9STHOjX4tbz2g/O/NDSGRZZ+e9kHSa5o0P6jNpjHau8VLYFHNpdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=iYIjzRGf+DsGWC1De8BYoiKh0W14Fa1MJ2WB37KiJu4=;
	b=qW0zvgG/sU3U5jQcAEZGCskaKNCud4QEWY2ec5fDF7NosYsnZyKKXZjj5R8e1b/tWAWF
	 XbRTrBbx4U5rA2ZUwPbpFgsNBwtsLmY12YHvHjKXN8sE2Fp75NvYfnOpOQeqLfNlvmP2/
	 qsfRRWADLQrw8Gtyl55sVlD9ujdQZxvhC9oRje7QknHtwTNPtL+7f7OzAeY9bGvKUWfVL
	 wlDxMQGsr7lpBu5YO7KYLVC85vVHIZWQJeaesxFVgMKGAEjcARd325ZE9MhUAvUo+L4eW
	 U//mU69vpP5eppXe6Sn51AeTq+JTcYxU4ni/2LKOCMnH/hW9T2GJgmLrhnfvTJNZNPw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156129;
	bh=iYIjzRGf+DsGWC1De8BYoiKh0W14Fa1MJ2WB37KiJu4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K9fuRJTHdp7FIItENEPdUQpRmcJNnC0ik05/HnwCJsoYduykIG6GOWhw7iBl7ryxB
	 I8uyOjalbZTvqNd04MM38xG8sfaanzN2CucOWycFI+pIdrMjOnAv1ag1Pj2b2iyF78
	 IJx1PGD/gZ+/fA901NM2dzAj0DE4w9btgHu0AmSKh9CbO89MNRgHVskpjWfCCIFmK0
	 097ZUijgUk4SzGUadOp2i1LMsXBybKDYrOfqOBC4+Aa7rNjBf5Ek+GSTGvQWV1KWMn
	 FUnrxwt5B3yKpzm/RV0CySZAWbhhFFgRDejNVSF4zSYBaAu9eN1/lmSe3boTD9ZbT2
	 YPY1I9T+vL4yQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 341DA60B51;
	Fri, 16 Oct 2026 13:08:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2793A1C64
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A78340A0D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTk4qdqX1aJM for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3DB0A409F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=WESHGXb2WQXQjZIOxSHIze0kJPGvKy/eghVAvt7RG49fdLlVZmOdFq0mtLItX43j34uI
 hMMn44w0e2QUs7qSUTZT2n+zmmV8HlXXXEvJ0ReoCtU8binRmrbPxtF5kRWTUSMX+6h75
 QQT8tuzEV1T9Iq9rS4Ud+9YhFhUxnJ48SoHB7haCJQTecn1Q3ctLIiFBoWANcEZJzdBM3
 xIgQbaj1RX6ExYMIewsiDZYLVsKB6rQKRKjEouV3160dWDUU7dZvOOiSeTBx6nmpDEu7K
 EEaeg6ZTeE2gQSHB1aO23S/WXntxM0x4V1HZzbRsdLFiYW5VtJmnW9pKDw7UPmEfUgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4d4TmKyzByuw+/FywWxoVdQaj2vtao2ZePk8O3zGQXA=;
 b=tHxkge249lbPSuhibtWNIS8XrEVYYATU5PNzL2xlsAcsomqXsHvYXVszAnleBZFqeMRE
 wyu00KT+rLnHyBC7ywvrfFEGTJbb3EtEQuqo8IR0x+DESV2PXVRiMCFA/755wq2cNH/fO
 vuMhRncSXVwpRZopCS+GbzH45lfRD6AFseIdq/dv81cy+3CC5Z21G0TSN+llDaVOk/Xll
 IEYMlizdD9Ew2S+jPjmvhHT8iXBAlB6jaZIOT7QO6flqSohkakAtsKtZ8sM5xUIdsjcbG
 S4i6eMk4UmYlpjueR7FKqI1xMGsp6CCcydS2WCGaHg6BVgLF/3YyzkeWzJCmtOVnADg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DB0A409F8
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E8FA960D8; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d3075ae5818be8ca5caf0ac2fb66f2f9acba7297
X-Git-Newrev: f3911673339161ddc10edca37bd60c5c1db8be9a
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.2E8FA960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/shadowsocks-libev: update the site URL to shadowsocks-c
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6665984938015308493=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6665984938015308493==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f3911673339161ddc10edca37bd60c5c1db8be9a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The upstream repository was renamed from shadowsocks-libev to
shadowsocks-c. GitHub still redirects the old URL, but the README names
shadowsocks/shadowsocks-c as the canonical repository.

The Github releases have been preserved with the rename, and therefore
v3.3.5 it is also available at the new location.

(alternative to commit 0522d9af895473a34c0a467e72e70d6d6e2a853e)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/shadowsocks-libev/Config.in            | 2 +-
 package/shadowsocks-libev/shadowsocks-libev.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shadowsocks-libev/Config.in b/package/shadowsocks-libev/Config.in
index fefb27bcc1..3a6c8efc34 100644
--- a/package/shadowsocks-libev/Config.in
+++ b/package/shadowsocks-libev/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_SHADOWSOCKS_LIBEV
 	  Shadowsocks-libev is a lightweight secured SOCKS5 proxy for
 	  embedded devices and low-end boxes.
 
-	  https://github.com/shadowsocks/shadowsocks-libev
+	  https://github.com/shadowsocks/shadowsocks-c
 
 config BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS
 	bool "connmarktos support in ss-server"
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index c76983ce5e..96dfcf8743 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SHADOWSOCKS_LIBEV_VERSION = 3.3.5
-SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
+SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-c/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
 SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
 SHADOWSOCKS_LIBEV_CPE_ID_VENDOR = shadowsocks

--===============6665984938015308493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6665984938015308493==--
