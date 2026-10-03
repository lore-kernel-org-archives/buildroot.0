Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AC5CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 780B46064F;
	Sat,  3 Oct 2026 07:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yB0yxVte1mQl; Sat,  3 Oct 2026 07:10:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A69046063F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011456;
	b=O11OgZIpRXChiNFBGwul+uzYllURdGpTSg7M5Z3nfMHyC0PblknxFGKKU5zxFsoWMroA
	 rWDw32SReKufp3utbsCbd2bQptRmxK0Hq3xLJfn2euNywGbuZnc3MltsOzxl01FO6wbGC
	 wevb60ZI4OV4192e2I4ZhSzRcJ/OPGvSONoahQrQm7QHxjN7YoUgnv7xeJUPOy8bbaI3m
	 S4fFemKy8htzyUu64dLu3D0eFUm7iB4ch9Bzvqeh4B/DZnOXx8on0tA1+ihUpgqfPYLlD
	 cUbTv3TNQsXhfCrEcmxxkMd216k7COIFhx9+Rip4MN4HB/WyeWVKNGPh7YpWveqq75Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011456;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cL0ugEo3wnUVjCriBtTL9OL79qSJUWfRDLrNy66hqxM=;
	b=eJrn7bwSJHhARDFPZyUaWSf+fZJkcdWtouzZPb29aXjEVQvhi3uUlcQFs2xw9zy7BnX+
	 gyp8LLFdw64JQfSvFRxhwUVoiAh+HiyoY7bnv39nymavxmKVZpX3u4EncrD+1W2o9yVLe
	 6oaahylPrjwPvbu3GLvA5/1XTL+PjWNDbySZfQCUJLgnqxYIVAqhD/u9FfDGRTcwP/VOD
	 IJU1x1b8HA2aNXN9SRbEeSN0Mig1bgp8pp+0nLjj5D05oWULCQoTSQl5grRRUgJSf8DVe
	 2nV+T8QkS2YB9ewmQueJqDC2CXXo1kWmRtFj9UERSrTqIQQcLiPFGBYT94HwrFAV/KA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011456;
	bh=cL0ugEo3wnUVjCriBtTL9OL79qSJUWfRDLrNy66hqxM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YUf0hDRwbxun1NeZK46QnVU8KZX8Uzj54B/TF4FSokfFJko6+dE8HpxGlGc5RqWBE
	 EXAw5g/5hDH1fmGpMAxgMQaa8H9Fzbp1sZwoeChb+JiW891nZAqj07AKi1TO7JTwq+
	 VINcbo7gHsx/9FmiHvI68gmfy6jw0nbTFjgeCyhwZbcMiwjVp7MBYsdpku93Sbh6iH
	 kM9RWub1RZHaolvrDTwQDqCR97o/vPIrj6GLLeW7k72NSxCyX+3hX9LdzDiun+HeaQ
	 ti3/lIu9v/YqeEKqspGBQ/Nr3TAuaxpaQjiR4pZkBJUGjjzqS8bDXofcBM/eAVyrcR
	 Cwc/MeuQL7E5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A69046063F;
	Sat,  3 Oct 2026 07:10:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE8AE34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A01588112F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtVJDo61aYcs for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:10:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BBB5981124
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011455;
 b=N7IggoX3huDsb9Mh3RkfbnJXIQgFEuZ9x3u3IthLqdyh8MZuVNd5VJiGHuAfP6bqSpdf
 V4/haaM5cUIU2E4IN2Y64kuuS/p1nHxPQSaPNU1yiEvV2dhfL0eLJQOXPxB1CGWDaknjW
 oOHBaGZrTdZiDTJmf6YU2Z71qzyaXT7onaP3B+i5HFiNvUm/A8Cxkmjj1VmlCkvsbKA8f
 YEV83GSTJWfVVMACB9y2iU4vce3mBlQg6b8rbUFk6MR9vIEvVMlAW5jilXalL/20h4A1o
 +CABv/b1lrj/ZyuKknt3vIdeVtlrMzpu5ieHpfnWiLBLQ4Ler7KeladMYpHTM4C+aeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011455;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zzDCQi4pPpXDX5ZOmAqGedZ7Ewiwoq7cEqeUE4BqgvY=;
 b=JgHBG9dvCR+b3nKTiY02gbuXlWzrCIMuWxu56GAhedcp6t5M+Vfq/QNqsZ+vRKGa1BrA
 L3CTASgte/MINaWo+rVqQkW/JSDqf+jhhalL56bMCwLRXraA8U1/Kgu0cG3QuqxJCw/eM
 mrAa8m2kN+KddgmwMvewA40eSyhiN9biWMsNPEscEXo8z64/eHA2cotXG1kiN/1vYGaSu
 CZEqLOZgRA3POmPBGbdhDRTAFWKz0ue8+oqkocHTcI9QcqO52c0XX1S5aISdMS98pvu9v
 uYQvwwUo369jadOBqJszslotXdMbFdAXHXoXHq8AEuw/QdteYWzMqi5jppKoUj6V5EA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DsauhCzs; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=DsauhCzs
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBB5981124
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010930;
 bh=zzDCQi4pPpXDX5ZOmAqGedZ7Ewiwoq7cEqeUE4BqgvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DsauhCzsW58jSSquXhl7mx4kEpVQn2NVNvsEhOy/vXoEKZWGHsvTtBtSqNvkIIK+6
 vBYUI8rkJEby3ps5Ow3RXguus/83TjXRQODQRNLbHo4M1kK2yCGZ0eoVFhFboRcqg7
 UvqWlMKtrM0J38tXOa8fTiLRjgkb5YxkaKN9Y14axfWuR5dYZb4dG+mpRM69aA8twp
 0wsJ6NgfDKREVPtuo9y0BW5hVG2w0BU+gNGfO1wxeLglMbpPN5F0fr9H7KI3HqFhQR
 nZtAjvAHiaA/ZaTiJzL/rKcOz2JKr5FTab23BkI4CiSh9BNAYdzRv/RdMXMZ5h2XLg
 qUUnysErdxKIw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 2gQ/pSUUGnE8cAPN9oFVNPbJvD+b8ktK3CkPsY6G7fAijK0253DjQBqiO5/YLXYBT1ddvKfwnv3
 usojPsTcfu59c9RDY0PM+2D09eTXqrMKsow1QoPJigB/07GWPXSnl/nn4b/Bq5iPPdaghxoaoYu
 aUvOvsiY1GldskZ3j602Oc1VedGcjnLnUsAVvr6Vw02GcWqmp/o6SSg9WxVfg//QlcSGB2GfcXG
 RLOTt+hWfys1lWjGZNhtxRif7jYBtwGU7pyh3rYpUwOYAEbFq1X/IR4ROsphs+7ooc6rBNewUIH
 hY9ClMfy2I5u+q4TETTrMwRBi24VKuW2yqKU2SZRLZfRoL006fcmk8WUGasNF9CP0+yvTIVO0Co
 5te9Xfm0AugOp+Ni6z6FWMlPNoJJ4ELG0jkaK5hN4iuHfKmqEoCXNllJGKi++jgZiqMvUn7E6T1
 OhPtNCTs4x0JYoT6rPXNPl3+neYDYNnAJ2yIqeIRwzC8CqYbH1/fCGQP8c21OH95A1DlgWHjgeT
 9BUPTUNGmwHBOytLe+aLSbaaYwvewzQ3klW+kE+TwVoeu0gRHEhD/CwLIbTNWmlUHl4rrKemIFp
 3kXT+SOg19bMHPZdprZGi7MeGWuR3+Zl8iUusc7bA7P1XEncHOysJ/nPZq1fmQ2cS7tBDem09OF
 3Np7FWZAdTlp0R4f/ToM=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E7ADA4C5436;
 Sat,  3 Oct 2026 09:02:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-2KS9;
 Sat, 03 Oct 2026 07:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:55 +0200
Message-ID: <20261003070128.1295458-83-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 083/114] package/python-simplejson: bump version
 to 4.1.2
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
 Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index a8614cb260..2601899777 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5  bd06bf5c6db9fdef4b220d0aebb03c43  simplejson-4.1.1.tar.gz
-sha256  c08eb9f7a90f77ae470e19a07472e9a79ebc0d1c2315d86a72767665bd5ba79f  simplejson-4.1.1.tar.gz
+md5  ceb8e049dc1d531998d321f6c1bc4e08  simplejson-4.1.2.tar.gz
+sha256  6ae4186f90362e9c03c80a1cd5062a20f3a11ac9d391f7ee0ef0701a0e2b7394  simplejson-4.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 1dc2eacdf7..8e6024bc45 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 4.1.1
+PYTHON_SIMPLEJSON_VERSION = 4.1.2
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/0e/2a/54837395a3487c725669428d513293612a48d82b95a0642c936932e5d898
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/f1/e3/1cc7dbf4deebc16e9dc42db37f473b5b612d021eb10e69974be308425171
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
