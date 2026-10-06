Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62828CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3400360809;
	Tue,  6 Oct 2026 16:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dg1zEa9y5-Qe; Tue,  6 Oct 2026 16:30:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2BB83607EF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304239;
	b=gxQ8Gpkw5uhOeyW+8hWQgqLjEb9ZRsrmj7CFNwCXlBblaTA5pZMD4KHIXFL+dIZauI+B
	 yxjrtanLsVMzgA5G9mmJxR5MJaG0H3hhNs8biJBvj6qXMZ7+erds3aG0Dc8EYNKEElFgk
	 gZqPcQvo3QtN9FBruI6hA3sXWkYkJa/nqac0008SwWzVrES/wEWdZHPBknsnOy9N5tJC+
	 gg7Zgem4bkrKr5jtkJ7/lLAmtDZGcMUgxS5rLese/BoNpCONCi/WNf/7B3CUDEmvWNxra
	 427GSBmrk9c+Rfpo66+aWZrLBH+nDiceO/sEHhABj0KKZCnpvyEVrvy7SUGpvkkCFdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304239;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rjtgo/ruUfKyK5evXQbgICXfnaDULXoa9/vQgqN1c8o=;
	b=QGbyF+X4F3im+uhN7VpF+GsPNo5mMwihSC1o9CTYV+GJOep5DASuCepwjj8Uo55bYpbo
	 tOtDIEuMQefIKwpceTEFzRKnZQ/I4StD5LIXVmD8Q5pSuDkQNyTEGA0pq7Kt0CSHCWxgD
	 buhgxNfq8cawZVIrmHvvklZ9+aDqUGzqWgVbZ9zozYjPUbxiJ92zJ5z4Y0HPk+B2nhcQP
	 R+ozV4BCeaOxIYODFTFqwb2942tu7DEtazMl6vHqueNo2KE5AHHQZMMDDDToQzrIufL4F
	 UhafTOf844ak9pBgusuTzbcwiFG8sU6J3GbjIfnm5oMx7mXEBHR1CSS8p/FezLBVBMw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=lRfz06j+;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304239;
	bh=rjtgo/ruUfKyK5evXQbgICXfnaDULXoa9/vQgqN1c8o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fre3CJMvX1VZbr7wXwUe3NcMKlTpym6GfqBr2ftUhvOnyrRehMNGo4L94QaK8FCgS
	 fMUTqemyFWD58I5VN8GQEl2XGoD3k/5W2PlRw4pe9I9jG03vDBJ9QxtSsZ2OdK9Wmm
	 sVTUlYuhHcY6JmImMXx/yFZhAvLrjpy2xAMAlJbFtzvouWlo53buL6IV3NjbY7Y0nB
	 k696UNQ+FS60ktoLYIYmsfTHwTcr29nJ2EGG3qOLw4vXgkFOcI2T0vUZ5VYce2UzEn
	 SImAJvNNroIv4JyKl3Ao/i0EB0gMr51cCQO5nHacF4Nhc5onPPdncjnPgJvVLYH4hT
	 qNxxpyOhWf7mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BB83607EF;
	Tue,  6 Oct 2026 16:30:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B9BB341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61080606C0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9Jb9xDdUVxH for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:26:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6F3B2606BF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303997;
 b=KAxESowrY6Z3qj3LuwRIQQw7s7WPgGXos57oHvbSNRvmtiMsw+4p1znBcT048AzxcLSl
 mPQUH216Ys6Aac0dZEJaamOgGB1yV8u156iTO16Pb1TXIJo4GsI7HlBLSdq39Z5+m06oL
 HzBynAzMAPrOErCR5olrCHDtMvKL5tml6+dIOjKYnbwunnmKu3phKRHcQqgThcLJ6Ce4S
 4AaOxDj/xsEJ7HdVyYaq0fHJ2/L9q5txCLLcIPTTKV8Nc88GqLkwMktZ+T1ATgUAhkj5Q
 br5Vkmqjcjr9Y+Chbm6p9FR7awQGQR7onQqA+V1wlYRBRTjCKeb7mlhH3AqnB4W7RnQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303997;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=biqH+mpGL41G/pJc4ksvqxNy8cAd1TWozr5zrkoG/No=;
 b=laVBB+ri+7+8GKdEs4jhhN5T+I3U4ECYn+IKJygX7owOrh63VHKuPDikpZwb/WdMsbWw
 /ctoPsHiOt/YumTlygluUpI7QgkdKnMY8yKKaoLwmD0qaZXs0R8CmvcJXkKyeVevmdW7l
 NzKeUZmkWfRCyEuB/Z+jbETEW5N1TuoRfA7DRoJiHCvarP5uLDpjRB8s7Aga0oyKFp2Dl
 DzoucE0805xjEY2uvIK8hE2BC1QaQaVffePC/PGEgMCMwPPkgvQWJW+HKUWWtaKdL2OLd
 IO9X8We2iSi8rMjJITnK4oMv2QqQ9lFfMea/HG5i89iusnmzA2XKZZqOt/Rv9CjJ9rw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lRfz06j+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=lRfz06j+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F3B2606BF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303705;
 bh=biqH+mpGL41G/pJc4ksvqxNy8cAd1TWozr5zrkoG/No=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=lRfz06j+zt7kOX5o2s18lc26XleYTt9jiHozGOAUz8ewbww2Pzyj5ehaVYR2lqxfz
 mlg6rPdV1KN3r2uCcyXOZn3GzLZGpggPJ3uxUHpq1w1btSq2hLJBu8vOt/Fds2FNxk
 xoClyTRiahDGZy2UeeAGeyohSqP3R4/ZyJhBMsXBY53wtuLvK8O07KagGGUCJqHd5+
 n0sWp3OwetAyIAFYUMrzaLiy23pACx+3qgU33f+d8nbogXcWGAbW4BQ0lvoghqpEzR
 PCKfGLjDs8VVVXbVQqHOqs0KAl8dUEDXMLwjkYpPBrlxY8A4A9or5IQ/OsqlluGsY4
 3yVjf/a96cVVA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 /bGA5n3gE5c2kQx8nKYe0kaq3jmz7V9TBtsdZYemPlqqxXl1q7OomFHxgg4KUFKGVhUQlCUoNAN
 TEaoJhSM9pMGF1yb4+RzlM1oz9ON/NHzR76cu0b8EvGCrkBQ0F0H7vA7bqCHwBjPIePmY2azZem
 hzUd/QR7W/5MOrpyZfc/TWbHQZmm9Pwpth5a5nzQ74nq/ofUCanV7I2wVdSKqHYVvh4HstM8D+z
 uvkFJ95kWMXNVggi47U3qV4MfXpYYDlhjtdstV9F9G7pYRHbfn/YJOG/oA1SnEtudm4VqGrz9o5
 NhPifOb6niU+DmZJTyVrQUfvx0/GrlGYIGZvqrnq8jWpHiUW6nToOBgrqUZ2NkKESY00sOc9Zbz
 BU+47gPwl07Bk0tzJMkMT4B8LHlHn2/yqidlaP4KvfEkC8sZbBpuLRfWWp0lqhWonYkvGwjp9XV
 zmtdvMbuBosGjax7M2V0H7Ma3d4s991uhbSyqhdJcndWc+KPPXhDglNevHZdrILILbgLuaAGJNB
 8WJVegi0cUJyEXiKPxKOsGvzbkalgk8JYgK8NujaCJru7AHTKmthw8DIXtQHSVv7cKsOhyaHe8C
 T4mpOWg=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 576D1A4C52BA
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7us-000000000ir-27Hv
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:56 +0200
Message-ID: <20261006162106.3439373-76-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 75/84] package/kodi-pvr-hts: bump version to
 22.9.2-Piers
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

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-hts/0001-gcc15.patch  | 26 --------------------------
 package/kodi-pvr-hts/kodi-pvr-hts.hash |  2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   |  2 +-
 3 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 package/kodi-pvr-hts/0001-gcc15.patch

