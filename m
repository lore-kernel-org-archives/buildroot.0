Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1E7C982CD
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 06:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C344E40722;
	Thu, 17 Sep 2026 06:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ykn97XQp1JZ6; Thu, 17 Sep 2026 06:35:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D4D2F40750
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789626912;
	b=dCEFgepN0SePFhw7doiFhhjssSQ+pCC3hzvTA62oapM39qiRAnGcrOQ9QviZ7OrdvbpV
	 zluoxztAVZS4rBMHcnQHTQd8KR8eOKUH5hDmkhsG8fwkGSfs6TaPBXI9a3LtvmdGxog7J
	 pxnCaFkyRo0r+Gr5I44FmvU0LQcWFB/VCSkWLRcdzRRCuwPDfXkYCnEVfAzSCQBpyOQT4
	 p6Qiylt5Jn9a2/sfsU3vb7iBPKlmJw8C+tIvvQF/3XjPprzJAGsG7waH0JPToP/4tx/6K
	 3Qxh8xarjvxcudmY/+w8R9JOkb+3R9rmNSDTd9Qu2zEjn30mwdKcq9poHX0aG1gg1BQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789626912;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iUaIGVNCLlXnnDBGmvRFWwHeT1MdRwcKD0gF/zns3uA=;
	b=RsnW5csGplI4GTAxdZoFWkIJ3m76EzMVawfGR9W2vEDCftArL3P+sJgi9wdor6E5jDve
	 6QMuXBkbQOip1z6rvNrRK2A5QtIcY2o3ayixEnuq88Uy02eQ8Z2pb7smQMN+aS0cyhAdf
	 K5SHS8c7g25jizpoL7bjt/c3IEMp10jlcuQjWiEnZf+8mQQoMVhm9+XEMA19hfdSA90C7
	 OWc9b9a3Pw99c6572H7GE/WHrbULh+nhCWVaVIyb4R3nwuC+bgcs5M9GxWF4ccO7d2o1d
	 QfHBc1kramVYMuKTF1mh93bV3YbO1oH8jAJwGS3N62kSzULP0TtkFJJuTbT7hECESnQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789626911;
	bh=iUaIGVNCLlXnnDBGmvRFWwHeT1MdRwcKD0gF/zns3uA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GljWUeOKGfsL7ECk7JCPZn00AL8ZkRReYudMj/6f4732ZGpWjyFzRzmhAWl979FV1
	 GOZeoM3CN8uyW8XsCNimvb+9tvYOnC1FbyE0PkmL776D1OwX1mISf+om4Ym8qnLKOK
	 EQlGgW+43uiiF0NaBVs0eLqiXa1Vvk8SQ7mM+ScMBbJRhaWH02z2JEMCOVINZoPuM5
	 fpObfSQTgOB+vwrskSavQ9Si7uPuLMSUSzwxRYOJtfdcpe/myQopdR9n6yAJ1PxhqL
	 HPaVYmVj+SC4JTDxhfBBShFIupTLG7igHXuKtlQhSHW++bBeJYUPEMvzkKSrVP0ooe
	 AD9G3KzRtrSsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4D2F40750;
	Thu, 17 Sep 2026 06:35:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FB7E24D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 218D840077
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShCaUeiuxCd2 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 06:35:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6E6234005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789626909;
 b=ovM4WP52j1XwTVxH/xvgINE9fouEEXuX7PHFMFVQiHb9krGilcF8yA3axGIwe064Z62w
 RcZSxcumrWEiNHOxWucQS7nSnlKZQbf3I/yOLzg8RHtmtuBvtK89VxzPi23kBKq7n3fCz
 6xRoOMASdrDlTjHbNtc61mIzqy9tFlXPLHJMNs0oDvQYk/H/dd/GRnTFKwm963OLP2vW/
 UC2rUGDYUbxrVCBJGWxGQnxtna0FVNr2VTCgmuHptYKDGcfWo9A+KfGhXgjWPQsKbx5TA
 wDdAT5Nefttj0qtkOf12val/KN8J4wO8+oYoQG1z93bMLjMZ4zNceFuhaCy9hFaVyxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789626909;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hFeyFb4cbuwWhydEXkctKxMOu7knriYu+g4X2uWcBGI=;
 b=U+xlxwg0QR3as3u7EVhWaSxzMfWAQiCB23yUZh3Fwrs9k03KgAMLmAYVXUKJXOSs1eBS
 FWcd/k2AODY+iubl44/hfV+0FXocC8LSh8lGFhyWJSMOpSV7cZmwpxn4Mh97AOK5wsTAY
 sM3WThU4ZIBtev7cLT6dPEClzbuXfvl4Y9UpqVuQHHIsSKvzovBrObjRsQ60UtPTQXdm9
 VaVf3xNI6U6Hi3+uUjfD9yItHT3jHD8wlbd6qmJtyPphLYPkBpkLnDh6ZEnWHxZN8P5iY
 e0gFazXEPpeYyBFdh/flvvHlSo0RMeKjGH8ERJaRYXBitx16/VRncF16ZMyBTnXxC5w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E6234005F
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 06:35:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D7D8960DC; Thu, 17 Sep 2026 06:34:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 08:34:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7acedfeeb22007cd919330cda8c324e2e3dac5e
X-Git-Newrev: ea18394dd71f2deb21792918500b1928e96177b0
X-Patchwork-Hint: ignore
Message-Id: <20260917063402.9D7D8960DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sofia-sip: needs OpenSSL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea18394dd71f2deb21792918500b1928e96177b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit bb254e2304274dc308e3d8699e92ea77e4189fb7 bumped the
package to version 1.13.18 which includes upstream commit
https://github.com/freeswitch/sofia-sip/commit/8081a1a6d05f174cb902664f73182c32fd2eee0f
that added the unconditional usage of OpenSSL.

Tested with both LibreSSL and OpenSSL, the latter with all suboptions
disabled.

Fixes:
https://autobuild.buildroot.net/results/afe/afe7b327f12db86e4dc31ecc25b576bff5c4a0bb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
