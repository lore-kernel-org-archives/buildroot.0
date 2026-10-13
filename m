Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12077CC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0FC3608BF;
	Tue, 13 Oct 2026 21:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bm1vCb3ikOmV; Tue, 13 Oct 2026 21:52:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BE97E608D5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928346;
	b=abWLljx+617WE4s3EJkvIXRgfzT/iFsIg0x9EO8XY4l7d+zdZvpTdl9Rtxz1P8B/j2j6
	 KFuq8A3heC9n05wVnGPe/dan91BSTgM07NHNJzOGGXZjs1GWdO4KC4YnJ7sKvZw3iqlSp
	 zARslWOSDLT5mtYy4T4Z2baJHCbCXxTPZkpdjYc+1AerhwP4ekUaBiKlxNnnma7CY0IMW
	 MQ4/4r8UtnX+/fwv3Thx99eVGJK9kHPTYx29M/WJZQxiEPdFIvzKTfnAjog74Zy+C4nRB
	 KmhAQQOMZR2iWKZwViP+WVeygQK5+cwnXuJW2E1FN7bi20BfQ4z7s+kQgcvOlqa4YKQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928346;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MUlGx+/TPRMGZcehYuAY8w6gX6dfxv3Wp4ARibuHiVQ=;
	b=I1YArDRct1LDDu+EoxUS1Fe6N21RJme2zGK99qIpYWamL5l+7A9PS57GOT5+WSjDY3ls
	 gorphVQD56Bbbr01NQxveYxFgvVxn/Uxk5HsvfbuMGSgTwQE2EXRKRNYdE7jIXrM2YxDo
	 JVFTnyVLQsGln4RxeHSrHuOwGHIlmwiKry4YL9aE1XrVr0d2OFmAaAQzVMrrjso0kfsOc
	 tjrNQGSARlpISce3tP4Uap/+e9w0flAXz0rIrQabRXrST0BLR7IVl7COa4S24aQcWepzj
	 F5hz/Ov7l4u5xNwK1WBa68azKb19xZ6FieM/k/cVoBSb5CzT686ShHveiwcIKatXsig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928346;
	bh=MUlGx+/TPRMGZcehYuAY8w6gX6dfxv3Wp4ARibuHiVQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=E8RkH6ofFG85bVrthGLf5k6uK0N2zE9aULpRDdHEESYfCjNqkPLycU+h6cYbuxF90
	 GhRZWmquTG83FdxcFZpFdVjgxli4MrgKfJz7UDtudoGPtVBkgkjnKP6+g5F547Nwfa
	 7DQisQU0cNwrYT1o1cxdUYWfEklUQlKCyifNEK81xs3ih38P4jc5qh3ZA/z4+RxnFM
	 vm9hvyOWWhH1IOBlZinp/xUG92B/jAQoxZ7Nfkb2w/gBXeHY1dOeFGrIvLqWHscPR9
	 6aIuDnIGgwS+zmk2sz32op4KHPPa4FI1zococDA7Lj8fh80o8D0IkVwALK40pEum9U
	 qzSfutlkYceGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE97E608D5;
	Tue, 13 Oct 2026 21:52:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1BB12AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B28C94073C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFogUpKXIuJn for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:52:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0C81C405E2
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928343;
 b=KccfOEI3T2P/fhlUAxHU5kPD4AvWUlmBrFlu3vhYWesnH8RSAxuLGm7/R4yXPCf1FkxQ
 5oetpaO687hgTf2k+adOoK0qtg+EvKcNwqBRRVjDTMjnOHAhLFLE+WZd1kItFuPN9X02f
 uxiL9kgVnkVh8dmz0D3d865wnA4DamBJOZBKRXe+CE0+UbfToYllVzu4gnpUuon+1uuts
 lqS3UUd0fC4946Zmv8BzOwhPNvFdviOIjb/NIGWfjc+napGiSCfXzUBkHEknqljxdBbgu
 nfd1bL3SXFEissOhJ0SKPMvWuZL/ccTkd2pKG2gxhQ7Fx8HT+2Ptkeux6nxDcaW/b8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928343;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=evzbfFjdF4N2oWFRkfkMgBlhRu5RkrnoXEzcIhU0ohk=;
 b=gjpPT1zX1Nx5+eCi8fSSjy1D5hHCvG+1M/tXQmMS6rsp4PBz2h4RwfsNoslhsez9M17p
 3jvwgo0J54pxn+Iwqe2CKh/3YrG/w1gPhy6lzZcZJTmLRQAnZSn3jDcJ33OvmXKaZuXmx
 +h3n/Uk8NuVLwOTHESAnkLdCVXA6uY+zwLE3bvutJUzdVK/JlQQLeDXFcDgvVcl9Kf2cp
 nRaHmB1uo7U+RydA/E4nGmyjwCRXWNKG8D6F2l0IiG9niWFWrDF+Kq94sf/FTNOY2L9HP
 5PkPVNOB2l3j7gedntJ2Jt/JeQLvGp94KXFJszo30UJOWUGLDp2vWchidpwf1cHPtNA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aV9DaTXc; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=aV9DaTXc
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C81C405E2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:52:22 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6df7f544919so2315828eaf.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791928342; x=1792533142; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=evzbfFjdF4N2oWFRkfkMgBlhRu5RkrnoXEzcIhU0ohk=;
 b=aV9DaTXcVRQAiPu6xefupBjimssOReAsJd1n4X2SIabvhRMv5Jb8XWpSNTq/tcMJDr
 syx6gbI5Gz6wKcFYt2M1TcNfyab0yFTqSY2Ft0s/wOw2r27eGoYwfadi2UMscWQ5olwF
 A0Suw5z7K0LXrhvos4yAhyEEOunUzxosZymURVU+PxivqWUO8isz+xbjDbvj6s6+nwkW
 /cWeOO2tz40qv8ZoxqVxk1mD+pB3WZoOZm2VF91IiOMfZhxP2OGqEYyGMdd6IXzKr6EX
 YYH5ebLuQxyfLto9XdYBkfAsSnQxqD2AN28v5d8L36jreb3QK8VZxvmFLiYNCfpg7G/F
 gh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791928342; x=1792533142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=evzbfFjdF4N2oWFRkfkMgBlhRu5RkrnoXEzcIhU0ohk=;
 b=g9+DKukSHTE/lHqRRLI4L6vRttFJX+zHT1gpP/fiYCU60J5NIsllcK5Ke0od+hOLFK
 7ZjgJZ8iaG/PNh7qR9s5Ki04WCzI/R5Rj6876mjE9E/bti60rs/uVW7/6PwYfoqwQ2lG
 ZFGe9zPFsAD+/4UOqqrVA7JQ6aUwKPidn6a/mKeMn47W4+S1vaNRAKCHNEzxL58bNYzC
 7enLv9ThH9o28G7JcGBYp+45j4RcSYtloab+EBKjUCteA1g8SWJYMztmVW/sNFdivWO3
 as+Cyb3JitfyGDgpbJA/rUR3bvsa3fb3opVXgjPA1bCH6eIUE8E08xo5lZp1PvVTm/UF
 yUGA==
