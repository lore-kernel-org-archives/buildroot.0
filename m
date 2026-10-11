Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92A1CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1C3A6060E;
	Sun, 11 Oct 2026 13:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3aoebNhemrT; Sun, 11 Oct 2026 13:10:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6327760616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724230;
	b=f92ufgHSLkSUUCtsDhf/EEgpBbuvAOuyNkyXC4wMj7JrrEM25c+nfBKkT795o3Dx614K
	 K1EzvEoZelMGe+p2T09gqUEnO6HXvnUVoUmO2zxlWYmzGuDNSaLePCv7QkkaTLafDkkBK
	 goWE4G4TwFlqSlyN1Nrfm2OSLZF6MCwSjAEToKTSgLQtnjgeQOAvHCxveITyXOsxKDcm0
	 VcI4V7vQEboBu4W09lJvZaVeDRxsFXiGnXJEOmRpfY68xjBcU3dh12aBTuM5sXmWslS1/
	 FmB7CB7mwikZeklyi6mzLNnXwC5n31xBP9mobVqU3wyhM/HC3mcsJGLTkyDUQZep1lA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aEtlX1oqNnTnB+oUITuBr04fPXS4mr0TbGhpiP7nv9w=;
	b=f5NqL08EIl0qYPaKyg56oSgJbp6u4LZwsrhal3EFTE7egunqV5+N59a8Agb7zPb6oDkP
	 VObRbiRFHr/SPRF0kIhzIFlxO22/L/JACf337CuDk3fLwi9fzBbNvTH8AXPMw1jssA/eq
	 JbScvtWXnwNzqE4CO46dOYe+jWjGasITp3Ln2dK6XkPDHwmttNve6WwzXZHfiL1KDj3xL
	 BfptcxVKAt+HMHrpPHi/rau5qQ6s8iP9wD9rK7/RRPDKDGpyFRvvmKGJLH9YEuzzD9lkf
	 WjguWsdHDOJMH80vWMnaWUNbnIUgUVh6MbSb7ffC7s/Jo2iPiXyTPhNiCA0YijNb9tg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724230;
	bh=aEtlX1oqNnTnB+oUITuBr04fPXS4mr0TbGhpiP7nv9w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nKojIGwhyypMB4hx5j5mPg4V0kNCy8R+1rGnCgJXJhkPWw/p8I3O6KpOcZ8jo6fSb
	 pvBVFcp60hnDEVwrfvppcFKgUL5lh3wItu7/EnzlKeHsAqSBFxfT5Z5idVJssgvo/A
	 /y5wy4qGOKliKy/H9NktmGwSxCEEhIA2dON7UVdEWKjZZiTE6TtrW1Cp93o8PaDho4
	 YXGH8ovd1iEPZH5JQ2oZto3Q1OZMjR/9jSkKQeiw0CZO7k5mC8aqwwp8SL1t6s4CYI
	 qpYUE+0KBs3GU/M0K+DlScz61em6KUqJjbd4+mglXjFXiozxE+hdDUsXQQJSKO04mp
	 fc0VsF55cu8qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6327760616;
	Sun, 11 Oct 2026 13:10:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCC092E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B29A480DA9
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EtB8a9G9Z8Y for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:10:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6A42F80D9F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724228;
 b=Bn49srlptLRNl1RxF2YJZSrFjbHC1dXiuBuP5eQuMkJNYPxh/U7J7CGfRj5mviLial8t
 7mmhm+wQFlV4BAHs2YtRudc11UKpPyCmQINbsactRw2W9vMdaYBqdo/tz5lT6fT35HtdC
 o0u3/IStQxhEhBVS/eyrTICuAS2zEGpbzsSMY9y6/dTqRJd+8K9xmXPxgUMuEf0Q4equq
 wMLvNzzKQX6xKyBxxVy56COjeDZTdOnlosWIYRq4fubDR6wnZUIVpeNpr3NTjL+QlEN4M
 DayzQupO6CUryltJQkISUFq9D36nJoYLuPfn9GcLH9DnnYCI5sv9SqbnOJIV9L8FkzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724228;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=SXYCIxlMLQZR42EIMam9mQ7ep7Gps1w/+ObvCSlLOIg=;
 b=oUgLsxfh8X3Q/eAsmAJ5+9iLz1oMzUFqcKOZ4Aq+awVuNXmYH4oEIwYh1HzFX/w7mGcK
 SkMkkv/uTllQ4O+nnUBUBOTZXb6YrG0PFSfe7VIU8LRO4aaYHGGB13q3QPGYBt7iFj2xt
 oAmUs33YpIA8xxA/yfchNG6TWL+/uzpyYiAQZJsdA9QZp6oCnHVP4Bq/shDxPQl9xVQpM
 l3sliuB9mS1oCJzAW/wpq0f79pbwB6Qlh6kYozb5AzfHCNDwHUJ1ZKedJx0HeITQvjG5d
 z5wclYQ7Ql62Kjzi8UPrIVjQq2iOC/tthGoio8654DNj5tL9UUWLgRjgjv45JXC/Mdw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="EN4Rc2/R"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=EN4Rc2/R
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A42F80D9F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723684;
 bh=SXYCIxlMLQZR42EIMam9mQ7ep7Gps1w/+ObvCSlLOIg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=EN4Rc2/RWdG0YxlLiYCO6F3UV6KymHgY4C37go1G9auvgfnsGqsrqyK/mR2tyAFuF
 M3Vw5bh97+AR1UAzKmkwSv9L1SEBO90Z7E/ruC0f3KPiMyUI1PJ5utvqZB/x1T8eWr
 GUEYZgAxy3F6nG6zPrkVx4wJvP+6GobvG5fv34BaTTAmBy9+GsXbM/+Rz3TBVfYpBQ
 /RsVOPpCp72dmw9KPimvCtjIcmdVzx5CDQ3JA0L9AdUR41/xXqlrDMMEDUUK0+yOKB
 XvkHm5pLuQd3C7cWu7LR2GaPaD9H+1woGfGLCFuHTjEVefALysulvsqbCNPIXahoZ7
 XgdknHn4FbuSg==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 wzYMDdvNN6NPKc6DwPPj31e39qJcVq6SBUJeVLeULSYN4jpiXCHKRMlVjtDS2SACaZxpW5LuUqN
 YUcbVvdMY7NQfyRcoU5xK4tGyyy8yaBQQt4lT/Zn8VBGbAohZLxTW4JpFRuuRUpPWADJ+08hBeU
 FXqygA0shmdFNzA97Eq1ppesfd2gxOnc4WyrZFEHi84qhNiTK9qeG0iKiF7I5wo2sGZECVjavHN
 i23kHW9dzRczyHZvPjQOnZRJP0zE+o1rDnRLJkSnwhUjJq9YRShtvrOHkI99CAWVBYi0DV6KvKe
 5b+NDg01Sdc/DAdGBoRY3wjJwcxgSj4cmOREVMcxKAJh+IbvYhmpCjjej6YlGV/6Sz49jULN3rQ
 77Wx9x7jXrPuxm7n8TKwNj/sBixN/szH5qZQSisNLRSYdwua/DuB45/v/GnG35FpqyOFpGc0L/k
 DSLv0vu8fDjzv9T+A/rY6qzHWfhgolNkozbgMpNUWX+dYvU4Da+TmAGNxWuY+xOAHESQETAAggh
 SVqurG80o6WhQujLevzeMM92jRpTJ9YzEeKX3l0T4htyigwLg9PRRLfY003Lo7rwLzgiNOvUqt2
 cylvVHg=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 94DBFA4C58A9
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAo-000000007Fz-2Pyx
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:51 +0200
Message-ID: <20261011130058.3443432-47-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v9 46/52] package/kodi-screensaver-*: mass
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
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash  | 2 +-
 .../kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk    | 2 +-
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash  | 2 +-
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk    | 2 +-
 .../kodi-screensaver-biogenesis.hash                            | 2 +-
 .../kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk  | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash  | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk    | 2 +-
 .../kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash  | 2 +-
 .../kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk    | 2 +-
 .../kodi-screensaver-matrixtrails.hash                          | 2 +-
 .../kodi-screensaver-matrixtrails.mk                            | 2 +-
 .../kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash    | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk  | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash        | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk          | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash      | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk        | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index 0210157d2a..a68c3ca3b3 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  468527220845a411af4dd021a907c6449327015fb848e61adfb46b47edde331a  kodi-screensaver-asteroids-21.0.2-Omega.tar.gz
