Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBB3C982E6
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 20:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D46B480DC7;
	Mon, 21 Sep 2026 20:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUhovwuntvvP; Mon, 21 Sep 2026 20:45:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4883180D84
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790023502;
	b=Ay7Sd9j39T4FRa/Tl1TLaCN8K2ipEqnPChJj7s8IUdas76jwnn2Sb6Fs4V8l0mGOhOgh
	 Bz4vFisZ0TM6TmRudaXL73KkZIqlmfebknI1cIJJWXzYLPoOP+QtIGZ0gcIzLG6lHk/lN
	 XxJhXtNbKEFhhkXse6kbwsXuBH86St7GCDEpMcaqhcMXcCSDnSLnMxsY1VIqan++QW/1a
	 wuCdbpHF3lq7O6Kj1JQle/3dmJCp8CB4pfvcfmU7zIUGgAOK5tyfnU1wsQ/H9zgLdcDAA
	 Bl8yHzqtPNrxMcndRdGmD96K7tvBHGV5WWMkRo0TpKhsoKKRpt50Hv9RzJ3g5PNfiQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790023502;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NBysWHh4fR3wkp+hsYP6HZEFhlRykyqEdM4EYdON+UY=;
	b=dLz2m3UKjWZ1xmcvZgKBGgObwdxiQ06HvtYlV/fixyrF6hQ24ZUdGTyPaw2JInwagr1r
	 TNRqOHMRab/T0BBUHFYZ172TmimtjzKxVK0tetC5ZSLq2C6jmZ7qyxa5fYIJBi8ovKTHk
	 ce+U5jW0XifhaDQRDSSAm7l3Zit9YVN8Avltfh9vJ89WpA/f6VX9iXR4X8c9lESpOxpme
	 a88PG8+niefJCyKCBRqGu85xo++vkQYTQT5drncQEeWgYRPhaalK+M9PJ5CZEskdvmiLh
	 OAaUsY//6QulBq5ej3Y1JkTHgWK5RtnKnlNFdD8JgK3uF5pRHMSWl8E+aA0t2/Uvyiw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790023502;
	bh=NBysWHh4fR3wkp+hsYP6HZEFhlRykyqEdM4EYdON+UY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BllXjNpp2/XpqM9fcQQHwhNl2F9NKInfPLYixPeIkrpySurbgZU+mA8AOyR00M90I
	 A2/BU1phgg+u0Spq7wXQzEEqaBCBjghVNSdnMTp3tBoujpodWMmb+PMwQwLPZPRwuv
	 Rjx/HfDWcfhcrQmfYzIOPsSCSNKkEp2VCXJUocaZrpGdB3jskzWjw5Nz4TOO0uUUES
	 uoRc5pIwSu5bdLv6mGh8ZzBGxUcr3lv5jCjEQaYBjH8xsfOwU7gwU4/P/IxUSGiBy1
	 JILoU0WwGejyvXypsHmbxU2FTteQLDHHIQ37/8uKPxnber0lbel/gM+DXnhX/q/jje
	 Cb6OBl2zHD82Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4883180D84;
	Mon, 21 Sep 2026 20:45:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA41B224
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 20:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF4A06065F
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 20:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQbBOIZhdACI for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 20:44:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6553260668
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790023499;
 b=St6JeAvZ4faXYrp8l83jEi295lWUZsiIG5dU96NPFPLX1Up319OklllqSgnAmnOL/7y1
 sjMjzc0nIKEFKxMqWQst3AyEGheaBpadTVwI0CO3Vbe44qgBfuKG/ABtftT1lpOB0eZca
 iTyfuClIPxkZyGyQGv65WtbzalNU5uobdZDkuHe2ex7DGhdgZlWHQGRFlfbIhQOVGMV4g
 4m50F4u57h2wpr4KX4wTsrfcDYp0Q1Km3f1ySGmYfFbH6MYtzf8KZIJmXaOA7tjEeG7En
 7e0N48aCa5TPddvMuWct8f/tDeJF8xS2HCJ22FUnFVFw8i/vP/lO/N2sLruvpRJw7rA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790023499;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4VquvCQACdtfwVuPDJKJpFNnXUDGvBHUyc7VyNXSI/g=;
 b=k93oaHhITdU7lLik7l2gLUKcOC8oW1+R01BmyWWRhzVxzc1MT4ZA87t8ee5mzn79lok4
 78FFNgj8UpBuw6BgbiQh4UUEi1W8C64RmgowzeC1MyM0SfHtMY3clltD7KmXBZr7nXbtI
 AZ1y/7R2UBvj41WP2u9ZMCSbuE36OwHmJO/RpB1kRpLvqVys6xz04zv7rHDzXxXgQgyVo
 Ex12jNqa0NDQumcPGBDColxe60sG9xwDqPcp1qjDwpVyHZjM/yXKTB6JxP9zu8+lO5fkL
 GExzZ1yr++il3j/OePIJthYQoGrZCb6Wbndoipt5jKm7OkLZ+KBFaI+sVrt1m1YhSRA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cBUbPkTl; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cBUbPkTl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6553260668
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 20:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790023494;
 bh=4VquvCQACdtfwVuPDJKJpFNnXUDGvBHUyc7VyNXSI/g=;
 h=From:To:Subject:Date:From;
 b=cBUbPkTlVYBgo1SOV//lA+DwUn4DeTVO2XLk0vHg5IAvEay1sS7Kkz2oBhzAthybd
 jZP3PCNf4PZvftd3qtAAmDudCuNWj/o9iqlnR/nud5B/uZc0ZgR7K2zbiSGXCrXmYI
 g3XP+QH/t1fk14u7jLRqYvaSc5cOT4H9qQ/0EVTcPJ+L878AerMEGnNGzhbVq0Pern
 NNpsXPXnh7Jgh9IhtHKFNog8FGZK/GCvq1gjkesG+ZrKk4M81nZqR9vQYo8hTTmKHd
 Qqx6GmQr14hDoSRQkAv4i5TQyNjj/49bv3aXWxxzYMkJ9984LltkLQxb3MYLM1DcN8
 Ytsp/DNkwp21Q==
