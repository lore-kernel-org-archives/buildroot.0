Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9149ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61AFE40EC5;
	Sat,  3 Oct 2026 07:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_t1r5o8QMQC; Sat,  3 Oct 2026 07:19:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7DF6A410C4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011987;
	b=TcLefBFlnNMhxtsnfuZNWPCS1+PHgwuNZ3dXIyGLCY15jBAv8Yo8kh28t6EsKsaK3gHy
	 LqKLQNnDGgHzJDFXmAmfsI6YYFw5GxfiV3alAnUmNeJup9kZPmMYiBsIvu5IeO1sY4RY8
	 n9Ngekci/Ha6gYBzhg2y8iCrPK8687avjMW5Lmae9aIMSLg0CS5Z2/LDfM+m9Y3NiP4Ez
	 X5XAEocOwXxnXLmjxR9mjWfZys4QnBNDWnwlYaM+F4EtqQzuQSKlrAnU328bV++D85BKp
	 4w/dNGONWCAaIkqiKFnFTM5GazytjTnun/VlE2c+/kIWyGyN8AU/Rsikkbe7ht0RisQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Nw+UBFiAbMmW6t2ReOeX7keq6HDXp3bhevbu2KiHtiE=;
	b=jJaqbzhlkSlrmdGgmKUDmQWS9hD8MSCjP3VSYzPMU2P3Hx6JSyjmQP0tbTvtWFiD4S+j
	 29BZuPbJNLkLbYqgsRUO+CCm6GPO8C6oMiFA2wEmVFhjevjIYA4zy6BU50YQqyHjqyvd+
	 Ok0Folj+oSsVF0QgR+yczxPRbiCKWHVElQz5pZv3aIVd2uCbrNgOdKtwsZPy+jpCMUjkX
	 z/K6uq3N4JyHLbm8LXLc4KPBQhRuQx3PerMywcCs3GiY/MDvNEFoEEcpxQKShFaisyO3R
	 huwXXloqQSc+dpjCcmhNJ2uGslgOH5Tz2ws5jcXiesSjcvsX78xmtgxVOwW1MS6LAbg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011987;
	bh=Nw+UBFiAbMmW6t2ReOeX7keq6HDXp3bhevbu2KiHtiE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p5NdoqSvoTQ7wzp/NlWYgYmMjJL5zePrj8UJY5Bepos6QDWD9/hS91YtBbFkvbriK
	 48QnvkcSjD7SyaO5ym8gxg1cn0gGU3UlqbOA6GJZjk15SFtkhiVOdUk+901Kv1APz+
	 cEiXGRQBEr6YVql5mFe27TZ6OSrEWJphH0eVTFNQz6VVzQZaj4zqWwiH9MamOjfBy3
	 A91LtFApaNcGUCG+ImQNghpNC82IUow5BHH9c9gWn4qQ6+wQZay7bwIQobcJSZTu0V
	 X0Z1EibXRRiWBQUfxhb9PGmbLN1F6HWy62uBaDXv0wy8/FNOg1jPiOos2OIDaY5LCv
	 2rTNubJUIXY/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF6A410C4;
	Sat,  3 Oct 2026 07:19:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C785634E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B73DA81183
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZ5A0avWFMqR for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:19:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BD55181149
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011985;
 b=Yo9JJPftdvN1m8XZusMD0vlZ6zgUX8c10G15nFscgBdhC7ZQJ0EqwHaadCcaioXxsxv/
 FK4KzToQ29+Rp78CrjE5GsMC+4vkXKD7jueKPvhereXUzNlTle+aULXxDaVELiIH5BxoX
 F0lHzvGReKLhkV3mUDtIBGv3IVI+3iK8LxyOFYNnDXxDhh/QuMSWiDbyx5sGxee/jeUKO
 BGpfwQ+LIESump2nI6VV8RcmB+Hk9hccP2yoH0Bn4NbbaXSciyYPRsKtfMEpUOhXUdvp4
 FbUJz4UIVcBUJTZ02WtfF5xSq+psNHB4GWJeynZZM2osMhox1uvepwY6aWTX3ZVr0Qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011985;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=xd1il5CHsSR7gcPbEPLv0vZtUYEhdH5LSyWbV2cnB2w=;
 b=GFPe1aV4zBZsw9o1n3c/UxD1OYHdr/v3S/LUT+FPdVrArrY489vo/dzWjiJPKz8btjGl
 QU0q2YZCL0FNmdl79L0MD5IlQ9aRDZ/9zU15NN1xdh7voKALlp/npMLvCD5J4P8whk1DE
 Y2C6FAM584ergAnk91yw51VqydfgHi6puj3xYv89htPCCYLgvrE44/6Hdp/hLPmL4bjxG
 4LxcBGrEhnvyi5I2ZjrKEca1F15zBltFpN94FVXyi4M6IrNdCSsYTXD/uVqY2pR+vEPL0
 nZwO7ufnoCp+Q24MuLch8iyrQfKxbv4KDE/3pNaNhOpZge6mEZLlpbMvGoI3/V+rKug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rWbUJOKl; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rWbUJOKl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD55181149
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010938;
 bh=xd1il5CHsSR7gcPbEPLv0vZtUYEhdH5LSyWbV2cnB2w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rWbUJOKlYoxy+ZQhYcbgEuUh766FO6Jf11q5y83kLkvD1cPXw5wZwusBufW0t/jdG
 jmL9TTvmQlEPaNj7HHyy6xnWLhF685fG6798fjxip1oEQdUo1Sdk1VKLTIIBQuF2Rg
 bgpDEdnLb44KDL/wtUCQACX/5bzCVIecmR1x5ba1j2bQ/mzLheZwAESftAkbXxj0s3
 wBtstFokDtk3GWe7b58JLQQZzG3GLg7nH56BbuxaMAmmB7QKxK63oInsfnR40HB2cS
 J7stjeoJosEIlF5Ah4LTWSNHI4/uM3au/6T56IJ1tXv/RCRwkqWhLm2WnmNAML9O1F
 SGRtc3l8dICAg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 93qOvfFTj1ylzNmDfgxDvGRQCLPSqFqvGAabl70FvsSEGErbJ4nuHMB/o9PpJhFaS0s6Q5bo76U
 qByR65BwORzJpzzgntWMuDzMk5C3iL84570fla/RAXgmlKl2byVRzFmp7qJJXPjmvV5Tls6nrce
 /LqvIWjEKM+lKZJKn5HqVRp3AljFFvGEEVJDYQktLAi80d1F5vAHSyizB3DkWxaSE+Eo0Qyoz/l
 mraV7Q5lt1llWWSgoTd03V+ltpTgtYKNfL4D0hgGvT4bOiYn+7tN+7BuXFUtbC4vNqa5y91Tp8O
 bruOHPHJT6Q96ZOdOrC8EeW4sAg52Qz66k0zLwpQQupnOhrsVGENfA3cSzFITLNqSIwSFdaaXFF
 3fOgrcwATzkyf5L8oo0UyjgQw9gNIm7RnG8FqCqiLLRxsx+aQQsmfwHE+s/5XNMDE17hBitukEQ
 9ZgdFmkDfXNfIlS0vkIQizNLxUp0M1Wx3CPYRWn6jj7sW/VVvBrnie0KHk0iO00mE+flr6Ibq+V
 Znm+tflqP97AQFqfc68rjHVFf4uwReAjmqgxjYce5co7L7yFReojF12fbMfDFbGk1Nheln1Fi+k
 6/G1XOZImwo77eXW6nqcL9hk8cHEm4IuNNqUYaONhyOXnptihbaVYJWFxVil0Ido
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0BD2A4C5488;
 Sat,  3 Oct 2026 09:02:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkd-000000007Zo-08hg;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:58 +0200
Message-ID: <20261003070128.1295458-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 026/114] package/python-fonttools: bump version
 to 4.66.0
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
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 9218c8dea4..57e03d1f08 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  cd04d1eee484599b2fa502b3ab5c186a  fonttools-4.62.1.tar.gz
-sha256  e54c75fd6041f1122476776880f7c3c3295ffa31962dc6ebe2543c00dca58b5d  fonttools-4.62.1.tar.gz
+md5  c9a3637bc4d32de7254a1cce3212eff2  fonttools-4.66.0.tar.gz
+sha256  ef0610dfe7bb5bf574d9bdad6f597403ebc9807d124ac6f148d7604b2609be98  fonttools-4.66.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 1eb8224197..16979468ae 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.62.1
+PYTHON_FONTTOOLS_VERSION = 4.66.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/9a/08/7012b00a9a5874311b639c3920270c36ee0c445b69d9989a85e5c92ebcb0
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/a2/24/86f9930b930b97fc82266083320f3c34643ef67261c32651e893db525aca
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
