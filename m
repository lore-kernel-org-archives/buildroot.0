Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E69CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E664119F;
	Sat,  3 Oct 2026 07:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLQXcaSuJaod; Sat,  3 Oct 2026 07:24:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 47A314119A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012273;
	b=gQodI55yvX7KgUtO8IQdZRsejgSYGtXIrl7LGfnweisObtVF3QIuyJfKqKmdKEGqkuBD
	 cFSsecSk/CeW2wI6NIsHg//QR5dQ607XRaOeB6BJXOeN7S4oDi/VgjAwWg4Ye3ztHKfrv
	 +LDtn1ydrmGUj16BBXvVmUCTG3SpznRpxp+Yvaj1ydrahRb3/LidBh1lBYAksuKI1vAvd
	 3P4hnGVeWhnafBTx8bCL6/Fh8w4GZjJZRgnIZKVIvjUQd/6sGb/Nxy5M/nQL3ypYd98yR
	 y38ENmI82Pgk4Htm5+2ZvOfPnlSoEFQRU8MnbsxgBqxTB2ZjAzR0tEh/jkmWKMJQ2vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nIHDLTnjs6fLklb9+gC/5y/Y5GeEL4ixq7VNmjrGiY4=;
	b=Yw3oI3F3d1x5WfMYzP3q8FyFWeofSpWDCBdBJaaqnLU3dBnjF65mGY0yFtqFpKuW+NGF
	 lR2RiK4jYdqap+Ujt36Q6W9p9xUIAzqIw8md84g+unPmuon42A0rxZ/V6CJVliBL4TvwI
	 tQZ+DdRq17S/GbRNKaclNYw0TAeQpDtFhyRLlxS/5510dNOHyqoqkGRzi+WhxZL6hRnD6
	 stLU/633UkhJFuiWEkjVBmVbi4QKmVyigh6Swu7D3FS0ZRjAX8FKlWD4zsc3L5WgdejZC
	 Pe599JvtPOJ5gn+t3eOI+YdrU4hnQz14hcWC7QYN+vLqtzLjeNZf+2W4FfM3Paiznjw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=KLfSSbfo;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012273;
	bh=nIHDLTnjs6fLklb9+gC/5y/Y5GeEL4ixq7VNmjrGiY4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XnFgri0N0kbhBHA+NuS0trwoBYGEghz6PzhXlt/M6yF1Sx5+5Th+S1auhkRPeaprc
	 cyRCTF/+ZsvUqYhXvvhR0BXb8xn1/94qN+Dxup9NTvFLtWm87Lqyy5m5H4p1CutK3o
	 gKaDKO+9coHB2TG5AHxGszx4p5poZTAtnbYs9Eq3Tt3cPBuckdZWpVR+UcIQwZpkrV
	 Kka6rg0SyWNF7NGm4rjtG2O9ISAC72ldcjJbZboyA66Pxp78QY9snVL7txoyxDOJYA
	 Q7fwYrM16BY43QSWcdnCIX04ZjpZ5OXRsGkB74DDUDlWyo/YLMF9575+4bCSiOZtjJ
	 DX7BB+DCttkqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47A314119A;
	Sat,  3 Oct 2026 07:24:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88247179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85FEE4119B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NV_m9ZZ7ZZi0 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:24:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9D77641194
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012269;
 b=S7B13ZSD2fmaKNs1jOGoQsR+t8++ovCpP94xyQf65DnaGgC3rtgZqG4Z4TNzUmoYoqmr
 L7SM8aKAk+JfktR0rESRAclf86rmfzgV4Z2mxGICK+FCnH3W5iFQCmRr5ZGSyoPNVNOSl
 ARz5dkezNN3i5zvST8RBVzKnlFge3d/SDHZff2SAUDi6hZV2FwzdKCc2nfehGuKtTJQVU
 VsZdXN6hRoE7Nb2BU8XQYgIk2vPgMBicqWRNThylFPe9/EQ5d0JyB7IHHRYhR3fOodlU+
 Eb3DN1vFc73NZMVRxYwYRKqTwvo/OrgJq4EPFDup1qp8eaLhb0WqfmFYZZ+YFwRmlJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012269;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zT+tuH7DWlS0m1F5LE7edTk+h6o+QYzs3wYg3X8rdBU=;
 b=NAWFgJbA7EDRl0nQI0pE01xJb9LEVkV/o6ySA4et+o4P6o4f5YmFdtT9C2OO+PEbyzTk
 Vau+mTKFYCpbi15mIAkgrCQHoPovQy2XuPltltCCj/eCViN9HgFlxjsI5n+TOHO8WjI03
 TYS8oYDZex1Yndpj5Gb9QP8kdLNTpkS15BZuB5egzmhPYQeQlwykELqOBkTkBEN5r5AJ6
 /4JBtLS/pgGgzvH8Ex29lHLRoX25yKOp4h6zGgZSamJr8Ce7Y1OxTVaiUWemHDLjRS1Cs
 g3Q34H2Ubj8JSlLDO9oSRvCx34YvJr8U0QBDh4joUEH1TFr2aPfAbvsMSzdV9sOlesw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=KLfSSbfo; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=KLfSSbfo
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D77641194
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010943;
 bh=zT+tuH7DWlS0m1F5LE7edTk+h6o+QYzs3wYg3X8rdBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KLfSSbfoZ5XGenh1Kd8K91Qx8M/6S+1QO6AGCcYU2GN/W+OwhWsu5RodkBiLy0H5F
 8dGSlkQC7qWGkzBE8eLiw3OztLJpTrPW6CmmM9FDpHDAxhob8hq3V4aC8U89AOl7Rf
 KTkWXuRUKnSkcZhixb9vYyeH7ceS/0ewW90F/m2BgAX6JtNS0I4D31ZAardmfMAHgV
 ZHEL1WLcHhOcv34VZ6FlLI6mNVPeGO4kIVO3F324GVYbj9h7BQg5yoCncDkv3u2+nT
 Ykix2h2QiIjAfqCn6tvbgQCewT+DOj5WJ9j4F2njbpcl4L1M/+qv9A/1MtQjjgDoKk
 WzquWaSqi1X9A==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 gM/GNIxc4UMCy6OeMr9YdHIW3RqOsjghqh4Gvy/lyLRlSja0eeF53KRSg6YFdYsCpBGd5+FIUUB
 tB3x+6fD0nXZmo+HsnnWD9TvqeiQqf5or514D/z6Q80ztxP4BGoXzLCvzHo11gZAoC26lqd4iih
 T8Q1VpXIwG5/eAE3e9yJc85cDItt9taWIm0S3yh6V5KFE66MaC2du3ltG36mfFU220pyS39ISGR
 w2NXP7lSJO9J5+7CX/Edxv9gGdCyX+L2mWyiy+lLFRv2ow2MhcVLDXcyoT3iatvTtuhGv2ew58H
 DHzNhRzjXQLg685WQnwK/ragGrUU0e63wcEpquEaGqvwIl4F1j8JXBbpIfdX4sxNnnkxeb9L8kX
 eRWmMw2LsT/lrbG2l/QOb4JMgFa/tPIpjcnK9V/0W1028FSxc0HnY13IHoDznhA7i4MCE/pRHYg
 0p6rBUt0xeuq2YaAjgqMF7iOFnlb0G9aCGrgPMUHS9deG1Y/HcYHsErk6NsmAOviSPp6MbAWx6m
 nY3HQIWG+VV5LxBcd+D3BZDg+ojqS0yABiCArhNxKIXZgqYA7WOGFlAqAPcp0S7n1+WL4zrz+qC
 VxnEhv7coZtkBee/xXHwHnxIwW6FOdaW+YONajRQs31XpoXbkzJqoNulZt2MrHnw
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13A8AA4C5514;
 Sat,  3 Oct 2026 09:02:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-3pXf;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:21 +0200
