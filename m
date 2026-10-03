Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56A2CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2B1E41167;
	Sat,  3 Oct 2026 07:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHJ243qxyOUo; Sat,  3 Oct 2026 07:23:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B75C841155
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012210;
	b=Z4L0bQoNPqnyHg7NNSGqnGKI2TcTm0c+6S9KOYHcA13eF8v4dlT5Qd63JFcVUyoeWHFu
	 eCU+q+URjXZUb3eAXgnb9FLf64gbdVNHBQJfsBLJC72x7n+QCirwLMAXjleal8zn7D7Ay
	 SRPFKgfpssWCa2u8Sc6jrWada/X0Fe6FF+ai/gNwZ/gxPcVZhL7zs7wNPzUcl3Hdu2Kzd
	 fflh8xPVVJZD5xfNDxsiiD4ZCuvDpAT70MBPbdCxW/uPhydwth/eRIJL57HUhLSH3il46
	 afQC4iufSgVn1OGFAhT6Q2FCyr1tzdNQOoOm0IQjG5DH6zTdfNmVy5fPUIdRmrkoCZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012210;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sbJiYF5f/l93V7mvAaE3FaI6ruWqwx7lfEeHzef5qoU=;
	b=SdfcB23BZRhFKU59tobhceOcyESj10WCeVsJCXcBT79LEJ7gmitCsVu12ZxQvI01bZa6
	 8DKOA27pPVQgUyezKxigtHkbLJCIPBPZw9xQKMtFb3QWPyTuomHgYtoJXJcppHwPiRY2c
	 q20ako1tBoPlRHH7CfAqEFBqr8toaprQr/rSt7XOvRjwrlkYwDjz1TwyHtC9AUZ2h04rS
	 XOMTMdU02GygvD/B7xaF3BZulbF8CPamfJcNyKeqAqdVmDQTzUxI7EOUqVcUwZv7Z/EeV
	 7yyNc9OBIeBzldOhzv4Ah3wyVyYWHish9BSquFCuy6K5XoP1esizvIN7cfe/uj4BS3Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012210;
	bh=sbJiYF5f/l93V7mvAaE3FaI6ruWqwx7lfEeHzef5qoU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lmZbbIkmHX0622p8u1FqPFndBRK0ZvH+kZEUsITvT29sOZEu95FPRhCWTSmGrqVco
	 E48KOmXP0RiMtBVwOFK1/uxW9BgeBH2+ADRWxNDy6zK3kTP5XQ3802U+9mHR+IPOyE
	 abbw5BWV7IsHQMp4n+Pw00Rj7VMU/nGYT2nA+cqUDKK6trjrXtg/PgTdEtzROllZd5
	 i6chcjBCe29FMWwIqeKPr/yfd3V3C6N9Irvyf59UMwsFkS69cKDxqz7piTRB+1xZVt
	 b+vPiuv3/Wi6K4evSuUCMmcrAihpzKIkQTr3LbSi3+G5uugvRuGcSCYVqWXG1rQaJj
	 /gHLF+sbhnPYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B75C841155;
	Sat,  3 Oct 2026 07:23:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE648179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94C1A40064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKoW4vaU62XC for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:23:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A3B4540059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012208;
 b=NuLcBh5NBxdwxHrIqrE07EQIDKmRsmKj6txyGxsrYmPTwEN7p33NP61vBxdRiOZXS/Pp
 CWgwM2iS5r8CEg4x1kEDc9YmXSxLfCpGPrinLsH0xL+DZH7l7XSZkYtfIIjafSpaZgKkQ
 7OUi9aLlAnB/dpj6IdGNBua7r49nllsi5LfR1vEXeWLE9B9WTO3YhibxXXlG5sNdbetSX
 j7UPqOislsKxGpnbFym1ZkS1H2R3KiPNhWHacgJMUSZ0I7FhawmmmiLplmGr6Y7+S2ejj
 MGW/eF0AHQHYvclO8O3s6iGOKMLPJhQgxAC8gh8p95yXZkYGmZXki3KFNKPwCoEuIpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012208;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Dg3xB08SomvRq+YhFlCaKgiRuDXwpVMevBVvq6UhLSY=;
 b=XO8Wh6d3CU8pYGckB1m1gXKCoPH+jScTizxvbnWPoRaUrgkOq5yDBhIYu1Tv7yalo2NY
 YDuSorh6l4SV/OtWaYaUH0dy5gNfMqGnYJW86O4OazS3VeMp3URzGPDNPKUZfv4ZddoX5
 +ibnLvoxn5KHvsMzymqNWl4on++kcvn9hvDajbqd1vWkBdNG95wgnOwoUu9Un35sidFjA
 INn89o8ZHT5HBXhQnkhW4nSnvlvFUR6p7/U28Hk7LLpKQaLcTmIeZwUo8F5xf23UeYWwM
 vlzIiHg3E+u5zfIeMBAraRg6q34PoQVDfnAwuRBnmggijUzb4G5dI5Hqx/GH97G9TNg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=E5s+1Dwc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=E5s+1Dwc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3B4540059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010942;
 bh=Dg3xB08SomvRq+YhFlCaKgiRuDXwpVMevBVvq6UhLSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=E5s+1DwcQ1u7r1e2QSz2iAgPX20JajJLn+AA1lO1yeLjsrEHEbzrBxlRGXh8RyUH7
 mbToq4uwetKtKL9xmYkokZZ3HWb3Z1x7ErkHdoQINbu52qHzS5VmtQRWVc5ac0/i9k
 H6DMVmqK+PHOVloDot1TEzkuoWsTDjCdbHk/cCK7t0UybktZyH5iQ8fWRMOTnv4uYd
 FFzDSBrSkJ2t2CqAkduA6f2qLJRkhNV4ppUBV4fueSNrtiCx4h/6CqQUrPwhg4Wktg
 afrYUJP0q6IqUCKDSH84/AsxUSK2KA8FRxub5uqT4hT63Pz4lZPfttx6d/tdnK4UKO
 nMgMRJe1ICUwQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 eBslnvmhprzQBvKB/9VmuThBLHRQKBw6Uoy8sKuIs+J3Ij+QfW+JTiOtx8/RVSP72ZccHfj9yq0
 ugZskI9y3MleUyIEntkuAIG4sjVxrdcxSYN3NFItAtr1YH0nB1OHIyqgnkNP9UK/qfUMbEef9oC
 tdMjhG0W4qgrKffUo7iZNOerFwydKOuY98yZXnWQiYfyuPlLJZ+hFEkNdGdLecBsbbB5N3IDqo7
 3fF/TTZNqCd4nfTwVivx6lelYipdFNvTZn8DOAxfX9GK/Yp/MYXketi3dOxM4aXnDVHzMJuymHI
 Vz9mRZeXODbECFTh+FC4gjC0KwEKGc1L0+3Aye7m3ug2VXns6CWFCDAP9kXwJop3KKg40hWCfQr
 T+qSNxentaW02De0+wQjdodjIxdVbtN+axg4g/tsTGsVgo0Dan26gaWjJA/EjbUrafMOAgHM/il
 clMSdQWyUz4+HwiC6UiUeOQChjE6dRPM37TMUw4cwJIdFQtBkSPYoGir549hGOt02pq+GmNTriY
 gQQ8eTA74MJcZJvufgmTYZoz5+rI8I9aNhPUo8F3kfgq9o/XqnMQcl59bN3AqgtIQexCyHVgMqw
 e+Lj7apjsqbWW+68clWnVQWzqimqRKX7NbSR098nKUFdxy9f6DsKxiZwl8ux9nxM
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2C2DBA4C551F;
 Sat,  3 Oct 2026 09:02:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-2B1N;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:16 +0200
