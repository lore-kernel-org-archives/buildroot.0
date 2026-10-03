Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC576CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DCD4813EE;
	Sat,  3 Oct 2026 01:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZgroKr9YQZf; Sat,  3 Oct 2026 01:34:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 86D07813B8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991241;
	b=sy2bXIyRL7jeiN6m+DHL0ro7p1PURUopXoxzUcHbFfEErf3UxCGk+5GmYJDgyk5dkQqC
	 zQ3hVB2wh53b6iHDNSdRbHkWXSeFst+3I45lhqpZqnqFVUQmeoAvxl2vTI0rNVggHDeXD
	 m1bV5Ygf+VX6ae3Iz5aXf6au1Ng1EoAFbOXbP7kuQCyWctvUnbqHHFB1scA141IsrVthL
	 rF4LEhrfGDmpfqgFihmjkycbeHjCwBLp4t0YBcdxDPtvMrZvcHHMRxHOJqWcuipLRqU1R
	 x4pyEgjVMwOOClUHIZex+0XIq2ojwCAoYYhq2Y+miwp4PzPqUUOMhBFE2De1oPowHNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991241;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=J3N6fZcfLJPBhsjR1DcTsUky5gewfQiacs9q8ZDnDW0=;
	b=eDTBuTh633xmY0iL0jsGBSagr24NfVnODNugak0/rWSEY0FfWm8LzXe4T1a1+wfvj262
	 Yy/yGn+dVXyWfUocXCgzEIZ0aLpxwleFVG+g5QwEIJ0MTDp5Yka6UmP25dl9c5OQLYRrA
	 CSOnQvi4lC5xnhPvS28XoUjTzoBJ1X4LLpzYvm+rXcrZfcjV0LV45D4JzlBRWywzQwm2W
	 fOEmDm8vexzgrIZfcJ5Ra61n86vFxBinOFO/Dyz3a6ZEPmekO3Sa0kx/XRMaHU3oNc+Kl
	 6Y82YFZlsgtanfIjD7SvWq/FVQN4rAsX3CH3aj6OsoyQzgfcD0xmr26o64UjOXi894A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991241;
	bh=J3N6fZcfLJPBhsjR1DcTsUky5gewfQiacs9q8ZDnDW0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OO6pWo0D/cuRp+KCDRA0H1Xj40vBoG2CjUXJgG3SBtVvs4s7XiN+rTBUs52QHds04
	 yyPxOdYyM/e4Z4v5f/1fEpvP5M0s5mqOpy04uKfLXH/E+OM7j32MT8Ftn2r22wpsr0
	 qB0E/Wy+viESviIlE8ZsVF0hWoij7ENY7VJHpB4VDxag1lAJq60oOEXFY8PwbCcxKE
	 MnFVPMx/NWf0cCDYRBzR0WDEqsz9Q8GEIxkpM4IREU3pj1U6XE2jRW+2CIQHVeryi1
	 Jurk37CRr4zEQHN93wanR3IbTJMjF1/lBVrInfUYU7aAPfOIHPXyVjggDrerKFNRv2
	 vqizynSrcPruA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D07813B8;
	Sat,  3 Oct 2026 01:34:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BA992E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0217360DB7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0E8umXc4KTK for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 201CB60DE6
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991239;
 b=AUzNvvZKl4/ArrGnHhzdjRvlkMs5KTDGgr4grokppfgSr5Z40FRoZ1IqT0S6C7MLP+z8
 c1LvBVUe4vZave64eKM09mt4VMiOrJ8pXY9nNriC4vLVUXFIwdrJ2ZX+U8Bhkw1keif39
 i8iHXnf2YsH1Nc8WI1CytUuNfiliin+bO25KEFjPTXiQC7Xk45pifCWf5lIzsaLs854PZ
 i9ugfXhaI0LdIfQsBmf1bqMVFmqhvL3GzWs+hhXjVopX8Bsqs9BYCFeGYmnGwlD3fKUbN
 mnI6hRAHdFsy9TS8IaXHl4s9Fsi9CYh0SRQnG9taAok3WTDK/YmDPa1v5JHpEKR+QjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991239;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=CTh7FasRkajqk037dtq+oX1JmutX0G9WQPIbtw6YBsM=;
 b=UGAum6QwsvkMorfegsNQZwZSnDu5jd4zMUXlzr405tjHRaaND7vf0WU/qTlMB8Sv9I3H
 COtHkh7kJw8Y1YRVF0OtzudqrEmxLQ9mpxY/OM5ttszW0xKXP8pIX5Obm7VzshQwoq0rR
 wCZUa2zEUztGbxc5TlK8P4j+xHbNDWnmeNkQxEAbXoRV16PrmZxw40mp+sGXdRut6RPzK
 5xkhQmiOFsCD6cvBaTuv63aJnd7Np9mYdKXcxhKDdmFj22v3zUAz6I2TiejJ4fnuohxjY
 2UuqByuzy8vY/2yK+y6mIX4u30Gxuf6663egzN4zOrNOnsmZgjJCnr8jUobuGZOeJpw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QFOlDMFJ; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=QFOlDMFJ
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 201CB60DE6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:58 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-8167e0d1f90so395632a34.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991238; x=1791596038; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CTh7FasRkajqk037dtq+oX1JmutX0G9WQPIbtw6YBsM=;
 b=QFOlDMFJbaRpIur0Nm3lvakd/wqlipWXlnibe1m58HmpvakR2HyL6HYwd9FIqR+lCp
 243VWtfALWbEBbzzxXhFK0Oa7s2UxrfXECG4IJsX4qVOfSaWVSAyzR2v38N3Vmk4ljlC
 tSMw80CvBXToxFKinSE2njZgkMkwA/XVKI4G27SQ+OQUh3WIUf9fmhqP3QupjRXtZFI6
 UJgp/jQ5FDfSXkCQUWp7aJ7a6zT7Qa6TjTT8KqT5+6+Y0dL5+PteLhMfGvbOCxXaJR72
 idXbxT2Dudcg5ma+S3mkRAsccif1Y5aKpdElGBPL9Bh5OZyPu7FBihAoNrq+HXc45yPd
 4KlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991238; x=1791596038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CTh7FasRkajqk037dtq+oX1JmutX0G9WQPIbtw6YBsM=;
 b=cNJRsma+5qi94dyrvIppUWeVVXHfozIjgW9NGuxM5NLuIr/vZlLRBaJ8VDD30iUNaO
 CBjsqr3M6Btw7m4uAEk6h6p9/MYEx1nQaK47Uq5riQ8yDTc1jvQy9hI4PaFkH9YoMHN2
 CMxmc7/IF7Q2e0ruyIOz5SmNzORiPH8qyCsw+bUrJB6PwPzR/QCn0hyIm0tIri78wB4U
 eqQMz5/yMdZ6pRWP7i11JokV3d3P837TnQV4y3LeI4VUcGf0KLQOLA7w4Y3RA+As3+WS
 VnBmsWDS0oJyNbyIrjzpYxy4zDzDQ7vprHlJS3wC/E4VTY0MEvtH3AtGIplA1hpOvOC8
 Fgtw==
