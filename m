Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59192CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10167811E4;
	Thu, 15 Oct 2026 19:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEnfbrt-Xb30; Thu, 15 Oct 2026 19:33:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 470B581202
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792092785;
	b=fFmrO/0XPAzSBC5suxrZFI95QQz+i04LZzyAfO5A0Q5HZQlsY7eWg6pmWUCob2h3NMs7
	 +FMyZWsURPNjaf/hFhoKT+103MKXw/7F9f3JB9QWllSeQSIvntr2ypd1NEagx3Yt4obFa
	 vt4yHUaYHKTCQRO3V6UFwmW/Hxr2lZkDIDuaHEYcjuLJUwj1JqbfUpVqFSAFPDfpi5Ypw
	 Q4Frf5PHoXPLNoNsmFtp3raq6UwLNUnoUU9N7JzQozBrAaLUemc+8ay++exjqM6CrXk9l
	 n4SyxChNaZDyAk8JkUWpQ+oZXKuMnE1c6MjZbcoIS8/mWn3ltQDu9LGeygqKH0DCnMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792092785;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=dnNwMAssRjlv9drqGQoR5zaP6iLP26URNmnXK6S3XbA=;
	b=Zcs7lz4tuihdqchH8aZVjnJOpbHddt/L6mRp6pv0H8I3iEaVjhCigQq22Sata73+O3fM
	 jFMMy/IS2Cj3L9c2CCoABpagTLkd4Qv/T19jSo/YDzpaRNBmmMWLFXVPU2o4EeLoxNUJH
	 DDmzhtkTqRZg0TEIHqoSIntCaGhNIb9SOsspTr3L7qGd3qxZng0eQblQ3WbWNKMuULwbp
	 j3nO7YQ51Cz6wM4HcWkev+nDJ6xkVykmGWFVI66IfP1KitTrkUG6jqq33E0mgZSx/+KBk
	 hkv2onpwDD3aEZhJRhKKX+VlwZGeP3ZsFGb+zRDz3AXKtp1xeo9PvltTiqu4FDUL/MQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792092785;
	bh=dnNwMAssRjlv9drqGQoR5zaP6iLP26URNmnXK6S3XbA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GeMa0nMdDrciTCtRvpWAAA4dhCN3j/JKS0/Yp88fCYzBCRLHt+f/49fRP3NyuNOSo
	 LYPC2WcsciKMk93rGo2chbZ4b0I679+RGDQskbo8io+OqRdt6Wrm+140xySwVh9vHH
	 6kRkwSrkrqBLrrQSeidpUvFQxyyfUgmHD2BXEtIZOjGUtnPwRxX13AZMbMpmHyksv6
	 QWtGUNHIewvMLcSF8dAVmpP07f/qUgvwsi2mFqvTH+nGNM0H3674HW9EfcOWmHEcSH
	 ceHnGsePCtp36L7DuBif60nGE+WKX26U3N4G8QuLWyCIustzIsUcBQ+8Q2gfmvGHC3
	 Ygyp1A3hxlT+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 470B581202;
	Thu, 15 Oct 2026 19:33:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C79D362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59BBA408BE
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwxqCZcLAgeG for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:33:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 99DF440726
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792092781;
 b=MgIvvnaCMSuIYqQTONH+hp+L/GCLNl+KGrYzLfia3Z072yF9XV9hS3W28c4t72PuFLrq
 nVcM1/zzhppDlGfJx3wwF0DL9d8b2t0qWQjJtKIDPOPAocFitbkw/zzuh41qQ7iOjGa8C
 nPTRbeUB2+px33+krzvZqPIjvCpuAKcuFyLFigJyBDymj6Ch+ev8CyIbrUtaF3cWUurwo
 2zEXO+lBITLRC1SzXKcssTnotjIq+ikVBsfTtSXer2e9uHRWww19gRP3UQvkqR8wLpOjN
 RA4h5MXoPVJaw8U29PjDfolaNnh/SBjusm+mJUK/7GVrCTbk31iXDcJ9LFGFfzSPTJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792092781;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=XkyZvyK07tsDvEAbvjVsO2Pvh8S43MK4MjAXSd9vtiI=;
 b=eReaQ3/wfIBWBIikVG+QIdbL5LV7kQQS23c3Eg8u/IlEChFrhHncl55/GYgjN4d7jLf5
 vzfdmkdpqXbm7gAJ06jE6HHdzrBWSoggUVp1eahzSx+9qZXPsY04LtW0BntxmMqBfOyqS
 HnzBWpFsb9Eih0rc77n9HX1CD/Km4b7Z2Vnj5fJ4xk6+bf0GXkDa14Y3k4opsPXi51iSd
 iyTpGxqwgtNelCCzw+E5VEAu80j/hwUTMP32WENy/LVaA+4WdLdmdFklWaqoXnzQBGaiN
 mfpRulQ6gkXLYKDiYJnsuCaHGtRCQi+b8zKwpjj/5aGtih413CZ8tYHsUdFX7AakHPA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GEQlWzTi; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GEQlWzTi
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99DF440726
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:01 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-6cf995766a3so4565977eaf.2
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792092780; x=1792697580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XkyZvyK07tsDvEAbvjVsO2Pvh8S43MK4MjAXSd9vtiI=;
 b=GEQlWzTiuTkKg1d3R2Jw/uHXlxU10pKHOt694wzzxYWBSfrn2btQqSokNSq0gPhoZM
 biEdnkRcRCqtxwnVyRuJlW1vzQXZBei5An2jDVdHAXAqAk/2g4X1RIQI0la5+flEJ5TZ
 33QrBybHca5jIlsqFjWbj7DoPJtZa9AUxygAL/vYgHHsEP4GhJDBdsmfCaY0xuv0+fJO
 ttPMvCHA7V0SKLLadQL41bvokm7z43Xn4kD1QUyidBp1MXJqXBzYK91sQ+2atgwlJyRK
 8z0YAH2rm47iu9mWy4Fis9t1VkH7zH89fslo4JOZxEemsgqK74PuL8ax9a2UWfhU/KQN
 vckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792092780; x=1792697580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XkyZvyK07tsDvEAbvjVsO2Pvh8S43MK4MjAXSd9vtiI=;
 b=oYHbTWiaq+HB2ZilKxwqWTpxF0TbJwaS3nZXa/XsoaCJ4z1L2zToz0DEofyPhb41uz
 V+WQv9cWGnUFzZfBkHonXxFH2HnZogLzN80kmMcm6BbeVk85jack0vq0Jw43bWu7eF7F
 2kcxgB/eUBSAwNAs0Mz5U1gAYQfvgNpKnYS5CzGBP8mgPcYrUh0YNMmfXkKJVEYCAe9o
 0EI4VeVfVFX1HthOTZ3WZy0hAUD+9rq2DZeh/ifEc8dZcrUxHkd5hMwsGL0+lYi0ki1I
 PL6hoW4i8RSgu/6W7nIAs4n5Y/aveLJFStfgO+7JmBmETaWXjcD2qKQwTf9dtEQkkdb/
 /8jA==
