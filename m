Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBA5D2A54D
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 21:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48FE4407C9;
	Thu,  4 Dec 2025 21:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVDHSv3bOVRE; Thu,  4 Dec 2025 21:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 627794099A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764884026;
	bh=vGtjL3IcQdGZKFubff8sj39e0UUHCKL/OrgQVATqUHI=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WWX8avntl1AaTc4KFs3X67jMtf0eUlGJ8XYAmLz+jwFDb0gyZmqqP6OGqLXJqTbPS
	 TOVhyYg4qtpyKa0NEKJ6IIUmF4IDCwg1Gqyl24acBm0zGTLeifiNn3euO4Bi2yl+D5
	 1gvt1lnCK/jooU4/Lgz+1OO/vUaKFL2+HL5e0TUjG3eHneq6jqmrYWOraK6+79/9Ij
	 sJ1j17Z1Z9yASHU2g3TvlYctGc2JVl82RyH/zPvhleRnC6Vq+YJw13sbOJaKPi9dup
	 iGQvrX9wYhTzUOa8tX08OUkFNZl34Zj88XgDqRk21MAsfviVYcRIO/5TCYWdLhOGa0
	 yEcTPDFEkNk0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 627794099A;
	Thu,  4 Dec 2025 21:33:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F25ED199
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 21:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E030B84536
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 21:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DKp7I53KLjr for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 21:33:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::664; helo=mail-pl1-x664.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67C3B8452C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67C3B8452C
Received: from mail-pl1-x664.google.com (mail-pl1-x664.google.com
 [IPv6:2607:f8b0:4864:20::664])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67C3B8452C
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 21:33:43 +0000 (UTC)
Received: by mail-pl1-x664.google.com with SMTP id
 d9443c01a7336-29568d93e87so14821555ad.2
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 13:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764884022; x=1765488822;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJ/1zJgjpmjurKS4T+zC5YpY6YwHisf2WssWw/P65Kc=;
 b=gNzUKY0f7RX7NyVDzz6s5Le+dDokzY6eX73ztRkoUkCFblfw+MfrAwNhekeXycuJjR
 i7M+fYkTmWqou77KV1bbBTUvpUZH7aB89pnH6iU+H3BxA6LGODMeF9tO13SqFERrNhpy
 cVjmCIFiXJcBypqM4hSjpg9+Pvks+1mE+3I2dbrVm1vfebhkYCGSaeOsgsWCdTrdKJEa
 TuthSd5u22UvF6DPuhZKM7GYwW52JI1iOuUqqQ3rXK2ULgWjtitHcBDMhnKdXK38E8+G
 7y4CNQQyTeYzm7kkrgOxTcJPvxA3qCHbZkUpc7K1188nf9G6Dtb+WoBN2IHJhJ+jyVaR
 8/GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVYW4atxzul7QyJ2B4SlM+hvysWgUSIuMqvgOr3bJFQuZKmaJHPKY57RhjbOurzPsoKKrLio2jgzA=@buildroot.org
X-Gm-Message-State: AOJu0YzIpSuuVVFzazngLB/ROFsxWy6QacOjgDJxdVYPtEXYLO5NwgzE
 xPBLGHdKAXjT1qxWfoc0ANti+gLegBijgn1tHKZxLDNmjtjTWcgEvaX2fiK29S3WGObBsVQYvUV
 gl821HWfg03ut0zF3ajHmgPlAKc3D8cRt1O397MetGrJlOSzqj4VZJ9qWjL9Hn9SmWoIPteJhlG
 IMC9lB2WeAIJvNwRYi/RnfD/T0Mq0FQtekSmD5Z9BBtVc8cs0UgmIK60xQP2Prgi3peG97+H6hz
 GVwmo3vfRVYtEQ=
X-Gm-Gg: ASbGnctOHMHOSV/J2KVOZas+3jKKPWwpnvpmpgz3CaBu/V3faFtY8vQUet5/RYgNSap
 H9+I0I1DcrwZhnvGChKh8GTdpA8ZFCUHz22KMbkxspAuEq2wawf308QPc8Nb4lMBAnTOxicGQ+b
 2GiMbAgD8s0mX3KKKmer9hyqqbJ2j2SpB1QG3JNmpZ4wPpfV2+S8jGquvSQYQWpgNADR6KQo70c
 0S7PatHuJvFZ3b+kqx/mq4W79a4AzgamrV8a0Im1ezzpDr7IGzTq4f4MUrMiNcbl7qiVf+JhRBZ
 5WyKAJ3T0E3SRvYQR8fET7A+GdEfh4or0VfkbCGQLWlZ1si6FqKlSLZy+oOGDKcTD8cjWtWqx4i
 JoTVYwiL1V270DG4gkoEqKk8tnVb5Lq7BM2kRTBgQhuP6lKor3Ma4BVs5pMED8aGUvCNvgyc3aR
 2q5aQrB8KIBF7SaPXZEAZgSeslhCx/zYgK5t1/mOtdcFGlX8U=