X-Gm-Message-State: AFuF++k3eTJkKMnvu2c8clDK3FCFl71Ln3nubt8+4DXsSty96liwYy8S
 ObfWx4X4lDsvoboqI9sKArBdcbcXpI3Q46FPLS70vxIn19M9G7qDL59yEZpqvw==
X-Gm-Gg: AYBFou13HcVPEFGKQ3BhCNN3YOVF21rt7XbORRuCWCAZYvy0oOnsr6YavM9Ou6Fkhfn
 Hlwm068Iahz+K8FCZlXWmAYhiEI9QdcPGFK+YkPUVs7gOov/VldrXcAeLqMcFmbLdEiMYf3Pbij
 KBCD7oYszfm0EaIPQ3ELAPtTU+in0GPAMWC/8MfsEsJrYkNfoZL3Uh3GC8lj2sK6XbnxSVryKHC
 LVDCUGV3ZnuPppqolTXdhbKoFcjothzNXniMGDTsMz0oZxRCrr8nW2ztXsRCMDAyH86m6GOur/r
 VF9MOR5ksNrgXEa/HSH0NEArvQqDv0ixjmScqc31r6VjeGHw3TH/DzoBJZiG79gV0E5iXFPIPxp
 2EKB25BJyP1pSgKnSrYBl3mdn3hFefLzXJqmIFyD6AVdENVpzN5OHh6eE1G7Tf+CviQhtOJZdwZ
 ceyc4CTp0DJ+V8UGgqIfd8Bt7EWGuHJdRxTiOGP4wxuxIw/NfwXDyaBtP/Kr0f5BkdfdGalJl0z
 QYFbK81NMmkA/fGuj8VRMZk0RqrzvN4cPDQZcq+Vmq+biIemudprWhezjzoKtR6KoysV7va3O2Q
 RPicZgw0Gp4kL1+afwdO69Gq50yOQnWOnO/GOixwIFJ9qhogjf6uSbPxqOBsGBSLS8kejc8NWeO
 gm5u1Sb6cIfHTdj8weJjKfntKYEEqcbtJoCs0UpNqmQ==
X-Received: by 2002:a05:6830:926:b0:822:3c15:f124 with SMTP id
 46e09a7af769-82284365b6cmr4144638a34.6.1790991237838; 
 Fri, 02 Oct 2026 18:33:57 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:31 -0600
Message-ID: <20261003013304.400979-31-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 2.8.0
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
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 92425d125b..524de89f94 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  e79707b798a66c8165c9c441440f4e80  urllib3-2.7.0.tar.gz
-sha256  231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c  urllib3-2.7.0.tar.gz
+md5  e8ed250b4d520f9e3c0df3165953aa94  urllib3-2.8.0.tar.gz
+sha256  63bf2ead4c879426ebf22ef2a781eeb4aa3b4ae798a0435506f8687fd5bb9b63  urllib3-2.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 8e598818a1..ae0f4f48fd 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.7.0
+PYTHON_URLLIB3_VERSION = 2.8.0
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/53/0c/06f8b233b8fd13b9e5ee11424ef85419ba0d8ba0b3138bf360be2ff56953
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/e3/05/b17359e1cefb4f909b5e40b1b90a496d987258916dbbf88e842c729f510e
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
