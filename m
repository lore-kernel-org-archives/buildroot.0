Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258B1CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65A04101D;
	Sat,  3 Oct 2026 07:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxK6f5B2TI6R; Sat,  3 Oct 2026 07:17:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0C9E040EDD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011865;
	b=ll3ocln1FM5PAfv851lmRmj0hhHBVbEfywrUbiWTt6BnOR5hbUesgADjQWRh4byBwQjn
	 gBWmjIoIWhIOF4fTneK78+vn+ZEc1AzgxfHRKZdr/0rEiPEyS6NsCBfEuhqtk9v3TLg3Q
	 3eH8Tj5sD2V4EMXEUP8YwGVVDMFeLsFluS3bEGW7G3mO5JlJlMrk3SBUYVm65vOQtdFUp
	 l2mMFj1PFRUqneqvGEv/Dv7RFOxYiWQWao1hAsnyx+DT/FoOfLsey9uvJy3td0PM1Iv8C
	 QcXmvkt3++Yx152MR1PJpF8t4C6lHXd44i9VWlIml2x4/U7Al1+2UhQSfL8yOoPB9iw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011865;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wv9R4OmHq3c8dXHE437boUpiQBIB55W3LcqvClhHEP0=;
	b=Iq5srJl729mNloLszM1kCa/USOkIaqImTfUzHaPpqkIi069EHn4xoca6yAx1lR5B50Br
	 Ja32gjPDd9+D4/e3NEiW4LhavcGrqmKny2WDLiOvt5audNpjDNmXG+PQiGKuYw7kFp5EM
	 9RTqRdjnEeA0dItu/AErPjxK6uFOBsWkKDiQmqqAsrlxN1R0OevwOZ+vBaahZKltf15pX
	 xL5jRLJC+3l0wdAf9NMOiATRBwhyEqCPbY6/3XzOfG3Hq3vptNri7gBN1JvEza9WuUFNx
	 1FJW6mYlsVO1rXm1oKsCvf82/3me8K4gihhMBg3FmJF5XeBOREap07PhI+1LOAjXeOA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=MKs6RNBn;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011865;
	bh=wv9R4OmHq3c8dXHE437boUpiQBIB55W3LcqvClhHEP0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sXAHZWKSYfeteI35d2WRLJxITO2hy1ygEn7ZOiCfWXXgEpecQ6tBmxUS7Ci4Y+8PX
	 DOGLRedCJ/6AIrrQc5jiSx3Jr5s2kA1MgquOKdDvC4cV7GQbErNu8Vf3zAwGpS4Jy0
	 uUysQwKVEF3zbSuP/rYOi77gwl4yQO7r9pb5aV5CNCY/PrG8YBJPbPiT6kUuJz0LRJ
	 2ZWtsu/lwHaU7kF0E3KzZosAJUieG/dLUdEzxjgeaRz7ybahrWM5kEjcHUhpKXR//1
	 4mVaRtyPqM/DDnZoFH4gQ2XmNsf8P89sIFHfin7GKU/NAYg/D1eFykR4VHpzvG9WJF
	 bi0lsANhGrqEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C9E040EDD;
	Sat,  3 Oct 2026 07:17:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AD7834E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D19E4100E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Y4CjqInKBS8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:17:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 238B340EDD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011862;
 b=o3spyvEfKvdcBBKMYPckAp1q4NL8IQiQrJXfczaV+J5Ou7oKmUzaoUjJjjxVTxCKnK68
 TJBhPm6am0pCzUf8dPi7FpyXMUHTM/T7HYXBbz0BSfxClIz8+gGEIf5FVqinR2x0xILQf
 uIf2ggX8ODybhPBvGE3c3w/masvWqONmSxsNtDJKIk/Y7dAN3KWdUqTgI/PSiA6is9EV2
 hCRH68edh+hbWNsKvNN7ReoYJfq0j64EnkoPwWA1FL5uKPn9h9/tDFfnAzgDJA+vryeFt
 wxeKNzYVkaz1OEF28yFVh/4jZb53VAJ2bp05f5Fm9VOwtGac6gobJDNSpqMUqguAw8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011862;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Yvw7qzrKNDF+RG+psMt6w7Bnr9EGWQrPy9zqdhYgiAk=;
 b=s+A5kZK26kGgzLFsFBgHJAeFwiqxwbMlyY4FapzemZ4dEk4r8MY8/n8R4fB8OpXKdxF2
 uSaLH6qWfGfIophx5I/q1bFAMj2/2XU2ezOGAhLUclyNlV/QlldCTiGebZUMPRGh0Oauj
 4rZaZZLj+CBkcSWZ3MU3lyCyyBsDnwUbq5s8Y93rmEbTvBsVAI3K+V0SitsPNkgSsBDEn
 umpQ6eYbRDRB9f4XaPiuh2NCRF0WbHsJYpo39wl/NKKtQOpoNb8Ra0dF2i0EuN0E6srC8
 ohAIknc6ClKOR9Yma8mo9zMq3anPKhj8ueK9ZR6TF1fklbt6uaOrgirHqYM2iFj9MkA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MKs6RNBn; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=MKs6RNBn
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 238B340EDD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010936;
 bh=Yvw7qzrKNDF+RG+psMt6w7Bnr9EGWQrPy9zqdhYgiAk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MKs6RNBni85Vokdw9YRDssSjAZvfOCMOr3hpwbKEVv01KYFp8X72A5GRVemtkfjej
 XTeao2I9nVGFx8gdSv8EI+oIyHtY6wQoge5tpbhjJAOu350dCNt8K7RH7/GUsAncDP
 bJXR16KcGB5LCwsnZqaMvrKDDQwiI/uPi7Hld5b6UudvFlP7e91oa0biXkXUUZvGx2
 NwCo0Dl4N/KE+/Qd3LVJC5oRBFNxWA2MU2Rq6PIP8ZJVxYnea4DvjQrRSgwGl33eDA
 N3PkBBQK5JrBFb/Ctx6xe7dclF4Vtusbs2yQzieCYMlE9P3iD/bWpgbFXm8GTKw8AM
 R3MoDpbMTa4hw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 Mqjw1AweGqdhVQzga/a1KNSqYs1LjWNxravFhggn0EO+uX8YLIiNlw9BRKdhnDvWoZ+jvjL+Ny3
 l8OjavV3BCGpyLua1oWZ15ulq+oNhUdwwrecqV89g9Vtnwb+iVgiQNt+cvi22Fn+O5Zs6Gdq/xl
 fgOX7XNE5bWtixQfuvm6yfwm+634E3HM4MUDa+TsttkM3ay2cXV2E82HYe44dHPLZ4ZQ0yuLhCJ
 mlpDjoT6xVuQXqEGqARfm1Y3lxWRMGvFO93F5x+fEUhlPdUIhSTW6oRb5ZthVsq8ML9F+piXleJ
 YaZVhgm8Zwx9ksXnUp82zX9u5jZWU6keS9LFZ4Zh/ZzSVWI7aHnxUzu2fyTb2uHONH4pEIWmgW3
 8B91Qtq2twqUGDgesCw2xr0jAGEY3FxNs2vxPqYrYUUv8tubxoLKTlZ8SkUDjpHOaOIunaOX9fY
 i/iKxJ2bGdsgxKw0rpeDgqDwgFf5HS5mU+mitqAAsCu8339FdYLfA52GvBgBa0KW+D2aLYdbcyi
 vXAXsuQn/m0hU8hsWNlAGb+fK/uyZoKmJqgOBRaoOCs91yDg7+TiAXck/WRFKQgTQBjqOdAE/qQ
 KvyMoRVkJqvd+OQoecO07JBOdBiIPvzmH12+gZ7CnBF79/GXeeQfUVRz2qxl/Ec=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 937C1A4C5472;
 Sat,  3 Oct 2026 09:02:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkb-000000007Zo-0uAr;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:34 +0200
