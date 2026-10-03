Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3283CCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3E3740D07;
	Sat,  3 Oct 2026 07:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55WVM6vqp22b; Sat,  3 Oct 2026 07:04:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1797F40BDB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011071;
	b=UQ6NU8lDfzDtj/w8GKPUmosPnFDb8NrmeDdhfj7hTUjyZDQuYW4x94H/Btxgw/rbQ5jf
	 zlMVVx1rIZzAKeJmivNYTZIqwX+v1js/waioG2kQaLvB12m1IYIURGWQBO/YudD3nRuIi
	 2Nnb1NeP0TwDYf1D5xCIVPznoEmAwV7870Fd1hCYD5yXYL/vjlmRUF9MhU02jVvPsyC9R
	 7PYJxLlphPsxviOX4p+XXcnQSanbuPyShwcyJ7xIbNXyJ1fImT0FyDIpOecOjUt91iK1K
	 5//q6MhBE2/3uRnOyihWwVktcXz+jcOuPGEGxg+ySu9m5kdZ+OUH92TcuMjwAUuXGMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011071;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=s9QTSwgT/1BA/ZtzLJkgM4OXWulA4PlXdrjjAWO9Q2A=;
	b=fWb1GyS/qBxaGQnMdHruOOpG7QWJ8ue1zl5YmyRFWq8mlkD2kmGJAsIR3xkSKyhhXIir
	 QiSCMk9/crVYifa/0yNB6DLHi6UeSkZcsht7QdtQugntaSYybk6kVr3ryhpbJ85slaH5d
	 XPS2Sz/qZcn3xLA7tdpz25sLXnH9/sZSvpN8kIfMMABUtjMvqAc1bsnD3riqGsLH9MPMY
	 IYM+4bKCj1nluERWL0LZvXG3Epp38zQwL+onQQ70Y2SQoMA8tBAUPDSWPR+2rduEuSXMS
	 WErUdZfK+b1iXpKe1Zi4YjptEoTtq5erw/s7qc4X/vdGgOjpkixTdVXMIBIjVVJulIw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=amFUd8xI;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011071;
	bh=s9QTSwgT/1BA/ZtzLJkgM4OXWulA4PlXdrjjAWO9Q2A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MTbtOGg9MHzZ0rqBqY2MqZ8Peh9mesnPF8yrzVRrGMg7DahWlx4KDMkQQqdIbhakg
	 gF0ARLMIjNZcVZwLp3C+A4R2ca8LFqkUwX1PAxs6pR9KFWAGBG5Pd5TzF1WNpAMYgJ
	 ZFqyHcEQk+5vEGIKWAcjXDW1oKx9Sb85XgGUWoAFhwV1GqzgRf3jrwCWU6D5Alj9Vm
	 +7V7zC44ULHc26+gn2RX9cSsf/V3emx/SwW//nMK27jp/X6CFcqARHXdlGKnEeyJbP
	 8ZrQrkoTQWbUv1Eg9OAe+Tf+Owj4sAhhV4o+BxhzJmRivE0cE5e1gONJjPY0Uo37s6
	 YY+52hgQpgkGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1797F40BDB;
	Sat,  3 Oct 2026 07:04:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A2F3263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1078F40BDB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIz2UuNchHkw for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:04:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 28D8340BC0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011068;
 b=EI/I/NzOHhmzq/kOCb+CoNXsg9G33p04J5xdlyPNXfnsxLdHWqyrq1g20Tc+d1GYnNNi
 7PO79D9RfBGZmvFXnhJciYY7jXoL40HUI7l2Yb4HL6oyxPscedr4Grc9agzILkWEBr2Bv
 LEgzB4I9eBD/vQ7iqA37OBGiYk4nO4IjZd7xuYo5rCif8atyA3HtgCFf6vBf2paCr0YlM
 dyJM2uro5C+36S0f9CJ2lGSpxNznOKboBWaduCKJ4hTmv8eUjQqQdkNLjssMpfLXu0RDL
 DrE6xhlkcYsl+qpSWevtkTYcYRMVeKRv9Qd1TN/tr8u6PIVOJXK/so7JSDiqZqHbQmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011068;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=JPsGQAGUv61VLHST3IuStXXHIsm4rok0sAuCnlttcC8=;
 b=G0WH3RgSaN6+33q3f34kvC4q951IyihMaZi8NxcN5y90MlVyrxDyoF3Qkhvgw5i+1yPx
 5/9RbTaQjXhCN9/mGfz7+LZ+OguFgYF/I8POFJkV7dsgBTcQtuPvwe/bXzdbhmux7IBAG
 2cEhPolZwmyMWUlIWfexkHVpk19oGIz+byJrvuW8Ud06uqhyHqqYq9fGWF1+b36MnfnVa
 kEIMkQpI2LInKcMUzA7X8W7dGhhcARnapQPnedHqhHN12anfi8M9EuBCsI13o6QCxsg3T
 PneJ+95yOf0TO24CHN3W22f8DR30SFF631+pw3TBSI4DzFAuS1gwentfmj6UgK1bcvw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=amFUd8xI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=amFUd8xI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28D8340BC0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010923;
 bh=JPsGQAGUv61VLHST3IuStXXHIsm4rok0sAuCnlttcC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=amFUd8xI+hslDhnSVXMDdP6k4C4T8zGqQeal+WUXzrovve6nHsoux9vj8VD7eO7Zh
 s3Zm5qwWZJqkimmQZdKLoQj1MXTnlMjvDqaCvJjmS1zBCsgqGSbdSMytBj8917rhuQ
 N1OsdmRba69/fjN2UyqVT5Q6XHeKOdbe3+Zdv/gnVtesEnkXXh9VJjIVXBOvgX+CeB
 u+YihYbbeiPwb7JU/oUbP8sCXU+qRxC7OSwSB8sQZNiABLKqSP9mt4VXTW8tYy4WfN
 P2hr8QOU6/ppGm49ghR1mmnKtbpSL4BIud4C9jCgI+t76EYKZvPBgTST4GMZYnwxNg
 9VxuBIDSRUsIQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 TceSZBJfrYi3TGu8DDkHwBG3+YnhedzzuDxgbmxXW8nTDm+NJxvQzwVz4h71dO5gFiF4n8IEeEA
 GDcNb7fNwkJpOBhGmRXQvymdGVsPm0fvpFLcBHcAcYd4eYXi70Bx0EFwVrWeGJF4xmYabPGLeSS
 BOx2NnOrySJ/n4J5T8vjdCVE3lKD7Q8c2SciI4bDHFL0O48mS+NcRFHdP2OSiMjE2WXQ/7pxFN1
 4MaXIgThCVaC4MrbKUMJalknh+LL+qGzx1PEHrXSr7cHfB4niE2JrEM9ImIg6ldKfB1RQpVIiyx
 dm0TfU4L310YkvQ1GWh+T9oD5CNvVYYVYOk1lg0iQEagNBhWg3b47zBDpcpSV/A8lQ32+ejpFm3
 g1hkx05P4rgae5SBFXwxl5oHZ7A5ivoQIr14V3Hw4xs90/U5BjLf1drN+VU94DKnt8ba6PTak2A
 WEnKEpIfifBU6lLlt6UkYYTvtwZViGKAl5lZZdmFOApz2kEVxIDAUYExQNiIUvUxwqEbcdcAcXw
 L4FABwDD96sUDXmN1rr7UCfWxfAvXzRuqJI5e4SJx+NTn7Ur4kCj7RIFCWKui8YtkIBt1JR1ADi
 4+ld/3teYzFV+KIqJAypYBCWsk5WpYh0sgZ0YXmYSrM=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76A5CA4C5417;
 Sat,  3 Oct 2026 09:02:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-3WiB;
 Sat, 03 Oct 2026 07:01:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:25 +0200
