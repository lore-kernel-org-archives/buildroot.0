Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AECC982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E9F960E2D;
	Fri, 18 Sep 2026 13:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_rgZOjJOtx6; Fri, 18 Sep 2026 13:07:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8CFB260E37
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736828;
	b=GvR0J5QdbmMHNfGkoSjwHqXAUNYHFqL38JYQbW/D9xL62aHp0x8tDXVba0Wg+k/xNbut
	 oh1N0JH55ffrMaYBsYjYrQrZ6Lv+GxmRmu+iof1CI+cvrmpWfO/uSrXRJsR4xgE3wGYJ8
	 bpX+AWgcVNaMzGEDgMlnxXQGWSpFLXuCsNb1zfY12ue9KfU2gtWTmgrTbjbiVNvZAZVqM
	 5QLgU3vVi9zBdphaz7sdiuXXvmglFHneng5/IAejehdFfQoVav0j80jUv6J1WQU09JY2z
	 miCYqFIXxkj2fdUWnY2g1qwvcmGzA6kLn4616ES2+vq3JUXG2xeXb7qz1HHITjjmXRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736828;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6UTpZEjjBozhB2+Vd35ujmanY8Ci306pWu7AWQTDp/g=;
	b=AbzgSLtAxkHr+hC/OgcpEgIevkik6igXLoWE7Y+8EkqDHM8f79WYufnss8gl76ax/F/Q
	 QskQsfiVVQZu31S2mvThByAzNsn61myXUo7YebA9OSaQTT4E8GFUHcC8mIO1iIwiK1qwk
	 iY02ituzhiW+ombSgzpC7RRtXfBBvNPlspuOCD8J8J329j8WaiTlZsTqEHfRar4FBzImV
	 UdKEpB+VrBHSSxsxr28SCE1uJBpBw9pKIWrAO1yHHQ9xek5f+4Rt2VuB9JNuga6eDhZsJ
	 PFi7is4htcyEW0MTZYE7wmOKjaaPPwvIKhdfdeJT8Zf/okK1HKLOMGfdURBi0jCMrRw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736828;
	bh=6UTpZEjjBozhB2+Vd35ujmanY8Ci306pWu7AWQTDp/g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TONd5LvtqNUxojGc+ve9QWY8hWUleFurr+PPGY7W5XTIFcoTsJgVuJhXrZn5M5U3C
	 h7AEK9SYATmc2LneLhAJl6uiTi/MHmDWN/tSN+S4/Ms4ZGGSdI0kfvWKjijF4XflA9
	 LAD5dONjmjZkMnI1UuVusIv5ILD+5hG8kAclYwfEiqB1fe5MZQ90uRZE8tsEYx3W4e
	 Hb916Fld2ukFOBsyJBIUWZBdrR/XOaBrXdAvY0D5qKX/A6PlCO4RXBh8e/14uRNXk0
	 9qdYF7e249R/0noZioButqOO9hbVvTsmCFlM1lHKrTvuC8VVCiQZIaB1G+vEjZaYkM
	 JvaGU0L0EXPfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CFB260E37;
	Fri, 18 Sep 2026 13:07:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD4E542D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE2C240B79
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPa8RtLJ83Fu for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D945D40BFA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736811;
 b=AouKPI4h0C68NK/Jwz/PIsfi9q20uIsEhyUrwJdla1NmbRLrbQJMJK9r7NF1oPY14tHC
 mMnnKfOSlqKN1VWCL/tRkEMzJtXvw4bPqLyfrm+UAiqTXlmEuizrHWovxj3UYta9Vzw3+
 BBqCkLTryNypF1u2/SyOTRNin2rZyX8AwBC/57gvoKnSU+sDbokyiPImXX+LGD5W/tGRt
 C4alg8pGncui+wLCN8dExJjIjVR1kdyiKCZICWjIDZxTJzwtDkaraf6B2RHCaQapmpB4K
 DhTnFMsoc/+JtF0PjMvO0u/zRm6sPOkirtXEbUWMt6LtRNiUE9ZQohDlNnK/inE0I6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736811;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=S9b/b92/5VEDONcbBBbIyNBon+tX5tTTFC3orQ14CBs=;
 b=mYjGR9Z26zvHFHpW3Xosv4naO3Rm5BdgQNxWTaqpdj3baeYhMSds/KSZY4YUNxJ4sqG9
 vtWINYUyMJD++mVDOovveWmKrEP8CctGD2twa7DY2KqojOpxkYoYSsayi0r2+oPX40A4d
 YDfNA71RMBaS3gGfVT112JXam6iXsw7SLZL86dSKa1CsKWt5fvwneFxJZ+lhSsFut3KWc
 Pghvo4Rfq+HYPowy0GdtETlY5z0ocfDMDTgnDZMTkc6c/L/gW/e5Df4DDyhcflISr31J/
 hl2Ko1A3j2OewMQhm/I3hMS3luONMYyz49RsVEF4q+L+P69rs/sdQJ9f7uwR9KJGgXQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D945D40BFA
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 925FF97698; Fri, 18 Sep 2026 13:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 11:55:30 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 00bec472c7923482564dbba73af45b3a7d98bb39
X-Git-Newrev: f9517379d1ab5832350ad0458af2428491e1eb23
X-Patchwork-Hint: ignore
Message-Id: <20260918130544.925FF97698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/xdg-dbus-proxy:
 security bump to verssion 0.1.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9517379d1ab5832350ad0458af2428491e1eb23
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes and issue that caused broadcast messages to skip some checks.
Release notes:

  https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.8

Fixes:
https://github.com/flatpak/xdg-dbus-proxy/security/advisories/GHSA-r7hp-698j-2h6c

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Julien: add link to GHSA]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 51b366290b780a6c5f9e09f8e84bf5749d2022b2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
index e5be1f0cd3..bbc1762acb 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.7
-sha256  3ad3d27ba574e178acb5e4d438ba36ace25e3564f899c36f31c56f82c7adbbe7  xdg-dbus-proxy-0.1.7.tar.xz
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.8
+sha256  b6630bd24f8161b0e2546d2acbb014a3b3249f5c0d75f2a863ade898b9034d3d  xdg-dbus-proxy-0.1.8.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
index 6c3ef5c9d4..7f9fe16f28 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDG_DBUS_PROXY_VERSION = 0.1.7
+XDG_DBUS_PROXY_VERSION = 0.1.8
 XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
 XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
 XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
