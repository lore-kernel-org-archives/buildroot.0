Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40910CC6B1C
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09A59607E5;
	Tue, 13 Oct 2026 16:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CnY3jnqx_bdT; Tue, 13 Oct 2026 16:43:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 19C8A607FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909833;
	b=f98+AMNFq+pAhc8HNSkkkXWnZv8RZjLRx2FK3SSeAx6sX/pgzXnNwDM7WQumfN7OSxhC
	 2gkc8LseUvGFaD2FCu7IeIcC7qpbcmPgZR4hkKRxO0aIvkLZwpB+XDSn5wXJVN8nPgbVc
	 m3bdNj6Ds/20FouRmJ1dnHmy3fdEGZE+qa/m0+HSAnAMBVat6Zk1q2spwqtGa9xIOTxPc
	 8HAPHZSv3eEXHTvQqntAsQ3fqwk/6rTTc4Lc5Rm9wz4CwS5U3vKoQwIGCZVkXzojplA/e
	 Xsx1Opl9LZwHyKIqjso43Su1YoOT7TWK7QPTAxLd5DqXPS3fPt1b5b9wEKwlaGmPjJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z0Mx8GjRoOM9hKq0w307JWIVpZJ4+yeSihN/iBlzqG4=;
	b=EXxHG+9iYVcerq7gogjQTluW0M70zG4oxoHNnJ2KLcyVQhRfCzxqIjqt64ysxv2DYlY2
	 kcagsIp/166im/5HLk89gl/G/eTfwSU332/LPoKZu8wnizXQVOeKVTVuA8laHU1UeDs0b
	 SVzyQ7Wj3Wuh1rFMOZ+6baMbkRleSZwXLjBkVkOfLSFZ3vIievy9yBBKigsJNv9D6kM9R
	 OmYWZLAQi3U1A4SHsodye3lifwtYam3lEwa1v9QZ3kviWTmxURlrFsGCAx7Xs3cEoYEvc
	 TsHS4+0YPdY3s9+gigdWBoj4aAwhGpnDU7qH7S5TBMNgPWWcI9SX7tYc41dg5ZZZBkA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909833;
	bh=Z0Mx8GjRoOM9hKq0w307JWIVpZJ4+yeSihN/iBlzqG4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gAXbU7AcggGy/60qOxR8HIIHOb4eOG4R4hPtdsSApVeaN1G2GUW5EKlArksifh3QD
	 BfjPc+HxdnENF5ZfNgsbwutt3+O9e0AkvNdNF75WVwWAfkoRcHwCMCL3PFF0hdjYAL
	 iD718zKa1z6Kw7Cp+VVKUpMwKzMH+G8TjhA32LdcXJU/DEdogZjF6HhkU06I6gVBD3
	 F2pmHS5QRy9dHXeyLPrU7V5ognLFrp2WVSgNSkDYmBnAEg3sdSVvm74atpCS1M8Q19
	 aWY+Bhg64i7yc7VX9oINbR4J2PVrbbaaaREKm0RFA6bOrRwGzfrXWbh7aHXBXm0yT5
	 H40x2gWSFNgcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19C8A607FA;
	Tue, 13 Oct 2026 16:43:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1A221DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B27B880EAA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZdIcOhbFIH8 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AB29580E84
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::33"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909822;
 b=nvOq9DcyKK6INM+YuLOiuCupFEu821gZeRAYIDQY4CZStkJZqDbOtzZrfiO73Y4Obaad
 l9GX4pTJhMiDIeGQE8GdoIgFnA3Ze4VgtfLaht3vTZWvxtRAC0eyBspOuUXj1vmex1FGn
 jlpaIh2G1/a2joAGldyV5CqbmU3cC+JElQEoggxabbgP9PR7b8R6fu/K4JMkp1U3vPPed
 5TVnefO1nmEStSvjmeFbNFYRTt5B9ZJU214bjW7DIXj6FYdortnST77vLK+8287CAwXjm
 JuIxNTqlCkwKtznp+ds7z/ttsoIHDMaphsUgVnO2Pss9hWpIcB71BF+2o0vd7BL8ojg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909822;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2BvhelDOsohxaqZ5E+ZY8RQAOJzUGBV8vd0uo+KGEPI=;
 b=OiFdKrz0A6tYcJG8gOG0OKmlKsdV53TTta98+Dgc+gDx1JJFQQ47PUF4eURhMoYPuUzT
 yA4LKoRdZCEEtzxCxnIRoNKRoignxy6V2Pnw03xteT6yeU7TAuQhMndbTARFoxjk8UGex
 J7vOHd91piO2Tq+fBC+hxmOZGtsUuVruVySkzhvQZ9S6zk+HqC/C9WaGOt8V/xTQZ96HZ
 xrM13pwQ9J8CRwmXF0Or7za5E8AHcyrsN9OD8Spki5uR2S/oTQXWa0CeGf7f/U28fMltV
 ocUP8eZ9szxMUpZ+A6MxCiJ6MneiKNMKtZyUZd7Z/U0BdrGTlLMoPMWYyFNZUQRry8Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nFScGMLr; 
 arc=none smtp.remote-ip="2001:4860:4864:20::33"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nFScGMLr
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB29580E84
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:42 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-483d290f398so1928798fac.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909821; x=1792514621; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2BvhelDOsohxaqZ5E+ZY8RQAOJzUGBV8vd0uo+KGEPI=;
 b=nFScGMLrbgGkX6TQVVYuJB65ljd4mBeM0SsszdU3TSLI/Xvu13C4UCS9/O4K4+IiKl
 RUirDkp/WbHsJnTyqM9Yi/JXpesOjU1OVv7sjDH4yeCP5BQyz/aBN98Iq53oMpP06RPy
 SeBlLZiNs5yOXQGYD2Z33jjRo4Bfn8gzLVmFTY2zxipK557BNfhLH336csRF3Aq+J//A
 aPAcsMprb8qS4oAlCfB9HxF+OF9Hc4XqV3bWaNL9M2e8Oc/SIR1s+8o0R4XIzyxCaVfT
 eXEJ/wn4PeLRbE4vjExpDoPio6jSfP7mv0srsS565zVD6a5hlf6MdcoJ4RS2M7va3uyo
 TN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909821; x=1792514621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2BvhelDOsohxaqZ5E+ZY8RQAOJzUGBV8vd0uo+KGEPI=;
 b=WdRyD0G1n5qtcwRaNQ8xjMykNCsIe5hACymfHg/WPzgpeDRrG+RcJYrufBp3iXN51U
 VlEggAdj5q8Tji4GqC3VLoWFwJUO1d7dP+G5sAxdWCatzjA+go9D2KTqVDxzUvP2Nym6
 Ny+oJeu+yGpa+LyUNq61m9WvsocvA8qPWhvRl9uFjfOF/ahv3VKw71DSIAEZkw2LtUbd
 1ZdHUrHqDVHmY6JKzBDu4jgVjTl++ed+5gSRZVcBmsbwnv1pAubJL5aqb2yHeFn8b+s7
 pW7PJbLGUpykm0UBwkKygDeTMYxCgz5RxdcoL7ZM1bsJ3ZHlyR8Z/LaVWNUeqgbFpFVd
 Dl0Q==
