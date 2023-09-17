Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38417CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 17:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA5AE81F28;
	Sun, 17 Sep 2023 17:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA5AE81F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIqIM7gkGG4t; Sun, 17 Sep 2023 17:53:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BA9681EE1;
	Sun, 17 Sep 2023 17:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BA9681EE1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C94C1BF3E5
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 17:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3574E81EE1
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 17:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3574E81EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2UDmImI7mLJB for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 17:52:59 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACC8C81ED9
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 17:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACC8C81ED9
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-502defbb0c3so6288145e87.0
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 10:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694973176; x=1695577976;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KeeeChu1pYpyRD8nBXckYXwAWH52/DG3nFdPRjEYy4M=;
 b=ghUXQf3WJ1VsvOqIL7E8uNXrbnw/6RZkq3D0gU1JfMd9OY/3QmLDthVR+k+UGaac2C
 qSQH2FNuK+nZ0ZblPO+KCR5JrG11ou9h2Z2lSiuM8fIo+cgZxZ64KPTSOsKjGYhGYO6W
 yKtVzRDmg3/SPUQ/lySmlGDbSP6alyhrdUkRj3m00jWyicTfiaYjPoF+8yBWd5jNekLI
 sLkIyucLkoTtzHzjkW9psiCdocEuL/MSFEMS4z0lCMnulXI9BwLtJVQakY7PqAzyo7Yt
 T0pQcIxCECIRCI/mpEo+YrlNmdfJWd1Uk49luPoFyiZb5GKKgQ14P0sHXJ/VkNdQBJ6a
 +lqA==
X-Gm-Message-State: AOJu0YzJGn26dqUMuPFJpQHAocQo1t3dI9/ZPzUrUo1Uij5PUP+TUowQ
 PA5zVrcDGeC14rhZ9H9Y4oKOGe/H4rvKB/SKQ34=
X-Google-Smtp-Source: AGHT+IHvuHBpcedB81k4UGXPK/bYDW8B433KwrGAY2Zekgl43+O6VUWxX4dcVCDnRxL1543Iknbkww==
X-Received: by 2002:a05:6512:12cf:b0:4f3:9136:9cd0 with SMTP id
 p15-20020a05651212cf00b004f391369cd0mr7848628lfg.44.1694973176404; 
 Sun, 17 Sep 2023 10:52:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a170906c30e00b009937e7c4e54sm5261693ejz.39.2023.09.17.10.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 10:52:55 -0700 (PDT)
Message-ID: <1827eef4-9007-269e-2611-e1e373865370@mind.be>
Date: Sun, 17 Sep 2023 19:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
 <80096197fe23a2dbb5d975fd76c951b33737ca1c.1694556946.git.yann.morin.1998@free.fr>
 <20230914230730.697c596a@windsurf> <20230915075045.GE2693@scaer>
Content-Language: en-GB
In-Reply-To: <20230915075045.GE2693@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1694973176; x=1695577976; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KeeeChu1pYpyRD8nBXckYXwAWH52/DG3nFdPRjEYy4M=;
 b=Z78IZv/mzyfzSHC8dxFQ7YR8S1T/AyvT0UPRnanGGFI9/hFpCo/NsMmdMnJAtz55GX
 xSvoEv6LLQeVaC3AYgx8n5+KrVXE/Be4Nil6IcObI6SloITUq2HN3Q+VW4HzHc8a0ubJ
 eO0mqHffGCUK2/VB2Y7Ap09RcP3C2+eJfF4eGV2c2oFR6YXwQhEQLflpDiFsa5TI498S
 MvdFoOwJNgDx28QSXjUCJFqZ9tnBgoQXgfwDog2LuMNqCWCzLZgnyB2v3N1G/DUVY1wa
 N89Buvi+x6NdEVE2L2bX0x+e3yrp7P7DruCnGblP4pjOrA5Z3M8LNX+xj7bUYe9A2U2p
 tebg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z78IZv/m
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
 Woody Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/09/2023 09:50, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2023-09-14 23:07 +0200, Thomas Petazzoni spake thusly:
