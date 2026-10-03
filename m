Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254A5CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF71740D9A;
	Sat,  3 Oct 2026 07:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bcihdoi2xoMk; Sat,  3 Oct 2026 07:05:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D178040D6D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011124;
	b=aaJELdDOj6+GLtaq5MPsUQ5W8dcP7wB4M7yKKrHzPBUO9yQnuApaLUSHsy6hO3+omUWI
	 2hRbH3HtywNaP6t4RoZaiE2w1WLUy0xmpcG472Iq79dKSRvnHgNm7w7Gtepsbb78Y4RK/
	 sWETdvuQFzqyBsQsrExQ0Kzd4e2vQYcl8z6GAcgGS8GadgQG9rNP2/KmDglER80cNw9hG
	 cg3kplLTUx6gGe2fX7XW3hjQFg5ZkHBBV5tp3Ij2e1UwfmxjgDsbrPBIMc3F5p+4Zfh6X
	 1k7HbtL6S2ECQgYUyyRhhGGBqGrUO7GQYWPEfzl6OGlby7XJxPD2mkrudxdhQlkH7dQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011124;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LBpi+yU0VcJz9TKmhO2BCJv7/F026YW+c/LG6v0aaLs=;
	b=Xoo9geT6Ps4qFj5AeBzEKpNCLmIotNWyxW49yGyFS6JZ5Z7q9lwSN/8oUCVEt99IHsz1
	 6ZUX/qOybFswWluuqLkQQlq/0uyC4NZLlwjRfLNBj5A/vsvJXBqUs/HARsQdAM3WqT7Xs
	 CdnnhoGPXdRp7U5EAocGQiWdjfcHZ8EeX+EK/9yK6sCupY9FYUMIZf+F3ZdSdT8cqxxdR
	 RS8YiKTkV2cNlkfsO6BgCoe3kXhWhCv3HMkf2xhWKgJHJGVQeRwhogcThY8ZUEz7BUNGo
	 kmPGm1W+yMVBLWtFWouRAFBcCT+81kxY8GWnVEOg+pEOybw8XuyWag2VnUDSrGaeljg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011123;
	bh=LBpi+yU0VcJz9TKmhO2BCJv7/F026YW+c/LG6v0aaLs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ozfau5SeglEGDknGA4Ard3RE45cB6GJke9i5lJCegJGfi+knd9JfWtD9zIN4cEvLd
	 4UQwhE30gDYDmJakbM5KbesvE+vBLQr+CrWrZgdfUdULRid4ik96A8zEcnzKeSU2uv
	 NYRd/4xqeP6p41i4nxr3PMpBCZyM+et8UZpuC6BhiiO2D0ZRVevF12/Os9cgYeBYgi
	 DHG8IlSwWH8ZQsNm6Yp7DsObFVd0xA1Fc7tPoPNGDfDO5y93lmsJSdo3tVDe4N+hJ8
	 rhv4VNm+srsKMnKjoIjEQJiF8nyiDviJu7/d140pA8G/Dsrae7NWkjT0Ax2aw5qzsB
	 K9B+5f+yLs98g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D178040D6D;
	Sat,  3 Oct 2026 07:05:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DED42263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0CF760622
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Yze5Ai_lN_M for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:05:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EEF7260609
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011121;
 b=SZ5JpBa2SE0lp8afgVWt/gD9raxcpaFJI6JP23GFfoaNGzN2svfZYkqwUKEP1O1CPS3y
 WpTeVU3z+mSdmueBIfOASxSKlNedRMBMHQxxFzsK4myQUdm77QQrVD+JIBw+WJ4E3uvWd
 0AIZOhwwQXQ5+u+6503oP/ft4TTZsRP8aHDoI1W7q0/MfQ3/0LXKIR8IMJYKq35tZLu5l
 0duzRa5ciChoS8ZwqSyTYEyynrOAUinMf7KPHWj0IWfGCjzWl1knnvIi4La/XQ+u8PUqz
 2HpGSAxTdILVFhH1gg1WV3ObfNvvmC59P57IGqEaKR3ycEnsbv36KAKgPjn9NKsWt9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011121;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=D/U4hMAaqwtxEKTcjNBrm+IsqW3PJ35poD6BK5sdp+4=;
 b=Ek5e8sLOrG0Vb8zXFuVaP/PbYUWN7huvFy2MiZVwMRYtNkLU+YMH1tPav3SAdftZFNQu
 9lPs2BX2YMM1YsyCMRlFqBVi1oJ3/BUEnVw036UKP8dS6HCJLWnGvSKT2hgTH5FawjiPf
 5aDbBjqKmvtl12pqjjUQMa3MYiIVkM0drvAv4AxCewtNR7x7yMIJ01Z34Gpzq5agNsmWf
 yFlfhnT6OvOBtFbnTVlBC0ip6TW7cysnh0ZoG+Jzxa0JXedAk2YXWJo7381GgPp+lnZE8
 PK7y9Vgfku3aNs1YXL5jmFSNXyfAEwxKrbQKyiJB217g0vS/lPodiqZpEaW3DPkKvcw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=E4AruGx4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=E4AruGx4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEF7260609
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010925;
 bh=D/U4hMAaqwtxEKTcjNBrm+IsqW3PJ35poD6BK5sdp+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=E4AruGx4RChHUXOqcY54EW+KVzacauAE/HtANn5t2+NQNiW8Wpkre2dTB3d1dkDpb
 Y+Wu3rLnCRPcs546rhS5r1VnMCfuNE4sdtkYUzPb3KD092bjQX+c2OHUiP6Qtq4uVj
 ux+Krk63aiqHV5p088FuFoJt7Hsv+lr9m3CE9XYBS74WcROib+6KIGSCiVCFC+0Z7C
 g7zL1hDqsIzbHMk3fSjoGENEYFKWNEKCgOej+ECgX6VlFpa8JaR6OzGEc6hmXoI+PM
 ic8mKFojDnQqgOMOckT7+p4LUIhK09Wspmx1U0SOB6jrG6Vy9UvftKpSYVr+bBDxXE
 RvmIwg05CkoWg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 1Jvs0KekgjSza1iJKXPuwesAzV4VZrh0/Qty8spDjlyr2Sa5XU923O4LKi3UTavax+zR74v+zcX
 00VKNc2iEzrcuwX/xFthnYCENf/f0gTvHluitirHoZiEyri+10u60gOFiuEoUgerz3SH76CDbHK
 Mh2zMXoNT1qi1vdSQIZ3XKjg4eRA1wDb9IQzFKhz9bF8wPo7qNbHtfDqvTOzBefREZ1dHHhn6n7
 Bvg3pn9orT6UyXfpOnhkmJ6mooR8O6/TpwiPe9c+fvJMNQkyHfXJIQQLFzu1y6UKle4cpsyjmvu
 xEgf9SwYcUAaCWRUPJeDZD3Y+EhVu/pznqeRFNo87QR2etE/oP2j1qYl6Dko8NgwbmHgsg5j+3p
 DeW/VE5ibxMWlE/9l5GZUitmHH6nt1jdQ47kWsK88TjgGXF6nGt0X59Yx45lxmgqOH66IMPTi0b
 znxn0T+T7mFVlrB7DfMUqGEcHarBhK4fF7Fiz+60vwMrpdJwW4n2fmGNaUxH9enHFWNovP+o2nl
 UjrJWit/7eT9fP5Zi6HWxs2V95fafyzaku/ZaqEbqPvSJ1PdPyHBZFdWEGASWfEzaRaPtYhqin2
 xQkYzXkZL5421YAJ4twJ/W3gUz2ju5pjHzNRE0XH1bDfji4Wn0vGPcM7N1vX5sQe
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 385F7A4C541B;
 Sat,  3 Oct 2026 09:02:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkf-000000007Zo-1wiw;
 Sat, 03 Oct 2026 07:01:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:28 +0200
