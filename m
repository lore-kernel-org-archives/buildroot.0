Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0D9C79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 07:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 966F9405AC;
	Sat, 12 Sep 2026 07:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFjOgTaAHATn; Sat, 12 Sep 2026 07:40:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9E7E9405C2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789198833;
	b=WmmiBDisneX8qZSth+YAwkQRoYc0BlorwkAaLg2oXW/+ZOBoxCD0tgr7KchzIIbZhsty
	 gGTBBqe+DSh+3Lu6Pf7y4AHKf2VfnQEyzECaMi8SxzE8ZMrGLFbJyP0PH3Q/sYcRaalfA
	 KR8kfaHSdkIAJQkMIIO0Qx4g0D+uhhkuGV6BdKrjEsX3Hpz2nshAk3iQOiIT/x1LLWMry
	 fcpLDv4zpZVmjWd9GY7tPEGnanjkWMBsgIO+bYoGzBOJweInxLKxnPBAiaFp62d5HxDAl
	 EoqF2Iq9SG2mlIWz7CouVAJNN3HwYIU49Jb1K+alCRXUH3DCIHhj5hzpj6OiU2Cym+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789198833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=2NNKG+Ovzt1tJCSWlpEfvoI8mhG5488DtUGs6ZXGKCM=;
	b=h+BriIq6s/DbNW3sdgzO2H18OX6I8q61MOWyVta+BTNFMzOE9+mn+GYLqNosjR9Zaen9
	 rpyc8sqawk0Tc7pT8mk+nBLxlcokDso0BF3D081RQ8oB0o9wOeCzRqTnjEU0nKIsbZkhg
	 WoOcCpD4qj6n2iqDSVYrbaNJUc3L6zj4sXc30WhlPqNGpUOOh1zm1xjAZR921Hk+XNSKH
	 MqaQk0O3H6OYQqismYWQkwWrZ/03jRXuAHeQ0sUx5VV9ejM3jG9k16omhEBZG1tY7bu7I
	 HOFIGWqPo+FcfTSQttgCNjMBeASVjbBqDwu5CjkEETrt/nj/IK7sUa4grkzJegl3xLQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789198833;
	bh=2NNKG+Ovzt1tJCSWlpEfvoI8mhG5488DtUGs6ZXGKCM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mi/LeXrZW1tp89tzxmSDz+rdLNqQ2m4fiQuL8EQxxKj++Jvx6OUVQsGnllzPb018s
	 d3PKLMvkU+ZSI5O9rc4sXqkikqS6O2QCqe/Qr1c5oZfTE1wS+ZZNUHGe3B0QwBfwXL
	 kTUA0Ieu0Pc25xqs4bztwdA9UHhEKu2hwxxvmsU6Irf0MjxFHDaiPvXWSCxXoauA4b
	 ZpLZCkhRNPJ8eBQf0EDf3KMmyg8ceJLaoxvn/YLRxze3fZgJL+CmP9zHXaIsVbdI0J
	 1T7HBtkW74K6wZb4n4tZg+EiSPqyY/mkPrjZ5AyLooQTnpM4iVfi1MJ/bR7mVCmRSy
	 vjBjteKGjXJSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E7E9405C2;
	Sat, 12 Sep 2026 07:40:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3B0A2E3
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9C48404C9
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsHm8W3RTWK2 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 22B14404F2
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789198830;
 b=ks8FSvMd2crdohwUXWpYHZSXskjwcHNv7Z1L+V8JwiDOhtettudqm40awUlcud0nuP3Q
 YrfBqT23ZsaTzqOdTkNA6jHSjyCAM3joz548YYeVDbbm21VDI5V53af+VQSq6dG3+J/Dy
 Mr10xRPuvko2p1asvA5BaM4s+Oel0ZzP5DMLOylZqtKsdqKjAUxJwxLcS7aiYW3H+14FY
 MNCzztY1fZ5xAEly9+F6jg2GLoTCO5UuQeocWBiE2sXk55R4tBPmcD1jOmb7qOCl5dpp0
 HHacuiw6iAchuWhwW+w33BnUC/h5A/dSQVdmBQzl+SxwyFwgnGEUGTyAvGnhGXqisBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789198830;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=u5LGX/RvErs/e+7TLINe52yhCN0uhYWCm8qkozGoKq8=;
 b=BvceazKxrZ3iu7PT9IbmeoX0P1gtx6jAz0jTeEjAtS+uOpZ1h/WydqgSvrOTiPWBL1nU
 lC9mHpo/aCgMEOaZ8roUEjlxYxpn6F3+Oi1pD/rdLlprYuTJDDZVe3if9mga20xARKPmn
 EGRl6KXQ+VEI7Fo+Q5yYqMJJWC3SkPJ1oK2UyDn3nIQxkBhjjyyUdcqJJCTYo8JEWiolH
 fzH/G2d9QOX0yieZiIuTtcQjaCVU+QX/CcukZCLLKwjRSg2kmSIRuSy2tRePEWknnQTMN
 bPzBIed0COyrbeSkQMJ/PMLcsdrAHUMI6M9XAkEnAFbdIyTApSfk7xMLVWTTVSOxwHg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22B14404F2
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B846F8C6B1; Sat, 12 Sep 2026 07:39:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 09:37:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f125a653038c9460b515b1f0d4c8c4be37d88c3
X-Git-Newrev: fcb0643274b69c7ec1875bc19b05157d4aa4f127
X-Patchwork-Hint: ignore
Message-Id: <20260912073925.B846F8C6B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.24.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fcb0643274b69c7ec1875bc19b05157d4aa4f127
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.samba.org/samba/history/samba-4.24.7.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 9fccc9bf5e..d62e325f82 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.6.tar.asc
-sha256  810cc955acb367e9bde556dccfb50db177a02b7c553aa1629a0b905fa7616267  samba-4.24.6.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.7.tar.asc
+sha256  45b7747a47452eff2b2159a44cc63eb43690d339fd1069088e023a015fed06c7  samba-4.24.7.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 6291cb29b9..a9e1577e26 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.6
+SAMBA4_VERSION = 4.24.7
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
