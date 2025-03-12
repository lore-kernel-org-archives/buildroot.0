Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054C7C28B2E
	for <buildroot@archiver.kernel.org>; Wed, 12 Mar 2025 21:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7C14406D3;
	Wed, 12 Mar 2025 21:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KeUbEPDlbFpQ; Wed, 12 Mar 2025 21:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B8A240735
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B8A240735;
	Wed, 12 Mar 2025 21:25:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 631351E1
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 21:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5220860827
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 21:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vosGPgGeXslJ for <buildroot@buildroot.org>;
 Wed, 12 Mar 2025 21:25:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=daniel@0x0f.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 326096082C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 326096082C
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 326096082C
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 21:25:04 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2ff65d88103so579699a91.2
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 14:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741814704; x=1742419504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qyBpkqp1ZnTjjNeXaokxyAggv6iuLyZohbtVkEQMToE=;
 b=RWZ8XrJf5K5qs1qpWqwvr5QahE2fxEyHL2Gx/zSZzNeXey/awww3ItklVY0CHE8lI1
 xG3VwlJPn482Kz/XS3KIb0QZdtKM/8WERhFXdlkCRoVmzUj/cqY/FivqW7qxSXjUDAym
 IUBbuZcTgk29qTU0akF2CjdkLPXxw720VMUMJD7hyZQuQEE+eFSleHWqf2avBbZPbJck
 xnK03lJRzIXobmzyJVwOA7Zjo7JRcBWHOeDnnDkwNhgK22JxpJW+T+K0f6huAzbMREKX
 Jhw6ks1dRTI03hdjoHKbg2jGUVWXybXSdb4jc0mSc8qwrp9B6KJeeJoqVSHFjofOPW2i
 NQlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+RnF5+/L6Ryi1wJ81j39vXzeeCRBs/qHuhX1vsmUOmsOv3mQ/n+frV1ArgVssv5Amc97EFWdoQ3Q=@buildroot.org
X-Gm-Message-State: AOJu0Yx/ac0xYPwBsWA5t5ESty5VaXPRsuJKdwd+EIb66ghKfWTNzy/p
 7VtCgJs4dvMQFuTCbKQAaCUB9Z8Q4amX2cCBBB2FcwW8Pck3qH+SrUry9O6IZq+PITt2Vaei2wE
 AI8nPUnB7rKWLxu0jc7E1P6PB8Jz0086d7EiDWQ==
X-Gm-Gg: ASbGnctA7u4QnM0vEnD69QZbUcn5pmZQaWukyTxFdAYI0jJfioL6kIR6YfS7cQE9ayI
 ym+2hSQNLeJw96VKoGhg3nBgbj+wlpXD6d9kcabVGZzTfNAv3pYBR9sMfoeTZ4av7LSLQKYu2zd
 I+nXWl+XiZ6rJresPUWAvMA59akEh6+t4K2EtvIURjeDGyiZY2wgWcEYJi
X-Google-Smtp-Source: AGHT+IEsgpTO/MV1Tl8yXJle0lASueqS63qU8s2r7mqSmNpwTYuNSZPeiDIK5plY8yC+hJzjuQW7x6x1l3BoTk5vA3o=
X-Received: by 2002:a17:90b:17c3:b0:2ee:f550:3848 with SMTP id
 98e67ed59e1d1-2ff7ce594a5mr31522666a91.5.1741814703805; Wed, 12 Mar 2025
 14:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250311101153.3567108-1-daniel@0x0f.com>
 <87ikofamtq.fsf@tarshish>
 <CAFr9PXmah3aNpH_LNf34QpkYxF7r2YD4yYRosFRid+5B8S4YTw@mail.gmail.com>
 <87wmcudske.fsf@dell.be.48ers.dk>
In-Reply-To: <87wmcudske.fsf@dell.be.48ers.dk>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 13 Mar 2025 06:24:53 +0900
X-Gm-Features: AQ5f1Jpa2Wqx0J3Fx1p4LGOKN6KxvUoAKGl3t5rqcpGxETDPVVIM2J1_9-d1CAs
Message-ID: <CAFr9PXmkxNrP-XnJwNG5eGiQtBHVWQPOERdotwJdsNXUpcZE=w@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1741814704; x=1742419504; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qyBpkqp1ZnTjjNeXaokxyAggv6iuLyZohbtVkEQMToE=;
 b=FHovXUkC/yZtKxOQRc/i/N3Y68RmQnQbqXyk21LjBaFqk64nR42hziXuL5r23+4E2b
 S0n2mTJxdmgwns/awAzlypfRsG3vIpmKYx4wkgNjRl9NEHeglukzdw5fSXfeMQsdDdDR
 TU9ZZhkdgreoecfiJBxzmCPjVXfIXrQSLeMNY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0x0f.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256
 header.s=google header.b=FHovXUkC
Subject: Re: [Buildroot] [PATCH] package/musl: Add upstream patch to fix
 building strace on m68k
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Thu, 13 Mar 2025 at 03:15, Peter Korsgaard <peter@korsgaard.com> wrote:
> I took the liberty to fix these things up myself (including your s-o-b)
> and applied as I would like to release -rc2 today.

Thanks!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
