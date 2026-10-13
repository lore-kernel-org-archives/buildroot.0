Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED75CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FD5240738;
	Tue, 13 Oct 2026 21:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y14A-g6ovH2B; Tue, 13 Oct 2026 21:52:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 43803405E2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928348;
	b=lrZfyhgB6YXsN5w8wigHB/FNxqflpbp1BEAB13uueGGjqomqVNBo0x6pTZegn0UOFaYP
	 wQO1RBuzoGWzRfXJ1FP+qJ+eC/ZwsDJwD/IB7bRy1FfSh6qseXnuAyCFKT0xIeZyZGhOF
	 EHABonknZvxpbUfaTQaj7Vt7xqYCjJF3JrkyddZ6fSedaXOD5acOUq6wvOozWY/vvdDC0
	 ZryUm0EdmT7y3IqSCXeSv3kYyL8SPumMMinh780Eg9Xk2CsCDjw4A2iAtSp+Fjeaf50pJ
	 vGQYtuWTJCzDvciy2hjLbbK2z+R96vbs8NC4riiHSolrd09KY498Gy9EVlfOFePpa1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928348;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y/ZrPeYlwmy7B0CjTYDuIOf2E0vnZEYo25Tc1r3iEwg=;
	b=pgxuyCxq8sSoWSGJ3HKwzEvEmisYeG0Yib5fuuuJIEwgyJds8rTIUZtoWrVH4boeo7rI
	 eozhGr0R1zHZ16thjBbAzRsO55MZrVsaf5J3hDh98p26Gef9y8TlGt+k3ifzyVuS74kic
	 Wr4TAgy8+iATPgt0ynO3ZAYH2os2h/Qe+UdVmer7SCUPptRoE2jVxTkx7oTry0LHrlRv0
	 nxTtV2q47uvWdpMy3nhrNnlHb3Z8194NzqM/rVt7Qr22KmmPnoYFVxpw4AxM0zTXGDrzi
	 /TnnAthF4p+0ToLssbv6tGt1m8am2qt49jzK/cvta8xV1EWtV4CLw9OZZe3gcQ8OqiA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928348;
	bh=Y/ZrPeYlwmy7B0CjTYDuIOf2E0vnZEYo25Tc1r3iEwg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=AgoruLSAf+ju9GnsRzIBtIhH2OvghP1ynApffFmsJ3VvQmvWuSU6wAxUPhjdSYOYK
	 JDoN7XA7JY1EspcbiGANZN67MPz0aEt3xExt5deSGkKwdgMzHu2DnvbLysxlm3xOMC
	 Lzqcg2U+Iv4PByTKYKcR9O85x+s5R3wvyceQRyBJ+ESLeYRIb9Tm0VSWe3oE/toGUn
	 6ldxZ7j7/4rrO7xlupZBsc/2KvTe4EiAT+mECPKbzUwY6OvVLmJblq6wlH1GF8dXqu
	 PEvFg16eF779bYqLqRNhbc4pUBeDOY3xRNmxwFd7S4qigMHY+ixiM/WLLeQVaG43Hs
	 p6ls3AL49jnzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43803405E2;
	Tue, 13 Oct 2026 21:52:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E983A2AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFF5160681
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYdTfttvmgc6 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5056D608BF
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928345;
 b=HSIeOP8N4T4604ySk5fYDcNZVM6o1v028EiQgHaFxnpaQ5/8xF0z2H9Yqd4mu7ffDcY9
 Bd7D91ahqbNPgsmsp9OLw2/5Bv0uqgBN2ykdASJxLRW5KHwMIdxvSNcxu3VnNkpFcaOI+
 baxnf9zV3w0jyiCxhXHWm3I8gKX+n6ZorTCmAl16rGqR2FTyiwoGFQ19zv4HFMyA/psQc
 LNaNsG97ZRIj5NKfXRAXc7vitJJ/BjoyJbcdu4c55e87cdsKXnp2zEQn0lDxj1pqwelFi
 W+H85xhkUNXZeUkSyq2cxkPESnIaDU4lYHRRqPx+8syJj7Qoi1Gytbxideh2i7g67bw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928345;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=C05DNEVVdTHokcHnMwZBWwjnChuQbDgtornqIig62aI=;
 b=Z9xGeEGycp4T/x2g2qASu35IFUe4r1Nu7kKk2TfHc4guUp+kwo8/swjSnh8bQNnHqgXj
 /08IpMC0jkc8gWgJbpoEKiYEug51Hst6Kiwue38qgf6Dsz2DKI1UGg05V9YscY7MDP034
 0WzuGoW3D6kyP03YTvdJnMJ5sz4lGFri2KWz120w39yZ+WQBTSpy6GwwEwD6Q0gkkPt5/
 G47uwddD/Zc6otXkdM9S+3Zk2vAP4sIAs05cnI243qzvUGcE1+VDNZD/XuEBXlP4LcZLX
 E4XIT0Jk/pQZd3nWTdw8b0yDzw2GCtSccJFEZIwxalbZU2tEl7SZlNE1Fgif6X+Cz5Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ndxkdYR4; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ndxkdYR4
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5056D608BF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:52:24 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6df0b02fe91so4062848eaf.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791928344; x=1792533144; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=C05DNEVVdTHokcHnMwZBWwjnChuQbDgtornqIig62aI=;
 b=ndxkdYR4WFkqKAOgf0tBz5E5Pz7Oo/1/4yYaU9oaU9ZJnO7jGhyYZJD/z8L+av6c2r
 /Nb07bXS9++F1kbbMaD6fsA2Ld6bEGBpPlGgLs90oVMxOhXrDbYhn6xH6Odba2Ydl2I7
 NL/MK2GEYKDTRx7XkwtSCbV5Ixsj5te4GZ7xT+7/ZzGoybjdGMiygixD//4y62Xo8x9w
 jB0dTr9cTBcpWjMwdflfXOa4cLXanHFfmESJhjlZI4U6gJXuHf7gKPmn1DlOuCPrUM+z
 lrKQOV4yAYBQDY/cOkL7Xy6MOkYvIuZaizBpw6SfNyGYNlpwONyI3pGR1PCNqQRbUlp9
 +TYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791928344; x=1792533144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C05DNEVVdTHokcHnMwZBWwjnChuQbDgtornqIig62aI=;
 b=QlwVITO2pFQAiXZtaqU85CaRCuSuZNsp9P894uadf31ckzEXx8yyQkQHqvy6IIRpoQ
 mhl4mpR6+atZ3l6LcNkxwkGKnkRKJWGYgxtzOUSVW3rx/uEJX0/kti0SsYhbByOkWXtN
 YiARYZNli8KnZXk4E9316OIVWpG931/sM6EcQ1Y4jOsirlRzYIzs2OpifeDn7ic8CI2y
 uvlZGWkGm2feSHmGVhCdyBZBHxC0Luk1fYTIygQRHAUITUxo0Iw6O+0Ec8Xtsd7qe2XA
 jluLFC9XSlvrtp4guVpUJjclJj430VYDOUyW9/DIM5w4I2x2cEBrJMxQWn7nZ3GJmD8G
 Drcg==