Message-ID: <20261003070128.1295458-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 044/114] package/python-mdit-py-plugins: bump
 version to 0.6.1
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
 package/python-mdit-py-plugins/python-mdit-py-plugins.hash | 4 ++--
 package/python-mdit-py-plugins/python-mdit-py-plugins.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mdit-py-plugins/python-mdit-py-plugins.hash b/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
index 4537d908af..bb29e571e4 100644
--- a/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
+++ b/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mdit-py-plugins/json
-md5  8afddf3e020778a9d4490f43ce469d2a  mdit_py_plugins-0.5.0.tar.gz
-sha256  f4918cb50119f50446560513a8e311d574ff6aaed72606ddae6d35716fe809c6  mdit_py_plugins-0.5.0.tar.gz
+md5  78fcde535f69c580e9bdc4393ef2a8bd  mdit_py_plugins-0.6.1.tar.gz
+sha256  a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0  mdit_py_plugins-0.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
diff --git a/package/python-mdit-py-plugins/python-mdit-py-plugins.mk b/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
index dcbec98089..c324f1badf 100644
--- a/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
+++ b/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MDIT_PY_PLUGINS_VERSION = 0.5.0
+PYTHON_MDIT_PY_PLUGINS_VERSION = 0.6.1
 PYTHON_MDIT_PY_PLUGINS_SOURCE = mdit_py_plugins-$(PYTHON_MDIT_PY_PLUGINS_VERSION).tar.gz
-PYTHON_MDIT_PY_PLUGINS_SITE = https://files.pythonhosted.org/packages/b2/fd/a756d36c0bfba5f6e39a1cdbdbfdd448dc02692467d83816dff4592a1ebc
+PYTHON_MDIT_PY_PLUGINS_SITE = https://files.pythonhosted.org/packages/59/fc/f8d0863f8862f25602c0404d75568e89fb6b4109804645e5cdfb1be5cf56
 PYTHON_MDIT_PY_PLUGINS_SETUP_TYPE = flit
 PYTHON_MDIT_PY_PLUGINS_LICENSE = MIT
 PYTHON_MDIT_PY_PLUGINS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
