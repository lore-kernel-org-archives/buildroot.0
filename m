Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936FBCD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 07:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11A334152D;
	Mon, 18 Sep 2023 07:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11A334152D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6L5dmX1-9xsV; Mon, 18 Sep 2023 07:39:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B45954154A;
	Mon, 18 Sep 2023 07:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B45954154A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6BAE1BF3FF
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 07:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FD5B404C4
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 07:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FD5B404C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wLLoibLbNvbK for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 07:39:04 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A624404C1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 07:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A624404C1
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99c136ee106so552470066b.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 00:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695022742; x=1695627542;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1t+pi5sF1oiqJvdVASw9Ryxvc89az4aDpvi2WnLU29M=;
 b=Rp/CMcBG3n7K1FwUatSzG1AXQhq2s225sAClhxvOAf+itY5jFVDl0xLYfGtNxFR6EB
 2B6L6NGZa3Jydq+OcJB4pvWcsPwhTdMBTwbXAugYH1vFT0rURKtpoveiabWahGxQ1Wdo
 d25ceTVWKNLtqYtXKQmLj1ECBqsicoxYEnJHkx+Cdg604gzp+8VFyI8yJVRSmpzCaLRE
 uqelih29sPsC2vE7MIYhvP9teZNdfHcbCGVWrRTqs7Bw9qSMNwqppToxt/z1vtobYiFI
 LqtAP1R2asypKRuCImwlNdGxK4YObVd6fHaKdWRnWYUkYD2VtNIQ8vHjg4u7Rkh+wMvE
 nmdQ==
X-Gm-Message-State: AOJu0YzwZOLOh60ZOPfW96n+PLAwydzPmH1olO6koaSzAoh4FHfGvaAE
 Didk7VByHkUXoja8/15Rui/ClQ==
X-Google-Smtp-Source: AGHT+IFo5cHIjBngUlvjaJKKHsucpCX3A4X8HoGKGrYcQiRshICkZD2Rxfqk1EJdu1DEAhAc4f28pw==
X-Received: by 2002:a17:907:7627:b0:9a1:e57a:362c with SMTP id
 jy7-20020a170907762700b009a1e57a362cmr6734210ejc.9.1695022742396; 
 Mon, 18 Sep 2023 00:39:02 -0700 (PDT)
Received: from [10.1.0.174] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 u22-20020a170906409600b0099d9dee8108sm6152540ejj.149.2023.09.18.00.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 00:39:01 -0700 (PDT)
Message-ID: <b135588f-1bda-51ef-bc73-827697ca7d37@mind.be>
Date: Mon, 18 Sep 2023 09:38:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
 <80096197fe23a2dbb5d975fd76c951b33737ca1c.1694556946.git.yann.morin.1998@free.fr>
 <20230914230730.697c596a@windsurf> <20230915075045.GE2693@scaer>
 <1827eef4-9007-269e-2611-e1e373865370@mind.be>
 <20230917190046.GZ415981@scaer>
In-Reply-To: <20230917190046.GZ415981@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695022742; x=1695627542; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1t+pi5sF1oiqJvdVASw9Ryxvc89az4aDpvi2WnLU29M=;
 b=LSeAdJ5UAvchw8kcr09UYRRteCCjMEosnaiUS3A6UWxOlvKXW9P562/La+QUeDAQWk
 Aad6Mz8y/aBIOY4bjDtyu4wt0SnrJT5Q5+zsVdeQBCgcHwU52wGANaqZ3AUTxFJWeYY1
 xYvwUPTrQZHalBGJJ4Bzdf4ysV+HCvTChOhhlTi4LtUUtxubwxKS5SKgPqiP7m5S+ut4
 Ta1q791oUptBCA9o7C/cF20wLU5AhwkEvWVJ63tK0g0DF5CIIjCgDW9cwzX7Xwko6Ff7
 uGAmp4le6rPrtlVP7JpxDFg2ejCem4iAZ9deQPQe8ABvEgXctRbRkJBnvfoDnABhUSNF
 SxqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LSeAdJ5U
