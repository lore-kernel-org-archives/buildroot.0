Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060A3C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 09:46:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4353B6103C
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 09:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4353B6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08145605EB;
	Mon, 30 Aug 2021 09:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gm-OJqGrHNL0; Mon, 30 Aug 2021 09:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48C856063C;
	Mon, 30 Aug 2021 09:46:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7F2F1BF5A3
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 09:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C606280DFC
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 09:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPRCSY18f9pC for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 09:46:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89DB080D61
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 09:46:25 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id mf2so29807041ejb.9
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 02:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SE0dMTIfqGG6m/D6N4ZMeRWYWKK2W0pcFhukfPuqLVA=;
 b=MofH0+LirJDx4NaCKkHOsonL0Vgu8//qgKILtuWHogezfjFSdfupLxBwAq9aLvFMkQ
 dyrpWjnZPU/K3S9tcH0s90oxK0acbhNfZPP3csLVOWEQCM7TyByguyPSZdXR07MgDn6k
 QBw6Zb/IDGD+vJlIT5Vf8hMg+CdzKc/cvOEnSv1HiJnyr/vgGfpumI4j23EPvv/8GTPH
 m/Tr8maDTN3DjP/q0OLMWfJEQdl5lykOK+TnuXyQ5oJPKL3gcgq5l8RK0Z4aWE0NYXXL
 3y4y+9Zp1WeP5HjRdgIvd4RkJ4xXYmO4Pylra3lgcG7QmlXOFK6IHwX6euh9NFrBHJ4b
 74KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SE0dMTIfqGG6m/D6N4ZMeRWYWKK2W0pcFhukfPuqLVA=;
 b=sV5CGMdMs+9862Y7466V3egxqEd94I+WUWg+UxwnJQ3OVd5cqGhNaTjyusMoJRjItZ
 QgohT5bsHFWGAO1R/2iTpkRhBKxnQrikDN1Oo6qMpy/Yh5ydgQD2H6kCHofWDMi+ZABR
 +l5+zaEyt5oOmDbaUMhfRnNX8R04cq4vqNf04Y1xbKNHIUuRVhG4KVlaIik0c3iQ+Ewd
 y/+ln1umNk+aeoatn85yBZZ/3/Kj60BJ117UjSpkHmPWdCtu0w+XTY8aSquzj7o/ugtP
 4TgK796pvf1WP6YlpxoU/JIiNV27GFkyHhTCv4123M5nwWDWzEtJ4D5hYaiHp2ReCgvr
 zMGA==
X-Gm-Message-State: AOAM531V7PNp4uhQizigVlhdKNgWyeDzsQ62a0U2o93gS8GfVeQZIwBI
 3LBJFKYGw7nO/pvHA00LMrSaeg==
X-Google-Smtp-Source: ABdhPJzvFx40fC6odmtLMw8Wj+tPdbvNgM9Mkbai0AQhiqom9LystJgIqtTQp/RntsA4UUE01rL77Q==
X-Received: by 2002:a17:906:4541:: with SMTP id
 s1mr24589377ejq.378.1630316783353; 
 Mon, 30 Aug 2021 02:46:23 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qt23sm6539917ejb.26.2021.08.30.02.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 02:46:23 -0700 (PDT)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-8-herve.codina@bootlin.com>
 <20210828224740.GS2661@scaer> <20210829133955.74d921e9@windsurf>
 <20210829125121.GA1053080@scaer> <20210829164031.GB1053080@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <ec6db63a-b841-6fb3-e537-234fe43fbb44@mind.be>
