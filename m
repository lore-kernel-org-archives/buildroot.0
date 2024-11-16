Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954E0D68BF5
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 18:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 288BE606E7;
	Sat, 16 Nov 2024 18:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1p3nWa8HeOk9; Sat, 16 Nov 2024 18:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2375A6070C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2375A6070C;
	Sat, 16 Nov 2024 18:29:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD1EA1EB9
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8BB040129
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKLCqEcbwWFp for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 18:29:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9768A40430
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9768A40430
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9768A40430
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:29:25 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9e71401844so233012966b.3
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 10:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731781763; x=1732386563;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cUZlp7zK6K/21Wo7AJEbXGMmj+6ftwe0WFs9WHy3Lrs=;
 b=j5KIMYJLkSX8ST7r36eiMSH9nGaoGdPz+BjjVO1NhcKV7u1v+zIhkdJh2rNf1S2kDw
 dnn9ykp+hLMkvtDIwZZIoUHjq6QZlIJtNVW7SSjsAfKZ5PsSoSJkVw7rvovPwdcoJVzd
 xOR6r75Em2bM3y5638BzBbEmN33/QPHNKLX13TGPuSp4TAhs5pV0870to+NXIRdWG94i
 Y3Vzdin8CVBhNmSPdB9ONSFqNERTMRbuOb02CndTTbKTFpELAPZ0lqeaCfqdxl1Nm3WU
 e6WKB3LdZ866/1sL55T3OdBblbQkOw95DK4thX/VkR5NDboMEqTUAo8EJ47bRneyRMU1
 CIfg==
X-Gm-Message-State: AOJu0Yy43+U88Y3NkE7i/FtG0UTaJVUPVVxCmhFVB7P7TyokmnIRu3MX
 XH9o8H2at7zzYHlU/PKNL0AftLXV73uziqE+2l8SLj4qPUV5Jj9E/CJIiAwH782rmDBD4JvM22t
 t
X-Google-Smtp-Source: AGHT+IEIQ2jt1dkjnyStL+WCSlk4mcLNgSKR1BFfHLAgCp4Yht7vHWme+NnZdcZ3WWO+qjmDwnLoOg==
X-Received: by 2002:a17:907:7f23:b0:a9e:f28c:374a with SMTP id
 a640c23a62f3a-aa4834544a3mr530632466b.32.1731781763324; 
 Sat, 16 Nov 2024 10:29:23 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df568easm332405366b.73.2024.11.16.10.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Nov 2024 10:29:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 16 Nov 2024 19:29:17 +0100
Message-ID: <20241116182919.4169370-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1731781763; x=1732386563;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cUZlp7zK6K/21Wo7AJEbXGMmj+6ftwe0WFs9WHy3Lrs=;
 b=h9O/A3vaM7uy/vXgA+zWqo9pkdJgk2AnjOfM3fhjMdPCMOVm8+Hw2fCElbu+3l46Wi
 RFJIMeHVzXr3U16noC7zaUpYviZoV4KBHamSo3PpqEXUqhPQcTBapHIqnLzmr8jLQUCo
 eBtypEnfFJ3ATXyEIyLGBnGol6DQHWHtq6WYU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=h9O/A3va
Subject: [Buildroot] [PATCH 0/2] package/armadillo: multiple bumps - 14.0.{2, 3}
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

I submitted the patch for bumping armadillo package to version 14.0.2
some time ago; in the meantime, version 14.0.3 has been released.
I'll send both, let me know if they should be kept separate or if I
should squash them.

Dario Binacchi (2):
  package/armadillo: bump to version 14.0.2
  package/armadillo: bump to version 14.0.3

 package/armadillo/Config.in      |  4 +++-
 package/armadillo/armadillo.hash |  2 +-
 package/armadillo/armadillo.mk   | 12 ++++--------
 3 files changed, 8 insertions(+), 10 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
