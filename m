Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31068C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 19:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7249781E65;
	Mon,  9 Jan 2023 19:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7249781E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id or7UyGP_3Z9R; Mon,  9 Jan 2023 19:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCC7D81E5C;
	Mon,  9 Jan 2023 19:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCC7D81E5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC6041BF289
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 19:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A456F81E5C
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 19:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A456F81E5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BbtOMKhaPe2f for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 19:55:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D71B681E21
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D71B681E21
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 19:55:22 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-14455716674so9870829fac.7
 for <buildroot@buildroot.org>; Mon, 09 Jan 2023 11:55:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8OzER9XhzVWYfj60XqRF8Lb1Fj8fX5KKL8C5H3lKxxY=;
 b=c426VugEioSScKsmYalSoafOHdKXPKGiMrFDpuFOkAROa5uTH0tz+sSrtQOJR/VAAq
 z9tJdFjVA73CXixbM2JCsoiN4l5KSrYBQnkJ0fWeFmQQvSs4S6dLaKYjAUAqqxtD9Vj8
 1fPdgRrm0Yo74C0EB0HJEMrXGZ1e6G0OqiNLy19A5oznTL4ZtvoZVP7+mymw8BX5Zsrn
 RMGard8cn3mybEg2koEaQiQc6EJy1eA4u6nWFVBkGIh6iuptAgw/hdiKyXyKPFBteIsI
 mJYGiQzYqiS2ROqKNpMNE1GSEnyHT8w+CVdk5sBSkvs/0EB+COY7VGiL+nt49Mmf9QQM
 VxxA==
X-Gm-Message-State: AFqh2kprMdtucwQBPAQT8e8tZ6AMLFWeyc12rPmh0B2GelWoodXJg4JL
 rEKg27+3sz4oRpQgFYNGrIUROzpb9rVTFSAd3vU=
X-Google-Smtp-Source: AMrXdXuo81q9ExFb8jS5EouLk+aYIfX90SO6QE9HoqnOQfhlRFpM/d8Su6uJDypR2EeLuxYfrLV/GdJpqQYqf6W98vs=
X-Received: by 2002:a05:6870:8304:b0:144:9744:2be3 with SMTP id
 p4-20020a056870830400b0014497442be3mr3223357oae.93.1673294121838; Mon, 09 Jan
 2023 11:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20230107010437.2471513-1-james.hilliard1@gmail.com>
 <20230107010437.2471513-4-james.hilliard1@gmail.com>
 <20230108222926.GJ151997@scaer>
 <c81e4acd-265b-ce85-6ee5-fd1aac0edf49@posteo.de>
In-Reply-To: <c81e4acd-265b-ce85-6ee5-fd1aac0edf49@posteo.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 9 Jan 2023 12:55:10 -0700
Message-ID: <CADvTj4osozQ98L0rKkpz7ehCqR3oA5gtsWUCMQPTOSL_qJTDTQ@mail.gmail.com>
To: Dominik Michael Rauh <dmrauh@posteo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8OzER9XhzVWYfj60XqRF8Lb1Fj8fX5KKL8C5H3lKxxY=;
 b=NjPhb3TrhgGSD96P7epTf9b/O2kql8NHLLhBQENCOrAQC6akpUWCbx+Zfc+H//pm/2
 ehFMZwJRwT63w+dt+u1QS1eSy/+3rGWDGDfELq+Uc8NhSGyZQAfdEjsE3LhuGaph1PY0
 S31YkSWL0o3q2ZtcRt/ebeQXA3FlgUBUU2TA+rPk46yMn3bt0a+eXS0/0ezI8omXJA/i
 RSnN9VPJ1JZdhqJx/qszk0+lTlEbpc2Ntz+xSCYAu2zVQh0mWMmdJCkbSUFhtqKND6UH
 itWz3YYT2qhollmR/XlFoqzHm11UtWSXq7gUulCYzsMKL0m7o21qREK/pz2fs6LFgMXB
 HVaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NjPhb3Tr
Subject: Re: [Buildroot] [PATCH 4/4] package/ccache: bump to version 4.7.4
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
Cc: =?UTF-8?Q?Anders_F_Bj=C3=B6rklund?= <anders.f.bjorklund@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jan 9, 2023 at 12:21 PM Dominik Michael Rauh <dmrauh@posteo.de> wrote:
>
> Yann, James, All,
>
> On 08.01.23 23:29, Yann E. MORIN wrote:
>
> > Dominik and Anders made hiredis an optional dependency. Given that
> > hiredis builds very, very fast (just about 3s here), I wonder if that
> > really makes sense to make it optional; hiredis has no dependency that
> > are not dependencies of ccache, so there is no hidden overhead.
> >
> > If hiredis support is compiled in, does that make it mandatory to use a
> > hiredis server, or does ccache still uses local files by default?
> >
> > If the latter, then I think a mandatory dependency is OK.
> >
> > Dominik, Anders, did you make it a optional because of a previous review
> > by Thomas asking so?
>
> The decision to make hiredis support optional was only based on the fact
> that, well, it is purely optional :)
>
> In hindsight I agree to enable the hiredis backend by default since
> hiredis builds very quickly and does not pull in additional dependencies!
>
> Maybe the more interesting question is whether it is really advisable to
> still build ccache as part of Buildroot since, in contrast to hiredis,
> building cmake, which is required by ccache, takes significantly longer
> and consumes much more resources.

Well we use the prebuilt build host cmake when available so this
probably isn't that big an issue.

>
> On 07.08.22 14:39, Thomas Petazzoni wrote:
>
>  > A possible alternative we could explore is to no longer build ccache
>  > ourselves and rely on ccache being provided by the host distribution.
>  > Of course, raises the question of which ccache version is available on
>  > the host, and how to tweak its configuration to match the needs of
>  > Buildroot.
>
> Best regards,
> Dominik
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