Message-ID: <20261003070128.1295458-56-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 056/114] package/python-pure-eval: bump version
 to 0.2.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pure-eval/python-pure-eval.hash | 4 ++--
 package/python-pure-eval/python-pure-eval.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pure-eval/python-pure-eval.hash b/package/python-pure-eval/python-pure-eval.hash
index 1ce4d3738f..197de309d9 100644
--- a/package/python-pure-eval/python-pure-eval.hash
+++ b/package/python-pure-eval/python-pure-eval.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pure-eval/json
-md5  d545186f2c899d9dd273c03d71b7ffb7  pure_eval-0.2.3.tar.gz
-sha256  5f4e983f40564c576c7c8635ae88db5956bb2229d7e9237d03b3c0b0190eaf42  pure_eval-0.2.3.tar.gz
+md5  2618825f897cc23016c4efb6e67ff0d1  pure_eval-0.2.4.tar.gz
+sha256  260c2774686e651b79f8b8e7fc9d80b3599ea6a66334b47d5f4abb69fc2c0ea1  pure_eval-0.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-pure-eval/python-pure-eval.mk b/package/python-pure-eval/python-pure-eval.mk
index 721640eabd..12f34a9980 100644
--- a/package/python-pure-eval/python-pure-eval.mk
+++ b/package/python-pure-eval/python-pure-eval.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PURE_EVAL_VERSION = 0.2.3
+PYTHON_PURE_EVAL_VERSION = 0.2.4
 PYTHON_PURE_EVAL_SOURCE = pure_eval-$(PYTHON_PURE_EVAL_VERSION).tar.gz
-PYTHON_PURE_EVAL_SITE = https://files.pythonhosted.org/packages/cd/05/0a34433a064256a578f1783a10da6df098ceaa4a57bbeaa96a6c0352786b
+PYTHON_PURE_EVAL_SITE = https://files.pythonhosted.org/packages/da/9f/abfd2959e9261dd5217ca8551d4de211ca6ab26fe9b72cf44731ff6c4442
 PYTHON_PURE_EVAL_SETUP_TYPE = setuptools
 PYTHON_PURE_EVAL_LICENSE = MIT
 PYTHON_PURE_EVAL_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
