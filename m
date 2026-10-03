Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6F8CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EF6F40D87;
	Sat,  3 Oct 2026 07:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sK-1rqPCwm4t; Sat,  3 Oct 2026 07:05:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 859BF40CE7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011111;
	b=h/z/ZS3IzZPbRBK3k7eJBFYWAarf1f3ROlpPf+f9HMTDZ1p+YUuYdgdweXFK/jfP2E6k
	 LQl6PlXt1m2m4Fmi0QBbo6bdLSbU+IMlepaSqDRFhUdDWDTJdYu+jjURPLAeSU9f4Iyxt
	 rsEfkgUd7muX084w/X8C69j/fKPnoWbIHNGpQrzdlNyIpUKzyFHi7RTDWj5mLaKZyI3F8
	 f9Gd89TE/VHdMEWWz7xasW3qDPM5nhR7bdRHkOKUEXT0K/04sAzWd0FnonF69JAQkO8T+
	 NhEixtUzhT6lsCU3hGYU5YU0ob5F5H4weXRxPdZl6KeWefksZnPBjL/c1XSpgZOWekA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011111;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jsnev3op/kOyAjTO6ZiRWlXzfT3eGPLTXytvU2bOCPU=;
	b=e+wW3vd7UQ6QBD29c5Jfny0LG+faYozp/XdUd4q/V8j0qKi+ulYgKm+J8h8H6EWSQCE0
	 TivAPaWPugMzmCbW3jugq/FUuy0QEqc1C1WzqpH7Io9YDtxZdaAcniP3K7PSP//6n+B8h
	 4xSKRgO2Mn0O4K/VZXfUfNoDkRXfCZCffAoBWR7gYIjlzV5Psj+dmoggspmzouTj45El8
	 F+b4BA6tCd4j2kKK7AHP3i+Kv5UMhOdFzS5bRBXPN5KIbi6Gi9/e3IoMZxhSKEARYphoM
	 RLMsbLVyEh6eBqAVsIrm1sYv/+9a4N1q6+2+2GmOuw3ZB+PDvAJYeVJeFLCcc4trR8w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011111;
	bh=jsnev3op/kOyAjTO6ZiRWlXzfT3eGPLTXytvU2bOCPU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gAZRQyeJAURWTxt5FFP3l2rFkYsXUHlippGyrpQ+ZgkaQZOwsZnGo1a58GaYhRB7o
	 0vsGra/AHQ3QbxyBufY9p1BxKQjiDpDVV62TXwWWNeOqPIc8eekI4b8y5jSKvAKe7d
	 w6rfwYmO1z9driVivAor3fmESk9tbvW4TcwwRMc/OEw3ZdDzFDFqWCgXQjCzcZAQLJ
	 Jg751kK42zZU/kr1guApNXHuCWPP/gmppzCiYrDlyE78R4ysttv7n4+KmIvS0wtxss
	 eZmlZ+VttbLor/WTnWpJ3gzCJAfTljQBOP2eCc8vqG1xzKxf/PG3BMemXny3RjPUuz
	 gdl4EZ/2Crb0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 859BF40CE7;
	Sat,  3 Oct 2026 07:05:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A055263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5005781178
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJ697R082v3k for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:05:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4F5D281183
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011108;
 b=XwMoYePyQKIZ4dXu8QswWsfGfFzb1W8mA+0F5OpqLQlha9aIq28aB0vfkErsurhyEG09
 ZhtKoxc7PUocwF2Ljvne0mftIiIAuCGhsAbG2slJDcLJzIdE4ARz/4wfeV5AkN/yw+/rq
 imvfzt9yRxZKsN4JNKWDPV/hsVD7KK8fEovYH0LZSges+KVAviEm+KblBEDmaX15z7K9+
 yVkIG9WGjMWGi7RuihybLer2ZF3K9TBaEwsXwpv4B9QgzksP7s3bEUdbB/BkRai9FfCbh
 nHJZKlTNNlLCpPOEHnjZHO5goCrFnvipklwEyQfTC4gUREvHQZGlEkEF+6GXLAoQKaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011108;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=KCDgAce7AKkATXSPiS+uEXXMcTJ7HzjCuWZL+zgN4xo=;
 b=FXw6arqcY6RyQwX+iigwylxjXd9J241vfgAsRmg5eduhwqm0XRTVIWspS7PNPQX2DdFM
 bdvXy65SUq7kCfddQ8L783VWq833zH1h4TUFInMgHzO8Stz2f5+jlpFQyQIJh19dBE4hc
 0gJ0TfgVMfltJnyKuuctUUzOgnGg7uO7E0JjkIlDv32xxNiKN06uehVIUbcvt5Zx5hpIf
 MrmIn5wxvjHrbgz6SuCH2y73NgUwFFvDZjtIkVic6O+4ycqVmEF86lZGDd987bypZzZbW
 w3NhZK5iYkwA5MVIJG7HodN4ZY+ROuAwSrCGvKvmNi1aHhbOctNblUGt7kiF/G9T7Rw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GBwbGkkE; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GBwbGkkE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F5D281183
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010925;
 bh=KCDgAce7AKkATXSPiS+uEXXMcTJ7HzjCuWZL+zgN4xo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GBwbGkkEb1aGxJiS/vhBYt+tBUYs1x7onGhl0uccdis4YERIYmC+IoXmNXi0010kX
 38dZxhEB93igVKqLPHl7T36dV7S2ZCdl89ObAwOQM+rTRgtdQ7HtJXcaCG8tOrNDsr
 jY886e2qbFW8k67w/OQRdIDuOpShPO7vMN3AvnITuvPz0jBCCa4OYXOVjX1FE+Dn28
 KoUTWEHJlRjIylASTfyubqsS/aTFL2HeZc3Chgb7Zls8T48ugq+XAZfm//0203d1k8
 oaT2ZO2CssFPdJVRNj0ZkNcmgPuLbil+77XyULrkh/KbdlqoGgEluX0ZTww0iiWiE9
 vZZfPolhavlOw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 0UVih4bRgGgILyLJSYY7bYRB3VQUhDgrX7f9h6qo/rPCxTuCMIYuy0XR5/gFik/ELFkOQEtvoQc
 R7f6SVkr70y9JEi/VngPToXvPMpss43OPIdFNyb3M2Qu9oCaU4iWYVzNWo+mbaPzn7vngW7x60w
 +Be2bjar3MD+P2v3sxBS1S9vK2082N9Tqztesr3HScpgyAjIr2qiyc2q7gzjY/jmFA99fNB7GG8
 Ck60j6T8nM3Nb9rC5AS+pF2RdbT5u/7EFZ1FhJNx/meNWHmqY44DA6ikxCVy5FDmZaNQqFkf7xr
 IPcGmU4wgFpW7sf/w5P6weYBaoxFq9SB31Pa/ROl2RP6mvGhcsoyJ5c+dkdme2ANaqlIo6OVl+t
 LNlR+/wmCyZ3uUaj87op0J04tor2dFUU2MklMx7AlMXKTWd6UrUjfQlq36D1shJfuEASMK3Dk7H
 axEqSQeVnUbZcUPgiZSLPyn65WgIsazIaGaQvzyD45seKWVhQSbL8d/3Pj6JwvobswAjW+cELw4
 81KSylHLRgGP3xOX311NtePKFqlvttRZO1FDqfG7RUKHgVnr8yIzvNcTr+8M9iSDaWt8QPiTWTU
 ynF0b15DX03+WUDwtegFAfb9E5kc2/3o5YtGh+uNfzXMCaK/628lW0/U44PtnxbW
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 044A9A4C541A;
 Sat,  3 Oct 2026 09:02:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkf-000000007Zo-1btR;
 Sat, 03 Oct 2026 07:01:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:27 +0200
