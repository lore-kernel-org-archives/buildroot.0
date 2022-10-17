Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688DEC4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 16:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEE6841725;
	Mon, 17 Oct 2022 16:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEE6841725
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlsxEJADFNkW; Mon, 17 Oct 2022 16:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B62FA4176E;
	Mon, 17 Oct 2022 16:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B62FA4176E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B93ED1BF331
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 16:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A207C405F5
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 16:07:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A207C405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-zJQbTLJhHL for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 16:07:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A86F4056B
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A86F4056B
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 16:07:05 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id r14so16752665edc.7
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 09:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rw+8BigwfUpLT+emiHNGgoiq18ktDoCLJUxBw7+P4FE=;
 b=7C1vxlFJmAk+n44uFP3oeSkklatCA8W6lqQuU5IbV3WcLvZ60KzGOgpR5zx6K0X99u
 zvJ9Y+fvrPDqGSsxuKwp03zpOGEQePoEQNWtWkS37Lg4xNjt7/8Y3T5DNizCxFn9PuBV
 fx3EgwpuxVHspuPzCNsyNByyiP6/8Hu/M5hZGk1OTmyicymx5Y/5rYZ/urjkOGHfP5ZC
 XSEkEhTZGh/FGbI9y0UEbzpER0VxymrjA4QQK2WJZDiu80eCiirzknkR2uPFUXaNnVr1
 Ubl/RF+CtsLG0FEjwCggcubkJketIwwkxnw7j/dmNkamINLYtr2h8hyriwPDU3LGm0uE
 HiXg==
X-Gm-Message-State: ACrzQf2qJpYEy7E7S+/Z5Jj4WJrxCdqWxClMCeSig+5BzbTEOxvUH47W
 OB+VKLputkjwvO3qMw5NdQx3YWe/cm1xtFI5di0=
X-Google-Smtp-Source: AMsMyM604jfyXnAO05RTPYtfTzdH86Dgdru9ZX2BCMsOa0rcP1tGXkiZ1t+uEjymdJqqRr1Z0Pd9aA==
X-Received: by 2002:a05:6402:4411:b0:437:b723:72 with SMTP id
 y17-20020a056402441100b00437b7230072mr11126859eda.38.1666022823156; 
 Mon, 17 Oct 2022 09:07:03 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 g6-20020a17090669c600b0072af4af2f46sm6228028ejs.74.2022.10.17.09.07.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 09:07:02 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id l22so16748370edj.5
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 09:07:02 -0700 (PDT)
X-Received: by 2002:aa7:dc10:0:b0:440:b446:c0cc with SMTP id
 b16-20020aa7dc10000000b00440b446c0ccmr10946489edu.34.1666022822142; Mon, 17
 Oct 2022 09:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221017142849.41399-1-thomas.perale@mind.be>
 <20221017142849.41399-2-thomas.perale@mind.be>
In-Reply-To: <20221017142849.41399-2-thomas.perale@mind.be>
Date: Mon, 17 Oct 2022 09:06:51 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qwa-bzHzogQoVRubbapo1EwKmzyPML_hJQww144DWv6g@mail.gmail.com>
Message-ID: <CA+h8R2qwa-bzHzogQoVRubbapo1EwKmzyPML_hJQww144DWv6g@mail.gmail.com>
To: Thomas Perale <thomas.perale@essensium.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rw+8BigwfUpLT+emiHNGgoiq18ktDoCLJUxBw7+P4FE=;
 b=MpLZVejlOXDkHJdzc1tRBHGecuQSqLIIB2w74OA6/ggyt2oL470PDrEEzUg1DNJlR6
 pzepJESfTJd79yMKm8RQs8TwdO5b6HTvkBHZmVPeenvX0RmAW6eOGOOgn/YByHJyFvQU
 rR884rI73sorECFJ+F6jadeJEJdJapqhlNHvebqAcT/YUWA4eK9jD4aQDvGsLi9wAmCH
 zehKoXQf5OsEPT0PgNscshJ/CFJdhFl52fncdaITmjN7CY3+7lPP/c/McqidkNzIkDJH
 K53ZMGM9kJPHh844CkW4u5v5zJDwGw6oLArgc9hCMOwqia9AUkLnMoacK2sGLzPc7699
 dLFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=MpLZVejl
Subject: Re: [Buildroot] [PATCH 1/4] package/goc: new virtual package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Geoff Levand <geoff@infradead.org>,
 Anisse Astier <anisse@astier.eu>, Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============3885284351681742606=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3885284351681742606==
Content-Type: multipart/alternative; boundary="000000000000806a0005eb3d2a7c"

--000000000000806a0005eb3d2a7c
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Mon, Oct 17, 2022, 7:29 AM Thomas Perale <thomas.perale@essensium.com>
wrote:

> This virtual package implement the already existing go compiler compiled
> from source and shows it on the host package menu.
>
> The usage of a virtual package on top of the go compiler enable the
> supports of for multiple providers for the Go compiler.


Is it not possible to continue using the existing host-go target and simply
add a parameter which enables downloading the precompiled version instead?

Rather than add a new package.

Thanks,
Christian Stewart

--000000000000806a0005eb3d2a7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas,</div><div dir=3D"auto"><br><div class=3D"=
gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct=
 17, 2022, 7:29 AM Thomas Perale &lt;<a href=3D"mailto:thomas.perale@essens=
ium.com">thomas.perale@essensium.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">This virtual package implement the already existing go com=
piler compiled<br>
from source and shows it on the host package menu.<br>
<br>
The usage of a virtual package on top of the go compiler enable the<br>
supports of for multiple providers for the Go compiler.</blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Is it not possible to co=
ntinue using the existing host-go target and simply add a parameter which e=
nables downloading the precompiled version instead?</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Rather than add a new package.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Christian=
 Stewart=C2=A0</div></div>

--000000000000806a0005eb3d2a7c--

--===============3885284351681742606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3885284351681742606==--