X-Google-Smtp-Source: AGHT+IE77Y1sf9NlqPNM/5wyLvsd/O9KPc7Z1MW+Jk6NP3Py8/vhV+KxNew23PCk9PJ5aMQ3Y5Vo9oIQZYS2
X-Received: by 2002:a17:902:cec4:b0:295:86a1:5008 with SMTP id
 d9443c01a7336-29da1c91295mr57779795ad.38.1764884022404; 
 Thu, 04 Dec 2025 13:33:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-29daeadfa9fsm3418655ad.61.2025.12.04.13.33.41
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Dec 2025 13:33:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b79f6f91bcbso174119766b.0
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 13:33:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWCVlogmkGjyZpZ8c89zKsRWEAx3rBpWU5VkM7SLP8VDL30UOY/gLCfLnRRlvJp1vV/qCtbKd39ltE=@buildroot.org
X-Received: by 2002:a17:907:d02:b0:b76:339d:63ed with SMTP id
 a640c23a62f3a-b79dc77829emr772097766b.52.1764884020509; 
 Thu, 04 Dec 2025 13:33:40 -0800 (PST)
X-Received: by 2002:a17:907:d02:b0:b76:339d:63ed with SMTP id
 a640c23a62f3a-b79dc77829emr772095666b.52.1764884020103; Thu, 04 Dec 2025
 13:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20251123133431.1499202-1-thomas.petazzoni@bootlin.com>
 <fe64d9aca519af339d5d30054c162d0e@free.fr>
 <CAGt4E5vMkqsHt2sUUqLWERZyRvQXyp1Z90E4wx8yPRP6CEiWgg@mail.gmail.com>
 <20251128102146.2afd777b@windsurf>
 <CAGt4E5tGGkOAtDYysD2DcusQZNhfb6CV5mtJPPNn_oWwr+M04g@mail.gmail.com>
 <20251129221713.364a5085@windsurf>
In-Reply-To: <20251129221713.364a5085@windsurf>
Date: Thu, 4 Dec 2025 13:33:28 -0800
X-Gm-Features: AWmQ_bmBO_LUeZfMhe3HoPOpzTa4iaC9i8qyklbhHub56R55kDFw4LWaU6Ozxqc
Message-ID: <CAGt4E5s1JmJEBk+jBpGarU3+tahoeg07282Oj1=kb+pP1eaJPg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Olivain <ju.o@free.fr>, Buildroot List <buildroot@buildroot.org>,
 Bernd Kuhls <bernd@kuhls.net>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1764884020; x=1765488820; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AJ/1zJgjpmjurKS4T+zC5YpY6YwHisf2WssWw/P65Kc=;
 b=AnqfcNf++dfWRTz/OSXt+o/aMSjJR5hMvX1kIQWvAbwLc83P8anzYDefZLmeoY66/X
 x4IE4iNM8nXpGjBF/q/m4c+qVnJwL+bPkFABn9emjKXCtU2nwvn9bLKP/qhOTEfRg9f1
 du7bxZjY0deiIQsmD1Rg5uyGEHgYoABT2oOYo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=AnqfcNf+
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: fix build with headers
 >= 5.10 and < 5.12
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Nov 2025 at 13:17, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 28 Nov 2025 13:16:24 -0800
> Markus Mayer <mmayer@broadcom.com> wrote:
>
> > According to [1] and [2], e2fsprogs does the right thing and will
> > propagate the "not supported" error. I'll see if I can set up a test
> > case that will trigger this function call, so I can verify the actual
> > behaviour.
>
> Sounds good to me, you don't need to do a formal test to verify the
> actual behavior.
>
> How do we proceed? You send a follow-up patch that improves mine? I've
> anyway had no feedback from upstream.

Yes, that sounds like the best plan. I'll concoct something that
builds on top of your patch. I haven't had any feedback yet on my
series from Ted, either.

Regards,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
