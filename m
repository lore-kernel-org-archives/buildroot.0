Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E6EC982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 00:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0563A6081F;
	Thu, 17 Sep 2026 00:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jug_FtOEuWkp; Thu, 17 Sep 2026 00:01:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 38B1B60642
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789603318;
	b=oKwIgczpxHfAVyhnVzNN/pn4MZKwkWtHatbDrC/Z0I4wsVAh3qX2qk9UiyYUwRu3Tt/t
	 lJv2rw3eXcC2xf5O7Yo5Uy+W4fN3AHcRYlyIAYm64MEl+LEttqJNuARLQ7OWovDeXA9Gd
	 0MF9nZZV2sTjlFMekc14b0sqbY3EufeJbm1o8FCphNubPuy6YybCtVxiwWjLFe27Io94R
	 w94rYByWVHxNYZlBWYypGCOzXXFqCqJPz/uSNUEbmeAuCn3sp+3zeXacDcd+xpCCiI0Sv
	 HvKizIo/ld85J3nEd1XEBUzIVbIpoyoINhMxemhPIMeLs/wuhjkkdRo6pli18/7HSUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789603318;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=51I6gT1c350t/Ho4buynSFYgyVpf09Sj8WKwTesPHYc=;
	b=BlDHP0Y/4UWy34veyWU8cRFKpwMIPAfqxeXBhrYTfo5U/IWuW2u5tZ86DR9zEl8Q/oyB
	 G9ItwARDeMaosDekcUI/R4225409+IwKT+JGJrscLLaTCOLywKIrOS6/pnxWw279WDIrp
	 Qwy9xkzCdvtBYFRUuKT5/49zdG75zB7tHAebnJbXP8a5CjZOstAC6VKS+wK+mhNa2uGdJ
	 deaA5mN5LOhEToHvJ4WB769sHky1FuEP61ecCC39TW8WGkKLslPwmoCGo44kiKgo8tV3R
	 ujtITB5u8xLfaXILQyljjwCfbXfAD7aBbhZrJe6UDHhhwVJB/7zeBktERnDUE4l4krg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789603318;
	bh=51I6gT1c350t/Ho4buynSFYgyVpf09Sj8WKwTesPHYc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XYb8vQvjviT4KOmsUexMpNHn6rTjbWTzJXtNAy39pr+6WLLdl2nglXlNuYa5JCvFh
	 bkrrP1YA96kNyJPatjouDmCKSEwIyqNnfYx+cWGmaQdFct2mu4RDNJ5QZXXjcDopcR
	 WdOxrkti/fvOUyxOQmsLcpthR3aQz9K3/+yxGKR9XxRGifzlt8QHAQ1PpkLEzbajct
	 B7okSwXEqPPWF+bGkY1aZTS1g5zirY93pC75tLeeNJCjRXSrYV39PtolXl0oZ7fh29
	 fbPXVkxGwKDbcVxjjI4/1aBD5xc+xuAA0y+bMe/hnGDFevdMPm+PNr9wzOno58RaJn
	 H3G9dCErxjn+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38B1B60642;
	Thu, 17 Sep 2026 00:01:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3E6FA29
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 00:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D19AF400AE
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 00:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZRYnanIiwdl for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 00:01:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 77CD8400B0
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789603315;
 b=HqqGqCZpSc9hX5plPuudKm/dqsryhfafvRIS/hsJSm4g5mpjNIdwlZZeeaVLg+D8VjUW
 p528Ma2V7gg1VUsFWuguB1Tw76OcIqYYzMjGTdJQYKM8myWbeIMw4jlLh+y7hu1GUnbiZ
 tQqvp/BYvC2ljXsaOI/nd674fASUxBUNvlY9ZMS9/xFT+QxErnWfPPvF2+fYC+wczKxUT
 8xIGEFnVr5rRTjFp2WMvbE4lUZX7foqMDkMUeccfo/CyMtmXZ8u1rl3PFP9Farwn8Rcqy
 mQlitXTKFBh9xfVsab6dJIjDlk75zTLZTtJ3JaX13hgwSnapqcjSTKo8Unx3mmLBDdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789603315;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=6/vwezkpOxXyQFcmZtn+VwykXt5WB3E/vAGas62ZWHA=;
 b=nQs0N6xAMsLKhRmpb9Vqv+XJhKIJJOkpFwGrIE33w1HwuMmLHTt6fHbZLKlOQUnLNYh/
 Pnts88KH4BB5nPH4nAFIuLoJqIWN5H1UhMjZU4LB6ZujehCl5QlwuG+QdBW6/v00HeOPD
 FW1uWCgj2sXZNRTDPFKwwkEtLa+Vi8U/jQsrJ6yHe2fVW0SBk6O42g5kyLi7cwFOAHvSw
 2wXeChr35gIxhR0uqged7Kh1PH+DkcvPcJ48RYJcbDZPK/mJzKTt3dzQr1RiMiNgpoJYr
 j7/pMXC0H7e8Jy/yfpNpwv7HIMT0AH16TuFyAsA7VmqUA+aqpaIs1ou+HLrdenGkKdg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ri+EQsLk; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ri+EQsLk
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77CD8400B0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 00:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789603313;
 bh=6/vwezkpOxXyQFcmZtn+VwykXt5WB3E/vAGas62ZWHA=;
 h=From:To:Cc:Subject:Date:From;
 b=ri+EQsLkUNkpljciIrwNV6DVxOtFb+eaM6kkDvqyUskCzVD/XtFueEENULx63yiQ4
 ernTTF56rZ9LTUdCGTXpNd/3qfcgWNTXkRz0iuQTy3DjNRs9i9p5g/TOhvle6093S0
 Y1PY067o8fzmVkUAs4qwI0r5p7xdL+9oi5AAADvbuJA69eEFZcuULX1+V8NNrFCbQz
 OUq0qa0C7O+GOEhF6k4xsvLy7wMN4fFk23d6DwVnEiZmOJ8+aKKVzC4oGuoDZSiEj1
 H8Qxe6HdTMi0CdU9fcK+gFaulvIf9vwqFLYqXqCPPHXSyyWl9ro2UI/6TfnBzqiYid
 mZexZBtwZY1Gg==
