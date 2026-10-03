Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFD5CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C8606063F;
	Sat,  3 Oct 2026 07:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sryrF9BzmUWS; Sat,  3 Oct 2026 07:04:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 35C8460622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011096;
	b=cv0CmD9Wmak7SjC5iHJuBOirgS8QhMpjY56Moh2AK500IDtW54/t2RZmPiq2AsCsL/xx
	 Wh5GnhM2frrG8EDZPNU67wN4rSvEz2CFm66bOcyv9IR0vERWz5D7eOLgTe4wRt5Qj/dBd
	 jMsdABsr5pGZrCe0YPkBl/ysfev/+pTgxXqsJnXs3Dv3wOVBTv3AbbM2jDNrAw0v0TNgj
	 d/3XefRSZtWSHm+cxyW9/4mG2iVg/f5XROqMd7hVKLN1f1N52cSOjFth6zZ74IP8QQj52
	 dnXzKR0q5YEg8iohbb5T2WFjzu/gjcV+ubtTKqvDkYblkdNZ/z1LKnPunMGJm9w8/vA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011096;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AU808bLknI1AYwdfQ8bHgEi/JscOaKyD1ZBDcES557c=;
	b=lrWB8BIbAv2+9tMu/XLPXRm4LSkfJtIkvAbjDImydCUztem1xeLgmZzUyf3bJGyAPQNs
	 ni5tI1qEQ/jJmOde2jO3FtjsDwBUXkr7XToSd32BvM8OZQ7sZYCbKdAezkJDYNqFiARZ8
	 1YJlQsr4pyjZgNUS7YPvMoi+M60dmtlBKpCe0ooAnbTaiHUmysBmr7eoiMvUpItKvGGep
	 JXG9uA/Cp0QskmS7CE0NigxzKzec+pSi3p/YzQYRjVeLBfPlYpfanDbzBUvjs67EZwQ/n
	 5yddzOY+smOeTWoSkMRr3RBzhUVAXU+cDpU5n5MVfHz8P+1pWS1v8B8nb9Ww/GleaHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011096;
	bh=AU808bLknI1AYwdfQ8bHgEi/JscOaKyD1ZBDcES557c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oz9DLVkbb+dRggTvv94+9D1e22oUMcc2LtRJiGb4bdqsqOweUryaO+pUgzDXOJEe4
	 gZBCthP0jny1oF1zfTVEIUp4HbkabH+rwwBhXSOuPPY1typD+VdEHq3YyPkO8qPEiB
	 34t2sRm1GHuqaqJzzmrtw/vVuWGCyMSIe41AgZ48h0dMWSCVmiEFqg6F8qYAbuBbp/
	 ujn/UqI8TFxIeJCLPLTYh4GDwYQpJY/L764ky/QuBctq6pr/o9l2hMCHtLUEEc6Hby
	 HKwSrjN1j2TFaTmEulYKudZG5jigUrvkB6RilrImls8BZ08Jbmahe8oyhvUHAPjg5A
	 Bc4K0jbkt3/+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35C8460622;
	Sat,  3 Oct 2026 07:04:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C89D234E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA7D381183
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfFTeazpN8Qt for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:04:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C963E81178
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011094;
 b=HsAflaEGQicXLOVoOUou8I6kHDPaMjYsYxMuPsSskpSv+FPuaiFGMWYjnvIL70Mylnsa
 2oRltujq1Kz7pB1kLw54p+39kOXCrm6v++7TFmujbTz2bnDgpJjdNpu8LFfFFlIsZh4wv
 QCKgi0MgUX0EazLqAp4YEbMqSUqNaaEsuyY76piyfr74wbvsfRmv7uxAs7emCJ1zAJpdH
 0rmTbbPSF5WoZoDAVWXEZXI+OaihvPHoF9K3WKkGTIWtKyMjl+fNGkMN/AACxEzukb6rb
 87ngcPYdKVoiy7LMc34SEcbUIanzmA3QwNnHq6p2RFemiwE+XMIgdCPv3FDuAkjTzLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011094;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=OllNWxCpVNX8DzUsfVrvZSywyawkBBiF3MaJ1QZiA6U=;
 b=Ro9TD89pYmhMq1GGTTkoaEV96uLGz/zOzZCw9WK9En9u5mCtn8kiV6EP/W7lsFA4/+98
 tzvf73zY/cojRZ9Y4gnPJC/fPwBNN11t6Xac1W8Xew3Sl4G6w9i+EjDnVOMpuTC6rT1ok
 bLDzdMT8sNNi+/JCtM29ygFEXcczwAUXD0+2nXDBASW8Smgu46R2L3/lu1mwxaRFvUDO9
 PcvgNFF+RprT6LTDQZsYJAIOChoiaVhPzh+3Sda6NmKNMhp6R6MJWD6l9UBl9RyqkmXC7
 jGLgFE3lIEUW7Qwx9il26PCDPf8tLKCVP+dCuO4E6LkCHfh5x3w3Y3ulcMB0iMMoLjg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QST2sJFI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QST2sJFI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C963E81178
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010924;
 bh=OllNWxCpVNX8DzUsfVrvZSywyawkBBiF3MaJ1QZiA6U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QST2sJFI0xI2ZL3AT8LyTqK9yBER5ccZaAqvKzDPpnqn/P/nJ802iJ+DkBcUGS/3d
 231NvgG83X3LCdBMS2/F2fHa6u5glp54u0fp8euK7HGR/oVtxUCY6QVmfljsumvBBp
 DNv2DpbPXiyCpEFyr9aJqifjzS91wGDBGeGPSbAgV1nuXOG6/8ZyG8JkXbIPvZeXBC
 h8wkhy6EfoJHAAl/3P5w+KMX0cZVn7FcGu1DsG7g07tHk/CNQz4B86d0eSRbOETJT8
 BHDyaXAE5vi7M8ANtfoF4zxDCHx5MYsrDjRKwayO1fk/5txoHpxATBH+aAphQR/EKS
 vF5mDqa9Uf5DA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 mwzYFxxbwu6ixmRnQ1MopwgJm5W01OWyas4SJWCtLyKwRe58gdw034028o7/C5KzYRqZy2sDU0e
 M/OIILnJqQ7Ym8uNGRu82aQL7UM+O3COkc7JQEiOgC+x0qZjGzGA6QF6MegmyEg16e4pvBc1d+K
 4YwqjbywZojWrjQNA0Bad/H1f+vBKz4nbo9ZPxmFYtYbe8GLz4lwZbr9fT+6YgsZyBf782q+7PC
 xwSlbIcYqliCUoUF31L5huRb6G5TvcoRVrhhwOHw1OVV8LjIn9CGpVVLaj8I6TFbrE/5vbZkOVh
 BgR9kwVZiVUTo5nX477bB6XFYg9yK0LkjsN2IJgslco1Knc9aLt06eveQuWyZTxZpcc2kDFh7mg
 ItM29r5YR94rSS+ELAz1zNO6ImERwTKTbLuJJd7niJOx3bBNj/j3cbrdHTE9nUz9gE6MwzrNTl1
 54QLdqx/GW0o2sRzqLzhANrGuIEQUOUPoKgK4IfUy3FjAUU3dB5Tmzs6jresgAT9jrAFhtpgKos
 VWQOSUeI3r8TDyIefTRydmmALdvAnkCq0igL7lkgifLlUqmUBvPit+mLdXq64Mz11VONLwdEMw3
 GwkkcXshiwHQYlBOlUDNQ0017N0kvU9STS4NT++R7qJyYOxSz4vR5sKhuKn/zGA4
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CF849A4C5419;
 Sat,  3 Oct 2026 09:02:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkf-000000007Zo-1I5z;
 Sat, 03 Oct 2026 07:01:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:26 +0200
