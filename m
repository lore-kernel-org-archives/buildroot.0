Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CF9C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90A5D4007A;
	Sat,  5 Aug 2023 17:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90A5D4007A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMay3YquGTQa; Sat,  5 Aug 2023 17:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A5C64018C;
	Sat,  5 Aug 2023 17:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A5C64018C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DDC61BF860
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D23AF81A5F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D23AF81A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3Tv59_Vc9xR for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:41:32 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07A4680E75
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07A4680E75
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8939FA4C10D1;
 Sat,  5 Aug 2023 19:37:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58718)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSLDr-0001nw-2d;
 Sat, 05 Aug 2023 19:37:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 19:37:36 +0200
Message-Id: <20230805173749.1570940-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805173749.1570940-1-bernd@kuhls.net>
References: <20230805173749.1570940-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691257072;
 bh=u7OsxQWCGWVlURUfqBxw0X+oF9sqJ25sa1cDK375/NI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nJMR6dXCWvctIHih0CINLAKeVNQHCAB3AS1QNfqBt1Bis+tHcRPIAlDl6jIkDZIuf
 6BH00TLV47AxwGiPwSIlyHhv7hN7QG2QhCL7jSm67sWZt3nrgSaFfjq9WbXQ6xV/Wm
 FPGzfjyH0AE5rOrmrEZh6dkiFhIdFPbhE3QwvETUHXqpLyQIAf+CZdbIQ1GfE2a9yr
 dLsZp3XLiXhOS4ifew3y8+LLlxHPrqPHEB9RQ3HxXZG3YfVLb2OD0CpsMTQQZ3Dvqb
 WA/G8rJmfMcaKC0jJ65CMb7owfx7HJJ6af4HsrZWc30LjTT4GpNrDs0nG9cmV68EIf
 8bP6Jn9Szq+kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=nJMR6dXC
Subject: [Buildroot] [PATCH 07/20] package/python-iowait: switch from
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
 package/python-iowait/python-iowait.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-iowait/python-iowait.mk b/package/python-iowait/python-iowait.mk
index e327053e8e..028001d7f3 100644
--- a/package/python-iowait/python-iowait.mk
+++ b/package/python-iowait/python-iowait.mk
@@ -7,7 +7,7 @@
 PYTHON_IOWAIT_VERSION = 0.2
 PYTHON_IOWAIT_SOURCE = iowait-$(PYTHON_IOWAIT_VERSION).tar.gz
 PYTHON_IOWAIT_SITE = https://pypi.python.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
-PYTHON_IOWAIT_SETUP_TYPE = distutils
+PYTHON_IOWAIT_SETUP_TYPE = setuptools
 PYTHON_IOWAIT_LICENSE = LGPL-3.0+
 PYTHON_IOWAIT_LICENSE_FILES = COPYING.LESSER
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