X-Gm-Message-State: AFq9FYIQ2IzyaUa+MBgb7uDTl6AkIDuhXknM0F+px92lg4Yp+8L0XPzB
 0Sv4WGWrhVygithUWO1fnYCI4n/Pjfr4R3sxe2HnioWAWOLeQ/wYqtrB2cPLJJr2
X-Gm-Gg: AYBFou2gB1y3l6O1nK8HLV9cYgFBiksKMGV3hiOWJxyOaO8uVwE/HSxEIElsoEkdoW/
 rn7fnTEdcODDicAPnZ+hIpzYsj0/DF3fmaBX7MQ9eH1HiA/dNfNNGjyn2+1oUae60/Qc4F+PjXB
 0SwjdWhQcpehSwxFm7tKyHxYV2TL85ZPHagkdvRs8duJgAz9XQfK2F6cIh6aKitbF67CIyNi2Nl
 AbwPlUu3kiC6DJoxlK9Uxccm4IINRpTPs/0wACB2nte4FpkmUBIRRQoGJlHVNUdfSLfxj3bDvIo
 zazTfSMMbWd46mlFml4JEoDgcc01f8g6YgpAwgd4OyxyP9anxIe6gN2oG5fcMcEgUmkomscdHN5
 5PAHLoSJv99EP8F74DY1DdJ/BNYXKFnRHv8TKBxMnCGQDpWZG9Vgndk92dxkqDrPc/1g+/WHlgH
 knQyKN549DtEHtVN/mt4UuZwhN/fa1rf3M8Z6v/CtZzMKIFJQwdZuEGT3ShTNAw/eCeimL5WQwL
 sRSr7ZjFUI4jz1MgQjSq+2RhjjbjqJJ70CtjyNXjLBP9lmJkxDty4Kfg8z9f6KwUBRDDpFxvZrL
 JieuAXx5govPURtL6buHW86eXIJynngZTuZUsmELQ/x0XwbFfMsuTiv+G7o6O7koCb7duuvoJ3h
 84j6t7OLP8hwD4UQFbZb57jlTIEeXantq8yc+bdtiLak=
X-Received: by 2002:a4a:ee10:0:b0:6ca:46e:b06 with SMTP id
 006d021491bc7-6ef0f1b83b6mr9619798eaf.52.1791928341855; 
 Tue, 13 Oct 2026 14:52:21 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6f56b25672bsm6813224eaf.11.2026.10.13.14.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 14:52:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 15:52:11 -0600
Message-ID: <20261013215216.2460255-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-serialx: bump to version 1.13.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-serialx/python-serialx.hash | 4 ++--
 package/python-serialx/python-serialx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-serialx/python-serialx.hash b/package/python-serialx/python-serialx.hash
index 11c2b7a512..603e515ead 100644
--- a/package/python-serialx/python-serialx.hash
+++ b/package/python-serialx/python-serialx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/serialx/json
-md5  9b0b380643606d0d84339bbff9df67de  serialx-1.12.0.tar.gz
-sha256  e19e45ba198e919b86952f428376207c8dae39b741546e02e8e5657981cc3b1d  serialx-1.12.0.tar.gz
+md5  f4daa494184f90a7cc3381fe498c7f88  serialx-1.13.0.tar.gz
+sha256  0f9ecfb157ff04beb280cd01fce6cca36a5092af861dbb31072e636bd3b8f547  serialx-1.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-serialx/python-serialx.mk b/package/python-serialx/python-serialx.mk
index 0ce0a81112..0dc1f46ec4 100644
--- a/package/python-serialx/python-serialx.mk
+++ b/package/python-serialx/python-serialx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIALX_VERSION = 1.12.0
+PYTHON_SERIALX_VERSION = 1.13.0
 PYTHON_SERIALX_SOURCE = serialx-$(PYTHON_SERIALX_VERSION).tar.gz
-PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/c7/68/efe61ac6dd5fe536eba0a3a23e92d09caa9e78cc59f97bdeb594a0098ada
+PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/07/a8/aec21f8a6d23be84a9dd9eb9259f3f2feec2b5169eefb2fd647d3a14d5e0
 PYTHON_SERIALX_SETUP_TYPE = setuptools
 PYTHON_SERIALX_LICENSE = Apache-2.0
 PYTHON_SERIALX_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
