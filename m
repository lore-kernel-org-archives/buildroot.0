Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909BBC369D9
	for <buildroot@archiver.kernel.org>; Sat,  3 May 2025 13:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27AF582882;
	Sat,  3 May 2025 13:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3kcpozMwgok; Sat,  3 May 2025 13:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6031B82B3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6031B82B3E;
	Sat,  3 May 2025 13:53:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCAC8118
 for <buildroot@buildroot.org>; Sat,  3 May 2025 13:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8DFA82B3E
 for <buildroot@buildroot.org>; Sat,  3 May 2025 13:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3nYe6aZso4r for <buildroot@buildroot.org>;
 Sat,  3 May 2025 13:52:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35C5082882
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C5082882
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35C5082882
 for <buildroot@buildroot.org>; Sat,  3 May 2025 13:52:58 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf861f936so5448465e9.3
 for <buildroot@buildroot.org>; Sat, 03 May 2025 06:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746280376; x=1746885176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eMT6vL/HD4LJGFSPgyshIHLwPVHoCGV5I7/oV55nklo=;
 b=qfxhi8+AdjOgvjrsAbYZVdKFULe3CXQZPgVuUKq2FqMFzXbazPbGxLHpOSm7QTfc6W
 GPa2xg6UqB4phmE/SmEa02Nccn/UDESqXGoJAU1tVx4gZ4yX3NOt+5qUzBrWkmCqXAI9
 RrdTgAbu1RL7bcO/OXcs94WmEqo+zUeWh3+lAZ2rJ0hTZti28gPBk+ON65/zP4zEYUaK
 w+lEtz9Yu5tS0SBo7j2d1NlX2NStOwMaPchG/UC0wt1t5TJrElJ0SlFidD8vwQ31KFqR
 VELRBKfLsPwY3bX5WMkx/jellawJ7894pa1l2n2ARS2OQyqPwMLEkPJCOJ6uyw7GR9px
 Jwvw==
X-Gm-Message-State: AOJu0YyAK7ALKS4LSIV0TUSoi7wxUzEv45DQXI0lCojJMjaNz7TWfKwY
 +ILr80BaZ0xceD3o4h5FsCmGsV90ZDCRYxptOY15mfbCdde/do7f20pbWxHZ
X-Gm-Gg: ASbGncu9UfUKsAFkx7Q5Lawn1rRcGN5wqoUms1vYli89pIqfxLIW1ttOd9d4PVSLVGc
 VkpmNguTDb8NUqZ2Vahm9ZZ0/0CtkUniv5DCpBv+I6LLIy1q8sQdKZBy0CFUxVriSkGk1nZZR34
 ySiCx8eQ61gTMib0vsSuaLVPMzNP1Fw19O8srgNfSjlLF7d8wNHho33tU2FMKLlfVtp5hPusu3I
 Fo60RjApDFd7V/DFuOjl22uNb9M41bblNdyVLHTDoKPgmhiXm0G08XbrGlOOYqPtdwtzFkEMgpP
 bqPAsk1TPC3xfrfGvsn87VBFEQe+pw==
X-Google-Smtp-Source: AGHT+IF3PYAkjW5U4EeAEHdSk2C6lJaY3iE5+zxATPH/dwSWjGcn055jQZ7unBBU4AeSkyKAvm3/4A==
X-Received: by 2002:a05:600c:3d0c:b0:43b:c228:1ee0 with SMTP id
 5b1f17b1804b1-441bbf439a8mr21127405e9.7.1746280375633; 
 Sat, 03 May 2025 06:52:55 -0700 (PDT)
Received: from kampala.. ([41.84.201.45]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc4f8sm76451935e9.1.2025.05.03.06.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 06:52:55 -0700 (PDT)
From: "Joseph Zikusooka (ZIK)" <josephzik@gmail.com>
X-Google-Original-From: "Joseph Zikusooka (ZIK)" <zik@jambula.net>
To: buildroot@buildroot.org
Cc: luca.ceresoli@bootlin.com
Date: Sat,  3 May 2025 16:52:08 +0300
Message-ID: <20250503135217.490404-1-zik@jambula.net>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746280376; x=1746885176; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eMT6vL/HD4LJGFSPgyshIHLwPVHoCGV5I7/oV55nklo=;
 b=KUbGLrh1gXhoT2AlEdAQDCLzQI8cq0vhu5T8k/GkENYmipZFeo/+jKqa6Afp7Vu1xR
 dEUaw1c9mixqVfsiKmukUjKiqciucoJI2thej0TBr2UXmqgiJjo9NyOZb16xAdsJGyxK
 8Nxo9R5qfQlNgSW8dcwrHiJOZ4Zzuaiyb0NLLLgFlHamFokfk7/x0nks699TQ0V860Bv
 Oh/y0RLDsqCZGWAs6ioeF5BKzFnuZsWbqOS0aRK3uuyv2ApeQcfc22nRBoCWiT8rwHp3
 HKP8ngzwXiL2fbRTDN3L+i9Kw5sQ+m+7yMB9RzaC7PoDEe8n83i+D98dKnZ+7x1t83Rv
 oIdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KUbGLrh1
Subject: [Buildroot] (no subject)
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

Thanks Luca!

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