Message-ID: <20261003070128.1295458-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 002/114] package/python-argcomplete: bump
 version to 3.7.2
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
 package/python-argcomplete/python-argcomplete.hash | 4 ++--
 package/python-argcomplete/python-argcomplete.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-argcomplete/python-argcomplete.hash b/package/python-argcomplete/python-argcomplete.hash
index 81e556363a..4a09383432 100644
--- a/package/python-argcomplete/python-argcomplete.hash
+++ b/package/python-argcomplete/python-argcomplete.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argcomplete/json
-md5  0c612498a4b7b421aa870d47361e2322  argcomplete-3.6.3.tar.gz
-sha256  62e8ed4fd6a45864acc8235409461b72c9a28ee785a2011cc5eb78318786c89c  argcomplete-3.6.3.tar.gz
+md5  b6553ad23016cb210399570522f90223  argcomplete-3.7.2.tar.gz
+sha256  aad8b69a0b9969edb62db0d1752354c0d50717b10e0cbb00e2a958381b9fc6b9  argcomplete-3.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.rst
diff --git a/package/python-argcomplete/python-argcomplete.mk b/package/python-argcomplete/python-argcomplete.mk
index 520c2e5390..d93d20492e 100644
--- a/package/python-argcomplete/python-argcomplete.mk
+++ b/package/python-argcomplete/python-argcomplete.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGCOMPLETE_VERSION = 3.6.3
+PYTHON_ARGCOMPLETE_VERSION = 3.7.2
 PYTHON_ARGCOMPLETE_SOURCE = argcomplete-$(PYTHON_ARGCOMPLETE_VERSION).tar.gz
-PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/38/61/0b9ae6399dd4a58d8c1b1dc5a27d6f2808023d0b5dd3104bb99f45a33ff6
+PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/87/6f/5a73f04007ca950701765949209f068da628bd11f9c2da287278ce91e0ee
 PYTHON_ARGCOMPLETE_SETUP_TYPE = hatch
 PYTHON_ARGCOMPLETE_LICENSE = Apache-2.0
 PYTHON_ARGCOMPLETE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
