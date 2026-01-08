Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4063D1489D
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 04:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AFFC60C0A;
	Thu,  8 Jan 2026 04:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFvazdeXwHN2; Thu,  8 Jan 2026 04:19:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC9E606EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767845958;
	bh=KyvfgBIiftWWtVgjASDHuJvf9jFPaGgVeN8hZobvgz8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lEDl4MuEfIdS6uoQa5Eky3aZZRlXaghJ5bue7uxa/h/ZVow97RE6HY0wFG1ea3IWl
	 V0+S+5VaXtL7Yq46Y+tOdzvk8W1HhY3HFVh3mVCFsiTj3JW27Yk1KpLG2h1B+uHlhO
	 1+UNRKxNifkMNwo8qG3sdIZBrygXGUgUO93kh/XJ+yS8Rgs0fSRC895dEPGjjn04PF
	 +CuAYnChhCCV4t5j7jjJe/h9+8iFXxSN37krmh3lyRr936wp5X/SecrLZFyJp0f2mz
	 CixWGhF5f5Cmv7Qf2sNkUUzb5WLADK79PN+AuJh2W+wpZkiY0D6umUZPSTWn2qbnQW
	 Fk2YI9HaQZnew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CC9E606EE;
	Thu,  8 Jan 2026 04:19:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFC3A436
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 04:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6EA582540
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 04:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlJgDhqY4oeg for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 04:19:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8A67822EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A67822EC
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8A67822EC
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 04:19:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso12820685e9.1
 for <buildroot@buildroot.org>; Wed, 07 Jan 2026 20:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767845954; x=1768450754;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zyrop4vu08kRA2GuQBI81mvHpYKuTVjHOxOrFGlRlss=;
 b=YS0ZofpZaScM7OZUfsZxD9eNx+imEQgQqt4wjG41C3VD5g6ukVf5LzcTiA189QuHFW
 5/HuqN3U5e2YoXd8XYxe65WHGlJzIm3yhVu2Oh3BTJjHGpNLSsA+VmCkJIcbn1YVwLFA
 oKrNAadLiGfMoMOAhUlBxGPLTb4JEdXyA9p2nVJ0Gb/2K5klg+HSRwfIFWYEE3qy5IJQ
 ucCHtQaJheX09pX411PbDjsNayG2P32mtByxEzs0VxUgsrtApcXv8IPvjflMZFCLn4/6
 +ASLEwyAPQb56cuoTwH0WpwrbQl5tKI1jXymffH2BzWLiKSHB5rL4Zc2XKMcNFrtrVyT
 nroQ==
X-Gm-Message-State: AOJu0Yw+SZ5MSY+HPf28hGu+nUYRsakBujATvj2iy5KG0nE3i5f6lNTZ
 NXgswygNktmCfhhDs9QEbwMLY0jw2YvroOi36zZZJ6HoQIRWRK8Xw7mxdesItw==
X-Gm-Gg: AY/fxX4gPOB32gnyjrSMVQCemhEjs28oe4WyAm2QdP+JTmfUU8enyRoEXVeX54ebhqj
 MilTmWmbRHqvmrj6C87iDxNDMyX6Tw4nFfHF0NhC4RaxKCLvvsqTWf30e4DtFuwVo4/KHEuu1/m
 NJ6/RgxfWnfYJDA24sHD8JT4dg0AqgupzRqO1lRQBuSUJIsCkuu6H5JJq2k4V9B4LfQE3y0/ek8
 GLLJx2z6byAT2cTItN6tLlS7vXISUFNolc2R/0Yzdc1zaJpfRSvix+yDWv7d6+26DEOrM0GXUvb
 anofEVRJxRIPczbB8sQ3YYdy4yrrrWoLjIfafBr6xmfWcN/LBpGwJjb2nal93ExSUJf6+idv6cF
 IRJ2CiicqBpRcxSto9RMJ2WigHI9tGuJMjxUiys2hhf0s4E86wyVXR7AXazmCjzOkyVwFtDiR25
 8DV46CwqqLNbwq3Uo93g==
X-Google-Smtp-Source: AGHT+IFMGfk1VSNUxA+e8lLnM1uLYw0tND6sTv0a122UcuKURkmkTNJRc7uYabYo7xvcQT1LDJXORQ==
X-Received: by 2002:a05:600c:46ca:b0:477:aed0:f403 with SMTP id
 5b1f17b1804b1-47d84b0a288mr54053275e9.8.1767845953539; 
 Wed, 07 Jan 2026 20:19:13 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f68f686sm130093755e9.3.2026.01.07.20.19.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 20:19:13 -0800 (PST)
Message-ID: <695f3041.050a0220.130d96.1e95@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 08 Jan 2026 04:19:13 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767845954; x=1768450754; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zyrop4vu08kRA2GuQBI81mvHpYKuTVjHOxOrFGlRlss=;
 b=TAPKelF5T7iTufYtMT7zyw69zz2jymiUeC/UlNn9hFPjN0YP+DbJHpW2fvvAFKQwzY
 IKo90L+vrKbLxGyN2rOj4MqBrcGJ33FuKRi1m8ILFyRe1PEhnGJguiKu6FuMhsOLAK+R
 A+5NpIc2mpnolWmwNbPWbEGoVMG1zrwvZ9U2Hax+vfzCmJgNAkazLa15dLdyyXj2BjeI
 cAzuEhgrm+SEjYA9wCbhnhGCINbcHabXMvelyb7M5VNuAmLOlj3eSb+zBEWgVoPawuqF
 0ygB/2Ajfrzm3WauA30PWML9EYZ9jToVOLapBqY0StzxdkLCPaRDBTeMMmLubksi8l2F
 +3kA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TAPKelF5
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-07
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-01-07
===================================

      branch |  OK | NOK | TIM | TOT |


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
