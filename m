Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FECC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D27D040BEA;
	Thu,  3 Nov 2022 21:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D27D040BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFXi6LLwyPl5; Thu,  3 Nov 2022 21:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CFAE40BD3;
	Thu,  3 Nov 2022 21:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CFAE40BD3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 961301BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FB5241836
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FB5241836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbgchP57JGn1 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:36:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 549F4417A6
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 549F4417A6
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:36:33 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id d123so2473078iof.7
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdGofJm0EYEBFPO8lhN+WI/8na+5iYmvlyGERLubRvg=;
 b=QV8Sw3YpHCVU9Cofr+jTcLZ8Fe+8oxJRYJZWQZPRuMaQR25wHsZgG8Nm8rjKYkQ52e
 oQ62PZtmQVGJKn3rfm4c5PrQRz+r8KCRFVu/X+tSHG64sctkObc/f0wvFWgDhjIzep3h
 ltEgYJ0JaCU7O9c1OkoH1lCiDTsKErECSCVWiMwSY+nLugosZLqvQJSHTZiLD6QPtetl
 PBc0QXHa701T+u5KJ4k7NBjcdDB8GKy1huTwxyPiTEaqxGlPmZy5liIjpmBcevUxFMLx
 lP/UyZHY7WG3VvwWEfv82lt9uWCCrmoLx60qke9/2T6Yeq92m8PLoaJY9jBLg80wsTaZ
 bmUQ==
X-Gm-Message-State: ACrzQf0f+K68Z6RxMo14yg4zCIXn6RLJXKLypqQlbOUT9vDUL3yEWNwO
 2W3asJcRamms/uwdqVvahHgslRGmcQfXpPFF
X-Google-Smtp-Source: AMsMyM6L3W/CPXFDTRtuF7Axov2jfYU5Ibxe83lrYIDfT9YTV0SOM1houCTrBhDNlXnnqdCT32OLOA==
X-Received: by 2002:a02:662a:0:b0:36e:6349:17c0 with SMTP id
 k42-20020a02662a000000b0036e634917c0mr19999539jac.183.1667511392112; 
 Thu, 03 Nov 2022 14:36:32 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q5-20020a02a985000000b003750f2bc28dsm585036jam.3.2022.11.03.14.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:36:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 15:36:28 -0600
Message-Id: <20221103213628.1321537-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xdGofJm0EYEBFPO8lhN+WI/8na+5iYmvlyGERLubRvg=;
 b=HDcNhKmLRiKTrPhMdZ4eeB0H5G5MDZjABtufZ2+/YCRj3xFuOtZpNkuypYrkprde41
 rW6pvpjFYAw8PwBxm8vN1CV6HdNwpK2Llj5U8QhGu4enXQwwT/Oyq4ug0JxJ/3EYT1Sx
 MbNgHMpbwCGF7Xc0R2PHWCArc/2veiQUL762/sAc0hnAJLYYofOIvry0UHzU0S8CijWD
 lOCzS5DxVsoDIQiSpLBsVijm/ppZhahYes6hR4Lm5CDslMD/Co4ZilANJyd+Bn+Q3II5
 p0Nt9nXhAt+ZACE32oS8fWugXU+jyB1k92UJoO9qK8jugTXaYerbU3VKryjlHicXp43j
 jdQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HDcNhKmL
Subject: [Buildroot] [PATCH v2 1/1] package/python-opcua-asyncio: bump to
 version 1.0.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to pypi source which should be the same:
https://github.com/FreeOpcUa/opcua-asyncio#installation

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - PYTHON_OPCUA_ASYNCIO_SOURCE
---
 package/python-opcua-asyncio/python-opcua-asyncio.hash | 6 ++++--
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
index d8aee272de..36b16a1596 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256  e5fab37a92162351fe40cab43df09db8a2e9f8b8a2a8f13ed680aa6f6d687ec3  opcua-asyncio-0.8.4.tar.gz
+# md5, sha256 from https://pypi.org/pypi/asyncua/json
+md5  a52df0dc0586abd1592c97a0274d1c9d  asyncua-1.0.0.tar.gz
+sha256  25966e374b0c90da112a96e9dbc5cc36c123b2b60412eac6f26b04a4b0b4d91e  asyncua-1.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index 50b581037b..509beda151 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPCUA_ASYNCIO_VERSION = 0.8.4
-PYTHON_OPCUA_ASYNCIO_SOURCE = opcua-asyncio-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = $(call github,FreeOpcUa,opcua-asyncio,$(PYTHON_OPCUA_ASYNCIO_VERSION))
+PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.0
+PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
+PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/e7/ea/6fe0799c740b0fc8ffda42fc97bf45204ffe06fe41d505c02654e0d4e379
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