X-Gm-Message-State: AFq9FYL57xbfwCOoULQWDZW2AnTxDknLVBAivCeLxY91/PKOQUQbIfhI
 t0c7PBeRAJkC3JVA64VIYjuMnY1mA/89JkA8MKyKdLc0quS0wXptd1BUWSJzCg==
X-Gm-Gg: AYBFou17eUl2jH3xdvVuTgENttv2j4cuTJ6gA2d7goQwzjSjCYNjBei06wqOuy8Rmsg
 C9mdDVDj2YiYekibTxdOAWJQNYkAd+mbNOIybY0SpFXOmjPCSozhHJQPUIARD2hkQrCy4m+eMIj
 apyleXWrakkFGMvnE+H0855XO38Jo1sBKZnv63tb63LaDP+ZFx2LZKtN0Hl8FdjuH2DLoDwIknS
 1HxFKJgEKhBlAxv+Fpaj8k8DgK6gMRt8E3D+i6weqrBEpCPZq9RgE1XncKXOPeoAnfK5K0Z6K6G
 ygPrKs/UJtf935NShJ5tb3/sZVA3iOEa+HQssiPXWMioEU+sg0mj9k4cb3PaWxN/CeGqpVz/J5N
 bU+h8UZeu+AK0A7namnmhgns+nfZpI3pDnOuM5ugU3aUDe9ZqbXAayM8SrvcJW5Ed6zLQZ8QzzU
 ZkbNr/JHXDBBDUZvENKFdV1N9s6zqjrUp+x6j2g8ynld0ZudgukBaRH61+iiHck7zOL22mX0bsg
 oYTpi6KVcUGJWo3inbroEg4b5YlyVMNin25Wp0WrR550ZFgZZAWKVg+3H9l12CIi1bNcERABpVA
 vOzo5ExYV3rnkzs2S0Po3mD+ujR/6OryDqvItFWS/6A2q0RItwQqqkR/Hb0+eQ1bDmxRaVXZXb2
 XQAjfo2QdJE6xsLen1zVxwUrLO5SHjXi5kWmNErDFb/Xe
