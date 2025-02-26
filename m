Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5529C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 06:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 727B341232;
	Wed, 26 Feb 2025 06:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gt73f51rsFvO; Wed, 26 Feb 2025 06:17:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA8341233
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA8341233;
	Wed, 26 Feb 2025 06:17:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE8711ED4
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 06:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAA14411AB
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 06:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jw-2n9liTRM8 for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 06:17:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=kuzminov.sergey81@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB91A4119D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB91A4119D
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB91A4119D
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 06:17:27 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30a29f4bd43so57690231fa.0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 22:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740550645; x=1741155445;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/2sF1eTPZj68UzVnKcxbp6iu2uxxnAyDRTkj3OV8lmo=;
 b=kt9fMxzvT4fyW5o59MmbipVYinRjs/qNob8h5+PEQh7IEkaIa5yJYriwgpOSYPf7ih
 P8ZcJBokDCQCqQXvbGGud34XxdiXveyFQ7FE6anWL5GHvZu2WQTXPae9PSTca9s5Yxnd
 HyvqUxYtSHiUyKwEGOZB/x1ebKe6qhLvGaqpQN5wpUMU1/hurgfhtqiJgp9V0gacVZP2
 xeyCfwWI/IU6GC0vwSK9nv6LqI55aJ/3bHOn9aIEooPTqyg3l7W8Eb2vCISLPZBa/srp
 A77rC28l2qLlI74/sbWAAFyl+QGFsVN+irJo9kogtF0LehQNfhMqClPNKLKgE+zn+ak9
 MUSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1GE59uO/kpd3iGk/C5uuSHnnRKNyiDnvpAZMAOyVg09tY/qlM3GRQvRUXXMcafQJzCoVRVBfEL/M=@buildroot.org
X-Gm-Message-State: AOJu0YzBWfM+bE4AES+babE4mbrF6qMojJIvb4SlalGF1eyoR2cJhnwt
 Xped0QlHTIRi88+V5t0W039vlb186b6bowVPbWZb/6/JJIOqFNKu0ItVug==
X-Gm-Gg: ASbGncsRKNPBSTDsaOgv1TxW6YhiU2mKOoTshGoMGFVThTi1YqEEjLKZXmpyoRyItpg
 tkJzPBYPCYud10bKe4yaGmpBpW/R8/MsmEJZf0LmLdCatvEe4Fw7X5DjItJnk0BF+AqSrQI4jY4
 Lny5bkovJm2oL37BwIp5sIxv8k220qtJ5AKbORbnunYenTBg44oHvL4yuJWjm4/RvjtQZ62rXk4
 MDoFMcZkchIFQsgmnOTSz+h7SQQZxrKxDm0bfNujL7Sp84s+xB4p5M4TNExVUpdXlgFDNje1OE4
 DEZ31qJTzq9pxFIOBFJgT42h6kG0UBxzeHk07NbQqiamxyivBuRVxyfuQA==
X-Google-Smtp-Source: AGHT+IEM+VfEUOkB41LXBJbYa9kuJR/MoMw/RhWqMECpotI6uTBnl5yGOCee6UIH5bB45Qsmv/cdwA==
X-Received: by 2002:a2e:9617:0:b0:308:f479:5696 with SMTP id
 38308e7fff4ca-30b7915fa35mr18385271fa.15.1740550644852; 
 Tue, 25 Feb 2025 22:17:24 -0800 (PST)
Received: from [192.168.188.32] ([62.141.72.206])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a81ae58b6sm4764631fa.88.2025.02.25.22.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 22:17:24 -0800 (PST)
Message-ID: <13aaf7b3-200e-4ad0-b008-c9cf750cd8c5@gmail.com>
Date: Wed, 26 Feb 2025 09:17:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Meri Jaan <merijaan328462@gmail.com>, buildroot@buildroot.org
References: <CAGmsXdzOtEvjSvCe63_B4FScwUO5GK-V+N2hQ1VB0je4-Z+T9g@mail.gmail.com>
Content-Language: ru
From: Kuzminov Sergey <kuzminov.sergey81@gmail.com>
In-Reply-To: <CAGmsXdzOtEvjSvCe63_B4FScwUO5GK-V+N2hQ1VB0je4-Z+T9g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740550645; x=1741155445; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/2sF1eTPZj68UzVnKcxbp6iu2uxxnAyDRTkj3OV8lmo=;
 b=Tkte4i7ACfdlqROcBQqaYOlc4P1PI/6OHhkK8IMPVqRsd6g7UIvsg8nd9CU77yoDe4
 SmEIWBP+U2Gq5fcOjHY+8CJQWbeX0apEeZc1aJq92Fa5x42RF7l6/U2u/Thl+hToWXNb
 mb+3DoRY7+BdZSLLqYR83cWR1gEOMH7RfU3KQxrIlPxNTN6CpPNACNW0w6LjCu03zFks
 vC+E8tksqB4IFJunT5tK44LcOFiUugBxvKBQkFpf2JgS+o5lLTzBKPV5pQxi9Xo7LnXT
 +BPxuCnKQmU+XESRwY/qWPWlYFF7UnfDLZPiZaRnbWsEXSkP6Oddub5jk2vcu92Fo/gi
 1klA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Tkte4i7A
Subject: Re: [Buildroot] [PATCH] board/friendlyarm/nanopi-r3s:
 rk3566-nanopi-r3s.dts: enable hw random
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi, Baruch
For some reason, the email from you turned out to be empty, so I 
inserted the text from patchwork in the response.


 >Hi Sergey,
 >> +Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
 >> +Upstream: Not applicable, Buildroot specific.

 >What makes this patch Buildroot specific?

 >baruch

Without this comment, the verification script (utils/docker-run make 
check-package) reports an error. I took this comment from some similar 
buildroot patch.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
