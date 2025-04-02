Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAB0C28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 17:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04C0983F7B;
	Wed,  2 Apr 2025 17:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oK987LeQnzlM; Wed,  2 Apr 2025 17:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EB90844DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB90844DC;
	Wed,  2 Apr 2025 17:06:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1D3711F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 17:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC3728050A
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 17:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WR45xwwWbcEi for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 17:05:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7ED8484707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ED8484707
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7ED8484707
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 17:05:32 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac25520a289so1175252566b.3
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 10:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743613530; x=1744218330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dzknpH8sABmZfgOeOg+V1DC2xHRcahAEjKyhLFJ7FY0=;
 b=SNGTE5bHDgjBXLMFJz+pLA0ZOAAoVflt+mVxyBzvnWog30TGQ9xI9frhvmG82AgVlb
 NyWiYk9Ntqhw+Eg+15fgl57HLSUHbLiqe27wunDEzLWl1nwRdmGtLSViGD1ksRlXfKG2
 YnQGyJ5a04BSGS4uSEhnxkoJnmEzqGDuzNC2xxh9TTpEQWlJk7UTiqkX7kqLujNU6FfZ
 fs1UtP9Cc/TNc/pqZo5wKjVw82uCSj/sV5MxDEmb2aDZudr+qKXBDySwE+dKniNGYIcf
 h9Ifhuji+NhIgFoVPZvJLC10ICGYzbLU4GcOL5flAP2bdP0UZrGWT6bW51mUkbjsNbOZ
 RQeA==
X-Gm-Message-State: AOJu0Yzr22Zuj2UTqdNmN7MwBUKG40N4hCIhX5w0PQZrxe7nlBAhGb4v
 LkheVooVDW6UG9yq0K2iKCj+uPlWvkdr4nrckSSsMckM6F78/yFGR2od
X-Gm-Gg: ASbGncvjKezYjcqSOLcp59D31I1iRtlJ4qTYxYY9IrZXJoSuGBjH1E0WOFDgMw8Vj7k
 tgRKKTLIcvSpbB3aS6Urch80vrQJuOzuHsv0MgOpg4RGaLxDLS2pHh57jB95UCU8qWua0rc5NKi
 Azz3Xjnf89oE4y2NAulQJ8mRLeWqP/G36BuvH08nJglU5GaU3JImWa3o7NhcibtRVRZVQ0Zs0UL
 yTJF8qNf5VBlRnpieH3UPYVsS9469xVgkt8Y7drdhoqR0qi3VJQypQwmltvvEZqo1n4uORlDFsj
 4JDk1/RiQjk4q1EEgDsbogglzvfc2GzKMXoCM1heX9I5xiNDjsM68P4xy6M=
X-Google-Smtp-Source: AGHT+IHb0nmgVn0IWaPZ17w+LrAfaCyVKe4WJR5A3uVh7q7gh5QxWJTV61n7JW5GrxGlkwAgqjKzvg==
X-Received: by 2002:a17:907:7f14:b0:ac3:3e40:e182 with SMTP id
 a640c23a62f3a-ac7389d8e14mr1600619866b.19.1743613529886; 
 Wed, 02 Apr 2025 10:05:29 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71967fd0asm946224466b.132.2025.04.02.10.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:05:29 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: romain.naour@openwide.fr,
	romain.naour@smile.fr
Date: Wed,  2 Apr 2025 19:05:28 +0200
Message-ID: <20250402170528.42153-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20241208134004.143901-1-shirokovalexs@gmail.com>
References: <20241208134004.143901-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743613530; x=1744218330; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dzknpH8sABmZfgOeOg+V1DC2xHRcahAEjKyhLFJ7FY0=;
 b=S4WEf+uIyGj0cnTiv0laSZvbzVE6I1HLT8uAsLs9vvGT+8gnBkYmGN5dxjY2YX/jXv
 U8Cmb9/yGCRuxPyWZ5VRV0ao9GLYLrLHKGtK8SNsualuAmWsqtcYTasPOgQLYUv+5HaT
 F0ndH+hdetON4LorEasRcO/drHXXLfil39YjiRa6EebRA85cbI0ZZbm7zqafgEQPOeMx
 rMflY7aMw3DL/5MuJqXcNDRnLi2tkYJ/b5pEwLL0Q2hTyT4p4+kAEI35pNuVaR79zaxN
 wJl0kb9LaU2vTcAXFELIqCWqtJWtTNZ8/qnGeIIG8xiQJduUuS4LlMHJoXPIHqH5ewgX
 /tSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S4WEf+uI
Subject: [Buildroot] [1/1] package/rust-coreutils:new package
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

The new version with fixes and improvements is
here:https://patchwork.ozlabs.org/project/buildroot/patch/20250402165913.39797-2-shirokovalexs@gmail.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