X-Received: by 2002:a05:6870:a0aa:b0:493:8967:86c2 with SMTP id
 586e51a60fabf-4a2a88127cemr11740022fac.16.1791909821301; 
 Tue, 13 Oct 2026 09:43:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:15 -0600
Message-ID: <20261013164254.1476592-29-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-scp: bump to version 0.16.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-scp/python-scp.hash | 4 ++--
 package/python-scp/python-scp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scp/python-scp.hash b/package/python-scp/python-scp.hash
index a82487adbd..8839163cbf 100644
--- a/package/python-scp/python-scp.hash
+++ b/package/python-scp/python-scp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scp/json
-md5  857ce2149485ec591d8c1076d8e74516  scp-0.16.1.tar.gz
-sha256  3f2b260bf9bd4c2b6857f697a1d7e8edc26fa569282b77027e849dfe1e48580a  scp-0.16.1.tar.gz
+md5  0255994570cb8427e4cc842184c4e037  scp-0.16.2.tar.gz
+sha256  d049f9aa77db4042c44b922cecabe97ef0716fb334a95701d68d1c7991684fc2  scp-0.16.2.tar.gz
 # Locally computed sha256 checksums
 sha256  2455cf0fc78e13772bf10ef5f209e7eb8625706d671b2f420cc8add37d548c1c  LICENSE.txt
diff --git a/package/python-scp/python-scp.mk b/package/python-scp/python-scp.mk
index a2224e654e..868eeddf85 100644
--- a/package/python-scp/python-scp.mk
+++ b/package/python-scp/python-scp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCP_VERSION = 0.16.1
+PYTHON_SCP_VERSION = 0.16.2
 PYTHON_SCP_SOURCE = scp-$(PYTHON_SCP_VERSION).tar.gz
-PYTHON_SCP_SITE = https://files.pythonhosted.org/packages/f8/35/fcef45d52d76a6dc70778c11eea719ff0ab550594bc51e55e66d28b5f424
+PYTHON_SCP_SITE = https://files.pythonhosted.org/packages/38/c3/4d0230664b7c505ba2fa7bf9fe4bee83f6f1fa195e865ad7f92b12917e59
 PYTHON_SCP_SETUP_TYPE = setuptools
 PYTHON_SCP_LICENSE = LGPL-2.1+
 PYTHON_SCP_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
