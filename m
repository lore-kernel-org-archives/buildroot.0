Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A5ACA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C37B60840;
	Tue,  6 Oct 2026 16:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0QBxXNujVKD; Tue,  6 Oct 2026 16:30:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9B0C060841
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304259;
	b=tYHJ3qpBpq9Que41d/wh58K8Ag7nPn4OmLRSVzedskQhErV6RJZMcAevOd2X1ofOpQDe
	 sDsIlO55G11MCk4MSZZq05IC1qk6Db0iNAU01ji+c1xFStSaXaaFuErNBtjLmdQapUgaF
	 SEXydmhoh3lSKOLBWxme7iRPszyOZHZfq1XoBGNAOpTWbSdonR1dSRX9ILWbpE/TxvrZr
	 Wp8Gco+R8HtXb0DaON4MBwYulisaBvOgPb+KnKfUQjINNpBWfmO+Z5n+CIUBr7dMp3AAu
	 bYacmBpJ5/iGSTuVWMp+LBggMmHU5/5kRpWw5THNJvEWL0U/xl+unIgx+TYtpTEiqmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304259;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aEtlX1oqNnTnB+oUITuBr04fPXS4mr0TbGhpiP7nv9w=;
	b=QGrwddINbG+/SODrB5Bd0g+xBGooO2/cE2/KfPUIvJnjXjv0VJNtcWVbAEIdW+hvtvLF
	 EY6jbcQ7KO2hNQntYFizN5+kJ9vG2N44RQZHsjlLcxgBST2ApUv5EUiBdqwaNAawSr6eM
	 oOAnpJrQ0yhiL6lT/WOuiRMcc/eXIc8WuNjsCyuZZCz1uMHEM6vtxxCmpA68Ghx/jvc5r
	 cYcAJrf+s8CEdubVblOUZ6zjGTdmRqDWBg7heYcU7nqyDy9pUOwlcsvfb1n9zIn1dz0nY
	 Oi6FifjCqxSRXXiSI9BViOZOFcmZ3W8osjf1MAtd7P+CrfJbmnJxWeMFrc2dEvz4ulg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304259;
	bh=aEtlX1oqNnTnB+oUITuBr04fPXS4mr0TbGhpiP7nv9w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XSLF+6BA+0+Pt+qcls4Wu/ZU8qpmVCdVBR9kgmjtfrTIqoQeW5mVKwccGo/8WM/eW
	 bNgXZpYihxCX4yYaSUYC+CRL82lXU9XPwuwnT6C26HGoJGrZKNlpf0iF01soPJpe5Y
	 A9+HQMikHXEFcP0l7dj7Is6u2WSn68AYuParFZgDtOAWbWeJ70hfInf1xeJ9CGKU3P
	 OECEGdU817baDgkO8XlVRKyb+Cfe2hB0RXl9Do485MHvz9Lroa98QYxxMc+rv7lcor
	 Lpao+4Mf7o0mSa/q4NLcYhP3si08ncP4Mm1K85OHeqq9TmXZU668EuqZR8ewi4ZQ/w
	 PWBcOME0muC7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B0C060841;
	Tue,  6 Oct 2026 16:30:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 29BE1317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FA6E40508
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sy_vlk7T-qvd for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8C855404F6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304060;
 b=dT5oPB8hfjfuwgoK2y7mO7yRi3zop5W5FZz8RJviTqbgF3LvEHvPu3CnAW1/+vSIdIGA
 sOQa8fdsB/RTG8BPnPZ/x+cveX65SI41wfsO/kOwKQfaTT4a+ALcfwlS9W79CzJiCjh+i
 bThTQmt++z5VDhy1rSXMY/4wri4KAuZENfeqYI3gF6zVjGxRhu2k3btv4q3s12A9B+piB
 geG/n8IIS7A5GuC1PkwLc2Y98t9oDGoLicVM2PRUYx38VwhjSJm4CItperw+tf8O5y/LF
 HaXxevgmBKYQH5DLmv9afe0X+rw6EMtWr9BzTqR2Xx4qTK9M6EjqJyxPBrzPnl4s8Pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304060;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=SXYCIxlMLQZR42EIMam9mQ7ep7Gps1w/+ObvCSlLOIg=;
 b=WvwskvopbMDSov2l5sKAHN2hFwMkTNCB1DVvy5iPMvCy6xPLe9UkRRTuOPF+KIs6bC9x
 0ViOO/isMBhze2+L2YXqyDNOMoe2Ba2sfFxM30wZyOLRSUGmfVKostJa7m9tEQrYH5eMl
 FqurKVxiunJSAIGZc/b2irzUzP2IEwjUYUktgBdzAQOsuYbRxSLKciYmfFTegAWB1yfS8
 QbhxjC+upCBT1i1GCDsSv2vY+bI9ZmMFItPEavKAzsF5DYPxwnYVJNxF1haZQCZdGTcTt
 S7HxEchaMiFk8sjWII15ApIQpcDFNR9vR1zq6MkQ7dpcJ5wHrYaYVuJjFD3nThNc1GQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sWE+fzaC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sWE+fzaC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C855404F6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303706;
 bh=SXYCIxlMLQZR42EIMam9mQ7ep7Gps1w/+ObvCSlLOIg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=sWE+fzaC9WsMWTh4bLlJLIU4VtrhkqhvhwDWPjdbFoiGezmnj41WakXjKvSBlpRsy
 Lb6dwpvgOO5qIQhIHB/99cdW+2qEUGBh8y5QlwFWCNgEjdgySEOZeH3Iy9GYZlQd1m
 568GUOuSsTQtlV9hHQWNUXxgukx7jhRrvSr3vm9qid64fh4c/nlvGVPaouWMf6fUna
 S+GKOoiSegZtrYeQOaw72BcpqSV1KoT0pl5O93+RNiCN2nPjHSL8e7ZOMZVHmzC2rN
 X7yQhLqwDH1eFzHnwSxBhtbYNGL6Ma1R/UJERFuCbtff2Kr7wd6fjnaUNRfcTiW7vP
 Y/zD+GdPr13Ow==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 +ajokrewR+n3jVwtZrGP+ywB2Qo1OHLkH4zfUmOqwHzMkcmXqG0WAYaN+oTy+/Cf6MfFvbCZA1m
 9vlNX3ZH5WHppKaNrLgw4Xp2jKZU0qGnCAeAs97OnI9pWUVjKNMRb5HQrbzMktLqWvGnx1ZaxMV
 jGop2p9E2b6+0rSCj4UZn0/KH/wbdWr3eS105qX0R85TKzJxcvNBFu1EhBN3PCEtBfJYJ6fJ8aT
 rwcjZTlxyzd0bSRwk8NlKgKHtXWi7VJoIM8lyLBIPOeth6YzXQIGr2KaN8MKB5bJjHyFxoCvflp
 pC6unY/p3AriQtUOjCtjghTKzQW0dh23A2tnRwgclvkow+6AJgQwi5AcuY5T4yD1ed3mDimHnrn
 MyvZx/L1j1LNqchwMl4R6x9oW3rN13M0O/yMoYkjEtJpp20qXYlktlCWmaeu2IiLz9INRFDjmWK
 opm6uXxOmLAIBkeOs5sJzVbHYs+n4Tuf8N4diiWxME1Ku7swqi0d07/tUouKWnRSaWB1+0mN9Xr
 rrW+08CsO0/4vRlqQJJ/AbDAnNoI+K6OH8J47xfV4Ow43PbF18SnpdpC0miLxK2by42iUcklsaN
 pEcANNU=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 37384A4C5336
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7ut-000000000ir-1yd0
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:21:02 +0200
Message-ID: <20261006162106.3439373-82-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 81/84] package/kodi-screensaver-*: mass
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
