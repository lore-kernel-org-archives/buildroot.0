Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3ABCA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 235CE40E09;
	Sat,  3 Oct 2026 01:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dv3di5fFwlsr; Sat,  3 Oct 2026 01:33:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3415740DE3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991204;
	b=K/LwjPZCznGeizf15fouD3G+i7mlNkODDg6D7yX+JOcqzov+sXy92nDLcijo1uoEGvlh
	 uZ3T9CEa9Tspqvpnp2vbCYk974F8cVkjonmdI8oTfq0Mn7hag60vY/JdxMQcmK6nLAMd3
	 p6kxqQE3XAukkp83jt/D6RtuDAjhhYD66wVqmj9xZLQ7B8Iv+40sFVkPb6m0oXMbX4d62
	 d88GWVmW+yAQaOfpiLXh00vE/H+NyaYAAn9hakWEXzYl9eQArPouIb6UwrR4zVfDCGZmX
	 j+ikKWGNz+BdVApDYSMX+7ia+b24eKhrpDXALMJ2HsMCur8CtsZ4kVmZhv+4M5GuezQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991204;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pnMZ3UZ7zwd2251ukwVa6IE+WVy/eOskeoJ3F6nKO6g=;
	b=BkQV2307r0RERzg6KSbYQCtBkIVLxUABbf79P9em7co6EVcST4aWIlWkwaDv6Fn5xwG9
	 8FrybMya2z++nlImxK7JvkoPd8Fbwt6aTLoNDlRLFPbbwJEu/D/SJMlDRQSpIPbzcF7FK
	 yp5EfiGB/cP0eVqcaUWj7D2c8qx7KUBPu9LQgSiZpCSP2uEr7qcn39YzvF/JRFz83R1YX
	 trT+fWRE8zkbp7c4uQKtVwOPYcc8yNidfkhWwRKMZ2/tEnSvE4p5MA4DQY8pXxDtz+vpO
	 +IYOD7aCDeJ9klHwBseDFeyVPq74CuJm+Ii2ONSDhRDw1ooyRH7xfBIK3l3FYwlemSA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991204;
	bh=pnMZ3UZ7zwd2251ukwVa6IE+WVy/eOskeoJ3F6nKO6g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DM1L+DFp752xKi1WZ+f/b3RZpRpb2roBMSlKNXA1zcbcq+uGqCGTATOp/Itsy+La4
	 GpskyTEk3xcxvwuE5maT0R86EM8QIyEA87g9H1McnaTDNMQeDNU3ZoyyWQ6DauE3Os
	 gP7+Wl1yM7Nu4XWmqBKmzuzm4M5cJz6486bVVC4ax1Gii8j/Fk2zu5znxK+Im+oyMA
	 vQcNv5iRSNM+xUj5V6HS4BZcjEElwrLoek267t0eoD4wVbFybh6sgh+COSOTAMnzNT
	 /xmamKVTRN1xFhb6/Wek5kdiOqSrI1zNDtcUjIR0vZYJX6JY6/ftpEQIpi/KPgKxbr
	 FyRvVTHqvtV/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3415740DE3;
	Sat,  3 Oct 2026 01:33:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 540DE179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A0428133E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCCEt9U-o0dy for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3C6CD8127B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991201;
 b=IopvIWZeKP/yHbDT1sv86cazfSddMENmBafLRyr8HybsjcBBZmKLnEyuzXVztoqH5DUo
 BYyJf3moIRsWwVzMNIps5K30DSSHUgORYs4MaPP/nfNAcQAX4BqVY0Fdr3t7dEox24mAH
 L/XKOjfomIkurRd5E2WA74KeZqiD+wNX2YTY9iuXLf6gQhKfJkYLlEGPs6B0NJ4lclYi2
 oTktkbl01whAVHy1zWOkk3VwRNsYheL/FawXSIS69k6wvh9+EAPt0IUHD61PlgvwMABXC
 aKr8UI5HTG2CoSd5j9gjxg3RRXutJVxg2mj0Di7TTQFb9xDWQO37hq4gT45tswrxoVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991201;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=D5JmaY9rf3W+RZFkNP4og5h/YYYzSKZOs13R7Q14dD0=;
 b=iWvDYmw+yc1lUnHh/yTG9Iep5Kfo4vR20iStfPRf3nouJKzKh4ZmiqwCHCzTASZwYfTz
 KFK9x71xLpe5KTIoWFzGaLAftTdtYsogkLizDEHNcSNrtf+ie6FebKsSqoFNu0SPAZtIg
 Y2MbQNkhgd7S7e0I7ytMY+KAxKSUyhRO6qZ5tKR3F2U9DXi9W25EQFaeemAgvycWbk2ZK
 SGPVLldn2HDVDtHN3s/v4hXFb2Sbo5zZcuWzqN5cJyzXs+DOs0rYdiVzazRkNpN91F+FE
 Sgo5LleUpDb7nxr4yeNmLMAS3I0uSZuphi2wG5Mena8OPPtKCdfPR2Vwn4EacOMBd+g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ct7CxcnM; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ct7CxcnM
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C6CD8127B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:20 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6b0496f4bbcso176806eaf.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991200; x=1791596000; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=D5JmaY9rf3W+RZFkNP4og5h/YYYzSKZOs13R7Q14dD0=;
 b=ct7CxcnMRQBdznMDb9Lp1ftWNVd1CZGgBxMkAL+L1U+PHxKB7BsavkgGxymn02yrB3
 RlV+kPSOV3skaKu1zEz/2umh6nhiFgaAy9VKG/qlxQLSZVK8B3gMCqlpmSW18GBfKYsP
 YxDe2MhPwAHpyxvzJZDsVrYiVJDYjgHJo9Q4bjPhEA8FNDYWReR/0E6WnG91oC0FF1Li
 YLHR4NlMMWOl9PoOqbtuZ+Ljr2+4TlTCAyIS7rN8h7AoyD7KByp2iDMA3DAoUKY0zeYm
 hCjleu8WXcbt1Mj8rMSZeJ7XUdXtx9xevdbAjbBd5Si7GKPumk3ID3Nmr/xMJ+6+gNvo
 RrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991200; x=1791596000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D5JmaY9rf3W+RZFkNP4og5h/YYYzSKZOs13R7Q14dD0=;
 b=yxLjP2+JIJjuTX10ObZCFjJJWLbzj0KC0TAApNugUvCB1kCWvsDoIlUQQpfxQ/k+8s
 9ISwpG++KtVoZx0ismuBGxiiDEq1ny+Cpffkr6kI9ubkqWzM05lmnTc3f/SjRZU5JG3p
 3b3Ztmuib4y2T3Esg7OepW2mbg97tU4nL1tlsau5mW1jsuQJ71oN3qcBeKD5FcTb5/hM
 BnBEKKzc5dY05iRuPMZn7XOFcRqJVZHx3gE0kJd537QBw5vPXHicABhsOigkT4O75v+a
 Ns+x1KpmxCaGiW3rwahFn8avEztLVno4oEt7RC8w9y4mqbUQomhdN0emulXmWbXLTRHw
 WsCw==