X-Gm-Message-State: AFq9FYL7zFg96oN+MrV+PH3XTUKP4piMqzeOb4+BIgdR2lRVovb3bPWA
 4bJW6+yGX5M3adtgUrAiIcILhu6NREVZF0OsnQ3EUiqjzjCzMsvstCssqZpj/nZc
X-Gm-Gg: AYBFou1Fmuw7v8neyvXtyGpYup+z5YbVofggNcdV+y62lw3TMrwVmZieRgDNoCM2Zkl
 J41i6YOYmTs5vvEBgxYaTrRgoI2fTVjJWiJm61SZ+yNDlCB2IW+M6AwQemYJF72RJkNWuFRTQN+
 8dM7cmlINTMprN/P8DDlUdOxDXu/DTMCGuLuR0qGpvysBxr/XdXbDmfgtaqzx8pHOvGR1VIbh/n
 bsGPTZsjmrAaiquU8eOZF/Ds2cSxqDAolalgvJZkHjOHCjSHSTir3Xx9omGDtIxDnyd0MmOojE3
 3nA8TjQOsKhfwcPQKDAY6zv1V8I6eJaTqSllh8u+1HltbiIgLek3cNF5dAciDC0GoBx5bx6eH/T
 6QddG8LoGgvvS/tPYil4rQ3Yk+Wz2u43a9R/CybiDN8xKzbwOQEDfKcQAqGfsFb+2Hnkd6TEolm
 IScaB9h1KS+KNefNSdnMSW6ryWXW3QWXbLBrq9m+Pm/aKH2b5c9lavEISGM/hnu+PBv8YrVMCcR
 U4jLf4Goz7hdZm5YgGNTHhOICjCRDlX++nNlh5tBeV19targCacu5YcEaameicUOWFghSt2819j
 ckDLX4rEPiCqiWyX9v7+YwOsPKyfp/y5fmHXxIeR1BbbYKOOpq3yhYhsXfKqn9qkTdY9MfPKs2A
 2t/rHkGIiaQhUi3BP8Cu8gggTcxC/SteA5nm2KxBuZN8=
X-Received: by 2002:a05:6820:1c9c:b0:6f9:59ee:cf98 with SMTP id
 006d021491bc7-6f959eee0e1mr2614941eaf.16.1791928343932; 
 Tue, 13 Oct 2026 14:52:23 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6f56b25672bsm6813224eaf.11.2026.10.13.14.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 14:52:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 15:52:12 -0600
Message-ID: <20261013215216.2460255-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-urwid: bump to version 4.2.5
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
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index ae77f9c047..c9dd8be04e 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  d4a8797e31d5ae93ed24df29be0188de  urwid-4.2.4.tar.gz
-sha256  a4bff322e8b8e407d7809e942e63177790509f5a2a740d27199ce8368f36f113  urwid-4.2.4.tar.gz
+md5  fd2c6a87a26c1f753f30edcc2047a27c  urwid-4.2.5.tar.gz
+sha256  a1fea3a551953fae4e6b727536334233bbb8b88c45230bc91d9751b402a8c16d  urwid-4.2.5.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 40bdbea8f3..e60bca01d7 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 4.2.4
+PYTHON_URWID_VERSION = 4.2.5
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/5d/d1/cb25a9236e6a6a53321dbf8538982134035dce940046e63ac864a4418151
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/3a/df/eb5dcbdf1638c38618096382b4a30b0423ed7d2aac97fd9469b51d6de43f
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