Subject: Re: [Buildroot] [PATCH 5/5] support/download/git: handle git
 attributes
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Francois Perrad <fperrad@gmail.com>,
 Woody Douglass <wdouglass@carnegierobotics.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2023 21:00, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2023-09-17 19:52 +0200, Arnout Vandecappelle spake thusly:
>> On 15/09/2023 09:50, Yann E. MORIN wrote:
>>> On 2023-09-14 23:07 +0200, Thomas Petazzoni spake thusly:
>>>> On Wed, 13 Sep 2023 00:15:52 +0200
>>>> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>>> [--SNIP--]
>>>>> Extend the git backend to handle the export-subst attribute. There is
>>>>> no git tool (that we could find) that does that automatically, except
>>>>> git-archive, which we can't use. So, we do it manually with a bit of
>>>>> trickery where we do use awk to:
>>>>>    - identify all files that have the export-subst attribute set,
>>>>>    - for each such file, iterate over all the placeholders, and
>>>>>      replace them with the expanded format.
>>> [--SNIP--]
>>>> I am not totally convinced by this. I recognize the massive efforts
>>>> that have been into these complex awk scripts, but there are a few
>>>> reasons why I dislike it:
>>>> (1) It's complex/non-obvious
>>> TBH, we've seen more complex code (awk or otherwise) get in. ;-)
>>> But I do agree that we need to asses the complexity vs. gain ratio.
>>   I haven't looked at it in a lot of detail, but it didn't look _that_
>> complex to me.
> 
> I noticed a little coding-style issue in there (missing semi-column on
> end of line, innocuous as it's optional, but that's diverging from the
> rest of the file). I'll fix and respin a v2.

  If you do that, can you also split up the big patch? Mixing all the br1->br2 
changes with the actual code change makes it very hard to review, and also hard 
to revert or backport because the br1->br2 changes are almost guaranteed to be 
wrong.



> [--SNIP--]
>>> For that second point, we have always had people that wanted to keep the
>>> git tree because their build system wanted to extract the git hash (or
>>> other info) so that they can quickly identify the source *on a running
>>> target*. Telling those to use export-subst can be a solution (now, we
>>> just need to convince Linus to add that to his kernel tree ;-) ).
>>   It would be nice if we could generate a file that git-describe recognizes
>> and uses instead of the actual git tree. Or perhaps we should create a git
>> wrapper that does exactly that.
> 
> In retrospect, I was thinking about override-src-dir packages. For
> those, we could look into something like:
> 
>      ifneq ($$($(2)_OVERRIDE_SRCDIR),)
>      $(2)_ENV += GIT_DIR=$$($(2)_OVERRIDE_SRCDIR)/.git
>      endif >
>>> Finally, we also bumped the subversion backend version, which is now
>>> -br3; that will probably have caused a lot of churn for those numerous
>>> companies that still use svn. I don't see why that would be acceptable
>>> for one backend and not another.
>>   I expect the impact of svn to be much smaller. Also, mistakes made in the
>> past doesn't mean we should make the same mistake again :-)
> 
> Sure, but svn is in fact still quite widely used in $big_corps...

  Widely, yes, but less than git.


>>>> Of course, I can be convinced that I'm wrong, but I'm not too convinced
>>>> at the moment. And of course (again), Peter and Arnout are definitely
>>>> welcome to disagree and overrule me :)
>>> You won't be surprised when I tell you I believe it is worth it. ;-)
>>   Yeah, I do think we should do everything we can to make sure the git
>> archives are reproducible.
> 
> What we currently have is *already* reproducible, and I was not arguing
> that was not the case. The point was about adding support for
> export-subst, not reproducibility (but adding export-subst should also
> be reproducible, hence the core.abbrev=40).

  Ah I misunderstood that. Then it shifts a bit less in favour of applying this, 
actually.


  Regards,
  Arnout

> So, I'll fix the little coding style issue, add a section in the manual,
> and resubmit, with a conversion of luajit while at it.
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
