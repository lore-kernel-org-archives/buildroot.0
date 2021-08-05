Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1238BC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:43:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7574B61102
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7574B61102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 341DE831A7;
	Thu,  5 Aug 2021 11:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id si8LfRUgiQr5; Thu,  5 Aug 2021 11:43:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B41835E4;
	Thu,  5 Aug 2021 11:43:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61F171BF844
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C47A835E4
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rU2SQgJG7XtP for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:43:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AF22831A7
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:43:25 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id x11so9042302ejj.8
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HjsVUOQfYHUpXPiNPTW8Bu62LZ9XobyIHUC3ly4V248=;
 b=Meu2VW7GF6Sgv+E7LS2dgF+VQRDplnBdzl7CA6F2S2J8vHQr5yLLE4tLAzMnYSEfLq
 DOsaQTRanSQGfz+0Opv6SCEgbyO+mBmrLpMxS1gMXo2Tt0CeJPk1226wNQIBh3uRbZ4R
 DoIryDqfyvW/JgKG4pJLPK9LZK4teT5C+o+hV5ot3Y5B4pSfJl4/9X8ailshhaNr8iOP
 sKTqYrCBXceaZUvzx+CPegHtPKGnb9kqoP7KD6BddP+xajOOCi4N7W4aiiACxV3VmwNp
 u8GI8UHshnAID3fxDZvIPTU2X9HJGp2Jmw0Hhb6ctytLC4n00JWfcp8xsHc5P1DPCPqr
 S8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HjsVUOQfYHUpXPiNPTW8Bu62LZ9XobyIHUC3ly4V248=;
 b=ZJmKuKtA3ClRdmZCC5MUJZRoWCj0W/n1l983uyt7CKGGvxubsXRZoDBBLXhvtADHUW
 V4L+aMLx3EWbTtRxlkQv16Dea/RuVrtppYUk/9Ql3Xfkyn6LmVQH2qk+E7LVboC74zNv
 te3xyp06Of3vyCDc4DZdMsnA2Iq3C3Xi7tiVxyh+/2XuD2FmfkE6s5m0MNnW8pJ2bwpW
 v48rmWIF2yHBIDolTF4FnbugbFQoWsuVHd/tXYyu8KZI4P53u8CGGAnMFekegqjL3uUD
 5RSrQqpDuyuq7yr2txeKFcxQhEC+NExje8FtlsRVGODZuK096/kocNSsWydpgQm1PwUb
 4pyg==
X-Gm-Message-State: AOAM530tr23boboifvsXZ1hXtboihQzGjEYcqYqMO324p1xE0OiTfOqV
 f3YZWE0JYEmIdNnLi2MTaVq1l4hNxdIPM0jikvM=
X-Google-Smtp-Source: ABdhPJwWfQTAvuqlg+VO1xaeM9dq9NGmMUzpLxbKINh/44HrBpiYcKUEPlTuNPHCYBTu2rd5r54Hhg==
X-Received: by 2002:a17:906:2ad5:: with SMTP id
 m21mr4424119eje.88.1628163804097; 
 Thu, 05 Aug 2021 04:43:24 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id q5sm2165081edt.50.2021.08.05.04.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 04:43:23 -0700 (PDT)
To: Joel Stanley <joel@jms.id.au>
References: <20210803081615.879069-1-joel@jms.id.au>
 <a67de0fb-78da-bbe6-e2f7-a58c126ee43c@mind.be>
 <CACPK8Xf9-KOSRourfGbqjFLciO4oVazz4Hv2Cf-bO8phhrcSug@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <489e7bc6-dbf1-b12d-23ff-7dfa478ab69e@mind.be>
Date: Thu, 5 Aug 2021 13:43:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf9-KOSRourfGbqjFLciO4oVazz4Hv2Cf-bO8phhrcSug@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/pdbg: Fix alignment error on
 autobuilder
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 00:50, Joel Stanley wrote:
> On Wed, 4 Aug 2021 at 20:46, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 03/08/2021 10:16, Joel Stanley wrote:
>>> The autobuilder fails when building for sh because of an alignment issue
>>> in assembly that includes an external data file.
>>>
>>>  http://autobuild.buildroot.net/results/457b88c4ba85edb42b3a36cce48bf90712f590bf/
>>>
>>> This fix has been submitted upstream.
>>
>>  Has it? I'm looking at the PRs and issues on github and can't find anything. Is
>> there some other upstream that I can't find?
> 
> The project development happens on a mailing list, like all sensible projects:
> 
>  https://lists.ozlabs.org/pipermail/pdbg/2021-August/002373.html

 Our Config.in help text refers to the github repo, and I couldn't find anything
about a mailing list in the README (or a specific contribution document). If
you're close to pdbg upstream, perhaps suggest an update to the README as well?

> 
>  http://patchwork.ozlabs.org/project/pdbg/patch/20210803080305.866765-1-joel@jms.id.au/

 In the future, it's nice to include such a reference in the patch itself.
That's obviously a bit of a catch-22, so what I do is:

- prepare git commit;
- send to upstream;
- git format-patch -N -o <buildroot>
- edit the generated patch(es) and add the upstream reference below the SoB.


 Regards,
 Arnout

> 
> We ended up with a slightly different fix upstream, but I think it's
> fine to carry the version we have in buildroot.
> 
>>  Applied to master regardless, thanks.
> 
> Thanks!
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