+sha256  5682dd86180706b6bee99a3b16797378b68d64832abf8fde180e6e5da741e07a  kodi-screensaver-asteroids-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index 878ab22c3b..f680a69cf5 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,xbmc,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index c63d3be3e8..c7bd9973da 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  de92f8773f23c77f388201d316273f1a06103965bdb9684cbda19a73180c1488  kodi-screensaver-asterwave-21.0.2-Omega.tar.gz
+sha256  049ddd84606576439531a76f04bf6732ecab1776d151a5bfe7b69a1a488080ee  kodi-screensaver-asterwave-22.0.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 90507bf8b0..90518360fc 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 22.0.5-Piers
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index 865f31b201..9f163c5dd6 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fdd5a5abf98318e01e22c88f81ae3838b2f3b76f99b39e01fc94af528a200849  kodi-screensaver-biogenesis-21.0.2-Omega.tar.gz
+sha256  a67269b38cdb3d9d39f8c7ae5c014af6496159ede7701fdfc102e78280e1ac56  kodi-screensaver-biogenesis-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index 4455caedda..25cbfb8cbe 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,xbmc,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index bb6918a03b..35e6186c19 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f56b57dfc8535331e36527462bd820e06e287a5a48ffdb33d00bdf1a2dc62b90  kodi-screensaver-cpblobs-21.0.2-Omega.tar.gz
+sha256  c611deff379023ef3310f3a4eb75f0d1ae694310efa857fc79e35a178c751c01  kodi-screensaver-cpblobs-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 8154bda2e1..0b97d3271e 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_CPBLOBS_VERSION = 22.0.3-Piers
 KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,xbmc,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index df652f3286..034993ff3b 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9ed9dba2040268bfd82648856b3e07da5cf51f39909c71c2579475221477e3a6  kodi-screensaver-greynetic-21.0.2-Omega.tar.gz