diff --git a/package/kodi-pvr-hts/0001-gcc15.patch b/package/kodi-pvr-hts/0001-gcc15.patch
deleted file mode 100644
index a62c5f836b..0000000000
--- a/package/kodi-pvr-hts/0001-gcc15.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Mon, 9 Dec 2024 00:19:15 +1100
-Subject: [PATCH] Fix build with gcc-15
-
-Backport upstream commit to fix build error with gcc-15.
-
-Upstream: https://github.com/kodi-pvr/pvr.hts/commit/b8fb7f6cbe9e3e9ea2737dc465a70fb4bb0951eb
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/tvheadend/HTSPVFS.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/tvheadend/HTSPVFS.h b/src/tvheadend/HTSPVFS.h
-index 1fbf9d18..80f9fea3 100644
---- a/src/tvheadend/HTSPVFS.h
-+++ b/src/tvheadend/HTSPVFS.h
-@@ -9,6 +9,7 @@
- 
- #include <memory>
- #include <string>
-+#include <cstdint>
- 
- namespace kodi
- {
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index db2c69e67f..b1555a2794 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c98e29433bf4a007662b20279748dccd95da7817ab73b7e78c0b45fbe31c22b1  kodi-pvr-hts-21.2.6-Omega.tar.gz
+sha256  af9e9adce1a96073280f49b19adac4cdc0145a0e2889a530b067ed2a9708ce43  kodi-pvr-hts-22.9.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 0e34a4bb09..addadb740d 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 21.2.6-Omega
+KODI_PVR_HTS_VERSION = 22.9.3-Piers
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
