Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80767C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 15:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0522F40614;
	Mon, 12 Dec 2022 15:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0522F40614
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_gadOegyUMd; Mon, 12 Dec 2022 15:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35C77405AC;
	Mon, 12 Dec 2022 15:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35C77405AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 789C01BF2B4
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53F25405AC
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53F25405AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8M2Cl1CgDnF for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 15:14:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64D0240256
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64D0240256
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 15:14:33 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id s16so3496066iln.4
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vV7nxiOvjq1qg/zpPb2iefY/rk9rdzgErP2rkbthoi8=;
 b=6mScBMqBNS92jnMgp4HgGCuIdABvv2XymGMbWDiXn9o0VK97nQM4Ju2MOPLLcydjVS
 4J136btQclcX5ScekFJev5lywbS/EocG/6aI2tq5WnuzAdB0Gn9iBTyJYVHxOIOcdJtG
 gAMFxRSBraBoJT7s6qUHuY36PVnMDiMIu8FAR9Gr2A0m+xJUkoyGltAu5Vmkk5oI/vNG
 /jQqARY6mfm//m96wFee7UyC5RSDcvEeHpeZJ2d0RiMsa/C1mKguPnwxAd5x4RgiLaTV
 N/an72Ot64gmGodVuZtGYJwIkaShrA/fhhhy+2mKi1qWG2XWGRxCP3GC5HrISYD5obQv
 qQvg==
X-Gm-Message-State: ANoB5pnMU8zHioGpi0SOXO0zSLEdKT7MP2+TTMZk9DCsoKOxPj3jmLx4
 SorLuasop77rxuelBLlFzUVRFBBp5H1P7Q==
X-Google-Smtp-Source: AA0mqf69csvFYCog7qI2mf0d0OOzBjEmNH8U3UDEq7Ym9BrWzMET5T+DdYUyPZiOebwW8BleLazE3Q==
X-Received: by 2002:a05:6e02:1305:b0:303:8dc:a624 with SMTP id
 g5-20020a056e02130500b0030308dca624mr8326712ilr.21.1670858072306; 
 Mon, 12 Dec 2022 07:14:32 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 g8-20020a056e021a2800b002f4d91546fbsm3063948ile.6.2022.12.12.07.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 07:14:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 08:14:29 -0700
Message-Id: <20221212151429.2813627-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vV7nxiOvjq1qg/zpPb2iefY/rk9rdzgErP2rkbthoi8=;
 b=aTctMzyIhsNzwB4GpOkNUHdHldMncCKicXUSCc8j/8a6JMH6+hE2/dFV5kaJ667DJw
 ACyeATeP1n2pKaquPvRVevTTcE0+MZnBeQ3jkEA35J4m4Kaceh+qaZbdfnbPw3WR3f/s
 +n8aOQIKvYvgrHNPFnQXFQ73zJs6guLSf+Mf/8EvBnphl+z5wc4dIJ2K5rEB+4VVALWQ
 WsaK4+UgTVNbQ0szOTqGtpM5V/cqzuYD39Q6IpxdGiLs8RQXXh8whUUvlKfn7UxSIr3x
 UDF5B3wqYIjSvdyuX4gXc2qVS3cj/5zrz+JAAf31nLqaXOQ1UHQnRjrtik3PugyqPdJp
 ixcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aTctMzyI
Subject: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiocoap/python-aiocoap.hash | 4 ++--
 package/python-aiocoap/python-aiocoap.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index 176b3d22c7..ab50ff0958 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  218178420e8fc3581001f52eb726b016  aiocoap-0.4.4.tar.gz
-sha256  9d7c9626cbc4dc24a91c6b8694cbeb834e376ab7e20e4137609380f726a9540b  aiocoap-0.4.4.tar.gz
+md5  03ca0411b7401bfd6e9bdaefe09bd88a  aiocoap-0.4.5.tar.gz
+sha256  906c927822185c8acf04fdcc1dd98fd845f31dabf5d5e395c39137dcbd6ba1e3  aiocoap-0.4.5.tar.gz
 # Locally computed sha256 checksums
 sha256  2bb211d412a6bfa4b2a9cf01123c7fe90e5e6185938896e23ab07b84f8494180  LICENSE
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index 96d8619a84..92f47b7a4f 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.4
+PYTHON_AIOCOAP_VERSION = 0.4.5
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/6a/7c/139993da8dcdfc86446ee6df65b98c68e40c5fcb0caeff3a6b348d9f7d6f
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/65/63/9051af6a2fc498f50b71f23bdbde0cc1d1f0a69eb767776dbf6d1411e240
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = MIT
 PYTHON_AIOCOAP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