Message-ID: <20261003070128.1295458-54-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 054/114] package/python-proto-plus: bump version
 to 1.28.4
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
 package/python-proto-plus/python-proto-plus.hash | 4 ++--
 package/python-proto-plus/python-proto-plus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
index 49e3a7025b..0f43e2e266 100644
--- a/package/python-proto-plus/python-proto-plus.hash
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/proto-plus/json
-md5  75ae41f8ad85af89da4c83b840087ec3  proto_plus-1.27.2.tar.gz
-sha256  b2adde53adadf75737c44d3dcb0104fde65250dfc83ad59168b4aa3e574b6a24  proto_plus-1.27.2.tar.gz
+md5  53f43e79ef6085de9931338147283228  proto_plus-1.28.4.tar.gz
+sha256  5ff7ecad828e032a491fcb86947801768e32237f99dd049b649965b892ae9a63  proto_plus-1.28.4.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
index 3ae0e2e908..6999d0a2b1 100644
--- a/package/python-proto-plus/python-proto-plus.mk
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROTO_PLUS_VERSION = 1.27.2
+PYTHON_PROTO_PLUS_VERSION = 1.28.4
 PYTHON_PROTO_PLUS_SOURCE = proto_plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
-PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/81/0d/94dfe80193e79d55258345901acd2917523d56e8381bc4dee7fd38e3868a
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/40/a6/4fbadcc2044034449b3f8f0ce82dcf3005d53f37c136642103fd4836a31c
 PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
 PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
 PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
