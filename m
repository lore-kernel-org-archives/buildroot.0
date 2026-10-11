Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E420CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 326A1406C9;
	Sun, 11 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nbu6dzrdHB51; Sun, 11 Oct 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1889E40595
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724107;
	b=YJDkEO/y5m3OMnCIN+6zaFcmIydpHN5UA58m1h4b4nADFhfTQbL+t3gEAui/H+zLOn1d
	 UAUad0OwTf4u/btI4azMLRBJijXj5pD3KNPB3RQU+qUgZueYo0seSnkfP+KWWUiyHvxyd
	 I5m0cF0olE5OKhwIxBwAk/Q7TXzeEv6upzQntfnUFwGx6J50PKzPzruG3GDM1ecyUTOHJ
	 /qJtD1TVz/TJi7WAYb6WwTYlWdyW7Ql1xZYLE5HUVBo/HqxZ0W+ixbaMKW03BUnLJurFf
	 lTYKCgVA0C2SoXIoCfGirmmTt3odNZBhqjjudpT1H+oxENjk8u7Z41qxcRdM860lnzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724107;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bTY5ZCPJxBE/AEidnbzCHhWj8VgxiEgKdmTmEHXQSks=;
	b=Lben1kWuCYJ2bn6W9yoYSPpr6moVJi+hXuBhX+MQ4mZWXZcYpA+6+dQQvUXBEvSII5aI
	 MWuEG89t9dIipL74LE2j+Y1ISt/greh3HAAy8j6ciTLQcsBcUN9pK97PftQwO+pqbXfxj
	 LuAkg7pLGvrVItzmXfSBi1MWiYQ6W000tj9U0pq7EnvWdzqvko3Y54zKhwzlVz2bAtCU6
	 nHfu6QJMeUdi+/UjO6oT5cYzrkiucyXDIwn2Mx19toxsXMYl3Heo8TgxKOctIBRXNQTa/
	 E0r3clnXRiLPWArf5U76zbKF42/zzp4VsYSYueQSEmxmHQSPgFdv6k6wwMYMuDZHEaQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724107;
	bh=bTY5ZCPJxBE/AEidnbzCHhWj8VgxiEgKdmTmEHXQSks=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dWW1fSO1HnGAp/gQ71JGlZ7LIdepqcrXCQaOfiqiiYlz448lbf3qLOAUow06dzQrk
	 +AYv4tIqZNip6Q3iUOpwG1HaipSNVfymDRvoykNrpAlygYhop+0iC77uXi4hG2v9P7
	 HuwpU/uQEO1ZjBJzqdhQWepQnQ7XX+M4CvEZHOGHG9ZWKNS2ORII2W0T4grzx1Mxwm
	 CR3KJESmrkh/iDbe0HAvtw2TsUdMWIJIK78BL7F+Par4aNttEWjRGmiijKVB9gH1pZ
	 XjAf9OrEwIK1v9DihU2vsKmoJ/D2E0oIadCIwrxhexn9XyM0TOUHQXWn62YuI35DW9
	 2p7zfjr66eXyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1889E40595;
	Sun, 11 Oct 2026 13:08:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAAA62E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C9374002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvoiUvGXooBi for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:08:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B12314008B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724104;
 b=hG0oNovUTeHqP6MhgdS2f/JIiCTFOXPhxWpICKx5suuGD1nlOKRb6XBboXl3TByEFG+N
 9WPIQYURWehzxA5A4W2dbjB11TbCkwmtix8CJJEyLRRbHQk1+4Rn8riE8vhn7WOSf/Izk
 Vjx/54rHylubL9TBlDkD8MM6AynncibSHYBuisPO5Bq4wLgUAqUp8NUFZJ1eeiyIdybdd
 oZL3oi+fOJkjYUF2JsGtpnLoEf7D+MvkIw6gk+zk+L8Ua3V80H8kxNXkrSeeCZPEPNoJI
 Ngr3QZSoEEYnF5FS+hCMZVgT+Y5GqYg4NlhqDZYzFuC3MWuPDccHwekUZlQK42CS3Iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724104;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZC4nlpTNXR+GNc2CZehD4mAOmETwzu97D50GF2QHVOw=;
 b=qyDK9CovoTsZvF6NsQGjBYOqvlqrYBGddfkB7cR67DGe+fK6s1/d6z/wb4ZDl58Q41wJ
 JOoCJRJYkD0EyF4Wy3+7CPuNtUgu3F6Ra8UKVPZW0WtB5JLu4lV78fjEcV1YYt9v1D/OX
 uMtP7XbJNmYGUPJkk8xZetTbgroRHBZgFDJRL4hVYYmscvu9jQxZFcCRAknaUD27grF7N
 GfegDjzld9gwCIhLfJ71R1ADoKWkp2mJbzzNwB85Zv35XnhK34e3pna23ecO4A0IiCOip
 nq+FvEWbzhpz7zc2QVDa377sNbbaXX8plIftj4nvAC3LuoGc0tAsyKNB8NFHUqUxZYQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JidVklZd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JidVklZd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B12314008B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723665;
 bh=ZC4nlpTNXR+GNc2CZehD4mAOmETwzu97D50GF2QHVOw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=JidVklZdJWUWnzguNbaM8pb1EvJyZZNG2c4TO0bXFpCR2za96KwtVZOJP7mZLKN6j
 3uzyMzInqHGdOmkTcfmUzCxfTEC6nXBihXhEhP90CN/7c6IyEg5L/0n8jfC+d6+erx
 SdHeXJiXuZigFhkBcPpziNWw3cgTojpjKNt6gGSC8EgQVP653Jxy96kvlqsy2giNDi
 WyQpKSLBKZzOaL2AzwrH3vDUVyjBM6tkYY8+xgQKh0cN/IKK8QbqU7W3nc1tWo/cKu
 DtWT5B08UV13gu4zk9Lb019UO6q2AnWId1VF+RfxwO2X7cVxxiBGhDaItlPi3nYlKu
 2tO5F4i5YYx0w==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 bTi3VxRhG5V8ueYYWjPiFFLoNTJtUV5WlfhelbZ4DeB7XhRoNCLCJxdf2VGBClmKc8DtPuKHar7
 GGgzJN3uQj7O3c5pYnBebciUJYdzeN74n8UjxD4gGt2Hy4RrNV/opfN4I0D4wMLBvs12x/FUoaH
 rNs8mrjnqEXQ5qaa5pJuUDnB3mJoJHl8yHqfeSrcGlS1nK6c5SO1QvhWahyKDNoF9tQpVwWTdYv
 QnpIYCh/LpHgizWwfEZ7bwThXShK5BOUPv7T+k+Rd+JLPujBoVEdivl4nAs9dnsoaMq8XrUfgKZ
 IIvR/GJJXliXzT75QJfl5H540vR0Y39O89x7RZCcs524H9AhJVi4BkBxXqcJJ4+gWFPzYbLorI6
 vOlTDWUwaGUzABCsb6wiHfbNHjy7Je1LS06dIEkSMT6Lr6dxA/TSFJM+56HPFP9JneFTg7CezoY
 tmr5RTDNRoq7kb6QRVt0eHnBv6QKQ1YfpdFB+ypq9/IrzWanSPWzFQjobPP706gpWOxc4rPuH4w
 pDYptf8XUG+qwX7t36kP3Tdi3Sz3pWuntc6Fcl0886ZPLS1PM2/rYfgGi+d/i22PgyhunpVX1/t
 NzmvJ+c=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2D82BA4C5894
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAn-000000007Fz-0CtO
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:40 +0200
Message-ID: <20261011130058.3443432-36-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v9 35/52] package/kodi-audioencoder-*: mass
 version bump to Piers
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash     | 2 +-
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk       | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash     | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk       | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk   | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash       | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk         | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
index de326bc619..e88e0d5271 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e7f21f4c42ac2c627ed381436d430a83f18ebc07cb92e91b6c98c4ff9528cc5  kodi-audioencoder-flac-21.0.2-Omega.tar.gz
+sha256  f944778346057068d21b3b3b0f92c996c076fa512a82bf54e552ee929d382aa0  kodi-audioencoder-flac-22.0.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index 5fccb82313..5e9ee8406c 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 21.0.2-Omega
+KODI_AUDIOENCODER_FLAC_VERSION = 22.0.5-Piers
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index 6c9439ec5d..fc55bd3b5c 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cf593053e7413f6790352ab3c2fcf227763a23c8e7a90381b46afdde3d92df7f  kodi-audioencoder-lame-21.0.2-Omega.tar.gz
+sha256  7edb92db2cc6af11d79f7f0111a60345c25aff422da719a1afef1e9e9f6fc401  kodi-audioencoder-lame-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index a1fa2c51dd..e44bc62647 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 21.0.2-Omega
+KODI_AUDIOENCODER_LAME_VERSION = 22.0.3-Piers
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 91f51421c2..7ff0f9c324 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5acd05c5e90459c1f07abe60c1df40f72ebcb3519287f104968c7cad17aca07d  kodi-audioencoder-vorbis-21.0.2-Omega.tar.gz
+sha256  7409360a8b540303cd3f9e6b21a52e21dfcfe2f516f8a92a94b4035a90c5efb6  kodi-audioencoder-vorbis-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 85a320c55c..a976a51ec4 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 21.0.2-Omega
+KODI_AUDIOENCODER_VORBIS_VERSION = 22.0.3-Piers
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index 34370b536b..fff9f8773e 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2bbc3e15706e02bbd3e6be3c232522e2091509a6fdf88d8af5db4cd6bf7b3476  kodi-audioencoder-wav-21.0.2-Omega.tar.gz
+sha256  8ca6b38660815593adb8c276347a51cbb91138d42de7f05bb2abda37624e3638  kodi-audioencoder-wav-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index 76f092302b..ccc9ada4c8 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 21.0.2-Omega
+KODI_AUDIOENCODER_WAV_VERSION = 22.0.3-Piers
 KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
