Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DEFC46467
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 02:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A834281E65;
	Sun,  8 Jan 2023 02:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A834281E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqguhHOTKIkh; Sun,  8 Jan 2023 02:39:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0378781E5E;
	Sun,  8 Jan 2023 02:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0378781E5E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8257B1BF3A1
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 02:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58ACD402E6
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 02:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58ACD402E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id os6rlPksYrO2 for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 02:39:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 092F84015F
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 092F84015F
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 02:39:07 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ss4so4775126ejb.11
 for <buildroot@buildroot.org>; Sat, 07 Jan 2023 18:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d9jz3nWut+MBUUzdqm10IV0XLnjtNM2HT445dVFTe+s=;
 b=3/96Q1m4CkK3iT01LnEz0msmSIpWKGVzITWZznvfGr75GX8fPrqFO1OqT3/PEY8A8z
 XKTQLYjKqfX0luV6lRrfUA1pKfNYmXc6vrP0bVbqzn1zA0TJEQZpvGfRWUjsSjzVJzeJ
 cA2EMwVe8ZZpzghud5eq6V2B/Lz/noEWb7M+bjqpoXoGumH2YdBYCTNuEszJLUzxEliU
 //hpqztvM8fMBJUFZdj+Be9QmMVvQPhPuH0YuazsOc6wzNp3hoPgh2r/K9/e7/g1lPIa
 KyOlLutGNmOPeUgFwUs7RJhhlITph4xBSkVAyBDN9vrcswdtBE32A6ARpGheUnrNhMp/
 2hjw==
X-Gm-Message-State: AFqh2koWlFq2J8/w73GFUgufL/lzR7T6mvtleDATueYl1XZpEMCvFwuS
 pBOi+1e4YykoCgVYKnprfNyWDSx/kdIEz+XQAZ8=
X-Google-Smtp-Source: AMrXdXvnVDgylgSw2V2urlCo86YjvCVsvVBDJXnS2JR4kYkIPxF0jY53P2whgx1bTCoHT+ok6OuewA==
X-Received: by 2002:a17:906:eb8f:b0:7ae:5473:fdb8 with SMTP id
 mh15-20020a170906eb8f00b007ae5473fdb8mr50135791ejb.22.1673145545877; 
 Sat, 07 Jan 2023 18:39:05 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 e3-20020a170906314300b0073ae9ba9ba8sm1989780eje.3.2023.01.07.18.39.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jan 2023 18:39:05 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id hw16so172484ejc.10
 for <buildroot@buildroot.org>; Sat, 07 Jan 2023 18:39:05 -0800 (PST)
X-Received: by 2002:a17:906:dc2:b0:84c:feca:c267 with SMTP id
 p2-20020a1709060dc200b0084cfecac267mr1267173eji.261.1673145545052; Sat, 07
 Jan 2023 18:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20221230180843.521147-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20221230180843.521147-1-fontaine.fabrice@gmail.com>
Date: Sat, 7 Jan 2023 18:38:53 -0800
X-Gmail-Original-Message-ID: <CA+h8R2oVpT9SfKALBq2ooUn0CgFOJa34Rhn+C7067T1TTpyhhQ@mail.gmail.com>
Message-ID: <CA+h8R2oVpT9SfKALBq2ooUn0CgFOJa34Rhn+C7067T1TTpyhhQ@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d9jz3nWut+MBUUzdqm10IV0XLnjtNM2HT445dVFTe+s=;
 b=NrjpNkgHqGizYV8eGw8fyttkqp5EpoSRRxsR+I+Ay+IV/3HLY7y+chZcKtusaepzYX
 YDmQtaMfQL1YB9ydAUbiIIFKKSb2eYdQTSiNoIyq6pblUX1W5hqK64muHr1OnbUPmTvm
 ebDoPnp21AEkw3aau9jMbfCV7/275bChcdMJ/m3KpG1RakScLVLtJqTG2WzbZyq+bzdq
 EKFzCC2RT7l2DuiyIv4ma6JgSIcTeNeIMvV00gILwYHScGmiANfGXBWhgkiYLaLozVFz
 38WRtO9gE0Cn0wuysIoYTuPefv7tTRU5InkXuPY5EqqOXZsEztKsm2jenznA+0leKxG6
 ecsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=NrjpNkgH
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: add libgcrypt optional
 dependency
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
Cc: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On Fri, Dec 30, 2022 at 10:08 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> libgcrypt is an optional dependency which is enabled by default since
> version 1.7 and
> https://github.com/containers/crun/commit/dd310aaf5aee336d0f6236c1c2add7b7cb030482
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/crun/crun.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>

Reviewed-by: Christian Stewart <christian@paral.in>

Thanks!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