Message-ID: <20261003070128.1295458-113-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 113/114] package/python-zopfli: bump version to
 0.4.3
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
 package/python-zopfli/python-zopfli.hash | 4 ++--
 package/python-zopfli/python-zopfli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
index 6cbde60ae8..2512d2ea10 100644
--- a/package/python-zopfli/python-zopfli.hash
+++ b/package/python-zopfli/python-zopfli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zopfli/json
-md5  ea5d84d9e8c5d02e7835691667e0890d  zopfli-0.4.1.tar.gz
-sha256  07a5cdc5d1aaa6c288c5d9f5a5383042ba743641abf8e2fd898dcad622d8a38e  zopfli-0.4.1.tar.gz
+md5  8978ce1fd86d28d2bd65ccbbcb2423c6  zopfli-0.4.3.tar.gz
+sha256  d3a50f91a13cea9bafe025de8fd87a005eb26de02a4f0c193127ddbf23ac8ebe  zopfli-0.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
index e914e1dae9..6999c34206 100644
--- a/package/python-zopfli/python-zopfli.mk
+++ b/package/python-zopfli/python-zopfli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPFLI_VERSION = 0.4.1
+PYTHON_ZOPFLI_VERSION = 0.4.3
 PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).tar.gz
-PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/0a/4d/a8cc1768b2eda3c0c7470bf8059dcb94ef96d45dd91fc6edd29430d44072
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/74/21/3b6af43a663b22b00e738bb0642931a2579e15da6852613d56c6aa535d28
 PYTHON_ZOPFLI_SETUP_TYPE = setuptools
 PYTHON_ZOPFLI_LICENSE = Apache-2.0
 PYTHON_ZOPFLI_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