X-Gm-Message-State: AFuF++kBd6yZLhWyjpD7SJHV6xRNHqx3/ObRGfIjNoetu8w3wgZ8dC68
 UPNx/y1gwEMOz7tNSHEX3g2Ued+B0ACPQ+MwLU5oNpac74OPqQTpQsW7hJ5yfQ==
X-Gm-Gg: AYBFou2l9BiVbqDJFwPYDdNd+PI81wYZGz0zsqpyWtfj+P+O6z1fmq+GfMAMPen7s7L
 k7D/2Tu5Rr6dupJNeODXMtEOK2KQhH61aSFVlK23Bc9IGddZs0y7+q0QDW8kdbYK2AhEFwOpj43
 40pXLk1TyAh0Zz4/RDV7tAOgHmteZ5ytWmIE4UbOkTqG46ET9E+axqg+tlLkPQ4wpo/+Vt0BIXU
 XDQaq09W3Fp5zKU0UJvPa6tEutQJiEu0W+kXwT4K7t1VW82fBz7w/sEvaYwlwvakiiD8AROpXko
 Vsb660dT/sDM1HnIMctA1mWPabgTuZZ2CR/K9MhfAyvLuAd+EHSeUJjFGYqnfqO3un2EHTGVrZm
 AdABD6g3CvaPu5nxNIvlxfl/KNBOc47V2j2/W+GetVlep/3QGoi7RO525gOD9KcXvujYtz/F6a+
 TuX4GC7sAtQuf8EPDXQFzR3iHzT5U3qKYnkkIVQLI1HQXc690NjWcKLD6M5mHFeZGLgT9Eq1JI6
 4aXzmKF3/LG0kFq8hlbPmI5D+gDjQQ4G/36gnqIqhwt7qa8tz9/nxGRB3zGS0mm4hs+MYpxo71x
 5/bF345F6jDJgJ4ehBVSmOC9NkEJpqbYn0Bo8nTvCiAw2RR1vUIAmKh0/RG2dJgKduzO9PezXt3
 3C6KhTxVBQs1vVfaRERLy9vL11/qFCSllNDnfbHwfMA==
X-Received: by 2002:a05:6820:2218:b0:6da:3a3b:5266 with SMTP id
 006d021491bc7-6e09db9bac8mr745474eaf.41.1790991200066; 
 Fri, 02 Oct 2026 18:33:20 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:09 -0600
Message-ID: <20261003013304.400979-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-dotenv: bump to version 1.2.4
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
 package/python-dotenv/python-dotenv.hash | 4 ++--
 package/python-dotenv/python-dotenv.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dotenv/python-dotenv.hash b/package/python-dotenv/python-dotenv.hash
index 53ab12e11c..3e9be0ef95 100644
--- a/package/python-dotenv/python-dotenv.hash
+++ b/package/python-dotenv/python-dotenv.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dotenv/json
-md5  72b43685c14b492ced7ed6fb1e3f1d63  python_dotenv-1.2.1.tar.gz
-sha256  42667e897e16ab0d66954af0e60a9caa94f0fd4ecf3aaf6d2d260eec1aa36ad6  python_dotenv-1.2.1.tar.gz
+md5  ef4507c345544f1b9ef984b8e31eaad1  python_dotenv-1.2.4.tar.gz
+sha256  f0d53e69935a851c0dcc78f3ab7aaccd8cabef0b92382b576b824212902873c0  python_dotenv-1.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  LICENSE
diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
index 6ebc4f6c8c..253fdc1e3f 100644
--- a/package/python-dotenv/python-dotenv.mk
+++ b/package/python-dotenv/python-dotenv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOTENV_VERSION = 1.2.1
+PYTHON_DOTENV_VERSION = 1.2.4
 PYTHON_DOTENV_SOURCE = python_dotenv-$(PYTHON_DOTENV_VERSION).tar.gz
-PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/f0/26/19cadc79a718c5edbec86fd4919a6b6d3f681039a2f6d66d14be94e75fb9
+PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/74/26/2fbeedb218a787a5eea551c7532cac4e009f83d689dd2faa0d0353473f86
 PYTHON_DOTENV_SETUP_TYPE = setuptools
 PYTHON_DOTENV_LICENSE = BSD-3-Clause
 PYTHON_DOTENV_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
