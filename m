Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59F0CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 701D680D96;
	Tue,  6 Oct 2026 16:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROye85s0LAZ1; Tue,  6 Oct 2026 16:30:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 295EE80DC7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304224;
	b=JLtUq6FNebZ006+a5K/QYCHpYN39ST0lCdPUUYEOzJQDSsKOyOErnFnb4jZKYOg0nkW+
	 ktTNGsGsB88uUka8xMwkXZUFv6Gd1PCEovt5dCXijwljGAZGD80ZXTZnU+akeLAIOqjVT
	 9vsj/dJLEPP+1OSiWr8XK0pKmt5FzrX99m38g1+7PZ+qgxPi4+HE0Xp1t0uA9VRcmkGyi
	 EwSL9I9SSpe66PBnil4G+LTITdx3Un4eGbs9f1RPoVCKWAHXAXtIXurd17w2n2iyteFhb
	 Vwq+LMEGtCIcbP7pgN8sjGpzN0jH1YqGxf4L/Bv9brA1OTvFuukD/EX0MnOvdSysWIw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304224;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZBgLRrUMyg0mpUkyaZMatFTb1lAaCa8JLlS0qz2gobU=;
	b=BjyznNeHJuLDO7ISdJr2nB95tWwac+/LNPUtnS9evL4Xsiy2Z6Ci2gFF9CpniqaUBju7
	 x5oSr5eAc+ulfu7q63yw3CA6jc2x+t2sWlagf/FojYVY1fCZ+UfAXXhy4oi4sEoeW1bVv
	 jLTEg4+Zk6WH3rWt/jYN2dK3YzOSqcqeSeDwI0JMgk7E0c4Nwrym9DGj9rPCvFdQrZQJw
	 cjiXlk8R98mnIcoahScdgW3/vQad6XWtjdGWyezPsFM3O0VYgc0PdS9+EwTS59Pchc7yB
	 KuOUW2UyBNNTuMRTe/5px6cbANmtCBI71uA1jOBjH3vdQaWsPgplSSTDM13a+KUOD1A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304224;
	bh=ZBgLRrUMyg0mpUkyaZMatFTb1lAaCa8JLlS0qz2gobU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sDqoFCmPRp0EWNSpX4G12HEiZuRKKINADGnzg3MXIx7pkVM0h19Rd3ow5MKZdg7c9
	 h2+iOlZd+u04hjlQ2LsTQ3uy8aGCOHLb2Nvev7nXf3dRhVrzRQ/7xaRupzWSkXaWkV
	 09Fn9sP5NuGHXd8CFLbc8bomKyrvcF4SwyvU3PHfD1WMswcL6fHuSPxZqJVNXFWgtB
	 uRweQrTdhucMnn4P4qKRK2t2FRKEw1eejlSyUYPqvx9djKnxUhcAt9773Phanraz7b
	 imGJ8CafilV3eS6Q7IidUe1cxLH7cj8H+2GyWqeGEOz2U3oZEcRYXFe7E6rTW+oRM9
	 kcgvvKAYvfl7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 295EE80DC7;
	Tue,  6 Oct 2026 16:30:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B421341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E50A1606DB
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udIZNT1naZcX for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:25:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E0766606BF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303935;
 b=F+Qv9WYPH+8yRgHCrO0xBZvwYH6rDesSFhDFIE2AcvVkUob8rRdb2V+0nOdrEr82jR++
 p94IAbp2IC3YRCzsYptkGYWoKYn+dPv3+n/no4zO3L6vJfNwf35vcEWjNYRFxHGlbEX8b
 s7RwhLlMGaPl2RPp9k//7cSuZFqn14y3cvgB2d5VAgXhBjjd1BwtmSomEkL8jYHkPOb+/
 8/TokPnwcMl6xr5Sm6w5dC560BGBQvS/uzkrXjCy4AHlSPgWDIjq55fP+/mVHv/4vZNl9
 VqyZ24+JWz5lpanncN658ACs/d0m6mKcUvWRwd+m3Ns3Bxmu5c1YjUve7b+PzksKx3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303935;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n/+LGAEZJLiIorP17BCoVnupvWfgZyfVfxYMnovnNqY=;
 b=ODnHWOaD3pdGe0J7SuE8/ufBHpsHQYzLIdxCS748XPhfcRWyuNRHNN03CkpEPFJ+tj67
 WuWRtayXB8iEgXqd8hzW/2qb+RXz3G63yfH7yqabb7K8TfMxrCYWx4Q3sP7yEf/DImjze
 O1i8iyhgkO81qUPK2kAvMrCL9IyRoA70qHMTZ1cjmVNyP5kWI/UX2bhVH2gk6Scaj0dbf
 ERdrrJljpVtpr70ZTCBNkpiHtaqShnhEk6IdToZTSAovukZU1KBVscJAyCXzq6fYQEjKE
 5Wb/451e3cL4ocUfzDKvBBRThfYcg1GF3ZipbUSfZrauLcZCMAlaXuDu/PocPfF3m+w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=sqLXB84k; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sqLXB84k
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0766606BF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303704;
 bh=n/+LGAEZJLiIorP17BCoVnupvWfgZyfVfxYMnovnNqY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=sqLXB84khuvyuh/kxzN1xT+nVjwPxlSmwZHKITS4p0neKRNDLFLhumaXujBJgjBkS
 hJcDybU5adN7u0gFbA2i59aiAuAS3BeUz3ssW61OtCIfgONcbmzj+apOBWGt4WdOMa
 vhJ2VZiU0kl5U0jRjyMqiDVpxLIiENSrTclniMqaAuOsLnP6On0yonEq1bfOP/Fizh
 XN1tDQgZ6iGTdXN2dXHzDmm3W7Jjj91FRTN/JopQVru9IpmVY9vyzY87jdoeMrsmtM
 nVxKDKdGugl9+4nutk2CasZ0U8jFGX2y78ju4EzW/u5E5guD51wELqrQHZlxO8IuTA
 knZ2TnYxVOqGA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 1TZ/hbiiEmA/JW6FQ6l26tlzHcjETo16G9N16Y7bxzUNKywW4WsREbpZbFOLlc3vo213wRbZHvI
 OOwKM2w/PKZahvpf85O4BR5UCIcxNlJZgyCewRtKo0mfxkLtyIWqE7Mv0O+DgJoXLDtTjYHbX5l
 4f+a5AAuDL8iVf/l9//5w8KYSobPyh5Nv5Uhw1vCy0N9kDa+76I2fxFrF2iDdJSm7r57qhUVbiW
 C07WRWhbLwrA7wawEQHYjEgG6/3fJvu16NB52fOOFY77TcWS/QWYhATY230w+kgGfhLSFoFpE4C
 RO3NtPELXgXot+536syUesxOlJy3zP6LzcW+1wv0eJ0RJyH7m3NxQdmzUmD9PN7wTUVOqzVcqiS
 ZbrUSTwXMx0oA4EBc7YFkAZmCTheOeRF8lA0fjg4RONb6wiNxy+nRvcOBWcgyWNRwDwIkULOfWV
 JGVE+qG5ZX58Bl2o66mqLQv8cnPB0MKjNUBeIbKUhivNwNyAgzlgjycfLtsqNWDegmmQ207H30O
 UT04shkPKZqpp13olZ1D0Q91ztCll69sUFX/8xwJjBbf2+TLmK0tU8YRwWw/MjiUrn9RudRAsBD
 A5TXgwg=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CBAF6A4C520A
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7ur-000000000ir-3cN9
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:51 +0200
Message-ID: <20261006162106.3439373-71-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 70/84] package/kodi-audiodecoder-*: mass
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
 .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash    | 2 +-
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk  | 2 +-
 .../kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash  | 2 +-
 .../kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk    | 2 +-
 .../kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash    | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk  | 2 +-
 .../kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash    | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk  | 2 +-
 .../kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash    | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk  | 2 +-
 .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash  | 2 +-
 .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk    | 2 +-
 .../kodi-audiodecoder-vgmstream.hash                            | 2 +-
 .../kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk  | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index d011e38fe9..84eb36bd80 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b2828685f1c353bf7123d0f9e88b28f53064388f6ea3ee357b8fb22d5c237ac8  kodi-audiodecoder-modplug-21.0.2-Omega.tar.gz
