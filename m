Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FF7CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B338A40E7E;
	Sat,  3 Oct 2026 07:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hi6vdp8wk8rz; Sat,  3 Oct 2026 07:09:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CADE740E7B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011381;
	b=XUztcav2HwyFxFBByhvGk9FC8m4E/jExVtu+iGkgA0lAAVb3obb3MqwPr3ZlBuI0o6ST
	 HsT0FeaY5i1zovBQw9U/q4vOhsvhumTeKb8btSC/NVivp7CSOPQIiuPxLJgeAll9WuuQL
	 umv0AQ/yak53Ba/VBRnQoeOjLCpbqgkZZVbCIYYLtYlNwgQ8TbSONlrgpnUsZv4JhDY5W
	 1tWXKWcesilXBAzA56g4jC+lXscq+l09lTy+x6FVczMMD9L7LHagkequxP0zAmsHVX8Qm
	 P174mhLnJxzblR2yh77IYOQ1Zqj5Mm7ITDpNCg0L54qPi5scO2xyfXp26m1SVM9acsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011381;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RQUBpAo/IrsCTlbCN/oDR8Y4EGDrae7Y24l8XM2P7i8=;
	b=f+WmBtXNL3mYfPDjM39dHtFcP9UMuJxF1S86RNb7e/AseWdHaojYdgnKtTGnTuhwdkKT
	 cNIjwhaY/NX65PlyYwXK/UKBZkXzSs4EvoypBhhjl3lTtL31WnF+NLOvU1Y0xNSd+9ul0
	 YHTFlWgXWH+Wnt5FLlyI+VQQxHXMZ8iSGw/QU4RLUF2dAQhFcURy2ZKfyI5cuGV54Dwwi
	 FOwgRDUTnIfjfgUIaAoE6eiFxgCDHBQ3opPBJm3V7LwBJcQK8x3YJxDvTWMcoj9ETrtDJ
	 29VOkcWWkFc2Rdscg63RXeanbzLwolk+eykfETNzbCg1iz+Epjp5NJdLvyIojGp1rVA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011381;
	bh=RQUBpAo/IrsCTlbCN/oDR8Y4EGDrae7Y24l8XM2P7i8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Wbf/jQum0z4jrtoJpSI+zCIEncazBH1iJXkyXJ8P2TrhG6WVeQVoU+0dG9NVXGkAQ
	 5XnbvvOebGDr1DqJFk9HGxPtrCIk8xFxMYumdtQt9PXR9aa68f4m1ddT/tVIDPbA53
	 6jrIa7TQxQ7zv1nZwSllRFDO0VUrjXcGB03p4+ia3rdij4wQHuk8qONwT9ggJBms40
	 0TLs3ZWP2G4ew0ar8FlGR5nNXaSqSZkZL9ekMr0gchi048/A9H7QWW3BjoMJtPh8PL
	 y57fIPhAESkYKHidWC6Ll2iXjW3BTddhII1GkI/DIaDsjvkY+HZs8mdHaKtqFY9TpT
	 e3HWMYWBQQiIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CADE740E7B;
	Sat,  3 Oct 2026 07:09:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F035C34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1EAA8112F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3cFOlOn_Igr for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:09:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E4D4F81124
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011379;
 b=CXguCGp+wkr2QB4cS7xEuSVwsTLuJQQIUqow7cMGFNpPQu2NRnZ2XpAH5FZvJM9Tst+t
 VFPBIPaUGpOVnkUBANZPCUi3u8kGeiWxX2RMs2NGoHlaFyaXrBTgZhC9AQ/3SaSNtiLbu
 ixX9KNX0pcQeGfyd5oLak5kgiGCQT66Japlxnx02s9do7trivLGR5CHfHbblniPCQtBsZ
 uIYvwwp2bNO8n1A7qe4WLXz+w1vubOALBKjwBW/feNkeWx4YB1nnjM2d7BXy/j5RwAWn5
 7UzumjpMNo9tSdMLp+JSgpl0oXk49+iqFRXtfaQgvCkKmrKO4ArGQDaXmAtMRjHFdgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011379;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qxh9E5UTieVT80wB3tPTwwrni7gM8m0VUdq3Vtvq+rA=;
 b=n4jSlYgKtBdXXTjBCsHxA/Ple2wg8P+a7M+DfaKNHhM+YC9ip0+OL2/kX4E4qiJW0qU5
 RyylXEABb2SmtkScBPAvC6togEBUd51x+Uz6m73fXiJfzvLvPk3ZPjHyeBgNlFxS+F2oo
 Ws8eUc3gWw+UncYFFqSUhr1J8XMmX2Qt+bjwfC6QprE+Ww2+802RGwY0yyWVK2ArIC2I4
 ScYklIajq6FjIJgyFKXCBaWW0a4zzBNWlF56+5A4iJdcVlnG8oNQz7kvL+yjBWagWZXCH
 py4Hs770aNaRmOH2Dhy1BCZLI4DGFezlc73kxoyPkhAELuK0MP5B2emFGzrfT88pfSg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gqrB7+VV; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gqrB7+VV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4D4F81124
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010929;
 bh=qxh9E5UTieVT80wB3tPTwwrni7gM8m0VUdq3Vtvq+rA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gqrB7+VV4rP5de6vkcHuN0vdHHN+GKdzNSariGcnPrjlteMvbzaPRAxR3Wq5JnlXi
 nj76dkItvvpcd7fnR07bSN12QIkqieYL9TcNlpqSOHHvVlG0iTL8X4hWfCDFEVD77M
 c2AnTIqGUiGLysgwdQqVoJ7HeWkaM9nLy9PyUZ5+SHaYJnQd60Gu/zA7jo5jTx8OsZ
 Tc20uL1XDIhPoW5pE9RQFx6S7NiN7j0erKaMwX5hTsrcYxmQwC7bA+7fPvWQC/ktlz
 +sKo3JixQ5uy8hxqFBOiIaC+Yw7Y0SSpYPl/E0Z+uvILXhQ9ffoV8Bhfpg5+HkWNsO
 I7cLsnx9sALLQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 eSr9OEHc6tounAq+8HRN6aGDqtJHN4gXEtqoGkOu9WxAulGE2ysPpeDQHGV9DAstSxihDie8+5Y
 V0kOxHw42rrCwf6nSGU96XySeg7L5se88oG25j4eaemppgXxlKmxMA1whw0c/BEFWOIkJFVOEw+
 2idOdNJFHNisrA1vtak8oZSVlLKtMX/kQ4xLkeVyBkVHcVxp7bNnphSUMPjTKJnQQUyrmsGw34c
 4NcmbCBP0wG4b01oHPe362DS5IOG7kQrQrUOs9Et1OsvgDyaKeovjnsa1OViDADoe4wPM7KV3HJ
 PIfSVk2FU6t478EiEbcKV26PN9MoJ8e16RHBbJekf+hsn4/alFfNNVX9E3lJvlvCOla6r7wluDK
 lVssaZRqUoMLZ4yj9sbB2x4/cpbhBO1ZPU6erijQBAf0Q6nUH+BD13KoYurI97XN4FFxt5wIuic
 E5vXki4kjQPwSP0quRTUvFDIaoKfcLA51mfM75aiLyDu97IFvPMXcn8s+rTYI8NWV6DIBTBFyQ0
 DYYn9zx0eGDdrUX3uuocHhQlB7+WKyEtYxQPZtfeIchFb6Af7NNZC0eiMrHtFH+gXPM2fKYHZkR
 ZZ/HglLBK4re2gyIwl1VwM2CXnuV0/VbN+TQJHTv2HhSD2gP85Uungz94S3RnM/1
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2146EA4C5430;
 Sat,  3 Oct 2026 09:02:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-0Kev;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:49 +0200
Message-ID: <20261003070128.1295458-77-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 077/114] package/python-requests: bump version
 to 2.34.2
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
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 4fda8ea71e..323aabd959 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  ebc3b42b51c6245524345d170e5d4c50  requests-2.33.1.tar.gz
-sha256  18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517  requests-2.33.1.tar.gz
+md5  611e438d0803e962500225f9807a475e  requests-2.34.2.tar.gz
+sha256  f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed  requests-2.34.2.tar.gz
 # Locally computed sha256 checksums
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 3af00a7b9b..8e28f39a09 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.33.1
+PYTHON_REQUESTS_VERSION = 2.34.2
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/5f/a4/98b9c7c6428a668bf7e42ebb7c79d576a1c3c1e3ae2d47e674b468388871
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/ac/c3/e2a2b89f2d3e2179abd6d00ebd70bff6273f37fb3e0cc209f48b39d00cbf
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