X-Gm-Message-State: AFq9FYIRAon0OrvgrRpItWQiDuq80nhWbE7/juh17DQtSZ+YHn1GRRz3
 mMVyt3gu/6odOQxOBhe5SEg8J36vimD3Jvw9stRw/G+4mCnMAVP3bKuinszpWA==
X-Gm-Gg: AYBFou3zDu0QjbhjTT9cf5NovLVzEYNbX9LLYmh9HfKTY1D+49b+ZxhJpiK3CF/k+4U
 KKT6esYZgBKmvgYh2SS8OWZrH76VovZou+CyVuYpj1h5a3wZETkp9rx2lIRp9fo2i+y1jqYL3Vv
 9d5/9Iey85y4oDbvdVJOky9Sxp2+bDqu3myNVt7U15f5vYnQV1pFBD/uuki7N9Q3vkOvxDSv1it
 A5dOH9jnApC/5+fDeAxtTGwDauRhp3Lg3rJvfe+gp9SQaxSNbpDrMhZQAyBiRAXLLg+uHZ88+rD
 xHp7ciLpm9gv2o56auERAe1BlWzai4SNQdFkz202X1c5erzwclTz8yDX1g9GT4yGVi2aFsdS4R4
 66oCeNFdbiI7GHD/9mGDLUpu1ITB5kMheQc6hGuByKXmoPKrZDuJ3Lf9ozhIP59IZXMX5+6MDZ9
 R6Za//vNqNtXn71S606Ql+ZgDyqdowKyOwv3gBGNw4X8Gzdj/YmuMsfRZrRAZSpiiP98iX2AMUv
 QQ461s4ZmRYIizebIneGxllegdXYHYt1AReBhV3Z+4AIGQD0xyFOGKYlhB5N7aLnfXY/P6dQ5/B
 uMi49jKRxoH7SH+EKqehmTwphyGSInZ0o1dE5/0XJE2LaT4X+21MG7Owi1Bi0ZYg98flg6hMauq
 EvY+MOgef6C3jgy2hjKx16+wgKHMjrLDyNc/oNCNC6A==
X-Received: by 2002:a05:6820:169f:b0:6e4:fdc6:6bb4 with SMTP id
 006d021491bc7-6f9b00ef9acmr7615237eaf.44.1792092780334; 
 Thu, 15 Oct 2026 12:33:00 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-7018f2df328sm180045eaf.7.2026.10.15.12.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 12:32:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:32:38 -0600
Message-ID: <20261015193243.3299884-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015193243.3299884-1-james.hilliard1@gmail.com>
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/9] package/python-jaraco-context: add host
 variant
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable a host variant for host-python-jaraco-text and carry over its
build dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-context/python-jaraco-context.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-jaraco-context/python-jaraco-context.mk b/package/python-jaraco-context/python-jaraco-context.mk
index f812cec8f1..dff0d21910 100644
--- a/package/python-jaraco-context/python-jaraco-context.mk
+++ b/package/python-jaraco-context/python-jaraco-context.mk
@@ -13,5 +13,9 @@ PYTHON_JARACO_CONTEXT_LICENSE_FILES = LICENSE
 PYTHON_JARACO_CONTEXT_DEPENDENCIES = \
 	host-python-coherent-licensed \
 	host-python-setuptools-scm
+HOST_PYTHON_JARACO_CONTEXT_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
