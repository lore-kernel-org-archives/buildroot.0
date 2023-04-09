Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F151C77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 14:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF80C60B32;
	Sun,  9 Apr 2023 14:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF80C60B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id llLldjIo-ZRa; Sun,  9 Apr 2023 14:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15CBD60B29;
	Sun,  9 Apr 2023 14:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15CBD60B29
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92E4F1C38F5
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B8CF60B29
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B8CF60B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Ns5CDd6ywmf for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 14:38:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 774CE60B00
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 774CE60B00
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 14:38:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94a342f15e4so51936666b.0
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 07:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681051085;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qwTKQqDXPqCI72SLxClrsbY4KCcRsISzuZH9FS918bA=;
 b=j4Q7Nq3Dc3GEn0CBQig7bV5aGY90xVsxssoY3ZwS/1JUEE6ezHpYqbLCbxa2Cq+cFU
 CDMLALO3wS8NUHV8Ivg1nRRX2RQoKNW2VQykA6ldX3koTQm+VvXh7pSjAjQUUZxVhiJ3
 YQ+jlmFsK4a74eOywA0gTjOoMGciXzskxJx2NtS2FRGorID60k+bPSwJWyyQLxwMndxU
 AMliLxcFgAScYCSKzIyuPfL8bBxsRcl9Rro+On1ZpZqGoFPJTZn5rLjoLTP1AQmU2U83
 H406SwjCGE/s/umFCY3VVQ31VwOlfKHCsmjYTV3L9Vgw+oRkTyW0rvMd8pM5Gushcyfb
 h6UA==
X-Gm-Message-State: AAQBX9fOTE+HzKoMFz78LJOUfo4eygw8I8mz/k9voF51yjiVVFkjxWhT
 PH77CJHwl66oAGBNdm0FahIW43V4jguYebbgF2aYJQnGzvM=
X-Google-Smtp-Source: AKy350bsEpvqm5lpz7MeWtQx4L4j0zaYJtVFaA040u1A7gysCxIY0WnXV3JWYRqQLG4Je3Ia09QrvrJPhwnlovuAlSY=
X-Received: by 2002:a50:a417:0:b0:4fb:482b:f93d with SMTP id
 u23-20020a50a417000000b004fb482bf93dmr3420263edb.2.1681051085253; Sun, 09 Apr
 2023 07:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230405202149.1411245-1-pevik@seznam.cz>
 <57ffe44f-3428-6c29-5ab9-2bf525ced0b4@mind.be>
In-Reply-To: <57ffe44f-3428-6c29-5ab9-2bf525ced0b4@mind.be>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 9 Apr 2023 16:37:53 +0200
Message-ID: <CAB1t1CxkXFuZ6uN33V-2EvX2EvL=VziwDQ0yq-kRgK5dXD1nPQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681051085;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qwTKQqDXPqCI72SLxClrsbY4KCcRsISzuZH9FS918bA=;
 b=LYDqfA67nnlNzhD4BXrWHGegov3PRUeN7hz5t72UtlIyQ7kLHpcMAPnIBzmwR5Qul2
 U3KYshcnTe5kr1HFK9C/SSuxovJt6Pul2jB+PuBSemWNVOh2fJT2LjqTaiZo6rdGPZVY
 AqK4EioNxuKOcGCxzoaHL76GQQ3W6mPkqC7OEAZRRm9uioKt/ZhwyQc4UdWXbpHNr+0k
 v5eUvH7XSLQTs4PRIxPJvGP/i3mhlZWj92yy3BaLBi31jyZHgg3VnjHOwVihvqX9nuZx
 eOrslNOKo+zDavF5PFkwXZbuB6yf2mkD39K3HkiZz525GypZ8/IJmZgGjh7LwtjxCNXe
 JKHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LYDqfA67
Subject: Re: [Buildroot] [PATCH 1/1] ima-evm-utils: bump version to 1.5
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
Cc: Petr Vorel <pevik@seznam.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 9 Apr 2023 at 16:00, Arnout Vandecappelle <arnout@mind.be> wrote:
>
Hi Arnout,

>   Subject line should be package/ima-evm-utils: ...

thanks for correcting me before merge. I'll be careful next time.

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
