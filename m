Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC866CA0FFF
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 14:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80AEF4088D;
	Sat, 30 Aug 2025 14:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wT9rNP_UmHox; Sat, 30 Aug 2025 14:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA1B140883
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA1B140883;
	Sat, 30 Aug 2025 14:18:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C7D6FA
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 14:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 784C5809B7
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 14:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnr9799STU7F for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 14:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.160.180;
 helo=mail-qt1-f180.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D3DD809AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D3DD809AF
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D3DD809AF
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 14:18:23 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4b2b859ab0dso30055341cf.1
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 07:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756563502; x=1757168302;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4KUEeFzofk7o9/95D+dijMhL3KcY4skox45xcZegY3A=;
 b=jYOu31YXYb5R5on9s1LykqL04tUTUecjXQVql0dnlIyNiSSAqon6Z41B89n838rrWy
 fkOIUqguBSaCUlABPIROvzfy8ziG9DcTE0H/zsF4L93A8BkF6Ndr1BMxksdOd58gaEID
 C1ad+VdkLaj0/roW5BqYlSz3IV22aG5gRmONn1RutrQSzTEFb6hqc9tt+1dXRTw39Qgr
 0fZiAxgSQR7Iu1wOJ3RQ6/752dVx6Fv073ZZoZESWRtMgLDThbBjzU4tTPXgMDtGRRUx
 21dGiTh0/J4CnKR4s/SN+cuEQqIT7j3O+s6rNqaiP6V5aKdBS0uffncbdN1oANySSGuZ
 CusA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjUrAt76r/SX2wA1DM2gCRdxQZlyjxm9mIAeY3FibkmC7cz1YpOL1UXlhFfH5eg4MVlPbyWiGEL2k=@buildroot.org
X-Gm-Message-State: AOJu0YyCxofVD0XKWVUR0B8iREKfAvOBNcSOtOaEzeoIppgGzz9yqDbO
 wQbwUgdW9VBys+XdcyqyEjSUK6OFP9STQPMJWEVUOS2yxhvy9kl0lvtyczItNY0B
X-Gm-Gg: ASbGncvjiLBk+bbQ/GhSi19eEgIC01RAB7SJmULqMNDhU+ukUR6b2VcW1Vo2SyOCm46
 m5QVJ77wa3EnjPL0c7sq02G0kNSOdg8rAxLxsrJrS2QcZnGyhYeomEdgrN5neYXI6ix7mjw4olF
 E8SSN52dNucwBjvzPZHovXXGizxYT6td0p6TxaxjpZ4koLSVycHkzQ14lLA1dAApGGX3T5a/weV
 7keG6aF3d2KUVzIGT4DrKMoEuLNtJ6DKQ2jMoJMcKldiKfKFWAugjIPK1o/Lceyj4o+DAHmAhIX
 jHsy5v99fbt3wPFJxbqdtnlTFYz4pHPWBv6f5ognTLkfkZ3i9qSjZKpQ6/lKsI/pC2GbGxuAQ77
 l4ak/kcW+QRtB4QJVq3gnbKN3KeRzEXaua7FuwDBRJZWkc4ChgBNGaAem3aclDaTx+lfcXVxdHy
 nhhmnnw+kkzObamX+EUhg4RyhYz4/dM0dNpBbO3vnFyfxMheb4Yjgwyc0=
X-Google-Smtp-Source: AGHT+IHNgnZrLg/aWYSqtq9AA8jjfE8zJzuqi3v6aM7fVgoAQDqHb/m1sEwcVghBWmP6t2O2vJ+rDQ==
X-Received: by 2002:a05:622a:296:b0:4b3:10f0:15dc with SMTP id
 d75a77b69052e-4b31db6c553mr24371071cf.62.1756563502032; 
 Sat, 30 Aug 2025 07:18:22 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com.
 [209.85.219.49]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b30b679105sm31636801cf.27.2025.08.30.07.18.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Aug 2025 07:18:21 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-70ddab8117cso24983866d6.0
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 07:18:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUCHsNST5tSWd89ySU/sKSpcfOzrwxiwUb7YoQuZVNJdKgYsyIyElz6Ciz4nHW/T7GB5AVLGszlDXQ=@buildroot.org
X-Received: by 2002:ad4:5f8f:0:b0:70f:a2d1:530b with SMTP id
 6a1803df08f44-70fac8ee1b2mr24022246d6.53.1756563501344; Sat, 30 Aug 2025
 07:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <6e3994b190d42c3e8f45481e7f3438c9@free.fr>
 <20250828071402.175523-1-thomas@devoogdt.com>
 <540122c2-746a-4f61-a2b8-8c046e3cff3d@rnout.be>
 <59a73efb7423ad217e51fb3331e4c386@free.fr>
In-Reply-To: <59a73efb7423ad217e51fb3331e4c386@free.fr>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 30 Aug 2025 16:18:10 +0200
X-Gmail-Original-Message-ID: <CACXRmJgv=j7ph+vt8ooftAmQPqinG4j-W4Ub=1Ty1e6ibkQ+AQ@mail.gmail.com>
X-Gm-Features: Ac12FXzlz7iibcOZrej3gYd8pmu14B6gCnKLev2s_I90puChthJ_9J_ILDWrBDk
Message-ID: <CACXRmJgv=j7ph+vt8ooftAmQPqinG4j-W4Ub=1Ty1e6ibkQ+AQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH next v2] package/lighttpd: bump to 1.4.81
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout, Julien,


I also noticed that my patch was applied to master and not next. I was
also not one hundred percent sure about the legacy options I've added,
but now it's indeed wrong. I assume that you will add a fixup commit
for that?


Kind regards,

Thomas

Op za 30 aug 2025 om 15:51 schreef Julien Olivain <ju.o@free.fr>:
>
> Hi Arnout,
>
> On 29/08/2025 19:23, Arnout Vandecappelle wrote:
> > On 28/08/2025 09:14, Thomas Devoogdt wrote:
> >> News:
> >> - https://www.lighttpd.net/2025/8/13/1.4.80/
> >
> >  Contains:
> >
> > detect and issue error trace for HTTP/2 MadeYouReset VU#767506
> > CVE-2025-8671
> >
> >> - https://www.lighttpd.net/2025/8/17/1.4.81/
> >
> >  Contains:
> >
> > security: fix to reject disallowed trailers
> >
> >  So I've marked this as a security bump and applied to master, thanks.
>
> Since the original submission was not containing those security
> references,
> I suggested to mark it as "next". See:
> https://lore.kernel.org/buildroot/6e3994b190d42c3e8f45481e7f3438c9@free.fr/
>
> But since it is now merged in master the legacy option
> BR2_PACKAGE_LIGHTTPD_LIBEV should have been moved below the
> "Legacy options removed in 2025.08" (rather than 2025.11).
>
> >
> >  Regards,
> >  Arnout
>
> Best regards,
>
> Julien.
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
