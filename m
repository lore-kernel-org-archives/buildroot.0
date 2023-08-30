Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C37C83F17
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 07:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3785812A9;
	Wed, 30 Aug 2023 07:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3785812A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMtj0kW5Zy2Q; Wed, 30 Aug 2023 07:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 387FF8129F;
	Wed, 30 Aug 2023 07:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 387FF8129F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58FBD1BF83A
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 07:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E3FB417B9
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 07:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E3FB417B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qN3wkGHYprz for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 07:29:37 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D55BE417A8
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 07:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D55BE417A8
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-52a39a1c4d5so6770404a12.3
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 00:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693380574; x=1693985374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zk2PDaom4GmilODh7ygKGFmSQ1OJmJKnSQJcdYfpwj4=;
 b=DU4A0WER6qkRgQ5Kc/sdHjGF8tyz0eRZPZ1pbzdazuJtGs0OTsNV3RFP47hYIEYojV
 Sw2lq2JNd2+T45Zjv4rJ/isdytGdflyv0o3IdyOcTxgXJnuuSFIRSH/YUsTpwEBUSnD/
 lIq2/7gJmJe143i8F57cyRUzX7BLcuUlYvKF/9FdDNe157sONK5cFAxHPpjnlUo3Z1yr
 8lhIZH4918L6pVHAUgJej7ojmAt+ejcmrNG6RnNkB0pecOhnKiu9uD0ibVMrcMpTue3+
 LwS0ZP4RDZVsEY1iO7ydXF2B7W0rBltdvAihfp7KqJxbnuto1ovZw2Fiu6w1Ai1exK/A
 2O4Q==
X-Gm-Message-State: AOJu0YwUU4obKPjppLDFZDH2ytJMiTmGXA/k1rSbPeAE66on7/q3SfM8
 +GBRcDaIkkxkkFc/zDQe8cqJr6mvfCqK7Opv5xL/Og==
X-Google-Smtp-Source: AGHT+IHjxX6sZICKiyLY+h8OjMYCNTcyupbUkS9T1/4VDUp3lkU6V636mcJDbIhs5lWm8MeRbEPIqQ==
X-Received: by 2002:a05:6402:325:b0:523:3e90:68b0 with SMTP id
 q5-20020a056402032500b005233e9068b0mr1074919edw.21.1693380574417; 
 Wed, 30 Aug 2023 00:29:34 -0700 (PDT)
Received: from wintermute.localnet (94.105.107.31.dyn.edpnet.net.
 [94.105.107.31]) by smtp.gmail.com with ESMTPSA id
 j4-20020aa7ca44000000b0052574ef0da1sm6456068edt.28.2023.08.30.00.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 00:29:33 -0700 (PDT)
To: Frank Vanbever via buildroot <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Aug 2023 09:29:33 +0200
Message-ID: <5966703.lOV4Wx5bFT@wintermute>
In-Reply-To: <87il917em8.fsf@48ers.dk>
References: <20230713161139.182388-1-frank.vanbever@mind.be>
 <87il917em8.fsf@48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1693380574; x=1693985374; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zk2PDaom4GmilODh7ygKGFmSQ1OJmJKnSQJcdYfpwj4=;
 b=fmJaqrNdzlckJRT5zw38j4eEQu18ILwHnUht4olVqTqJNOQGZh/jQ6ItH4Aa0vXc8s
 UpiE7bAGwAblFiuCIzWqbJFQLfuXavIz1Ruk2OoQ5uXG5Gt0zpF0UGFNLGB8jFYdRPbM
 S6K/NmfDdPmlAtee8RyVLV/tde/+op1/Ok2NwLdiKN5oPTJqCFgVzdoF70vgbzmLeAMa
 5oiSLRwFG0USae/G5psdRZ6vv1j9swDs99W3qwtmfbjfIYr5v6JEbvfoOTysg/Fnp0ft
 UxsyXVdJv3SneBbcUxztc+TbxL265Mhgb7ZC6j0EcQuTjbWaIR8pQhCxE4mHukYbxUSy
 XPUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fmJaqrNd
Subject: Re: [Buildroot] [PATCH 2023.02.x] package/libmodsecurity: backport
 security fix for CVE-2023-28882
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
From: Frank Vanbever via buildroot <buildroot@buildroot.org>
Reply-To: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

I believe your assessment is right, at this point it would be best to backport 
the bump to 3.0.10 on master to the stable branches and get rid of multiple 
CVEs at the same time. Do I resubmit that patch or do you take it directly 
from master?

Best regards,
Frank

On zaterdag 26 augustus 2023 22:06:23 CEST Peter Korsgaard wrote:
> >>>>> "Frank" == Frank Vanbever via buildroot <buildroot@buildroot.org> 
writes:
>  > Fixes the following issue:
>  > - CVE-2023-28882: Trustwave ModSecurity 3.0.5 through 3.0.8 before 3.0.9
>  > allows > 
>  >   a denial of service (worker crash and unresponsiveness) because some
>  >   inputs
>  >   cause a segfault in the Transaction class for some configurations.
>  >   
>  >   https://security-tracker.debian.org/tracker/CVE-2023-28882
>  > 
>  > Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
> 
> Sorry for the slow response.
> 
> We are using 3.0.8 on 2023.02.x. Is the delta between 3.0.8 and 3.0.9 so
> big that it makes sense to add this patch rather than just bumping to
> 3.0.9 - Especially given that 3.0.10 contained another security fix?
> 
> Looking at the 3.0.9 release notes, it seems to be almost entirely
> fixes:
> 
> https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.9




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
