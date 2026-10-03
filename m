Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC7ECA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B876040E09;
	Sat,  3 Oct 2026 07:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fhh1joSRNSc; Sat,  3 Oct 2026 07:07:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C0E3440E0C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011221;
	b=nbBalXAW/4Yb8hRYwieiroAEiQXMfk40d3JTKrJnMi0H5OfNV3vE5+RWVZ18MDD4HL4m
	 ShKbsca+s7jWr1mWdiFZRsOTikY972cAvpBO1VoHYgTad9AeQHn4j92aJWa1F7eJxBmJG
	 vfkjM6Y0kPl349g+EqpP0gZiDE4dG7FhSI0jrgkTvb7++A0WlySTXnJPinh6pm94OCQjN
	 CBSuP7o1FZGjVn+Fdg1J1nrqmg5IPlp1/qfhgCJwxA2pDNacYIlCEcmA39S+FkW3GM7tV
	 Zy6owmoVsihY4PS0chTNyl4MmZa11iCc7Lul2yn8rl2UKQ4rBsyO18OY+K+lXVukFUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011221;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pULVnLdziZJz5+fa++jE9U5tiM4Up7M5bF4ztjeIdK0=;
	b=c2RxqrmdaY8QB+Xnp7zrBeQyoOA+sCn/X8LnoigxqFkGCOUlFeArTzctCu/7fAxTw4pe
	 x9PoWWnttpDtLtFrbUrAEiIYjDKGf9GsEQcFtPoj1dgmfsc84v+0hydPU7j7d4y1B/TLm
	 DEGIJ2Qv+uUMRhbCTUuHGivf66LNCJwNCVQoDxTonjFhBnkVT43FV44e1i50HL2vqLKo9
	 oszfQKDkU7c3xO9UgE+soDjnhF2Pd0Xwlfq+n5wKBByItBa5FxgW8KoyFOJVbwVHvS9oM
	 k/y0DMoluRAJNzpKABC0+QdgIjdIA3XWS3XdfUTrnk4iLhkBFp40x9t7vfaqOINtWSQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=icXIgRfU;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011221;
	bh=pULVnLdziZJz5+fa++jE9U5tiM4Up7M5bF4ztjeIdK0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JMkpYmD6Gxae61YpIZot1iYiBDN9710ToDgh9cPPNfdf16GgvUVckFSzctJ0Obh2J
	 33F4vnqB1h9QpwoBtguu9J2JPBY+15mqMQNDdF/0Jgp7awn0lpZACOjtiPcIX62xB3
	 PgtYF1p19DPjoQDHsdwjtBLlx3V4P8IsWhnIUR3GOA/Ro6a4zkIVd8Y/Q8aD6QXtgB
	 N90jdul5f2026Rb4sL0yxBM9lgg26YNcxOfne1a8JxJ3zIPCkvHRzFgZUzNZaEH3nh
	 EwMA7UZ5weB49agxNy5TukpG0ASAQkZ3l+84CiHZ6sbSYbRlhNXjdGEPveo3XTC4Rt
	 2vuibrY9x/D4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0E3440E0C;
	Sat,  3 Oct 2026 07:07:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA2DF263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC56140E13
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SSFv6cHRXod for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:06:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F2D2C40E09
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011219;
 b=cmTYdwVLo4jV8z7vz63e5qHfk1qlxGd4WJTmC5sot8OKhtVFOupDZTCjE3DE1zoVFooP
 XtHQKbSn27Q9d4wms5mASH5WCM3s0pGv7dPmlwy8wy6iLi8edNtrtpYK8LL9b9XeOvOmS
 nkL8gINoY5v4ukVoJIpjNpJsIM4gZv74KxDcE8cTnmB6qnAPDFaTTS4nCDfOg2I1TVxLK
 nHiOtS8A64zqGm5jV7hoitMZJ9gM8IrBx9Pbt6fgqexnYC/gOoIAfAku65lzwTBo2KebA
 WcWa6HEQj34/w863pKnD4h+SAzsHnfm+FdjuMM/BtuZMXdRIqifKz/+0CPZUKR9HAEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011219;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=YFB2oV4dA+3fa8JyNGXAh36eB1nz9ph3DG4gaqbgkpM=;
 b=Es6hC7MeKW+yWpwt/S3RvDWNao/NhCCsmFUf4Lc96KLRtDd//1NPTPizW4vpmexR+Lbj
 QrRLdDvi5IvkRP2Zh3BzB2nUUI7xGJpz2k8zIsUptlDogowWW4MVafkpnoUmXsQrnUokR
 QRzUxUrdejh30MJQtY+GWKPVWYIIWAF6yQBmVHHrCt6OGOAs1qRGqpxZDQF4EOokoPHj8
 G4AnsmaSaSrLYnRRcDKdJQ0rVpnW5nPoJu2Atm+f6NFiyRt8V3e8a3hhQ4T4Yi4gQusGB
 BBwTkOx4yYX2sRfTYymL8BXMWIlkr+t8dL4e802UuI2cXlV7IWLFhwfascKqh3kDiJg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=icXIgRfU; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=icXIgRfU
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2D2C40E09
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010926;
 bh=YFB2oV4dA+3fa8JyNGXAh36eB1nz9ph3DG4gaqbgkpM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=icXIgRfUaeETf+E/G9DSpslrZ0MLytYuLBLqKSQLmZDYeWiCncpwcdFcjl9ZqbluQ
 nm6wfBKYKL/hXjlxf2qHge3yzInrla4X2n9l+ESE+F+219HFKHJ8O8zx3IrMD8uFa5
 s9bY7nLgFZkyjZXnRkzOWYsh5WKjM7PmXUzYvUQt2voWP2sgIpVnGuWhS1bD45Ok/U
 Pcw2153yCLtJVOEXtYaNg8dWPUoLbGa38VpGTBROhbZx3L3dMP26pNuJWODU+ymTJW
 LJbXOE0x2732b51r+UCVmG9Equ/vtu/5d9PKSXsZudG0NaQ7b/433p6gNJZzgWG0pk
 Fia5WwNpOv3rw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 MnNiup6w/ROxWsmWoJ6mQsuWXNyDWH1agS4TV8hKq1MCJKqp8qwpc0OLUWfeDTpHXIYzMeafDUX
 YAEbZG6EkFVSedfU6+4lCMooUV+9Kbgifa1SGv4FVzUKOgLsb/VrdYl0mE32kEoYE4mOmnaU4hU
 bXoniA82iQBVCRcWqZo2CfNii2t1xhGlfeviCOs5XiepGj4elUt9x9eA+EC04+QVFPzX1k9U59N
 du2EM0Y7AQQixcVluk8SeZTv6f+sItzobQqLFO6hD2Msf3lQLnPqi0wYkECFgSrD1QRJnTE63wH
 BUG/w2mUXdeaLjJ40LqMPBb1bJ2RNduBfM6aHp3OUEsq//r2xxLbZiqiKhizbyPA1jQIKjlgjd6
 igK+WRFj/Tfvi55jRMwKeiqM5hyNaD3Y3nM8KGE893JoesI33CTQgVkeySZpAhiEFc1SWTGwtoM
 ZGXi7qSPdjlQAZ3wEyZ0rvpc01rfM/eide7KwMaPdh6GqSMZmxkaYvsN11Q2eBaXrkhgcaOa0yl
 O1QNJ7v6avU/UNL2SV2odFQA2Rej4LY9jxosjFNnS1GEErRBOgfMuaKGFyb2TIlJnCjgOIa3Jg3
 2+G7poutooe8UCzMcqjqucejGP67VixNmv//nmpAz6HcUBtxaeqmWz6PapMuG+Yl
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 98C8AA4C5423;
 Sat,  3 Oct 2026 09:02:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-0PUX;
 Sat, 03 Oct 2026 07:01:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:36 +0200
Message-ID: <20261003070128.1295458-64-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 064/114] package/python-pyopenssl: bump version
 to 26.4.0
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
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index 84f4b7fa60..9da34a4264 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5  e48484d4a915a47a71064c10ede7e991  pyopenssl-26.1.0.tar.gz
-sha256  737f0a2275c5bc54f3b02137687e1a765931fb3949b9a92a825e4d33b9eec08b  pyopenssl-26.1.0.tar.gz
+md5  6e47d45177e87ee8f4c0963e873610a1  pyopenssl-26.4.0.tar.gz
+sha256  28dfcce0162b9211413e26dfbfdf1d24317fbeba18fc93c12400a1856b2a0bc7  pyopenssl-26.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index da31da5c5a..b2536de576 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 26.1.0
+PYTHON_PYOPENSSL_VERSION = 26.4.0
 PYTHON_PYOPENSSL_SOURCE = pyopenssl-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/8c/a8/26d36401e3ab8eed9030ad33f381da7856fcfad5691780fccd1b019718fc
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/3f/e8/7325d258199b159eb2c03fe32107533e2832e70e63f4fb88a6aa00023201
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