>> On Wed, 13 Sep 2023 00:15:52 +0200
>> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> [--SNIP--]
>>> Extend the git backend to handle the export-subst attribute. There is
>>> no git tool (that we could find) that does that automatically, except
>>> git-archive, which we can't use. So, we do it manually with a bit of
>>> trickery where we do use awk to:
>>>    - identify all files that have the export-subst attribute set,
>>>    - for each such file, iterate over all the placeholders, and
>>>      replace them with the expanded format.
> [--SNIP--]
>> I am not totally convinced by this. I recognize the massive efforts
>> that have been into these complex awk scripts, but there are a few
>> reasons why I dislike it:
> 
> I am not too surprised by your reply, indeed! ;-)
> 
>> (1) It's complex/non-obvious
> 
> TBH, we've seen more complex code (awk or otherwise) get in. ;-)
> 
> But I do agree that we need to asses the complexity vs. gain ratio.

  I haven't looked at it in a lot of detail, but it didn't look _that_ complex 
to me.


>> (2) It fixes a problem in only one single package, which is already
>>      fixed in a package-specific way, and we don't have visibility on
>>      many more packages adopting this.
> 
> Plus luajit that you applied just moments before (and was identified in
> the commit log), which makes it two.

  In addition, we are still playing with the idea of switching from downloading 
tarballs from github to using the git download method. When we do that, it's 
likely that more packages will have this issue.


> For those two, I am afraid that bumpers will simply forget to update the
> post-extract hook with the appropriate data, especially as there is no
> hint, close to the _VERSION setting, that another value has to be
> updated in lock-step [*].
> 
> Plus the 4 qt5-related package (for which that has no impact on the
> build, I'll grant it).
> 
> [*] we also recently ensured that the erlang API version is no longer
> hard-coded, see b574a9606e62 (package/erlang: do not hard-code the
> Erlang Interface Version (EI_VSN)) because, in the long run, people
> forget about such things... And even so, even with hints, people just
> don't follow them, like we had meas3d bumps that did not update
> mesa3d-headers in spite of the hint right above MESA3D_VERISON.
> 
>> (3) It bumps the Git tarball version, which is going to cause breakage
>>      to *all* downstream users of Buildroot which have custom packages
>>      retrieved from Git (and there are probably thousands of these in
>>      the numerous companies using Buildroot). So causing so much hassle
>>      to our users for the gain of fixing one package in Buildroot is IMO
>>      not a good trade-off.
> 
> So:
>    - if the package does not use export-subst, then only the filename
>      changes, and it is easy to s/-br1/-br2/; that can be added to
>      release notres and in the "updating" section of the manual;
> 
>    - if the package uses export-subst, then that will actually help those
>      out-of-tree packages because they will no longer have to deal with
>      it manually in an ad-hoc manner.

  Yeah, I agree with Yann here: there is churn, but it's not too bad. And it's 
always detected at build time (missing hash is reported) so it's not causing 
anything difficult to debug. You're going to have a lot more trouble with 
package updates when updating buildroot.


> For that second point, we have always had people that wanted to keep the
> git tree because their build system wanted to extract the git hash (or
> other info) so that they can quickly identify the source *on a running
> target*. Telling those to use export-subst can be a solution (now, we
> just need to convince Linus to add that to his kernel tree ;-) ).

  It would be nice if we could generate a file that git-describe recognizes and 
uses instead of the actual git tree. Or perhaps we should create a git wrapper 
that does exactly that.


> Finally, we also bumped the subversion backend version, which is now
> -br3; that will probably have caused a lot of churn for those numerous
> companies that still use svn. I don't see why that would be acceptable
> for one backend and not another.

  I expect the impact of svn to be much smaller. Also, mistakes made in the past 
doesn't mean we should make the same mistake again :-)


>> Of course, I can be convinced that I'm wrong, but I'm not too convinced
>> at the moment. And of course (again), Peter and Arnout are definitely
>> welcome to disagree and overrule me :)
> 
> You won't be surprised when I tell you I believe it is worth it. ;-)

  Yeah, I do think we should do everything we can to make sure the git archives 
are reproducible.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
