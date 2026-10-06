Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14248CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D54E4405AB;
	Tue,  6 Oct 2026 16:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeR4Wi05BMON; Tue,  6 Oct 2026 16:30:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EE1E44061E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304236;
	b=RK9El+vhcys/AyefUY0KmjnBQzJmzH/2uTM9ISdax9qwlJMx83huHQEOIXH6N3K7nt35
	 btseasGQPr28OzEGCo5Q7VAZhNKmz0k2NI5G1fz9qb3oVnXmhN8KoWaG7DA0rdyMsCqPF
	 5wdqRqF6S+kiIVp+QhdfiCa1DDUAxm05E6v02oqs8j9fq/1aeFBqJjADQuEo0lq+JmzyV
	 oO6rhEB6DJfZ1g4Wbgeae/uGIrJd2yNxw0qFU6AIz8Gu5RBFdgC5hvj5P+/V0vguukTjP
	 /cuQmyR3eU50qXnHX1UmwNCuPKy3IW9P/egKjPR6k7YO6itIo6pmfgtMjF9RNAspaxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vq471Sp1KZ5m7PCBni7WpMNrTzKsZrLxF1MSnT4KCkE=;
	b=XTgDuH+lazpEdUXx4i1N5LSKWuFCQVb0IvJNIEjtFHxewDb7cOuGPcGaK4uhok3Jixg+
	 x9XY8FzlR4Ho+n8FIILjcelibtoim9oFG241FZImxPk80Et9aKALYiXQYAPwCVQQnHVDw
	 gyd5/zuZCeWJsXibh9CIQcg6kQg/bdXK/xV1qCmbpPEddY+PaCIW6EgBIGWcqgU4jegaP
	 HQVXUW2aSG+B21C1RX8KOdR+FB7kgIH27/JfVIqxQJ6Q4OUCA87gVFkQhhEdLcyDpVsap
	 3TQ2clglse0j3VNXySygolAZUvgoFL7Xn78APnJVXmVMGdj4ld3eTMtcQALKUOrMzcA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=R6oIF25V;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304236;
	bh=Vq471Sp1KZ5m7PCBni7WpMNrTzKsZrLxF1MSnT4KCkE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+Kh/rKn0qaBSmoAf1MlSBAsjzpxmEf/gjCnezxWiq3yWCvJDDIW+ZAY2kaNpb++r
	 PS7Ftv8ETH51IMeREvE9RHE2JwQh+UoBggOWYZnas95RYF+eCDblfBDrSfIThHqMVe
	 4P+HIvZ+tfBFn9GhAnLMcBWh/REEw8/3HT7IZiR63cTdP9ec4Rs29GlocyM03VunBm
	 B28r10j9/WuUc/yXkxd1GiyyrMcQjbeJ1ZV1OADVtUOqWScpsf7gasISCp5bpjNDZ4
	 ANYbfjXY19zXKV4fVFUoZxLXWPc3M137ZKpayB+9koHIX9nNaGGZrA9o3VKVOmBeHf
	 ywZwVxFUmTXcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE1E44061E;
	Tue,  6 Oct 2026 16:30:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 203CC317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11F19405DD
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFSN4ktkQwuL for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:26:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3705E403D3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303985;
 b=m+YTUMTWltyR73a21R+oK2alAMaqI5EKFsBOCtwfRulha48ArT2BmGBmuWpZxSTxmuMD
 7tS2O9ULj8v8LuXgMfLom8CcaxEIEZNtICbWd58FCbvDgVg0xcdyVJ1W/JMOqgM2+e4NJ
 04vmrG/3ObfQMSMDx2010J1aW4goYZLegimSSsB4fDe9AdZiinWA4KfOF5+B+Uuad5XqR
 QGtUeQDwmGMUUHTPOPo0tPOxdYwwBc8dS9MnGX67DU2+zm2EHb1s3qGk2Ae+GOQA0w/rM
 a9WgfY5ihNaqAg7DSzy6bCWGDWI0h46WylVpm/iDwqDzwVIlz+mOzVsZAY7qurO761g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303985;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tGL5W8+oc0rH9OWSnDl0NPgBOotSh6RUubZxmRqLbfw=;
 b=sdj4yFzBEmoRfVEub7VlNBVya5P4S/ZiLGohL5tgtVOu/dKc63AoFr5uiKdQ4LDbt7Yi
 3FwNCRO+cuhXHLwbyAEATcXdczlFcGUjtilcRv+UVRIEhE15iuTN1pVLko03YWA/JeEL7
 DYuYN2er8rUunZeuz69nvpQ1b3qjBY3q24v9Ql0Ke/HVVxeLqI09LQ6E7Jqk1hhDBlSUJ
 Wh7EzcCz7tfJmlqfmbQZZ0sVg0+rD5rhYutISsQ5oXJFsHIa2tGZLcoNeNU7vh43EpT+I
 7NjEE9T/m38mRU8a89BP+0/QB+VGyDt5Y8zZj6Dh+TnbsBxnuoJ0WTNBQVXI9bvGWFw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=R6oIF25V; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=R6oIF25V
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3705E403D3
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303705;
 bh=tGL5W8+oc0rH9OWSnDl0NPgBOotSh6RUubZxmRqLbfw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=R6oIF25VPm8TH/4LEhew1DEP0O4RHwPYqfHm2CoP2eqAUn9dCHQG2nlUERounllNj
 rpBGRX6+0vZzpUv2pQdKsd4cW39feC1De6XbhgACjVpE4n7i0F6Vqn1qnh5HoOnTH6
 JWO3ySoVNPikNb4Y26xBKv4OsftPpWYI16x0b7Fpz2A/8kQBLgHQl/5yaIis0nJdrK
 ojRd+o6r5MIC2p3ws04a78XgImI3ATtuCbBUAP2yStT2zBIVvqAhNKzS38eAu5iIW7
 gaEehP6LfRuJQ92y4hTG13VMXDCR83t24LzokLlV5VGHP3rhQ6N13BfkPezyDPbR2f
 9Tz76PATOoqkg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 ososXNBGW6oSItctLrV/0bivDNJSdPs4PJkNMxBcHqTDUmjcqD5sxNa6UFn67ukap07K7OE5c0c
 BG+ZYSYwAsELqn0udDR6/E8CH87E4EqXnqg3BEIAyUIgloaoSssMBpNyIJQtvaz8+l/c4KLEz42
 D4eGZdyTz/Xsphip4sSlEmmmGJ9Gysa2srBNJjELmpgIZg5tXO/3s4ztbOf94RhCj/SomWSztdi
 ruUwD1y4H3wKYk8f2KTFYuHvnz8eSemnncU+qPGNxO7fl2EzYUzq98bc5xUYFU3CKWhmkMBk2VL
 3BBjk/0VGLy7qUSU5VqEP3Y55oDQUNQ+qcQ9Wpnv0/IouRKQJRct0wqOi/RlatqFmhSf5qvIvas
 H6JZh8CkLA3EgwuRSYSULxGousvLd23vpdzoOpNacTWJ8j1k0DCf6cQsdx0qsT9IerwIMJ7JCnR
 PJrB4vV3WSLY/2LMocvO454bM0A5n9IafURpItP85S3CpSv9JkfHYBvL3V74NP1PgYCSmj97jnT
 ONM+7SOJT7dd5GzfFEiEVFoVQgNnP7o8SKu12yPZ9ySrjfqEDy30FX+U2sI9zUFrU6KHiKnxquA
 NsmP7oQ=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E72DA4C52B5
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7us-000000000ir-1jND
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:55 +0200
Message-ID: <20261006162106.3439373-75-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 74/84] package/kodi-peripheral-*: mass
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
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash   | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index 3be4eef39b..541507704c 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7392c30a9e49b0cd219cdca14f5b20ffce9f4a52c349c2cdf37cb603dd21f516  kodi-peripheral-joystick-21.1.23-Omega.tar.gz
+sha256  d4b2d2ed3276053d2da5f198fca248243a55d7b50730ca9e274d84636765e048  kodi-peripheral-joystick-22.0.11-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index 698b918266..0625dba460 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 21.1.23-Omega
+KODI_PERIPHERAL_JOYSTICK_VERSION = 22.0.11-Piers
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 833905b9a3..2791ce3074 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5f74b0493e0f17e297f271b0befd01406dcaae121305bc7cb9d0ece6200cc675  kodi-peripheral-xarcade-21.0.2-Omega.tar.gz
+sha256  ca391349b0184083ee76918ae37359f2df541597812476c4a18b0c5e0b3d62d1  kodi-peripheral-xarcade-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index a46c616323..0fda4dbdfa 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = 21.0.2-Omega
+KODI_PERIPHERAL_XARCADE_VERSION = 22.0.3-Piers
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
