Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30671C001DE
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C37C8416AB;
	Sat,  5 Aug 2023 17:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C37C8416AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NkZblqSLE_cV; Sat,  5 Aug 2023 17:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AA6C415F0;
	Sat,  5 Aug 2023 17:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AA6C415F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D06B1BF860
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3248040382
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3248040382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6RCHbcHuaBUT for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:40:56 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52471403A7
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52471403A7
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 58234A4C10C0;
 Sat,  5 Aug 2023 19:37:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLDs-0001nw-0K;
 Sat, 05 Aug 2023 19:37:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:37:42 +0200
Message-Id: <20230805173749.1570940-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805173749.1570940-1-bernd@kuhls.net>
References: <20230805173749.1570940-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257072;
 bh=DYHcsLO3K1uzWFkjr3RBdjl4zOW3fAbwpqXr7F5aCvI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BEwSK1DDShRRXeMQv9v4KlQGMKi+T4ANJH0O5G8JclYdni81aCcibR+Yk20/qvp7P
 DFnsBPWr44Ls4DhkJRq2GgU2rKZoPZsslLt5qhaerPpn0PXhpetdmhw/TgP6JUqPrT
 S+TWBGumnyfELntYwGgf7W56SzxEIIzq3cZfjx70C2vut/Dpzzlz2+myYB74UjJ/mZ
 IDOO/u6qv8aBNQrUKpV9iSeCNtnSlxQNeejAyVe4SFrsqnBC/BE8+oH0q3r10Z6VrO
 nt+MY4VuJFcFw1W2VNvIJNhvko5j2FWtdZCahDyq7XYVYDT4vaXVZm9gVUjP5jc+qi
 hLDpoukpfsz2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=BEwSK1DD
Subject: [Buildroot] [PATCH 13/20] package/python-pexpect: switch from
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
 package/python-pexpect/python-pexpect.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pexpect/python-pexpect.mk b/package/python-pexpect/python-pexpect.mk
index 3efda26825..d230b11338 100644
--- a/package/python-pexpect/python-pexpect.mk
+++ b/package/python-pexpect/python-pexpect.mk
@@ -9,6 +9,6 @@ PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
 PYTHON_PEXPECT_SITE = https://files.pythonhosted.org/packages/e5/9b/ff402e0e930e70467a7178abb7c128709a30dfb22d8777c043e501bc1b10
 PYTHON_PEXPECT_LICENSE = ISC
 PYTHON_PEXPECT_LICENSE_FILES = LICENSE
-PYTHON_PEXPECT_SETUP_TYPE = distutils
+PYTHON_PEXPECT_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
