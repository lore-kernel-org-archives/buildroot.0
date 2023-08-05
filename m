Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FFBC001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23A37415FB;
	Sat,  5 Aug 2023 17:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23A37415FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xksvqOkHER8q; Sat,  5 Aug 2023 17:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21023415DC;
	Sat,  5 Aug 2023 17:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21023415DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 249391BF860
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B086D80BDE
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B086D80BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2HNZLqx41ZC for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:38:31 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD41180B9F
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD41180B9F
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E41EEA4C10B0;
 Sat,  5 Aug 2023 19:37:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLDr-0001nw-2C;
 Sat, 05 Aug 2023 19:37:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:37:34 +0200
Message-Id: <20230805173749.1570940-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805173749.1570940-1-bernd@kuhls.net>
References: <20230805173749.1570940-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257071;
 bh=Los/RACMdeefBUU2MOxIAWHirbtFTKpIDR7dxj23VdI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vtFutaj6WMCGiIxQZditvsQlde6yC10tKhi+/xmILfjwk28vwAUyBMu97BMdLGsjQ
 nk8C0P5LI5syyh5bx7mG8wpg7OCqLl3vnOsyL1t0ZIN4zx/6Rs17T1LxN9gTp5Kxxf
 O6+eMTVovilH816gu1EehKrIk8jY3/5e5mmX2zlCUciB8Z3YTWiWKArCsfH/N/x+p1
 WWmQw3ZLEfHWEPoFiJXUMWANRmmphPWOsH+G8QMAflZnm4oQV3oJroOClnSC17xXki
 6FhGDvXmJLTu4Ofds4DQMOxH7YT1cRQx4MtT01TckFqgN2eG6IFwakf7PnohEBR5jf
 jAmZoNqYlW69g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=vtFutaj6
Subject: [Buildroot] [PATCH 05/20] package/python-dicttoxml: switch from
 distutils to setuptools
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Steve Calfee <stevecalfee@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-dicttoxml/python-dicttoxml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
index c26c16b72a..eb0049fd03 100644
--- a/package/python-dicttoxml/python-dicttoxml.mk
+++ b/package/python-dicttoxml/python-dicttoxml.mk
@@ -7,7 +7,7 @@
 PYTHON_DICTTOXML_VERSION = 1.7.16
 PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
 PYTHON_DICTTOXML_SITE = https://files.pythonhosted.org/packages/ee/c9/3132427f9e64d572688e6a1cbe3d542d1a03f676b81fb600f3d1fd7d2ec5
-PYTHON_DICTTOXML_SETUP_TYPE = distutils
+PYTHON_DICTTOXML_SETUP_TYPE = setuptools
 PYTHON_DICTTOXML_LICENSE = GPL-2.0
 PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