+sha256  9a0b5bfce44d937726529a5c32d1f33e4d70261eeed5ace443dffd1d159641f1  kodi-audiodecoder-modplug-22.0.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index 15a1d96635..9f3e089527 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_MODPLUG_VERSION = 22.0.2-Piers
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index d743433027..7093b6c48e 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4c82bf0ffab2d09f26b84d382fd00f70695d5f6a6d781be2818f9f5e10bc675a  kodi-audiodecoder-nosefart-21.0.2-Omega.tar.gz
+sha256  f0b89b0ac85c2248c6aeafba1b805c2c21524fe5dd229f2a5ba362b3ea8dd313  kodi-audiodecoder-nosefart-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index ca45739a02..ede46e0698 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_NOSEFART_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_NOSEFART_SITE = $(call github,xbmc,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index 87cf151859..c03bf7434f 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c7d10dd65baed2db1272ff57fde76f0b268a4a434d57022539c4dc5bf6f8b54e  kodi-audiodecoder-sidplay-21.0.2-Omega.tar.gz
+sha256  1657509ee534600bec9f66cd651e7d6342502fde1a213e81a807eb17feb3c565  kodi-audiodecoder-sidplay-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index d98fc4a7f5..a99cd32f9f 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_SIDPLAY_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,xbmc,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index 0ebd6cf128..16e353d2e7 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98afd81a9653efd9c6fe69dd7918755c75a4671322b793a35bce610acac0d128  kodi-audiodecoder-snesapu-21.0.2-Omega.tar.gz
+sha256  5bffae158b9e02d2fba2fca7950fc9497dc65928f90ab336f37ae51819b662a7  kodi-audiodecoder-snesapu-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index aa8178c55a..03b3e121a4 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_SNESAPU_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index 560c93b74f..9d463dd168 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  089ddd6c890e571f69eda0a85077d8ffe91c4b31fd0f9e20f47d4053c1e984a8  kodi-audiodecoder-stsound-21.0.2-Omega.tar.gz
+sha256  c40edfdc694f62d0ce0129f93b16fafa97cf254526d8d874a473560819c31894  kodi-audiodecoder-stsound-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index 2bd37a8e04..086e2ff6ff 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_STSOUND_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,xbmc,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index 22e7015ff8..5240efc8a6 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  eb7bee9453825f86275ae05c4561fb52ee7fd9fa21857e303933cb57d28ccc4b  kodi-audiodecoder-timidity-21.0.2-Omega.tar.gz
+sha256  90354522f51889c341541694bc964f24a4739c342c0c8f28ae3c002ac41eebbf  kodi-audiodecoder-timidity-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index c165492416..ab417ee150 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_TIMIDITY_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index 010315db59..27a721d85d 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6f5dddc0e6161426b8c40bfd1136ca555588db27ae78c02178b6ac5da93b377c  kodi-audiodecoder-vgmstream-21.0.2-Omega.tar.gz
+sha256  c6ae413f47d9261f3a20cd4e2d380b44a57a82a93d03ddfdf2ac0666b230ac6b  kodi-audiodecoder-vgmstream-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 66beec0a37..74a5f05a0e 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = 21.0.2-Omega
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 22.0.3-Piers
 KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,xbmc,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
