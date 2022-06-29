Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB630C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 12:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A72741599;
	Wed, 29 Jun 2022 12:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A72741599
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1F1uVdquAh9s; Wed, 29 Jun 2022 12:32:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB9DF4158C;
	Wed, 29 Jun 2022 12:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB9DF4158C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D4E81BF407
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47D87840A0
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D87840A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QvPbjbiSE5Ov for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 12:32:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5586784094
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5586784094
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 12:32:35 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id f15so9702551ilj.11
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 05:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ntaA4flUmlLxuEOtXf4PgIds6K033X07aIqERUdGyac=;
 b=jpuvdWkkA03rHZugjT2BAV3nBeoSpM1nKZC2LAy0AZ0WyOerI0f7AzoaES3vIfEJlZ
 s3NqPmj2VurOdQwpqnmPwqtGfyhgAbJhLptbQjGWkYZvb45Y9TMzcdjrZA2yLjiU3MQl
 DcMR9VZSDQzFS9D+oDppn5aMj9krTFzjf/EDCt1JxYUfdTKugDJYKuqmWIqANDNsl1Va
 IZcoi3Rf7jH0XsCbaWjOjLJIMiwKuwHSjKlxR+rOpY8sGy0YfWdKd8v4HL74FUl2Go+2
 4+XE5C9+xOOE/n81VeaWQgh6m+ij6Hxi419GoVQdr4/0kNce7UBqULEuo8TJKe1K5md/
 R/GA==
X-Gm-Message-State: AJIora8pRRkrHCYW6QsQ2UBZxKvZS7J3XLr44cIlv2YuZdpBqgn6b65K
 9pwcWhtWrrnpJ/j8loVpWSBtsgPCwBQ=
X-Google-Smtp-Source: AGRyM1suT6NVzFZ3ZufNl4kcacNbsD3bT1UtyvWtmixDxR3E6GN5pEMx0ixKsJjmG0t8J7rRriE1sw==
X-Received: by 2002:a92:c547:0:b0:2da:9950:1402 with SMTP id
 a7-20020a92c547000000b002da99501402mr1754661ilj.301.1656505954298; 
 Wed, 29 Jun 2022 05:32:34 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-112.hlrn.qwest.net.
 [71.218.105.112]) by smtp.gmail.com with ESMTPSA id
 u194-20020a0223cb000000b0033197f42be0sm7238577jau.157.2022.06.29.05.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 05:32:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 06:32:31 -0600
Message-Id: <20220629123231.2413887-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ntaA4flUmlLxuEOtXf4PgIds6K033X07aIqERUdGyac=;
 b=Gn9FiHqu5AxfqiAhCfiS1XRAwdNb1uByVIRHxXc08sftx0QUHN3bhFXQkjnlsroysY
 Z68css0cYc0jW/3fCk/mZtCcrCOOjfc4qcZSchvVIqnHzgtoF2NOY4mfr7xibJOh4GL7
 8XthfDhWhkuW3b797o4caa1380wYVSaAMl8BDpUyQkSgi3GAcO1qxDltWFHVCRQwqsp/
 z3mjo1r6y8h6zQsn+vu1bm08ZPz787Ulua/8dGumhoUjGfVkO43hKMD/kjw3qk8DiiXr
 rdVQrxLkiXzhf9xTq6ssDmF2aGjEK1OYwPOp+5SjB99shgTvl+1AugocgJVxL60iZXC3
 7qaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Gn9FiHqu
Subject: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to version
 3.0.9
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index e7137d55c9..90242bb2e2 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  971252e99e1e02a4c27f001894e0422d  pyparsing-3.0.8.tar.gz
-sha256  7bf433498c016c4314268d95df76c81b842a4cb2b276fa3312cfb1e1d85f6954  pyparsing-3.0.8.tar.gz
+md5  fadc2f3bf5872bf6310576a86c3566e0  pyparsing-3.0.9.tar.gz
+sha256  2b020ecf7d21b687f219b71ecad3631f644a47f01403fa1d1036b0c6416d70fb  pyparsing-3.0.9.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 7e458042f5..55516c3ce8 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.0.8
+PYTHON_PYPARSING_VERSION = 3.0.9
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/31/df/789bd0556e65cf931a5b87b603fcf02f79ff04d5379f3063588faaf9c1e4
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/71/22/207523d16464c40a0310d2d4d8926daffa00ac1f5b1576170a32db749636
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
