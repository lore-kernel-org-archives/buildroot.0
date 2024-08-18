Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB265C5320E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 17:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7717140257;
	Sun, 18 Aug 2024 17:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOtiQZi_DIGi; Sun, 18 Aug 2024 17:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 567A14025F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 567A14025F;
	Sun, 18 Aug 2024 17:16:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 224DE1BF299
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 17:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A4FC60607
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 17:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0iBAxkLOZgR for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 17:16:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 84E2A605D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84E2A605D9
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84E2A605D9
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 17:16:07 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52efd530a4eso5688198e87.0
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 10:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724001365; x=1724606165;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=etyeOQbvQKNZVWlMJ7FaMBDyORfrsbznjgIzaIgXSp8=;
 b=iElPgya0UxXldTZcKljvglNF8Q+GbpHdMI8rafSu9BJ6qj6xW+eCTEGR1pbS3MwQZy
 EBXxD9lhJjanAqoGyI4yNNSWiLzbxrLrncuFNCmX1H2EsRtriY557isaFSc9FGtcMUEc
 tamV+BU35au+S+5eE2PXJnIJzpP7jRqTQ9ytsmkybMvhZtFP1k3LnEi1xpYCGCVd82z+
 Nih8jOK3q+09YuYyguo3AxlKIeuGeC7zsCsg2jLAwTurxm7H309xyTCzIucLpMvgAnOZ
 89mKiys09t9NFsbc/HK9romoivbPPxnSeVb5oPnSrdaLqRp3X1svzGkikAwBLWsW34b8
 4yKg==
X-Gm-Message-State: AOJu0YwrEcWiCvnOuUBviaoriX2ZKChoPiGj3lfkORR1pEkWge2tsiWp
 2GJVFpwY+Mrehr+b/06UUPHqbNIwnrXA9hjZ7r1OKFhOH5oh/gaS
X-Google-Smtp-Source: AGHT+IFvD9MP4q1rRm3APO0H4Lh08RtlKPxZCAzC2q/0c8+ZdDx+WAgx2GE9pjLEaECf0GUJxkLN0A==
X-Received: by 2002:a05:6512:1595:b0:52f:1ef:bafe with SMTP id
 2adb3069b0e04-5331c6ae0e4mr5323717e87.22.1724001364072; 
 Sun, 18 Aug 2024 10:16:04 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838cfac5sm530992066b.80.2024.08.18.10.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 10:16:03 -0700 (PDT)
Date: Sun, 18 Aug 2024 19:16:01 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240818171601.GB719477@pevik>
References: <ZsIK7ZE/nzzxu4ab@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsIK7ZE/nzzxu4ab@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724001365; x=1724606165; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etyeOQbvQKNZVWlMJ7FaMBDyORfrsbznjgIzaIgXSp8=;
 b=hJkr27jDgXAlIX+6gHbYnI6aAi8s8hb8snNwJLiRbXVZVAECfnUylq1Vxg9HUmPOCc
 efTMJsBCZjAOt+Jr8uS1drXxZxLmAZeTY/ep6oB8wetAWF8QSdKwYrRivwS43xUdehHa
 uDSNbIhDZycKknc/4qJgNq9v9F+5v62xllHYukWDO57ngCbMcqqgwwuLmFWx5TVOvBOj
 TcciHol5watN7F+5RZtP33rEc+7zyByX7Vf3qQwgzYm5/Q4OkL4wLe0WcMcqp0/nYWx0
 nsGJUhBm2UgD7JyUd6IPdLfkF3JEUPUR9mkWzamWiW1J4qGieHwP/ISmXybWYaV15vlI
 4V0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hJkr27jD
Subject: Re: [Buildroot] [PATCH next] package/libssh: update to 0.11.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
