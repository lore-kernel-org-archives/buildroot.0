Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67DBCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75A6F410A1;
	Sat,  3 Oct 2026 07:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwZea8x4TnbQ; Sat,  3 Oct 2026 07:19:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 860D3410A6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011949;
	b=HpJLsEwBkYcwFfd2uaAFSi2vAX3MtOpprDUxeMGj6nsK2IkVRifn/J/XuvwVBwGQmV5x
	 BF2Ev6cWg5fhGZbXaQ4wN3PYQ6+OpnFhLGDWhVjHjuOVdg7xw6LZw7p7SAdVEcfE6efbk
	 LAcBuxo86KjcsCMmzrStyCYfMYkA0YR8lCZJxNcVVRL1qzOaHnT5NbsiCY1/S2gNycrQE
	 linfo+lFW2zTMOA3Jmny4KQ8xN+pOGX6KuNiXoODCmsXYLjQ5nBLIwJ6zbY0y5W9jClGf
	 PxGfsxDr31Pt7BOGePBuje28SE6g3u0Uk8XKcOWgQZU+ZuV9RCmnH1LViH7iH0rhjAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011949;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LfJ0tPEOWAfmZV6wm4LR6ViHgLOsR67oZoQKKz3tcTI=;
	b=EDlQkGKSuEcvxhlccuykuHwAsiSR3u2pdJxIigW65+v99ZzHkfkgFkb2sPRgtOsurs9P
	 TGA5ZaC+pmXe+xwB5iDxIR/Kapq2sh9n3MXbgpZpfS7rqSHN3KQqQxdyvk9aUOqOPBrcA
	 If4YDw5AsDSiXaf5VN2v0gRREN0jgUMQHaLELQMRuPkIaEYy8XJmcdEcs0c1lR6fHxi/x
	 suhEu030eeKgQuA1NFMT1mgZf+neZw+aK4IhDcUf1z8e6uk3ySDwdyIGg3m5ZAW+P/7av
	 rtVcgfVcE/StWXeFgXVJ7ZEs4VaGV4uir2griTyz61tBkGm4DeiK/U1dG2awES2tSgg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011949;
	bh=LfJ0tPEOWAfmZV6wm4LR6ViHgLOsR67oZoQKKz3tcTI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Aql9NaI5+cSt1V79JL3yIPtYYxAwOVmp58jPrjVn5o6mgzjgkMbolZ24CQvo0zE3G
	 wIjBTiyuuob/6f8fkImRfYGS0TA+w2uxO2UlVcAMcDeG87pRQUTrifCRwBIHvxjBzp
	 RODcpip2S0bE784cevNZ9hrTrNckKkgrJLi7OyesVJ6sKHYkFsY2lg00ZEuaKyEjxc
	 N5oqG/zqenhruyH8kShXyyvO+hjFz+Um/8oV5uXcBbRGhEVbOSp/S+wd3e4o4ahI19
	 DqWWEHe6/DhRt8DD5Tzy98PhY10Vuhx/k0RkcZb0k8jQHWPgquCEKtpBxiBtFxP3oT
	 y5V1pZA89Q0Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 860D3410A6;
	Sat,  3 Oct 2026 07:19:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D47DE1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA75260DAD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zepua9xHg07 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:19:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BA31E60652
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011947;
 b=epLwzHFpKUJu9v/vrsLswUD7bvFNJGVVCfn1dG3SspRc24A6W17WILFzoLxtKWh4PN6E
 fTJCSLG/UDMcRo2oaBPvOhIP+I1G6XkRKm2I1eUsuBzMM57iPI4N0BQsvZWTb1wDf92C3
 YbDbYjoJJ1vjHgadYV2ut0ezvWTbja/dwpLvGEoRYu7tHFPxkzPTWeBcaek3z7ybgi7BD
 LuZ9gFd4LoLIzGdKr45EeqdK3ap2lhVBVTleyqrE1SCOw0NgALxi0mdr0gYFwq17Y89uM
 FiOS4oJDKfZx30HWZEMHKt/PXw/qkGsvjIdevSCTO82/kJVFfHlLV28keTcFkcK40Eg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011947;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=V0LDQubiTSz1Rf/YX7RVs6j0tzo+03spBEGrBnA7kFw=;
 b=TUFtGdJd5nDkl7iOjO3DOvJQqn6gDUWNoC747FqMj9bECDj6nP50i9mTae00DzxyOuoK
 BELIlEZsUzgKPapq5qt75M4+pv/GS8NCyn3DfAytNRLa/I/Kg6wHd0dazv3tfOII+y6C/
 Z5mwlQiQjnAUXWoGG0/Au/aS47IYPkU+Qc7YduKjMmyw8l/YwkQZefBKCghFTK4MLgW/n
 LJiFSKtTyUk3Rm9bO6IXHma0adHPTBn+/Fr2mTCoPP0oG697mNEXwVSTtjzvMS7zh1wO1
 tszzL/UTUi9tS6HxtbDpMf5ciUbDfw+wnXK2GAHq9LWJLwNM0mCEnnooy0MeaiGWGSw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=txeuSX8W; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=txeuSX8W
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA31E60652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010938;
 bh=V0LDQubiTSz1Rf/YX7RVs6j0tzo+03spBEGrBnA7kFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=txeuSX8WsBqB/M2H0fZ9UR1kBtjBITSVQGSXIcRxFmKZ/7LTHnNEmfrGO0nrIMHTT
 1TxVNIHingiTtwd1rHAUXlNgIOaASDH9wmmJu7vS1vWtwtcAe8Jyo3Muexyg4KX2B/
 Mi0CeQQVPtbavPMy7jDd64X3bGARkjLwlXPVTjiL9nzW+1F11X4C6cJwrwXYIrJ7GM
 olpGc3s+8qiTUWKPRId7efVsXsGftEDyaGoBZkD/LE4tCqaPUFt7zHHkDTJ9u/RY8a
 yatKwKTKEj375lGwTm/ecnt7iPwXJREMzx+3gZLWdPdWPC8OiSybhfVvetNyyoJa6h
 ebfz8yZlCnMAw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 DcFGGWhpf9MCDlX9acxk2jfcVEwmU5nO4USWDdywDRjcUT9LObLE6LPoNOn1cV3DIqZoBr5brz9
 jWZhPnDXI705RtuZgeFREYoeUTWAKUdCJqKfACBvkUkpfCsHT7f7MB8GYNzwp0P2EXPeoBoSUtU
 lUYHvzmDObszlDWfWtTtcxTFjzNOICQl10nJdn0PYTnp7prfiuYQ02sM5mvkDU973cft2aBRCGY
 BzaIs4gXIdYq04zf3FOZeV1W7E8lyJH1LuQVya//j6mUUjoyuKabOQHYJ8qBCLSpfb/ru9bRA9X
 AYC4lAHiOOQsL4O0P/Tr78hxV9HgQqykAbvNJ95Mjn/OoCkV0Tn7wHFTxCAm7cOR5qnvmkeyDSw
 /yjK+gGgesORBfMsKznPL2heWcwyqJtkXaWGZ0X5sxvZci8vzOhlzhPQbzeG4ULkyOqYnlFbt8h
 0QxZDoIb0vOFmewfy52iij8f3f3+Mwn7LhcNLcGh/rXsZg3iDpLo5cL2e76GPXZh1nFfbQ2+MnJ
 U/qEbofh4cTbByvury4U+3QGDG8RsXhXtxAQ7E9oT6rVrEEiEhI387vl5HHIbV3Hq8WW35dEZy/
 X8kvRFZhWIae9l4PKac0VmZMKYpX0oHS2bmBBX8tWr4JOs3bYIbdxClBWFgQN0JuguLhQeCKPHY
 hjjKfWJLonfNHWrokApQ=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1A366A4C5481;
 Sat,  3 Oct 2026 09:02:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-3NqG;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:55 +0200
Message-ID: <20261003070128.1295458-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 023/114] package/python-falcon: bump version to
 4.3.1
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
 Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index f7d2d358cd..6a78f0f617 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  d4d156864d62dfd93abc2fde90ad6fa0  falcon-4.2.0.tar.gz
-sha256  c13e86e49696d6655411fe09473c34997e49ff45e8cdf7576297b0ca71ceac3d  falcon-4.2.0.tar.gz
+md5  f6ed9db875cb6ea8d26791b5345cb0a6  falcon-4.3.1.tar.gz
+sha256  b5081be62f1e2d4f5140f4bad6993fd2bf8b1e503ee7261f56d324b87e41a67a  falcon-4.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index e6ad8f5d80..44ba1c7bc4 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 4.2.0
+PYTHON_FALCON_VERSION = 4.3.1
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/ba/15/5a4d8d62e8b338d2ec4430965b51b592695e859d0c6bf104afa1ce927eed
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/a0/02/a51af369a4feded77801d744f2d4669c7fa0a294bc117acf6ee06439937b
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