Date: Mon, 30 Aug 2021 11:46:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210829164031.GB1053080@scaer>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v3 07/16] package/pkg-generic.mk: detect
 files overwritten in TARGET_DIR and HOST_DIR
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 29/08/2021 18:40, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2021-08-29 14:51 +0200, Yann E. MORIN spake thusly:
> [--SNIP--]
>> Finally, as a side note: there is still a case of file overwrite that we
>> do not detect, even with this series: if two packages that are not part
>> of the same dependency chain (i.e. they do not depend one on the other),
>> and they both install the same file, then the file-overwrite will only
>> happen when we eventually assemble the global target/ and host/ from the
>> individual PPD target/ and host/ and we still have to add a detection
>> for that case (which is not a pre-requisite before we apply the current
>> series, of course).
> 
> And of course, this will also cause an overwrite when two such packages
> are also dependencies of a third patckage, and so when the PPD of that
> third package is prepared, we would have to detect file overwrite.
> 
> Note: let's assume the following hypotetical dependency graph (where the
> notation A --<-- B means that B depends on A):
> 
>       .-<-- A --<-.                 S: skeleton
>      /             \                F: target-finalize
>     S --<-- B --<-- C
>      \               \
>       `-<-- D --<-----<-- F
> 
> If A and B both install the same file, then we do not have a sane PPD
> to build C.
> 
> If D and any package in the dependency chain of C (i.e. S, A, B, or C
> itself) install the same file, then we can only detect it in
> target-finalize.
> 
> So, let's take a step back, and have a wider look. I wonder if the end
> of a package installation step is the best location to detected file
> overwrite...
> 
> Indeed, let's assume that we do file overwrite detection:
> 
>  1. in PPD preparation (when we rsync the dependencies, in the macro
>     per-package-rsync): we can also detect that a package overwrites one
>     or more files of another package, report those files, *and* prevent
>     building a package with unsound dependencies;
> 
>  2. in {target,host}-finalize: we can detect that a package overwrites
>     one or more files provided by another package, and report those
>     files.
> 
> So, the above (still theoretical implementation) is all we would need,
> in the end, and we would not need to do the detection at the end of a
> package installation step of each package, because it would not provide
> any information that we couldn't have with the above.

 Fabrice's patches have shown that the overwritten file detection is too
aggressive in the sense to that it *will* cause (many?) failures in the current
situation.

 So, taking a step further back, what really is the problem we're trying to
solve here? Why can't we overwrite files from other packages?

 I think there are three distinct problems. Let's take Yann's example from above.

1. A file written in A and overwritten in C is only a problem because the
finalize step doesn't take into account dependencies when combining the trees.
We could solve that by taking into the account the dependencies.

2. A file written by both A and B is a problem for package C, because it is not
predictable which version it will see. This problem can be solved by adding a
dependency between A and B.

3. A file written by S and overwritten by A - this, I think, is the big problem.
At first sight it's like case 1 - by taking into account the dependencies, the
finalize stage will see the version from A. However, the problem is for stuff
installed into staging, where B sees the version from S while C sees the version
from A or from S, depending on order of A/B installation. This has two problems:
3a. C's version depends on the order of A/B installation;
3b. B sees a different version of the file than A - this could be a problem for
e.g. header files that affect compilation.

 The original scheme we discussed three or four years ago already took into
account situations 1 and 2, I think, but not yet situation 3. Note that back
then, the overwritten file detection was assumed to happen only in finalize and
accept overwrites in case there's a dependency.

 The curses and crypt issues that Fabrice detected fall in category 3. And
they're extra nasty, because one of the packages involved is the toolchain that
everybody depends on, so you can't just add a dependency to break it.

 I haven't given sufficient thought to it yet, but one idea is to allow packages
to add a post-install hook to another package. That way, ncurses could remove
curses.h from the toolchain, and libxcrypt could remove crypt.h. Still tricky
though because it would mean that any package that uses crypt.h would need to
optionally depend on libxcrypt - so that particular case would probably have to
be solved by making libxcrypt be part of the toolchain... Or maybe making sure
it doesn't overwrite crypt.h and teach its dependencies to include the
libxcrypt-specific crypt.h.

 One thing is certain: it's complicated :-)

 Regards,
 Arnout


> 
> However, a benefit of also doing it at the end of the installation step,
> of a package, is that we can cut short on the build time. However, I am
> not sure that benefit is that important or major...
> 
> So, I'd like we think a bit harder before we apply this patch...
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