X-KAS-Sym: v3:f51bdf72230551df:JsYBAZKS09uOLuRr0W53WVI34NkRjuDdrs+ryLfOKaExG6p709qbo/AH36voMhD6kahuEYpTjlXp5MMQgGftyPRNK+9BdFB48D9r46QA73gI0bCfMXvJP6/VZGvhENdgL5d1rBC0iPlEJbi7YPJtm6EduyeZmqjFUyG5Zi9Du6M3foZFiomaZBoW5tIQa/eo+cjbK/+iuNw0me1CVoHFNxxqHbsSTDZrTrT8fDMD0fHKmgf9fxLDocm29vv7b1LmnnDUiN/+/CYZcPrjpQKr9Zzh67Nvg0IfHOKuA4NF3KPyrHWUNq3wkoM9TmchVviJWho1y6MxSwx3LTFzvssfkA==:XJoi9V0hs2P2AW6TTAFSuSEn4UFGrmeQjOzDhU5hrQ9TRo0Kw7a/58nMsW76ArAwt1Uo9Fw/cqWyiV4p3IrbHQ5IaGuneIBWnj4jr+vnIaon5u7yUytaWPFb3LgtBF68WBx4odj/JwXtfs8I2PN84BaTKa4TMkGhw/4YeCgcGLTkVUcSA8WseN8U7obSGh64sjNb+9LoDk9ews/L0F0N2uJab5a/1cCpcImW3hND8u3pkfgipwL+J+LkXI9mOvx5ovWd925nEwZ85cWB0GxSUChr5h/qTlJhmjoYDepLH+vt1xCjzfeMTdZVJHYW3DSiKDLEX61K8HBmjT0cbu6D+SJlyRA4oIeON8OBSeyqE8V3ZEECOi9offzBjv5CK1La+W88yDz7pMmuio9d+Y8VvFAP+MTp5HuZ+/WxHYBIKNlIhHyCd60hpbPAplIUtE7txT7tbRG7xTg2hxSat3qXyW3bVuyVud7pU9B2KS0Nd7jXrlUHpD+FjUFsg1fnE5RXs+jV7VrGGPQmn/3JO4DkbUIoiTNnIIxlSoMySvR53zEKEjNgUSRvkg3Y+wcHIsMy+NuCRtk4XgabXs1uwhd+vnqXyjOq/TGThVybe2DAqJEKXw
 ==
Received: from fli4l.lan.fli4l (p5b3a0ed0.dip0.t-ipconnect.de [91.58.14.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F115AA4C3DAA;
 Thu, 17 Sep 2026 02:01:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35996)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6zZY-000000002lB-0wz1;
 Thu, 17 Sep 2026 00:01:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Gregory Dymarek <gregd72002@gmail.com>
Date: Thu, 17 Sep 2026 02:01:52 +0200
Message-ID: <20260917000152.3060291-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/sofia-sip: needs OpenSSL
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

Buildroot commit bb254e2304274dc308e3d8699e92ea77e4189fb7 bumped the
package to version 1.13.18 which includes upstream commit
https://github.com/freeswitch/sofia-sip/commit/8081a1a6d05f174cb902664f73182c32fd2eee0f
that added the unconditional usage of OpenSSL.

Tested with both LibreSSL and OpenSSL, the latter with all suboptions
disabled.

Fixes:
https://autobuild.buildroot.net/results/afe/afe7b327f12db86e4dc31ecc25b576bff5c4a0bb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sofia-sip/Config.in    |  1 +
 package/sofia-sip/sofia-sip.mk | 18 +++++-------------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/package/sofia-sip/Config.in b/package/sofia-sip/Config.in
index 2ad1940833..37961273f3 100644
--- a/package/sofia-sip/Config.in
+++ b/package/sofia-sip/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SOFIA_SIP
 	bool "sofia-sip"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Sofia-SIP is an open-source SIP User-Agent library,
 	  compliant with the IETF RFC3261 specification (see the
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 1d47b43fe8..b8679f6961 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -9,11 +9,14 @@ SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
 SOFIA_SIP_INSTALL_STAGING = YES
 # Fetched from github, no pre-generated configure script provided
 SOFIA_SIP_AUTORECONF = YES
-SOFIA_SIP_DEPENDENCIES = host-pkgconf
+SOFIA_SIP_DEPENDENCIES = host-pkgconf openssl
 SOFIA_SIP_LICENSE = LGPL-2.1+
 SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
 SOFIA_SIP_CPE_ID_VENDOR = signalwire
-SOFIA_SIP_CONF_OPTS = --with-doxygen=no
+SOFIA_SIP_CONF_OPTS = \
+	--with-doxygen=no \
+	--enable-nth \
+	--with-openssl=pkg-config
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 SOFIA_SIP_CONF_OPTS += --with-glib
@@ -22,15 +25,4 @@ else
 SOFIA_SIP_CONF_OPTS += --without-glib
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SOFIA_SIP_CONF_OPTS += \
-	--enable-nth \
-	--with-openssl=pkg-config
-SOFIA_SIP_DEPENDENCIES += openssl
-else
-SOFIA_SIP_CONF_OPTS += \
-	--disable-nth \
-	--without-openssl
-endif
-
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
