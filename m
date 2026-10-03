Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533E9CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0759C6063F;
	Sat,  3 Oct 2026 07:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uM0i8t3kEb6j; Sat,  3 Oct 2026 07:05:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 17E3560622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011136;
	b=VcdKayfDWT9qja3Cc9OEqxxR7VzE/mZ8zwIH0J00EFL/QvchrsaOUpHtRGdJGZRJyEak
	 GDNvXCT2cS2Zh0CfnaeSNJe7V+ZTtsDt7blRE13CdcLjesbQw1Ia3v4VpL1LYnNUUIpLQ
	 GpcAqcZArpYHRLkk/Mqy3sjJDu17WV8MCun5Z0B7pMYWZHd5JfklZNcfwkw/GUk1S7apH
	 Wy3lOsbrrbP05pbe8llu/NEkaZJV81jwVTVYEryfHFBPL137kBiX0gooj2yMXtrXwfM64
	 8pnoWBFKSM3HNGI4Yx+YqCbdJagZAmMNSOpgdcv9WuOrPxPhmqv2iBJ6i+t/j6cZEtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011136;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ylkFzaUGgMy9yf8v4i0vcNJM0qlie1fhgPQwHBWB+jE=;
	b=T4Cx63ytHolKqT9mN9Mtj6KJP+gyAun3pyr9zFwHPSHfYUo5S17fX3HPYeAq8gcAhyBI
	 XOCAbQwCoQWnW1eIBKX3DLp5WANWwSujCCQ6IKE1e7LApaHp7lJ6Vb7yGI+O1JoCeZiTf
	 L6W3cll+LemQkw7uo8ejAd0C11frfsP+oCntIbAyR25mqNA7xddcIKR2uuw9qBAKa3+Ca
	 JGOmfiBjFnJwmC6zD7WRVfaBGVOMayyhCxUKnmCScGAooCHJKHtQjXwi3CL2eXWgcA2fI
	 eaMM8FE9ZW9yXEwETOrF/2MIyeZd7YKGD5vQ6PuwtAngMWEG1/R+TC1XweWnigYfHCg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011136;
	bh=ylkFzaUGgMy9yf8v4i0vcNJM0qlie1fhgPQwHBWB+jE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Kw2zXWaFvIjN3lpdOG2cR1n+hZN1+YwW4koEl0wlE/MB+GSPxcivfIMRezI7t2svV
	 mTHVwe1QiFLerastUp2ByVBbOCR+KpfPK8/wgMtfEU1v0HbDWPt+wHjmFxhCDJiVAQ
	 edGk5Zcpm65dROeTgS+BoNAIb4TWcpMl7PzsF5wNk8Ruv7ECs/lgZ9MhST6zxDNjh0
	 my5PANnK69t4V1o6hVLhrBkxVNIUNQSZI7ZnIJSDWuK3c7/GFVJm2+t1KTQwjU4hmb
	 sDuJileSOhv74IpcmtFlR1Iri80tTnFKO/DV0lK4s/rQvDe/nP0T9Mnm+kUNOnTY6T
	 16zEwpBM/2rmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17E3560622;
	Sat,  3 Oct 2026 07:05:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68C68263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EBF981183
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FU3k_z0_9mnb for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:05:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6854C81178
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011133;
 b=SaTyF/GdrMS8kX98USwqrwnR4UWl7pBkdEomgJO+HhLSSiz9nLBWF+CDmcKj3jVB3y51
 T5Tii16anOIYVmV1u2LZ1niUyJVst3rjqjE/a5vHDnyEeSCoWFAH93GkaYxEz8JImuPhf
 yGA/uNC5FweUyT7SptVBQn1vUgt9/lzUfpdcxqKNTy8UKEA+JYFvP4AaZnYOOIp989asA
 bn5vrXezvluFV9Tk4wIdbVVS7Mf69pNKfCy13+mhfkg7FatiCrek8Nr4NvbDfBAxA8Tt4
 cg5l7U1WKYwcisheLQc+slatu9Ye/qBcIgW0hxLscbH8i7vwrmSkv/AAYKUb6+pkLVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011133;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ANLRTDDXDc22foVCFZaXeMzkmLmX2dT2cT1RXTMZPCA=;
 b=Dkq/Q/1lgGjsaa5R83Q5D8cRLe5/bPtWHjl5LA2o/46Hf98VxjnD+aw1IqijlaQxy3xn
 bzzOz8V4BD1+VjEkXgNiR0eJHOpY78NvtVuDyaUNwkMdkhhW8m15KlNY5bbzEDEay/SsD
 MmtP0wytmZeYVKSlCxX+qw5YoQG35hIzNt1QffWQd9xTWT2PTuEwPRRInft0wI1QG25BK
 osg/dKqYw8SxEulnehOKkJskFtnsN5XIapNDn7hRy+WtXfSsm7h74NebJEr1YzVvwijbb
 bC44bAvYoE9H39UAP0CYj87rqkMZu/JsBSZQjHyDOQatSrrseBf7siyAqGmmVBbLwuA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VIqFriCw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VIqFriCw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6854C81178
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010925;
 bh=ANLRTDDXDc22foVCFZaXeMzkmLmX2dT2cT1RXTMZPCA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VIqFriCwAtdtU/7ZpO3hY/t3DmaRUDAdHwEQw0YnWBDKB2oBmQR5klM6JzgRcHnBc
 4SM1RY2mwq4hqnpe55LgbFuAhIZE0Zsc7afEYOyeL/g1aBRGR1jFdJ6GPxmHQ9ucmF
 L9rctfW0TayFxY9IGhnfnVz/Pp/4xV4ilQQH+lXVFeVI52Pjc+GDJJYUa1TbkS5YNC
 2tmvhgFMvQ+yCC8ESCI1pO8pYW+BuxOtdGwv+UoHo9JH7IXygZFcGBESuCcrRHFXr/
 zhMYyYDY0Sk3uccWHVkB7lJuqSM0KbNu2L3mZj72FgOTjfcFZ8+4XwAtYSLh37VZIm
 XTSx0L/hnJRuQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 bx4HQqihSwu/yLe8qDAbzanTCMevFEdphMo7FM2NG0LyaRawVPr4u4XK/qErhCjRf9XaW3g62Nw
 YPWQ456bwus9ZeNOX4pgwz3LsCOKn5RHF0w3clI+URqOwboKkpWSSC/7z5aw/ausFOy3DW/IJoN
 3HlRiqvD9QAVDvp++ba0Bpu8u4/vO54hxvqKyRBeYr2sgvu6jJBgb/oAwA7YsT21I5wGhJ8irTu
 35xdtO9swtyB/HLAP05b7ls3beEGopdVoNLLQDfz5mM3dxJFQMnI+BRg+a9yPm3kmGzxVUewxmt
 Kxqx3LvGrHEtJI/yd8KVqkoHRN6WHWoMOzsS5jX4ImfsgV6FBCGLXi645hXLCCyeqa3ODGm+vDb
 uYqZJ4Y6gpybHqiuqE3xwyf041FgBDhw61HVET2O1APu6OUzSOc/ypaefHozc2Rx9WNNz/AvOp3
 ApA+pwqrHXaUVW5Rj2IeOfffGJvEVb0iL/Bc9tChrASg0pgtNStzOtjzsq5z8EZjzb2Dj1zKA4j
 SU1C3WlTKYTO6YXL5MY6uNbmUXoCZYsur4q4f1ywjmxaes1VqNkk8fpTlfi4nIjNceIoJO0zXF3
 gUF81eUQx8UGCM63Rk89PSDoYJI9EwfqGOyEdJcwDuA69ZSIqys4l4UQPFM3ov4x
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60F89A4C541C;
 Sat,  3 Oct 2026 09:02:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkf-000000007Zo-2GhA;
 Sat, 03 Oct 2026 07:01:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:29 +0200