+sha256  cb87ccf7c3cbbca7682196e0ed6b5556662a9b630cfa462536fe019ff8e7cdaa  kodi-screensaver-greynetic-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index e484305485..1049386374 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_GREYNETIC_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 27bba5d3ba..a339fd3932 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cc342d201606e682fc9def894a308784b74633f981209570c87d1bd206894311  kodi-screensaver-matrixtrails-21.0.2-Omega.tar.gz
+sha256  906de731f0b1f559d27c874c29f3de8bcd82551a99547181ba5a3cbf4ab9dfb4  kodi-screensaver-matrixtrails-22.0.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index ab51a5bc2b..21b1a652b9 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 22.0.5-Piers
 KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index 867ebf865a..2dbae3ef54 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4d7c15a0070e4792b4b56726d9a37ab6ca8c569186e0beebd256a57203d5e362  kodi-screensaver-pingpong-21.0.2-Omega.tar.gz
+sha256  b2d773288bc4e07e695ba847805a498b43d35784fbc066f878f8d0217d422cb4  kodi-screensaver-pingpong-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 5d1854b9a2..63b89a18d3 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_PINGPONG_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,xbmc,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index 23d1e1b1f3..7a3f8c0642 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4a6b5d7efd789be40226ffe337bac8f64c47335c40085d940d624d42cdaa1be0  kodi-screensaver-pyro-21.0.2-Omega.tar.gz
+sha256  70e519246b05bad18ef97f0973a082bc4796a438fd6054532b44a8af3bb4dcfc  kodi-screensaver-pyro-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index 72bbf2e913..6ffbf563b1 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_PYRO_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_PYRO_SITE = $(call github,xbmc,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index 6f9ca93d8d..c611a7cfd8 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  86a479a4c6d0b27723a701330b83704f223566eabe7a25302ecf8f0a66e5b27e  kodi-screensaver-stars-21.0.2-Omega.tar.gz
+sha256  45da0470fd95cc059356f87ae34db32a117ac11c9e30e4b65c7f018b942bc534  kodi-screensaver-stars-22.0.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index cff60ae5db..4dc7577b6b 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_STARS_VERSION = 22.0.5-Piers
 KODI_SCREENSAVER_STARS_SITE = $(call github,xbmc,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
