Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF9CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A6BC40581;
	Tue, 13 Oct 2026 17:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xB797H7Wi94E; Tue, 13 Oct 2026 17:51:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4FBED40583
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913895;
	b=p6S3Xg6PRfkc/erBLXO0vgGeVVkQLQgB3tpIqsmaUxzfWJfjPxjS6mlZ9R55YNrPYJRr
	 J9myIumPWj74GEoJCVehbPYOIj0edH3FcCM6OQZdhpa16pWz+APehnqX00FubIzo5qPID
	 m3Ur55jwmGiqFhVtnn9laZf9pgztisRXrvVNcfPZSABbpc3v+kd2qvLPrWYsn2a4oz5c6
	 X45fWawls391J6IfPRqGfU8In4tAes226XGz/9yZV3v/v0TSmYwzFBGvEqz3LPMhm2E1B
	 YvJRIHKwzekac3GxqFHOx6pn9CfSg6FkKe0rTQWQ8xyCJDwL+cFnUf3aFRrS3ayy1Rw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913895;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kbMmCSacOOGaBYOT/LRm7CEZKKNWXE3POkCJa2q9i3g=;
	b=XPCbq1p49OiPv4qVct2AsBUmoRHO67CP/CJ05bVh8PLyBdK2Te1bzbi7nDDNVSFoI14+
	 95LrExsSN/tXRZsdwezs1VeLgUkHeNOIkWU7IK6NkJ8R6OPpxh8kZq95eH5x4G7hxip2u
	 kknbPgvPty9s3xg+yzVwHLtbFpHtDTbTZ/XO655eQXmNiIir5YEo2BwKUv548kO7Bnhbe
	 TrlSGXu3A4i3p7r8yVoiATGLaLHpsVvjzggnXRHdPOrGa3u1KmSGp25avf/8FmWeyYxdJ
	 7NMbYDegPXmk54RE1nN8aT8eSQeonYwCoTd10q+sbznxbRGSMftN4Zv1CCTYH7Br5mw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913895;
	bh=kbMmCSacOOGaBYOT/LRm7CEZKKNWXE3POkCJa2q9i3g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OrHhiQV38DhRBHxyPdCWjDxX1YmMaTwC7wLD/VaVF8sIK9EmQRd/T9By0zgLghEKA
	 kPy4jBvZK8q5E5XbebkQyFKtS01GqLOSoNKJcBrEuuFMeveu91O/qiGinhvmgzxPWB
	 kF4YS+aY95ykH2ZweQ0gInZlH9BsG+DUg09Q84aMSbNnQRVzdYNu8o3k1vr1av7XXO
	 pYi/BtyFNLRdqLDzejQeGiTEfd3ZfOjyHIhZsuh5dQPkKWcwSdvAW+7PG+uHVEHanz
	 8Fb+mG1dvFEP9elft8LsimIGV18PbugRNNzqWBnrJq7xpjjvYuQ9yJR6MPc0LnTZHN
	 2TbQL7L7RVfXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBED40583;
	Tue, 13 Oct 2026 17:51:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B160F75
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEA4580AA3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lo5EeMPwfShN for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:51:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CFBB980A86
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913894;
 b=Kx9nVEWpddMVRniqH3lER3yvnp9hQm/ebZP/haDksQa39bdEmFVZibve1zdQT0T1Jnm9
 K+DdNTciTySJOgRkft2LxPpU5Xw4klRhWnlXyN65lqa/+tEfVMv+qQgofbTGJpgjgTDp/
 BGm1OrnpU/3OMwOCpTJEAMNt94PRvUa7i5TaCL3wej7afZBaT5j57LxGp+14EunBNWZ0Q
 x02L90Mzz0Vjv2/4HLuH5AKFofvlIIli/fWJa4YrPcij8wrDLt+OSH4Sz2cfG8/9AaaSO
 JZ08RNhTHR/YUxtwnCiUARBrZ83fiMvilUeXvnXHyawmUejXQ0Y48bKhB4iCWjhiWhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913894;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=BlfiSPoOlnO5noGygfJktyYdmFo9DllGf2WrVlAec9g=;
 b=m3sfs2xRamSu85wEjc4HU3Go6lsQMy1WjP7EsEbhUModZSPbHKbPIqD37WxCQTTsWTSp
 gFvzoJQFLseBG6q+ZCkwdhbmquLxiDs+NeV0eRtwTNZ14UcjFOrD4z5ngPdW/SLL27WbQ
 ++v5GQqGOa8xXfjtz/uEDAnUcrNYSOeB/XTcnH2BA8gayx+nCq0kLmS+G0wMPDx1OeHch
 72iz94GBs3OLZZiqjlZWl/svH7AoVGO9RFIs0Jv66tHJiRIUqiverTrO9qQb21+EsPwTM
 hmLervOGxPVc2lf3cAeeL+W0c+BdiqNAT0L8cKdDrv/tB6GadlBRK8ECvHyXH8wJNVw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OFwx1O+Q; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OFwx1O+Q
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFBB980A86
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:33 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-823e4047037so2599009a34.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791913892; x=1792518692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BlfiSPoOlnO5noGygfJktyYdmFo9DllGf2WrVlAec9g=;
 b=OFwx1O+QDrVlAOiiJUnmc6U18o9qAH8EZZZmspqRmVLvpKjIOvj1oPJcfvxsPrn0md
 6RnfvXMtWCYRvLSKHpHWB/kfvozkTb6DY7GkMK+dPxGsmvJ+1e4tlu+KAPTGeNPTWR7n
 j2W3JV4G7UEX4FbTfNVrzW0fIhqDmJ4aGIW2cQswCVsPmTAQzA+aeeOaGU4k7wQMR4rb
 H0tIQSPJGeVaVHs3P1fBBJ1R26Gq+s9gl9HDSSeQX5oJqleLoE45avGttsVTdfmOXetK
 abPIIopDK9wnRnIUBtwLAP5dLxnUQFd/NTpfO43yORG1FVp8vEZa94DFkwQvYlDczEeG
 2qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791913892; x=1792518692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BlfiSPoOlnO5noGygfJktyYdmFo9DllGf2WrVlAec9g=;
 b=Equ8XNyg+v4jAhOITZk4wOGJTMt/NzCzklsMnXWxaiTUrxO+qEQhf6SKZZGmRhnD7d
 O9iK14DuXeZoUIF1+f6hy5w75LsLHyHh82QNb3/xgyT22idtZaO2zpl+4XtCGEyAfZcG
 MKQGYQZ3pimKpL7ahEYhNfqhqj9MCS0M567YB19JqUfwKDe5RVZxePvgyEAMRXrf3FTJ
 X8qkdKRhI1/ySMOBhsvNncGx1XxhuPJCKVR0B0rOxj/gTZR070kNoAWwsH+3MoYf0ZVP
 9tm13cqoPpIYm8LXwxIWQNnyrmL/bLsRXMBhOshmqubA3DQlyOKmuoia/DdSxJ7UiL/W
 RKbg==