Message-ID: <20261003070128.1295458-57-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 057/114] package/python-pyasn1: bump version to
 0.6.4
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
 package/python-pyasn1/python-pyasn1.hash | 4 ++--
 package/python-pyasn1/python-pyasn1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
index eea1118bee..1611a42549 100644
--- a/package/python-pyasn1/python-pyasn1.hash
+++ b/package/python-pyasn1/python-pyasn1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1/json
-md5  b7a8127ed5fc251943e47dbef51ea6c8  pyasn1-0.6.3.tar.gz
-sha256  697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf  pyasn1-0.6.3.tar.gz
+md5  8389c385b422c57820eca5f21bad64b1  pyasn1-0.6.4.tar.gz
+sha256  9c447d8431c947fe4c8febc4ed9e760bc29011a5b01e5c74b67025bd9fb8ce81  pyasn1-0.6.4.tar.gz
 # Locally computed sha256 checksums
 sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.rst
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index 7278b3f857..b8b9062985 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_VERSION = 0.6.3
+PYTHON_PYASN1_VERSION = 0.6.4
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/5c/5f/6583902b6f79b399c9c40674ac384fd9cd77805f9e6205075f828ef11fb2
+PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/a4/9a/23310166d960def5897e91fe20e5b724601b02a22e84ba1f94232c0b7f67
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
