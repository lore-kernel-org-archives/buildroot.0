Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7764CCA462
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F58560ACF;
	Thu, 15 Oct 2026 21:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNKgo-6Lozxc; Thu, 15 Oct 2026 21:55:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9201E60A9D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101316;
	b=MdOGJIF/14kLb6ZRJFeTgLA3qwrHX1CjaFsWQNICs8B+n0a499Mw1Zw5ACKPxcI0dMi3
	 WwbEjXSgP8KHuF3jqEq6KAq2FwMKiblTnPdva2Z867ULAaBGNC9jhqP6xBwlbL3Kcvh6O
	 43KNtE5lEynvvdcMbscNkO6TpEeTa9mvi58gPT5hhzj5sFBgttl/AYhkbWbX7FNu9o8gT
	 DGR9+lo7HcDOXTAkqUB/etvbG1wUL5RJwz2pAhUwxSZUJ0TtaO65OE2p8Rgl3YPaU075y
	 ZbqIb3FaCp0MtH4xnwJYm2FVOvl7HeeB2sV/VjRrafHnVAWngQLQozM7TOf0e0CI0Nw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101316;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NIBOe9c5EkGmT5dpUGANOUGTZpGoqucD4705rwryT9Y=;
	b=JFRnVazY975Jm5ZuEiH7PITnCy5YmF4Zl/waXLqkRVzsVau69h2tr6jGTmXQl8D4Vlpz
	 75MRLpbq8U/Zt977Mc8c8S9qlO5wtyXMwqar8nuEuc36PRlMXGUz2wU+4mk+vYYJqhP1P
	 fARANiHDHwrkgAdZDiO0WFRMOf5K4pHbwyUlLcR8TAip8O7LRgZ13aolm249BrpDtARg/
	 H7H/AxEvBBM//VsOvYKNyb3E1GSX72s8KbtUjbMYL75jpqWQTfRSOgQ+Y862q6HTMCbXJ
	 ZJjA6kYXWEkyGC0j9alEfWvXSep9KAHvp5HFGnYcasdB+FJiGOhtRl9pL+Xwc6WaANA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101316;
	bh=NIBOe9c5EkGmT5dpUGANOUGTZpGoqucD4705rwryT9Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rtdXsSYkF++CvzuX7RiIT6cnUHSK4aex8oGeHybvkdEuzgP5pineIuQAi09rRWEdM
	 lb85JtO2/NLLfJbf0wRW/qpQ7BaNw17X6yigzGJBzJDw/3jjFwUaLyOCBiS1E3V2YJ
	 giEMbxno+iVI7r4MsQrXe7fmkd4B5MNb/dKWFS5E0uYgT+otMk8LobDBnUASu6b1ja
	 fMUIjxYnVDWfog4osczOlP9udBJeHAtbVACeMBY1uSHetTpzrJm5WjmTpLw6cy//oJ
	 YHQjegzGwOTOnndkF5o51dMbWoHJ9R1iIBZo+cqvnDclJtkTex7/Ej/x5v4oGBVpxY
	 J87mj7DOKjNDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9201E60A9D;
	Thu, 15 Oct 2026 21:55:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2226F1E9
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B1D400CB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAUyWzgakang for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:55:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 11A9240087
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101314;
 b=FXR8Yq0eJOnTKB3pWzcZ6Svhvi5bSbjKMFM9lM8i8gKWqMJDSFqYYQ5HCZ2ZU2W9f+0O
 bn8sjWKpNb4WjZ0Cpid/DYS06kCODLfDtziv4sOTFjRF/RwCVPNF0BaZQ6boo3txfWKsj
 UcIMIUegIvGhv6C4p2UrhYJcQ4b9XKk/NKc1oF6sSWAihBNBR19EwErHmvtO/gF/0c1N2
 laFWX0RNyxOAQc1EDG+bNegdRgfMRvTjavM+OevRywf3shl5dCaSC3KV9/vdirtLll04p
 woH19wRgGAxiLaTRt5pA28wTcfqfUlvc164AiE8XpaA4f/Pokwzud7R/sWAn+GfS36Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101314;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=OGWiS9EctEaQlE9P1rjUiF6FekoxAY1EWUhl/L8Vtrk=;
 b=TE4S7WPKuF3aZOIq+FmXO8xGY/Tw3AMKpe+mjtwd6MBTLOZfoyuSY5rY1wFzTmII0tuF
 01j5Y1qkNdfbMGSp/+HtMFgZEkCuTBSZa5+pF+BFM9TrjQkqC3x+5b2dGEkJoNJt1bKAA
 Wcz3KenQR7xcefBHpCZLxjmkvgWF1ncwRw7SDXlfzNMsKOZDRcEoxiwplJ/A+k4Tg1Cn2
 yCSDskLIeryIIzZP/X99OFm7Uvs3fvPe8nud8SkqLrnAxZq4gWU7S9Hwpb+E0mli4jroP
 lpxOn3tE/5djHWt8CKGQxIJ/xECT3aWgpiZ3l6xw5P+01KdNGKfza0Iku5EHIDC1dOw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OyxkfbAU; 
 arc=none smtp.remote-ip="2001:4860:4864:20::2f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OyxkfbAU
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11A9240087
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:55:13 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-49dee4c5427so861201fac.2
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101313; x=1792706113; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OGWiS9EctEaQlE9P1rjUiF6FekoxAY1EWUhl/L8Vtrk=;
 b=OyxkfbAUO7LZJvRGNEdO0xOemFHrkmNbIVV6VBrkzfpAbIkxIkd6/YETqRafgRraFy
 xIAfe+sXokORZlppuBo+Wzixu4xlInLsHEI5n7NjWEUPWoXLNofQs6u2Kj5+yZ9QAbe3
 8Ipbe3eF9Sl3aJih6+5AhjjuR/heSAB5BrjVpVCyfrSGnp0HfUzd3feVHJ8sAobLyzcg
 e+5f7CNsyL2OuYds4PljEBo+YlGJ61Ju5P86Hiry4b32BEKh2QQYe3Mu/jOWrfaVlo8w
 wavvdqPHI6hfiHEv3Gbpd7I2aBY9ChmzLt8/hRJ34UJotKLPKkOhnUP6YhlNk48Gf6jQ
 6vRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101313; x=1792706113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OGWiS9EctEaQlE9P1rjUiF6FekoxAY1EWUhl/L8Vtrk=;
 b=tVstGslFhEwkKOaOKjLCipvnZqDT7ZLV+foi3HTz3YxyE01wEveBefxi1rxLY8tlGu
 cvXluFN19NGxzsWUyIU3H+lIuJrPOfwJ+HVl+jNpC6wunzyHDBaULnvarnkXi4k8QvHQ
 iGZu9S2bJ+B5Vu1Szv8l9pVKmIUJyesK+8YXN0QgEeohXTrbvJfGpCqdjIITB47a42Iv
 v6duJE20RaKxeRwJNaxacPBl7DiqJRtaFh0j+Vc0YgxBD6K5BHPxZPVZNTA+8OAFQUeJ
 hZ3nGQIZ4EY2svsmUCBwYQAJ2maUYCr/dsVcDp+1ljwxIqAMzQr7BFksDnIrFHL3S7+n
 D+dg==
