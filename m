Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F22FCDB466
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 08:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B8FC4F092;
	Mon, 22 Jun 2026 08:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqp309NPb_Te; Mon, 22 Jun 2026 08:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51DCA4F08F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782118226;
	bh=GX1/lA0hqDY4PeAMNFU8W4ISYZmbukW7xElTkz5Tpc4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lLOQptRqdTFWyuztKTHo1NAs71N4OQfxuDEJHzEdBfZissCi41EXKfkLTLinTOJ+r
	 EVspP4B43o0FVYKrAD6Vg6SrGyNRTfyKBVtMQ4eHzs+hq04P+hwoaAAURQwtXBVAjd
	 h9w3HAo/guO3vXVo50EJYMA4gkJZKtwGvc3XrelTsV85q+r/a7Lx5woV8AeaUfgpge
	 HB4hUvrwEP3rcVywtMFAztKAG4eRLJ0OUuGVKVYx/3OGI3zRBI+0X/Ibx4lZrvkBpO
	 dWYMKMzoZViR+81vz8YTz9EhW/UpuEg0E97DCJPR2GhYFkqrjqhStJo34Z6AdY4GA/
	 5OoroiRfm1GUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51DCA4F08F;
	Mon, 22 Jun 2026 08:50:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B16FF367
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 08:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5864784FA4
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 08:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id my3yr0IvYxdc for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 08:50:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=thi.zirnstein@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A53784F9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A53784F9F
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A53784F9F
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 08:50:23 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-697bd41a4ecso512832a12.2
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 01:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782118221; x=1782723021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWNriDsohFgD9GLuFsVINkcwxFTn01BL1s4nShcdBHk=;
 b=m0NN3Q7aBGXcNAdj8Kj21rILy6659kPsgw03Y0sw+UqXN4l2h9aTN53mlgD1uvb0dO
 t0t+/18OUDRQ0jhWR4ZF4Ivw1OtvWEOpwXaFTs1W+0/KN6uQjDx+o9h8IiVLXOVHQgJA
 yV8ALIpc1ctfdGEinf/nYxuwTpjLys8jnEVTKhhNoOq/HZZL8LvvhxQ6yQo0VvwKayNa
 3ikB4YvyfRfuHNevCew5+v5T0rSSYC+pt+dQBA5pMPrO4nmggQ7jyfaq9LC0f0VkVFbC
 1xc/yFVp2lyub6z6gP2y5abWWc396yykK0BIyAOb2NntL1U1ja6SzV8oZBZCerZG2Z1w
 LJzA==
X-Gm-Message-State: AOJu0YzlcKvNNc0ooMKqRz7OnjdyN1zDmYp18uFuCWuG1g8Z0fuZvpfz
 GfXxPob2KSJFpoCXBuILh7Gdbk/G0uOAx3IpfxHCyKClayWIPgSAUs1Dk93B4nkP
X-Gm-Gg: AfdE7cmijkGxZtYvEMo9uSqKof0EW4lolBA8czzn+lAoPHgEX1QCTUw4+3LRuB3IrID
 nSnJSpl3iUgPow8chfxoHLdSnu2ciFH/hu3ogzrj6glRCuCPTEqflld/7PsRXtH+CekzoloFidg
 vvv2dSCVspm4agAkyHFOpJqMCPMQJwUeC1Y/ltpZLDU2ztyUF5azy9m9XKfuqVZomO9RLoWWNaT
 V7zG2YkiIN1WlizNPPcu5/oAn4HBqAIQZXGijed4Kvsau1iMm5t9Xn0YR0+gJU5wMn+8zt3MFJD
 qTpRGqErdYQdFisS0cZcwBL8ivwaq/CC4Ij8zAv+ev2qATnnfsKIDlbfhF+dr+3v59HK1WJrouD
 KjoiWkBbv71yqO7KntLJyGK8cO3IpYzQ+Rl1D9HVxM6hXtGPXGLAfYYkGqK6MGM3bBB38XoZ61u
 OtFFMos9cXXfuqYRaVfkQ7TqCXZ1bz8OHwgThWk2DjG+5RNc40IcxCVxzbPElod7HkJDd+bwovW
 DV1HjPLMWdUyg==
X-Received: by 2002:a17:906:4fc7:b0:c0e:84d8:f181 with SMTP id
 a640c23a62f3a-c0e84d8f31cmr141718066b.38.1782118220737; 
 Mon, 22 Jun 2026 01:50:20 -0700 (PDT)
Received: from thi-server.fritz.box
 (dslb-002-204-230-174.002.204.pools.vodafone-ip.de. [2.204.230.174])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c0c5e998decsm317374266b.22.2026.06.22.01.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 01:50:19 -0700 (PDT)
From: thilo zirnstein <thi.zirnstein@gmail.com>
To: buildroot@buildroot.org
Cc: thilo zirnstein <thi.zirnstein@gmail.com>
Date: Mon, 22 Jun 2026 10:50:11 +0200
Message-ID: <20260622085013.802927-1-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782118221; x=1782723021; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWNriDsohFgD9GLuFsVINkcwxFTn01BL1s4nShcdBHk=;
 b=QFCQgEvIgZpITwmAXsDqkui/Rq9Ax+8B7BEN+YWCZck6KqGSHm1KveWKs8Tjcpj5V6
 UdEFv+fwAjUEPpJ84G+yZY+rwhUbLHYiMFHqvc44wBKB9aVMjYW0cp/C7NhZJQ7GBhZY
 Ul5FW+CBJiz5dNKusgoAapWN/Kza+PbQN9p3W6UZXdOLdBKKK8su0NysXpLEZ8xWH0fV
 u+wAPY2CUASJMfJzfAPwr/VtcTE2DCHOrKm9T8zNy0jNIk+g0Zq3t3DK4sgHEjtqmFjJ
 6e0FgBVliaoJ1kwIlMt20sYeNHgMjc8eCLMb0t71w0Yy0m2c9qeSgfcHy7qEhf2KCarG
 chOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=QFCQgEvI
Subject: [Buildroot] [PATCH 0/1] linux: pass host-pahole to make
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

Hi all, 

Please refer to: 
buildroot.org/buildroot#184

kind regards,

thilo zirnstein (1):
  linux: pass host-pahole to make

 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