X-KAS-Sym: v3:f51bdf72230551df:j1MewkGEZHlpMKnRfZgfECgEs3VoFu20AFrIQaU4uIvcMyBjgRDjwQGdM45TV+6+BGrg2yPJvgMRBF0tt70Z7a6PkqNv3qW5eKPhZ2o6maRCFLNHGyJjIR/ErZYZW9anED+SyRIR1tSH+CTGuE0bRt5jRorLtJ2g4w4wSTX8kdwgUR7b5aASC694Wfb/gizuspQlLl0Ms8ZWaXerWIvyCTeSnl44qctGsdRP9qwIr/ryF1L1BGr+wYMTY2FyH1K8m4mCNGZupow6bhOaPRRE6WYh2FehT6gp6rArksbQxhJivNHNEQbvQ/RTiHdSLLpwo/LfkTq8w3cdHOX0RV2r9w==:gcuwxX7CXwsfaPbDKm4tYN51aSjwvyixmTHGH6u2ZLa4T3ONU2vMTfQuMT5E6SDTAMJXRAx+WlLzpFWMVqM3w1H7Qat7iNyILBb2xjVpSjcMb96hNsybWZhvyAt29lRbrdTmPWZGPsrkrSd6tTvolHGEp4P7hxtaXwNmTmGU/UXNibEzEukiuV8qrLYu6RHWv9NX45a9er3SvzjL0BqGzdeySlUjj9zlqYg2biJOEES0xCzcDP0j5MVDIdCJcTA9qgBVenceOy/PZsRFZNz99s36KDX6qESfzaCtN64zap3dO/9X/2A8xsyyKgzjcOXmAK2aTs/sJazDL2LROkRzjB79daByPiVZ6GSHATG6WG5HfWFXrX4X56BBUykx2jxbt+j/hA+VKlj9qWtmE6o8SgEiLXQkckY0uaWT3ODTCvnIGfP/M2i+sz6FQcZbLI/BR1ug5druQVPLr6XJIXVYmiyFKoGR9BRTf7mHvPO/FtJjxlyaOYkwnOA8yO/oFxH5xLsTDb3oXOXZgz2caMN+tEfcVCSwGWoV7F6XvUIPuJoAC8gaDBpu9qEuRtiJXiwdEZxLOgZPdQYG6kmRVJe2ya71+mLreg==
Received: from fli4l.lan.fli4l (p54a1b329.dip0.t-ipconnect.de [84.161.179.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 132DFA4C3B01
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 22:44:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39964)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8ksf-0000000040I-1Qd8
 for buildroot@buildroot.org; Mon, 21 Sep 2026 20:44:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 21 Sep 2026 22:44:53 +0200
Message-ID: <20260921204453.2971019-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/utfcpp: bump version to 4.2.1
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

https://github.com/nemtrif/utfcpp/releases/tag/v4.2.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/621d6e1beaf66f2649a1fd78da29fc1400d43355

 package/utfcpp/utfcpp.hash | 2 +-
 package/utfcpp/utfcpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
index 454903575d..9b3fa18330 100644
--- a/package/utfcpp/utfcpp.hash
+++ b/package/utfcpp/utfcpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  54a8e96ea835a7359e8e53d03e30e9833d51350cc4615ff53f8449ef19ee46ab  utfcpp-4.2.0.tar.gz
+sha256  6d6a5493a111884cc085ee31babfe6d9960c8fb08fc80a64852eaeea8323dbc1  utfcpp-4.2.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index 25cdb20ca4..e839261600 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTFCPP_VERSION = 4.2.0
+UTFCPP_VERSION = 4.2.1
 UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
 UTFCPP_LICENSE = BSL-1.0
 UTFCPP_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