Message-ID: <20261003070128.1295458-55-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 055/114] package/python-psygnal: bump version to
 0.16.1
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
 package/python-psygnal/python-psygnal.hash | 4 ++--
 package/python-psygnal/python-psygnal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psygnal/python-psygnal.hash b/package/python-psygnal/python-psygnal.hash
index 29493977c8..6238dd5b4b 100644
--- a/package/python-psygnal/python-psygnal.hash
+++ b/package/python-psygnal/python-psygnal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psygnal/json
-md5  209e3e54ae0b019d43486e8abf9edfba  psygnal-0.15.1.tar.gz
-sha256  f64f62dee2306fc1c22050a59b6c6cdad126e04b0cf50e393ff858a1da719096  psygnal-0.15.1.tar.gz
+md5  3d91dd25a636441ee2aa6d8b703582cb  psygnal-0.16.1.tar.gz
+sha256  8e30df5e8f2a927191afacd22653924ba5ec54ca00f965f4af3ed38e37b727a9  psygnal-0.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  50169b145e35e6ae11a1e05cebdaa7052a58a8a2325dd5c394f8a68199c78415  LICENSE
diff --git a/package/python-psygnal/python-psygnal.mk b/package/python-psygnal/python-psygnal.mk
index e68497fbcb..74c3918e84 100644
--- a/package/python-psygnal/python-psygnal.mk
+++ b/package/python-psygnal/python-psygnal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYGNAL_VERSION = 0.15.1
+PYTHON_PSYGNAL_VERSION = 0.16.1
 PYTHON_PSYGNAL_SOURCE = psygnal-$(PYTHON_PSYGNAL_VERSION).tar.gz
-PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/4e/79/20c3e23e75272e9ddf018097cf872ab088bccba978888472656629efa4a3
+PYTHON_PSYGNAL_SITE = https://files.pythonhosted.org/packages/75/df/2a94607af05d91638646339acfc02d7c865821c21356ddcfef3d6b4c7fb6
 PYTHON_PSYGNAL_SETUP_TYPE = hatch
 PYTHON_PSYGNAL_LICENSE = BSD-3-Clause
 PYTHON_PSYGNAL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
