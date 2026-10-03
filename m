Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B81DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA515411AB;
	Sat,  3 Oct 2026 07:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vf6NITy2R0mD; Sat,  3 Oct 2026 07:24:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EB11E41131
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012296;
	b=PdvoLhuY6E/tScdoaG6l5yGXWXc2Oyh23SwmdLqy6DHE+CgYwaIZp4tHCYZT9qUzrHN6
	 yccsN/g1oCzVtd7n/5efEMfFg9JRdbhy+ihpJQ3yDUdtHMUOHym/kYe95CFSubUp7l68O
	 j1HErrdXad1jk/30b72l1HmxLl99OrED82xn96RiCkbhrGL39EGiPLFUokIiJiSrg1Vr4
	 LE6ls/Aw5tJBJuFHOVp1WB2jppE+4PaVnEQWkN4T70zVk9nMuYo2YZJFm7UE3rnrxqjX5
	 aN+u2ktbyfVuWo6wrFnisGXVexrJIIbduWrGq69GrbVnGE71lyjmuzsCujxYx4YGlUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012296;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xnYqDW0SpTjBREyA9eofTtGpuBQMZ/7xLVkm+T4O1rQ=;
	b=lyKVcz2LA7GyCwMvYx7IrB7r6ynmsF50C3OjD2vbT5UzT+vWtpugvzAKspmN5KXCIY0R
	 9chM4Ht3omLj+9KyIXxA++ceQxRlXVItm4dCXuJHzZj1sI1R6wI4dVcuvRklg0qKGhhuR
	 zIx5/YFwlxN+jIj+c45li8jyiqFOY0v/ER0xX7q9qAhg8LWhcVylJ+A4geoBatmDDnkfx
	 KH2BfoS+t+jnu4xWfDQA1jn6aj3y9FAsszBRVJv9oAuQtWb3RQR3Oz56DgQvllkxhbZrL
	 xXkCVNEhItnQerldO7thg6Dd2qcRoj+hKCtzor+3YHiR+cpQghXlvAxgsWiuJI8Eb6w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012296;
	bh=xnYqDW0SpTjBREyA9eofTtGpuBQMZ/7xLVkm+T4O1rQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Q7L27bYGvRvvS954lx6tH8O25CpFiCVMwW+BjtgGmQ+nqy16PAQnixGw5BT8ULJgR
	 OAV6HVkbSkmhDnwllSGrgq8U9+N16HDiLWknYPqgdzcJa1wowePdZ2+XHG7B084RH6
	 o/4S4ZzD7qQnzL7mpvD9eKhUvaLprYJVpzT11VQEwX0HUy62x5ptF6je22/TSSuE3s
	 dpinv6kBDIYkd8tVKhETcy5tnbgHhTbT49vbUxkbLwdw9PcGT9Fg976psusox6Q9EK
	 fZRgkL5PWOIAmLNQC3Lx7opSlM0mtgs2FlNTF36mNran3Eeg7wNKLUeGgFPi4zhUyR
	 m/75GWmsROF7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB11E41131;
	Sat,  3 Oct 2026 07:24:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4C0034E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA34460DED
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRYsVo1mZLEv for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:24:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C45F160DA1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012294;
 b=ZEwiOGAAnaingQgjkLTp9sdNdI630BTQ1PUbDdXJB4QUBr5J0FBn7/ikZs7qKncih4SK
 zOk2CaSAI6o6sGU5uDc+k6jjNNIPRhM8nGTjAnj16nJ92T9LSwH7einMMp78mi0mt2vnY
 Rnf1CjfIJyJppY5eZfyxO0Qzo61kX81oQKnDs9r04610KaN+9kSi2EvHvEn6Z3m1ZgcCf
 RsKS/mgns05jc+oY7Yxvo0HjFCem5eeT4m7t37Zvy3SGd9LX8Dgb0/eiUWHWOVelzgfsC
 WKWH/EeMBYKWYpYr7GcpP2JrF34IXc95IcFHXgaYj5oLinnrQeRg2uDXR6rU7pKZmkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012294;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=FXuAGmtsOvNHbqwIogUE7/ezchhyEQcc7yCeYI46jWA=;
 b=A/Mj4SRpcsIKIIXUbFwDhoGJO4URYmfUW+/RfpMeYRrpKuU6M3F1Y4grSgsrUkY6c5GV
 QUaq1L9a3iR4ynjo5cZsxzR1zffnRSJAENRugi5gXrM9JWIi14JcYEaQ71QVRGxpFKhhw
 1ktKrbHeht3P8CmrwzvPs4t7LcDKp03Q9p4UXorJt/d+xk5cW51jaRt955JaLXi7J4m0f
 zlPpw5Jub+/IbMtB8pdwZRcPSAnyAwY78u808fw4cqgcBzNmLvoMJBmhrKUe75GqlD8F6
 Q9eahJZ5lU6KF9pm0M3rxCOuqS9x0XeNzn6Vq0yTI0EHL8GcPZignMstpsXO+HW33IA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gAxy2055; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gAxy2055
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C45F160DA1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010943;
 bh=FXuAGmtsOvNHbqwIogUE7/ezchhyEQcc7yCeYI46jWA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gAxy2055YQIW05sXMH4eHP4xXfE137mbeknSKqRbV0+cU9cAAKAvMwE9dkDGobh+K
 L4t+S340l/XJVW9ZSfaqfmrApQeC7q2691vXUn3pxJ8XhLez0KG34yEg94pABXctLZ
 9PkL3flixy5nKxIPN+9afu9NFm4kAo25091V68FY9XtU96zMfmxtG6LLz3c8AuYu1u
 x55jOhpmVB8gafNmQr4xyBD1Z/St+T9H6qPznKbHWNl4nLgqSEQphEvMrnns3dm6Wx
 x42+iumdO/DEOnFlHhbP03DhAo7eUBQ+xVkWc1TkBvvmnYewflHD1tzTxa99y34Gyu
 lXGnigRDxTasQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 bCfk8HxAb4OqAkeIxPhZ8k09Wv5AjQzME9cYQ1ylScvHMf741ceJgWVHQgmz82eQhMHA1Z6HaIu
 j7yMbVfmnaRL8znVakCzHNM1BU8skHBXZ0APOxYJh4PtqKuS/0HkDQYd9brOczBXkA6Hv91D9ZJ
 zWGgY5yIioOcGFsVsj6FmCB+mjoUqd8MXUZm0b6K5u+Czs1d9fz7LPRONFABfwWjQz5selr3nL7
 cjIMDzJxqTG4cuG2maALDOPWtxtPNFKe6Jd76nZzHTlGUNcC0XgpNIjtW855LFmRe6uOGvCS1Cl
 5FWwv/FSKnvocBYIZJhNU/hJTvaSfjnrPl680/KS7XTf7dzd3gTBU5T6fYWJrCaRslz1EKhg7Cy
 9wNqStvg2RKLKnWU7iUkWrLlgNmpkJ0NUT6cY8YFWMhJ2bUfAdDBobI+pl3jCk+2xD8LC+Gm9co
 o+ecA2kRCRImRxRDvkbvY8KmgU0BO0xvwoe3eIY2Z9gauvfSA6FPVsnQMG7xrTzN3mqd808LxAV
 KrE0trnQcC9Q+ZQXr73nlRx2ETTDCkuIuofwrEmZ0Gn8SsXRCZV7bQoV60cgyPWSJ7vu49q8lmU
 2UInL+tlg/3wgfotBGA6kJHnU7MBOBHhpAWzCaYC15iSfSL7BnW8bGK932MM5Wd/
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68EAFA4C5525;
 Sat,  3 Oct 2026 09:02:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkf-000000007Zo-0cPB;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:24 +0200
Message-ID: <20261003070128.1295458-52-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 052/114] package/python-pip: bump version to
 26.2.1
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
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 3ce6073701..427cd14ddc 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  c05fe5cfafe4cc2ce7a44318d8eed4e7  pip-26.1.tar.gz
-sha256  81e13ebcca3ffa8cc85e4deff5c27e1ee26dea0aa7fc2f294a073ac208806ff3  pip-26.1.tar.gz
+md5  f7e8dc36dcc6cdba3bf5c426ad076902  pip-26.2.1.tar.gz
+sha256  f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7883d660878e0813f  pip-26.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index d12bea3225..74c789e097 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 26.1
+PYTHON_PIP_VERSION = 26.2.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/73/7e/d2b04004e1068ad4fdfa2f227b839b5d03e602e47cdbbf49de71137c9546
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/ae/15/4500e320e6b101ec3b719ae85b697d9940b6cda672bc555bd6016fc60c6f
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
