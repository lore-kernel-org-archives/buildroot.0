Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69146C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 05:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0519060A5C;
	Fri, 16 May 2025 05:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6brlquS3kei; Fri, 16 May 2025 05:04:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F44E6087B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F44E6087B;
	Fri, 16 May 2025 05:04:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D02C185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 05:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 198214163E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 05:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzC_BZMcE2PH for <buildroot@buildroot.org>;
 Fri, 16 May 2025 05:04:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35F6A416F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F6A416F5
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35F6A416F5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 05:04:49 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e7b3410e122so1691252276.2
 for <buildroot@buildroot.org>; Thu, 15 May 2025 22:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747371888; x=1747976688;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q9zZqoVY23R12r9Tw9ExsI5Bg5C9m2OUAyKEHiSYZA8=;
 b=tzf9SK/d6aOJZTTaDVsAW2ge1BtP409M5butZjb4z7EU2pgfxbGCRjVyIS9qmEJ2mr
 DOeF03L9tBPMHJaQ9TSmNuFaKbq5tHCr3ePrzbqZIc15Tl1xZxdJE6UIjmIdqfqqSUnC
 MuiX/sA2d3GxZcWD/9JCq0Ap1AmNWjm+Xi9MqpKfDqI1hq94WfPxlhz8RIvLP5xiFvSy
 Hc/94s0ZVXsd0sv59tLOXfu7UNT7/UkcIVjqSRBzmv60XNCRoL7Cuor/2tfq2yYxK3tX
 qwb5z3mvxbZTfLr+ikzRyaGncJ/5PqbiX29/IY2xfoFw9ptnF+6gz8/wqNWdAm10WXiQ
 WjFg==
X-Gm-Message-State: AOJu0YwieyhErsNdmOq2jM6nOSXsDsaOSMg6KayArY8RQX8ONfWfwsVy
 upxvUFDAH8W+Tb54r0cX+I4Tmu71qbFISIWYiat9eFsh/ZtC/BIh393p1ZPDuIZrX/4t4ltwnMa
 27cg8
X-Gm-Gg: ASbGncuclHVdQDfifZyDxoq2yNPyPsa3B3Ne80JIlcV+W7O7p8jv7xtmwQsc2QQFDMg
 Fztak6CzuZPtjwrFug+TXCmrtUv/9Rkhw+3lHnvk8ROC/IbE1zi61FHWrMSS2UGXTQaHyCRwlGQ
 INe5bSLktPgpSOLfzFIta6xqeCyo0oZSnSpfCieOCb840nl+LX0jZW4+wt3o+aNUMV+Bdv01YFz
 QYVuK57IPfHqHf/7Ewkvyklb7Pi2hWDI0QIMydbw7LKhHLBfwGxDzZU24sfn9RWyecZMREuvGhN
 5SJJy7UQ5AwcfdarHC1wG0b3nGOjQeq50NnZ3h/hqeV/RkrrFRcFFwMitYMKqYa5+Od2EUafDn4
 cfd/XeK9zjUebpJ+WY5njtsT00icc8A==
X-Google-Smtp-Source: AGHT+IEM4YMtG5ZoKozx4YkjoVQZ80blmF4y3LGutubQOHRA5ts9uubeUPNAlhSBeHnbnqUdG67xgg==
X-Received: by 2002:a05:690c:3:b0:6f9:97f7:a5c4 with SMTP id
 00721157ae682-70ca7a58028mr35968477b3.29.1747371887824; 
 Thu, 15 May 2025 22:04:47 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-70ca831dc94sm2349967b3.43.2025.05.15.22.04.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 22:04:47 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-70ca2888e99so7979537b3.0
 for <buildroot@buildroot.org>; Thu, 15 May 2025 22:04:46 -0700 (PDT)
X-Received: by 2002:a05:690c:3:b0:6f9:97f7:a5c4 with SMTP id
 00721157ae682-70ca7a58028mr35968037b3.29.1747371886685; Thu, 15 May 2025
 22:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250516010021.977627-1-felicitas@pojtinger.com>
In-Reply-To: <20250516010021.977627-1-felicitas@pojtinger.com>
Date: Thu, 15 May 2025 22:04:37 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rnEKw7a8QEfYDYn+RdK40mzahAj0QbZHGb4OPFMQbm9Q@mail.gmail.com>
X-Gm-Features: AX0GCFtsdwiyvBvnRTN7xiJepBfhJ7R2V_to_CBpl7wB_gwh4vD6a08xhsfdnNM
Message-ID: <CA+h8R2rnEKw7a8QEfYDYn+RdK40mzahAj0QbZHGb4OPFMQbm9Q@mail.gmail.com>
To: Felicitas Pojtinger <felicitas@pojtinger.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>,
 Thomas Perale <thomas.perale@mind.be>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1747371888; x=1747976688; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q9zZqoVY23R12r9Tw9ExsI5Bg5C9m2OUAyKEHiSYZA8=;
 b=0Tf6DJjcx0kmMloVE4N7eoXaTk/NFjGigNTtnmL3QNoX3UIQwEhE4IgQBJ0XwM77JK
 RbsgR2C+2BMl9Nor6kPikJqrDzr1Ecbz94DZnHuGaJ4TloDkiD1a6F+fQCyczipBZG2G
 CU0raH0KSVgbckIAH+LOzXjy5i5WlN1d2gZ6teTmZ3kS2xq+KZFfKmvTTiXqgF/AHFOK
 /3sE3ftGMI9rlhZlj8lXvDOAy+Zbj6Px67P+a3xoDHM3e3NdezbTb8k02lMBDF7E34nC
 gESTG388UN4U+sW4JHp1zeiXDUN8wkkBM1WODx/irN5UEln95JMhfVDFAWwL0DxIGEQP
 2/kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=0Tf6DJjc
Subject: Re: [Buildroot] [PATCH 1/1] package/go: bump to version 1.24.3
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: multipart/mixed; boundary="===============0081315974183411455=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0081315974183411455==
Content-Type: multipart/alternative; boundary="00000000000098bced063539b8d6"

--00000000000098bced063539b8d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Felicitas, all,

On Thu, May 15, 2025, 6:00=E2=80=AFPM Felicitas Pojtinger <felicitas@pojtin=
ger.com>
wrote:

> go1.24.3 (released 2025-05-06) includes security fixes to the os package,
> as well as bug fixes to the runtime, the compiler, the linker, the go
> command, and the crypto/tls and os packages.
>

Thanks for this but we have a PR open already for this;
https://patchwork.ozlabs.org/project/buildroot/list/?series=3D451046

Best regards,
Christian Stewart

--00000000000098bced063539b8d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Felicitas, all,<br><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 15=
, 2025, 6:00=E2=80=AFPM Felicitas Pojtinger &lt;<a href=3D"mailto:felicitas=
@pojtinger.com">felicitas@pojtinger.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">go1.24.3 (released 2025-05-06) includes security fixes =
to the os package, as well as bug fixes to the runtime, the compiler, the l=
inker, the go command, and the crypto/tls and os packages.<br></blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for this b=
ut we have a PR open already for this; <a href=3D"https://patchwork.ozlabs.=
org/project/buildroot/list/?series=3D451046">https://patchwork.ozlabs.org/p=
roject/buildroot/list/?series=3D451046</a></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Christian Stewart=
=C2=A0</div></div>

--00000000000098bced063539b8d6--

--===============0081315974183411455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0081315974183411455==--