X-Gm-Message-State: AFq9FYI3Cglnew8A0JxETaX7UNgSfWMsGz9TvYfVeCZ3xNJzFmGDOOoV
 CQOZZccF1nbLeBco3g2u6jTw7CfYwbAvhjotP/jtv593F00awDdYHEtYXE8gig==
X-Gm-Gg: AYBFou1gDx5GQyk5LqpHi4hLhymFRm5P2Z6k56mTwWeURKVdA5h+7aQAw4nrmMnKjnD
 J7v7s5z+9dITpNQDQrwypfWaTKA+Je6Oh8UAkCaswhHOi94HYQ3cjtVvUZKTKebw/SjBstERMlQ
 BLBxEckGIersE8r9OEPQtKPH3QE27L5RLvM8WTy5Uaywpqli1dUgL5jf1yfA3FaO63vgYzqzKYR
 Jlse8D/ElkPMI1fm1gX1gCKzdo6IGvEa+KLpyhiOwGHiw6FG6MatbNMgdovJdGwxDwIcv+k+MGs
 FM8LZ9SB1gvWAynMb10HUCdp9o7UGsEA+54o0EqQViucdnXP6EriNgOgnA6ZJJ8St9MnRv6rTTF
 V5Sz6mrKCMnW7/Is9T99C3JT8+hXW/yiKBfu7aEJBDaGDleq+oslg0lt4/9hB9Ipa7d23GNNq20
 XGZRC7BVmstaT2MeP3TrtzBuA9IkQaeptVDAjuLIGHYGDOHwgslwyRGPVhwnkTZQJ8sQLO60UDr
 nd0z7cDgzaE5HrbMZF4EkK9mgt+GTKMdrUPAXW0KHH1/1GCqMxzVX2tWOxmDNkxYn52bKbOygGA
 iovHuVTT05CcEZu02tOCbimrZw/h5lJksUIaNNeAPwfoop2hBV4i50DSsiN3lN+hPyWZUn1uOoX
 89JoRxU3iRUXW0bHciA3T4klVMVeeiGCAM3+yaZUfgoXs+gY6IZuZIQ==
X-Received: by 2002:a05:6870:a550:b0:49f:80bc:ca7d with SMTP id
 586e51a60fabf-4a2a896ac32mr18353180fac.10.1792101312794; 
 Thu, 15 Oct 2026 14:55:12 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a73b6e4a79sm157869fac.13.2026.10.15.14.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:55:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:54:53 -0600
Message-ID: <20261015215454.3428556-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-botocore: bump to version
 1.43.114
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 51be01c029..2f298bcd54 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  a05d160b6ea2e3b8d54919585c414752  botocore-1.43.112.tar.gz
-sha256  9ce0d70e09fabbb3a2e1126d3ec79ed67d14c88bb3f064e62ab2881d5eaf3c7b  botocore-1.43.112.tar.gz
+md5  2e223cba9b8627048a80de7eae77d5aa  botocore-1.43.114.tar.gz
+sha256  f366fa4db518775632ad1eb128cd8203ca46396cecf37209d904f0bbc049ce90  botocore-1.43.114.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 376c400332..e029532f9c 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.112
+PYTHON_BOTOCORE_VERSION = 1.43.114
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/0e/49/58187bfb510831e4cdafd7ced8e2a748097da81e8b9799d93f8d6ebf9f61
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/ce/c8/b508359d1f3846a918c06807a9ae27eee063f904559269e42ccde9de09ea
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
