Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CCCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 08:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A39AA83E9B;
	Tue, 12 Apr 2022 08:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVS2sN2dsU4I; Tue, 12 Apr 2022 08:28:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABCD983E88;
	Tue, 12 Apr 2022 08:28:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8661BF2A3
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 08:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29AC160F39
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 08:28:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id com7I-Pffkcm for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 08:28:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C455C60AD5
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 08:28:13 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w18so21399826edi.13
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 01:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fceEl/Txha9QVhlEMOaJVGRwIIT8dai6p2TCR8GwhZQ=;
 b=NQ5petcXIjYxFfx7xwcm77zJO8AoJvSwzSuR2X8rmcRIyKayFbdVHlbBaa4BMCB9GZ
 hklrPdt/n3f6qlrkvQ4SWsAew5WwERDECrzgj0MY8rkqHvfcdtGY5/tNR9ATx6mcuEAq
 dWYPrxU3BMUBPWsShtu/qFv6etEoNLtLuQU3tbm02qFm6ApGHQP9RRLoGDUkprt0COFX
 2bZfXVKFo/bnonFBjNG20hJnswUJ/xvOrSNHLHrjeipYyi8kgg9Gg8RvOcHVZ8Jl7e2V
 Ap60JU1f+lHacLbaAOT69xypez+cEpNSoZYx/88XTEvCI4bZBFk96H1gn4kg3n0g2APW
 CopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fceEl/Txha9QVhlEMOaJVGRwIIT8dai6p2TCR8GwhZQ=;
 b=oQysSD8SuK95otshKlsgH0NrY3B1IE0s5BFTmy28lc4+XFWWkV0vFs1ZdvFe7zKxMT
 /JfhKddWHI5iVHIqSySLAfke5IxiFhE0ibHqJOg10HdI1zx0Om7wTnP/80MU1rh/5LAt
 QzcFFCdmXi5ElcjLBbyvoYyTVKbp9aB4zOV2s13hiJ7ExEC3g4lbWiJSZVOD5xFc3URu
 5F2a7lmDYZIFi2M0B86bKNQ23VAcXek53qLCY0uDlKheYiE6p9UQZ8TdpzCgFNxL3LsQ
 r5Jm9ZO3v6PmKsY2ouTUWABRqo387COlWzMl+WhK40c/XbCtWN5g59Qab6zZP5u6ePxE
 e36g==
X-Gm-Message-State: AOAM532xegTNiXoFZPHxAWfI5pzomT88VuLVmvTyMGRLpPdDHz4pZGV3
 PtgoMWgqDKrQv8XMgklqrMhypALCeh2HaA==
X-Google-Smtp-Source: ABdhPJys1OTtZ4x0xFOQI3hhblgaE8c0JNSoCEFxLSuUcZLIlIDYTMU5qo31RkpNfPqJOIHK55kq7Q==
X-Received: by 2002:a05:6402:51d2:b0:41c:e157:84f1 with SMTP id
 r18-20020a05640251d200b0041ce15784f1mr38031983edd.135.1649752091908; 
 Tue, 12 Apr 2022 01:28:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 bj13-20020a170906b04d00b006e742719b9fsm10969510ejb.7.2022.04.12.01.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 01:28:11 -0700 (PDT)
Message-ID: <4fead5f8-95e6-6f88-6a8c-f62a32fcec9f@mind.be>
Date: Tue, 12 Apr 2022 10:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>
References: <20220405185320.319C18361B@busybox.osuosl.org>
 <9ca9a86e-917a-ea5a-04bf-b9cd0e15aff5@othermo.de>
 <07cb544d-bc42-d774-08aa-67cecc96c1b0@mind.be>
 <87bkx7h299.fsf@dell.be.48ers.dk> <874k2zgxzk.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <874k2zgxzk.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [git commit] package/containerd: security bump to
 version 1.5.11
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/04/2022 22:34, Peter Korsgaard wrote:
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
> Hi,
> 
>   > @@ -55,7 +55,7 @@ var (
>   >         // NOTE: The $Format strings are replaced during 'git archive' thanks to the
>   >         // companion .gitattributes file containing 'export-subst' in this same
>   >         // directory.  See also https://git-scm.com/docs/gitattributes
>   > -       gitVersion   string = "v0.0.0-master+3df54a85234"
>   > +       gitVersion   string = "v0.0.0-master+3df54a8523"
>   >         gitCommit string = "3df54a852345ae127d1fa3092b95168e4a88e2f8"
>   > // sha1 from git, output of $(git rev-parse HEAD)
>   >         gitTreeState string = ""            // state of git tree, either "clean" or "dirty"
> 
>   > So the gitVersion field lost a digit. No idea how this could
>   > happen. Looking at the file in the git repo I see that this is listed
>   > as:
> 
>   > 	gitVersion   string = "v0.0.0-master+$Format:%H$"
>   > 	gitCommit    string = "$Format:%H$" // sha1 from git, output of $(git rev-parse HEAD)
> 
>   > https://github.com/containerd/containerd/blob/main/vendor/k8s.io/client-go/pkg/version/base.go
> 
>   > So I guess something in github is wrongly expanding this $Format?
> 
> The format logic itself is part of git, as the export-subst attibute has
> been set for base.go:
> 
> https://git-scm.com/docs/gitattributes
> 
> But why the two $Format:%H$ lines expand to different things and why it
> has changed over time is unclear to me.
> 
> In any case, I've pushed a commit to 2022.02.x to adjust the hash to
> what Github is now serving.

  As I've written in the mail that went concurrently with yours, this may change 
again at any time. Therefore, please make sure that you update the tarball on 
sources.buildroot.org so there's a fallback when the hash changes again.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