Message-ID: <20261003070128.1295458-49-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 049/114] package/python-mutagen: bump version to
 1.48.1
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
 package/python-mutagen/python-mutagen.hash | 4 ++--
 package/python-mutagen/python-mutagen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mutagen/python-mutagen.hash b/package/python-mutagen/python-mutagen.hash
index b2d846e7b1..241c84d6b9 100644
--- a/package/python-mutagen/python-mutagen.hash
+++ b/package/python-mutagen/python-mutagen.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mutagen/json
-md5  aa2d0d73e71c5daa1a730f7b94272357  mutagen-1.47.0.tar.gz
-sha256  719fadef0a978c31b4cf3c956261b3c58b6948b32023078a2117b1de09f0fc99  mutagen-1.47.0.tar.gz
+md5  90d74b6da76fdf31933766e0e0d83cc5  mutagen-1.48.1.tar.gz
+sha256  8f95637ab9f6f305cec6bd1294e197debe207998e3e068596563c74f86b0a173  mutagen-1.48.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-mutagen/python-mutagen.mk b/package/python-mutagen/python-mutagen.mk
index d42ed27e49..e8d04e8eb5 100644
--- a/package/python-mutagen/python-mutagen.mk
+++ b/package/python-mutagen/python-mutagen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MUTAGEN_VERSION = 1.47.0
+PYTHON_MUTAGEN_VERSION = 1.48.1
 PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
-PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/81/e6/64bc71b74eef4b68e61eb921dcf72dabd9e4ec4af1e11891bbd312ccbb77
+PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/df/70/1675da133ea92227da41bf5b24e1c66be597ff736a1533ade41da986852f
 PYTHON_MUTAGEN_LICENSE = GPL-2.0
 PYTHON_MUTAGEN_LICENSE_FILES = COPYING
 PYTHON_MUTAGEN_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
