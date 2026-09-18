Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEACC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 16:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB3B940BF7;
	Fri, 18 Sep 2026 16:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKf_PUlLpt34; Fri, 18 Sep 2026 16:45:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C2B1440BF0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789749910;
	b=hcd90nNRAJKLWrgEm7ot9Py3BpYZmHxgAcP8C8IJZLZ8i2/Ht1R4Xxff0IHNha+TtmX0
	 iypEc6UI7GhUlFOl2ls2/aBSf6x33nD91aMugukaOqc/CDXMI8rXPBvitLEXFV/rRlHaK
	 zZBhJs61lYCKynerDjgTkyQh4D68no+kKOUv2AsFs3lb3wT6akeAwfpXUYay2Vi7webKu
	 5oxU+p7WUJYu+6IG0YTMZHz0t8wwVHgiSXNmfsWfpmvK5kwdDS1wF1rcqXrt0GwaWw01h
	 DoAZwZ4i1NxRe7xCuXtfN+/WQAKDxYZqRf9OczAKe7eFIlwAZAmcE17pz4UnVKOXsrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789749910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DEzECeIaqlhcyPjgaxke2fpgI+2FjioOiVreToxVFeI=;
	b=Y3UQ/dv5QvEXuMh4n6r1m5Ru1lN3JmtIMsDHDxmqIGI76gPNlvlVQBJ+Yng05RhUSBq4
	 TAp/L5/NGE0h7Oe1uudj3pX9tYtbKYn/19HUOyvS1ztrjs8ypSvrvd7lWTvvf37MeW99R
	 q0dSjvoZJc2V1NjYkcAvsKt73ZyXQr6Lgg0LrrV6kJl4kUKAHuUQLCShmMLSfckIHYkIZ
	 yslAiuHzUZ+DLuBpHpP/bo6YeCbn75ipMrfJ1T6uXhwVifC/EZk6JdFACWMq45I/kTV8G
	 0lsf9QL3UYub34Y97P/7oNS2lEZ/QcFEkxl7TMODxxxPGsUitdlqkqmK6T1h5KrGK8Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789749910;
	bh=DEzECeIaqlhcyPjgaxke2fpgI+2FjioOiVreToxVFeI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cT2GJJZQlc0KsjwWkOzvfRIcXr3XDbFVNYrVhYb05B2HA2v4v2qGe7gOlQ9IDCJAn
	 hUXuXXvuMRfEulI9r7+TyhYnPFCQrSIL+gLOHeZCfltwfksXPdM5W/m0WaCCeEQufL
	 Ntkl/bo5XPlNxhyhXyG7AqMiaXbldi3/4TVv4E+RRoV/NXfZzjh2ts6dszk8hOsp03
	 p6p9uZk9prShXYjvCxgRRv68ZjUuS7iImRgxlS93lOyih79DnI6jTPI3AyMJiIS3ql
	 zElwTOOALoffBwuJiOtGiR3EADPXragd1ylagSGrTY1Wm/HSdWRZKDogIzZ+C6MDo/
	 mI4FTJksWlMcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2B1440BF0;
	Fri, 18 Sep 2026 16:45:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A4EE3B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 16:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10D6481322
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 16:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKhTixywx2kI for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 16:45:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 11C4681314
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789749908;
 b=VhyoVmzHCpdDSSDkO+C4QpP67Eo5wm6FeCbOFarfsFcr+U1Zjk7UUo4oyX/Mi1E/OG93
 WiPFFywnf4CHZLkdUDZ4v7DDmzB1EHKuouaarW/PaSgn1kyZ+LYvWxid10RiQQ28oGd5E
 TtQzcTwySFhqhKhTVyqz07SRYBEwmsfOAZr9Jn8jIxUVsCt6OWWKVgLuCXzUmnrTfUXcg
 FkFZOG+T4KzEcjdizG60jAbhS3/4OHkUI6wxqMp8YM22GyZgzgpYI5AaXLde49ZHJYTdM
 EKX/Im/GvsuKy+PXmmk/j6bFfvVfSlYhDP43ZUKHavqR+aqs4qpYm/amam61sbKUFpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789749908;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=A0T1dcbqQ1NaeBVETCZFIse6r8+0r/6+6WtnFk/Fb6Q=;
 b=V4ZfgsYR3YQ2cNZAV5CTq5fnQAaTLmrIJedsn7Huv4Z0Q18b07yEDHSpHLnHe5P9c1jT
 lJH4dgJjp3i2U87HQ/wC+6WmiYy6I8PZdXbpIMRHwMfp6jbWds3WUXPNv19Qi+dNp+qtR
 UXIMH9MT1jZvLHI/DiKHM9vXhQMonVX1wyPIgN35aXrrpeBL4HU0RUNmnlUOyg8FhRADz
 pomS1aoNY8yPEv0cf4DXJ0FBXsN1URNafovC4fCBfWANWktV2adFJ6jn4kyAxaFauL8AC
 WXr9dxhR9vlzgbphPXemC3JeqX81DHROP+hX0FtesAB1Jl7E/8XI6Ra5c8WQYIStZgA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11C4681314
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 16:45:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B0E496090; Fri, 18 Sep 2026 16:44:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 18:44:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86a56dcc17cc540c08cc4760af9481636016550d
X-Git-Newrev: 267db9da2b4ed1b0e70e46d97db717ca6aab5d47
X-Patchwork-Hint: ignore
Message-Id: <20260918164400.8B0E496090@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exim: security bump version to
 4.100.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/267db9da2b4ed1b0e70e46d97db717ca6aab5d47
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.exim.org/lurker/message/20260918.121220.0f87338e.en.html

Contains the following security fixes:

* GCVE-25-2026-09-50-1
* GCVE-25-2026-09-51-1
* GCVE-25-2026-09-55-1
* GCVE-25-2026-09-56-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index c075b2fe96..49036ecb1e 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  5bd0a3e353dbfcd5c8174388b824316a61ee2455d9052ea2f0877dee939d33b3  exim-4.100.tar.xz
+sha256  e9fb41f6724a5b136d64c9d19dbc5f26494af879a3e7e3190f91639eaa79fa0d  exim-4.100.1.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  e7f2cc1ba9af4b1113d9a40b384bf2e5439f539381126018fb9a15d3afaf687fd209d06d1cfa96e61426df0d9f4e7988e49e1192510abc02b2aa19b14b051abc  exim-4.100.tar.xz
+sha512  42b7d59bca187e0e8b3cd85d97ff40fe8de9d807fb12ce38749c30056c92689ce98b09874aec06f1d83fde806fe6193312a98681b56c8baff1acfcf91244bbab  exim-4.100.1.tar.xz
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index a8395a2309..c52428a800 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.100
+EXIM_VERSION = 4.100.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
