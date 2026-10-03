Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EECCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7140D40D77;
	Sat,  3 Oct 2026 07:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ho5fDj-VG4dm; Sat,  3 Oct 2026 07:04:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2063040D95
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011083;
	b=OsdohUHv0H5MSRrKIV3vuT47cH+4kHgaVYeHZwLfh1YPc657fUyNOYnF9cpv5SXcUEDv
	 Bvyx48oXp3cTS6mhqxYBwGUOZVlGU5tzUWCO8U6I3RGJYB+riFkh3H9h3Dz9xaBgTUmnZ
	 rc9+NJZT617uBPN1cfLZQOrCpaBK0BjeIqR2fKzKCsCQANb8BI2/xlnwMVKvTteyNzQvV
	 Vkdt56H/9SmgMy2XYjoPq0iOXYyQOq3V6qWmacFZ4JXC7XRMaF/WbtLExSPZfGz6qOXLf
	 9cU/IWBfan2Kl/FymginiActnYI8Jwc6W5JWFhF97w6BY7BqLPTQid+HygnidhyEa+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011083;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xAIaHilARsjtp9j7L3NVhlGYgmxLItasBbA18NdhbNg=;
	b=f77pjrPYdo1l6vxZeZTiH0YWrR8KOu0iIaJ4MyVKX7xbRLdfcpz/SK0HPpjlyNGizxLH
	 Bq1PkwKqUTHZbb3LHwYqK3JDeqoJLh8UW0axF4ModI9ZlHFdrMup6dNH4FgEwbrMbYLdB
	 hzSWc9veZ7DcQY+Yr8tDgoQzJ3xH/fB8KeIqzm9cvvaIjvn10L6VI4pXaWeBvFOmzUpLK
	 Yf8KaMgLeFySjTKATfZlrPrP+rK07PrzOxgAzvyNnwD/kHmBoEcVujvAskw5ujmrbvWow
	 3NZCE+pdJM+nGtSFYmB1kajwoEl0+ymp6mWoN2yARcvVjN4qimtusovP0T1YN7EUapA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011083;
	bh=xAIaHilARsjtp9j7L3NVhlGYgmxLItasBbA18NdhbNg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AyFq0D2Ek4HKKwrgk6l/V7fJ2cYfk6w46hDTMJJLKgrpvsWpwP67uvCRhIWGZDdkm
	 DEgiXwUGbTcPnAJ5dky8Q1xeeaJfVphMIL9efLEllTaPru0sY0BtwSkmzxH9JNGOQo
	 17RvovA6xuzUlqbPtGeDlQP7B3s+Sg/L9fI+bI6svUb2CDhRZhoz1aKo4GD/hHPu1P
	 LrvYPrTo/FFk1JBTqMjojBVWoieCoPYpxZzZAWfy8Wf8a9F6GIc73+UEvcOP5jwlgf
	 LyJj3boKkaoqYYw/YmLYGcEcL+p8MpH/6oVTarwyIYMInGOQBMbnTlHEXetZBBM4n6
	 LTWZrvWTyYIKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2063040D95;
	Sat,  3 Oct 2026 07:04:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96C50263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 881D460622
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUy2Q_FX5Dgn for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:04:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8ECEF60609
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011080;
 b=c9dzIvWLGEA7vjooeRSqLKH+R4qgNdIJmKZ/QAbmBH/1ZCd8IIuaSlJip3ZkAEzrQLL7
 2/tHkuw4sPmcMzH4GZxEnY45gFFK60rc9xxo9egbB009OBpbJU5di8Fv+SVP80s3Sps+8
 ekvXwhZMlom2m601W5zGlHYZMPogCp3J6TZ43+U/w3ofRg8FUMHR+/Xi6Hu7dHa1vUyDl
 oCnnbKgz5oQjnVkMp390LFKvzG21WxqQMAzpvRhp6/yblFeO0k+Wb9LzoAqxhPMJajvdp
 5PGfS5U/eHQElZ1WVTMPvS/nGlEjAtuiLJDG6rQyaUd9OjRRXrmAWpKxqevnWGeeXag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011080;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1WZZsDQyKkvFIqTB/B/eZc/u+jojgHBimKeADVX6TuU=;
 b=nPcjMqJd74cDDzKvUTalbObvFyezHTLK/Ci+cfaSp/vY7t8n01hKJOQ7cV2zrsXjtVIG
 PMbR05iq3xu/I48usRtS9DmMC8gPqZESwlQ2Fx5k9hHrhWnWe+zT02aIHGDSx09+TtXOc
 sIHKvMxSBsu8WJOQRNVxC2Skv288pxznggFYe86W1LQ++iVX5qab139kbJ4kb7hGna5Cn
 gcg9Z7js14DxqxMYr37DtIGpmT1XYGRCHRNr5iF3bdsr7adUu2xw6pN9ZJ4g1szL67fBU
 YZbQm/27sYCsH44uqlr4sNGQbJUhIk8E4RZW0slj+Fc0QJmUKZ3rh+lyeDqndl47jhQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LSDFs5XX; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=LSDFs5XX
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8ECEF60609
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010924;
 bh=1WZZsDQyKkvFIqTB/B/eZc/u+jojgHBimKeADVX6TuU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LSDFs5XXKAtTyTGRKtU2A8giHYptR3SxtC2HJORW719kZCp7HWO3nfWxYdX7j5LDj
 ptmopTSnv/NI8S5/5abNvUG1lGJgUTZcBnwO7ISX4aBqiQ96SdM6hayS4C6GjE8XFI
 fObLglw+6BJ/mEbyWn3Ht+55CCqTNfsuPyyFdZin/8c6lSor1tcnybt3ai0Gw5HwYb
 lgFcxKQ5w16iBgf9zRHTj+7gGhZp588qo7Zh04d4r4ZtDElH2CZLYywY10OF4KZ3+o
 7M01mPAuXjQFLaq5KacbEfxPdaUwFTfVyhiGg1xWLa8FBR4V33fQwIQxSsLV9DvEko
 +Upba7se856tA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 IOXSU/mca+YapLG0xtqrh8FyeQYeVBpDLaVPdahgCe7X2pmrCEZohAIa7Gte2uKhRoSMF/GEGIX
 HVxk3iTU+4laKEQJ2vltf6j1IPYBZ3QiAUnUGp5myfHbi7kq7V7EGqj07TMifuLa86JBHsXoil+
 rTOvEm17A1DwUStahZnQGLgE+2orsUIto1Djo/jRzTTZeWEzRLg7fJzR7lu2qFgrvs4as/Bfx2w
 p3Td0vULujnKia87ddDJWrkBp6XZk8eR6bI3WkUCIK402Viv9j0GMFLEvVncbcuwRbOZJ6sQUFr
 37TA24iK0jiYTKZ4gyMYbtxUA/pledPg38Elj5PokvtDs2CvURsXhBvZ/pPM8f7qRMmzAILI3ob
 w4LAvjIRYpJquC8Sh5WJsnaIA+HPGOk+yww/zJx7zEcCtR9xZprgJSaLYL7FOJ8wi/ceoDdHDZb
 UfWCl51/gLZkS9DxbMHye5dgrkRq6B9LgE2g3DFMLEmvznJWng9JMcSTXWfz9aIdU2OJxEhgjbK
 YQdLfGy/UbckKaV3MeVm7kHwqEMqTmJmEwPx0dc2VZ+qJz+/uV3cViHY8t96vzsJDVATZJy+8Yg
 RLmWkScx8bKt1zhNqqF5XUi/76qUj7MATdKZetuNUXODlYuEaI1mffiRKEdy0c0D8g==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D420A4C5418;
 Sat,  3 Oct 2026 09:02:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-3pYr;
 Sat, 03 Oct 2026 07:01:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:26 +0200
Message-ID: <20261003070128.1295458-114-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 114/114] package/python-cython: bump version to
 3.3.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/cython/cython/blob/3.3.0/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 3c33ad0536..f4495dd076 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  7cfc3278f4eb7a072446f08dbd4647ba  cython-3.2.3.tar.gz
-sha256  f13832412d633376ffc08d751cc18ed0d7d00a398a4065e2871db505258748a6  cython-3.2.3.tar.gz
+md5  df8ac911bb3c6af48fb0158160e5b029  cython-3.3.0.tar.gz
+sha256  eed0d93fbca7087f143b42c34b05a825849bdf17f101572c2105acfa49aa88b8  cython-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index f99dddc310..587949c17a 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 3.2.3
+PYTHON_CYTHON_VERSION = 3.3.0
 PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/39/e1/c0d92b1258722e1bc62a12e630c33f1f842fdab53fd8cd5de2f75c6449a9
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/a9/d8/4981ef716ad0e3ff0d3ef383aefc6b03c4a88dee33b272bf8e0d833001ca
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
