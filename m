Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093D7E92FDE
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDE694064F;
	Mon, 29 Dec 2025 21:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4agPMgmTHDP; Mon, 29 Dec 2025 21:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E5CE4059E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043319;
	bh=GK5UsolIHuhaY4JlT8EAX8MuM8xfqb7orEskkJ7KeWI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pswJOcYcUYGXadqPq2ry5ybwGiRuVzuDmq+4G3z1JaM5ttIphuT2qLT2ugAgI2n37
	 JTMozJoOpX9xX0M7pB4FXBy0V5Kjh4jmJ5HCwutuyBwP0ybWRsiFvU3LYkmvf0AxZX
	 HfCr8LcjBcGRyZP4pG/xtMabQSAiVg/NwwZ9siCsShPFJ8DEPeOYxRs9tvUKx0J48D
	 xIIVUCeKk6LgdkUlFmaPJnOdm/57+G0W/XbuUDrk9nftycguoXyyhQiAspDcUAjfkB
	 goCRlM8fPimAYUh7qRUGm5jt2HvkKGIWK7Hxxdi/LlKIh4/fpHmX+FZufV+z7cK54w
	 57Sd/PE+IRKcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E5CE4059E;
	Mon, 29 Dec 2025 21:21:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49A3D35B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F3294005B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLxJdZtwwKty for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:21:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 488544002C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 488544002C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 488544002C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:21:54 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso97015755e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043312; x=1767648112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=52biuz3LLxgAsqf72oV2IG4MFOqaBjcyHFT7xNevg0A=;
 b=sHldXj6khJYBu3736Ved0VSpFBLlkF/C3Dy/Mf8loaMnOLr6UVU3hV1UtcVqr1kXpx
 Teu69Auiij2fXJ47kQ3hFY1WeS4sXAsPPmctBi2CVmgDdOPoq2iRi4ks1vPC219GbVRZ
 iFzu/k1GZMWUf3aHgJbSOqVsJX02WMpK0OHj4vI4PPxpazhUk38+7/w8CHRwPG/J75QM
 exsdQe6yt/TI+UwCxTfvcOm2GSTdBmrTee+d1kw18wHDqfAd0+y6qafyzBfsYgZbbNhT
 iF6t1o+yiWZwmx+8+jdrm9702/swgIToAI/+/g7GyWsXslYs01kSzTtvX9YrlCzd3M3K
 fh0g==
X-Gm-Message-State: AOJu0Ywk0cHZHUcD3HkgET2siT7o1rD8/pXccHoTcnG9EBVURG8fxqnz
 ePIdvORxoQUoAsucBLz8CLoyT5511jmqyHHyQzaNr/Ws77PiJSgFVN/Gg5sMM2aFUSUFFnw8Dg9
 doTo3d10=
X-Gm-Gg: AY/fxX5DpAIV0HpT+jkmzAsyJyZRHHFGC3HKS2AVtg1glY4sKYcCplacall4TFhImBg
 lPwZMeUX+LucxLIUJ0YRVMWwkBDfr/faL+EO+Jf0/cwiaaZqAKjcBdrnRdjGjWzJQVHQPnMgg6j
 mtK7n4NLDrfRyzr8MuiWrn8tosADUYbwWOYiEoZ6yWecBLw8ynP6/9rhBojBN24zD8V24fE3KGy
 W/+T/radejZnIkvZLbGpdbYD8ZpdgBHbILLsAKaP2cgAmELrlTO7KiL6APP+LkYBSJMVD72eSXf
 wJOQGKti3gKpRjjmSvjcOLc3AznjnWjnAyjIj0lp5zK6OX9CX4XElW+TRYB03gs8YJ9hUDeGd8y
 l9E8vyEBuzNaG+QrFUD+wYXLk5pJXgnag8P44qr2uODFFMDe60pgjYNBXSSeb0SF0SlHQSIrMek
 NNjwg5BUgsWKLamA==
X-Google-Smtp-Source: AGHT+IFcV06jleFNcaf+/cHxjoCdWzox98hbT+iF78TPstZyQNYkTqndgOCEFloYwnHk5V7GVufjww==
X-Received: by 2002:a05:600c:444b:b0:477:557b:691d with SMTP id
 5b1f17b1804b1-47d1959fa3emr363862755e9.25.1767043312583; 
 Mon, 29 Dec 2025 13:21:52 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:21:51 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:34 +0100
Message-ID: <20251229212149.167902-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043312; x=1767648112; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52biuz3LLxgAsqf72oV2IG4MFOqaBjcyHFT7xNevg0A=;
 b=LhbE0FNmdjgMCUvV4pA6w450El4KuQysRH+JEaB2xZKoLYdqCNbV3CpoI53QWYRxPX
 7Kh/+bqoK4YdW7CoxvS/AocWwiK9mSL8ZhXqupgXzP6oPa394n3LA87ZSpL29NXQKOgt
 NgXUyJP6O7ixWJFbdpcWm8qMrFFSPBwovhhjZ/DZTN5T44sE6tyOVGKTpzU2/kwlSPY2
 B9HmfuYdkoI1lL/vezNeBV2y6sw3vsdG4agwxzI+kBSINvbFdBIGj1QqixSoMf+fENoP
 KOBddJwBKLoDWNq58yB9d8RTl8X44WTWvhcoyjJ6sFytLH1prYu/7X6ePJUeCJnwTPTm
 Ro0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LhbE0FNm
Subject: [Buildroot] [PATCH 01/15] package/xinetd: add CVE trailer in patch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...5-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
index bb2ee1fc9a..c99879b478 100644
--- a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
+++ b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] CVE-2013-4342: xinetd: ignores user and group directives for
 
 Originally reported to Debian in 2005 <http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=324678> and rediscovered <https://bugzilla.redhat.com/show_bug.cgi?id=1006100>, xinetd would execute TCPMUX services without dropping privilege to match the service configuration allowing the service to run with same privilege as the xinetd process (root).
 
+CVE: CVE-2013-4342
+Upstream: https://github.com/xinetd-org/xinetd/commit/e7c1ba41f4f86b436fb82b0d55cd5d387bd4ecc4
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  xinetd/builtins.c | 2 +-
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