X-Gm-Message-State: AFq9FYIMROOnpgQGy3p22S9CH3TeOw6zckJbKAOucuSwnmAzJxKm4MIJ
 sVyNRMwOB8gPbIlJ/lolGTHU3OvX1k4RDktsHHhGBJKA7f4DuX6NcPJoXkL5nOzi
X-Gm-Gg: AYBFou1Xg2Q1xU9uVsLU7N0olX1LTXM6+0X/W6lNenxd/jiCnxfKN23LAJSfqFUJmqm
 72ZZpq6dC3ybIXhHNxKez31Ow2bzXZdqYwh0rQVofACq/hhLSU1LAhSuYjqDDo9lihUu2zTyWys
 HFHsviRTMv5wKbemsN+w0UoMm2LBox2ThmY5/dWtCUPayQEaW/NTncWJX9b/ocJNUxioYOakmK/
 ALt4cnXKaqUTSCKxRrNTOW8VoSV8/F2t8Mdfi5CEjrtwQmgLH7zJp2e9nVupOlCKrqiQAaw/Eei
 iY605uMiw5TFPjkqyVQO95s1DZLruydT0WIZ+cYkWSXLxHjvpARfuzJt/V686Jj0F0nttq0Vwig
 XLGUiZ5f24O5i3DcYxUwZAd8eljEG4TKMgSfvGbSOwFT/RhXuToEkXjnYJ/93XhyjSB8qLblsDq
 gqlNqAUoaD9fdeRPUhbkXHWD1Zdnp/pHDfpjqXlZMMHqsBvEV9CpNo33bIninheWSLpPa36WAOy
 yivpDggLAY0xbF0L9or0RHiQDIUsjfFcccN7vzTCVz7Dkrk9E8Ww+37TEiAhj/GYfnrfu4prG54
 9W/J3hD+1cT7g7HyeM/POTP/mYdzVjQt26afwZpNrO94oIcxELSe3m6EVRsycc9R6NXF89g/wiB
 icgmoAIA4eWl0QBZBRFovvWXDFsGxlwqaOyT1X7HJnCk=
X-Received: by 2002:a05:6808:4fdf:b0:4f5:6fff:3ac4 with SMTP id
 5614622812f47-50c516e42b7mr15132855b6e.41.1791913892382; 
 Tue, 13 Oct 2026 10:51:32 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1c120686sm15424624b6e.16.2026.10.13.10.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 10:51:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:51:10 -0600
Message-ID: <20261013175130.1822395-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-async-lru: bump to version 2.4.0
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
 package/python-async-lru/python-async-lru.hash | 4 ++--
 package/python-async-lru/python-async-lru.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-async-lru/python-async-lru.hash b/package/python-async-lru/python-async-lru.hash
index bd875cde78..e6a2894605 100644
--- a/package/python-async-lru/python-async-lru.hash
+++ b/package/python-async-lru/python-async-lru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-lru/json
-md5  11ff9ba26a6a52d3ec751a57dcacbde5  async_lru-2.3.0.tar.gz
-sha256  89bdb258a0140d7313cf8f4031d816a042202faa61d0ab310a0a538baa1c24b6  async_lru-2.3.0.tar.gz
+md5  6cdb23de8d478e63e613176eab38bfe4  async_lru-2.4.0.tar.gz
+sha256  b0b0077d9b7596615b3c12d0aad4f6aeccaaa0ac75ceae472608ede89e764c08  async_lru-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
diff --git a/package/python-async-lru/python-async-lru.mk b/package/python-async-lru/python-async-lru.mk
index 2825c46053..ff33383524 100644
--- a/package/python-async-lru/python-async-lru.mk
+++ b/package/python-async-lru/python-async-lru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_LRU_VERSION = 2.3.0
+PYTHON_ASYNC_LRU_VERSION = 2.4.0
 PYTHON_ASYNC_LRU_SOURCE = async_lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
-PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/e8/1f/989ecfef8e64109a489fff357450cb73fa73a865a92bd8c272170a6922c2
+PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/8f/43/9d22679e8dd0ed965182cca990d32c68b150730cce8046ad61b3179b5b7a
 PYTHON_ASYNC_LRU_SETUP_TYPE = setuptools
 PYTHON_ASYNC_LRU_LICENSE = MIT
 PYTHON_ASYNC_LRU_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
