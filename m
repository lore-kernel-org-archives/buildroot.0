Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6F4C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:20:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A71461151
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A71461151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5808E400EB;
	Wed,  6 Oct 2021 19:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xpYjz8TIfPJM; Wed,  6 Oct 2021 19:20:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3994B4078D;
	Wed,  6 Oct 2021 19:20:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 065221BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9E4483FB7
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sh4_i4c7BnhA for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:20:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC01783E59
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:20:29 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z20so13728988edc.13
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Izfa5D8adI3VeRrjRC10qP9i4X0p7PhSXEeLB39tkSA=;
 b=YeqfKJaPosImvqy5AJFNEPp8XPn7NRDYfanQoyIh7Zlo1qm5OPig7hNghAOkXu6efb
 J7H6bch9r/NQ99kbMgURjCv9MjiwT0XwWgNvP+EFZtmUJRJcR/ysr3nnsqzuUL73JQIk
 uYRwQ1zmcnJh3oQdg4f1h3K9dXqX3kdJrByBe1QGupLPoZ80fKL/uM/AZ0Np4fjO/imm
 TDk4VQrrSv0ohvLLBsj3bcOgRNXqM2YznW5kvqNUwCuq4PZf38fsLB2Qbovh8I8x2YOG
 xKxljZLhVASH6W1bItLGE8/RrNdOyLxZEeeqYQWtvKUlSQohxFhjAbcr8ruYFtuJRrf0
 kZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Izfa5D8adI3VeRrjRC10qP9i4X0p7PhSXEeLB39tkSA=;
 b=H52MYgSHhpEuF6UFhFGtWN1+UjMEzDZLfh3SzM1R7JzH+PdEBa5Ll8YvN+mW/9Yrj2
 PQLJUXdcypdJgS2qmM+7ZS6ntGi3ZGsAN4zgQYDezt6WMUqxYefwDe8fh3bWiaijiBe9
 L+M6mmGN6hYJ6Pqal6I3d4sqNnNDjIeQbF2HfulV/RMUtTAcmFW/LVQFWIy+MLTNaf1F
 d+mfudd20V07O3njrwE8uEnvMamkKugu3BlwIwPc3Bh3Wfglrn+C+Ikkq8m1aXsLIADk
 T9gFgUSieo+w+fSlZyl04c2GZ8s0vqdYqy8q5EeRJ+iCwAwiqJojQ+p6Hl0dzhVsoFp0
 W6+g==
X-Gm-Message-State: AOAM530XCt1tSIyr95h8Q/JFgQIbd4CRgF4zeZlMSHHkXXl21fVFyRKQ
 bv5FaRvZkyf+lHDHs/i94j3yYA==
X-Google-Smtp-Source: ABdhPJyGjQ0SGIUd6TF3oYH9EsKi4NQGObV7tIOS2g5aRtslnrau7E2jIUDzzqDU8+lhgmzbZSsHDg==
X-Received: by 2002:a17:906:bfe3:: with SMTP id
 vr3mr8655221ejb.339.1633548027589; 
 Wed, 06 Oct 2021 12:20:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z16sm144367edb.16.2021.10.06.12.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:20:27 -0700 (PDT)
Message-ID: <441e75de-8abd-436d-e0f2-1ecdf5a2bab9@mind.be>
Date: Wed, 6 Oct 2021 21:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210921235951.805592-1-giulio.benetti@benettiengineering.com>
 <20210921235951.805592-2-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210921235951.805592-2-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix parallel build
 failure
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/09/2021 01:59, Giulio Benetti wrote:
> As explained in the patch itself(pending here[1]), I couldn't reproduce
> the failure but it seems to be right. Basically I'm making not parallel
> every 'nsinstall -R' command that is where it fails.
> 
> [1]: https://bugzilla.mozilla.org/show_bug.cgi?id=1731911
> 
> Fixes:
> http://autobuild.buildroot.net/results/a895ed7aa48edc5cd9ac8bbbd689433a98c9c057/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   ...31911-Fix-nsinstall-parallel-failure.patch | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch
> 
> diff --git a/package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch b/package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch
> new file mode 100644
> index 0000000000..7ac340f1ca
> --- /dev/null
> +++ b/package/libnss/0001-Bug-1731911-Fix-nsinstall-parallel-failure.patch
> @@ -0,0 +1,34 @@
> +From 7ba4d627212507f876dc112e89c68e82e1c50188 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 22 Sep 2021 01:40:31 +0200
> +Subject: [PATCH] Bug 1731911 - Fix nsinstall parallel failure
> +
> +Fix nsinstall race condition when building using Makefile with parallel
> +options on. I've end up making $(1) recipe in copy_varlist_into_dir_RULE
> +.NOTPARALLEL. I can't test it that much since it's very very rare, but
> +it seems to be the correct way. This way every copy_varlist_into_dir_RULE
> +called should occur not parallel and I think that this is acceptable
> +since it only create symlinks that takes very few. Further improving is
> +possible of course.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + nss/coreconf/rules.mk | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/nss/coreconf/rules.mk b/nss/coreconf/rules.mk
> +index dc72e9cef..a341b8385 100644
> +--- a/nss/coreconf/rules.mk
> ++++ b/nss/coreconf/rules.mk
> +@@ -377,6 +377,8 @@ $(3)/%: %
> + 	$$(INSTALL) -m 444 $$^ $(3)
> +
> + $(1): $$(addprefix $(3)/,$$($(2))) | $(3)/d
> ++
> ++.NOTPARALLEL: $(1)

  This doesn't make a whole lot of sense: .NOTPARALLEL is something that applies 
to the Makefile as a whole, not to one specific target. I haven't looked in any 
depth in the libnss build system, but unless it builds recursively, adding this 
is exactly equivalent to adding

.NOTPARALLEL:

anywhere in the Makefiles. This is BTW what we do in Buildroot.

  And in the end, that's the same as calling $(MAKE1) from Buildroot, so 
patching is not really needed.

  If you want to be a little smarter, you will have to manually "unroll" the 
dependency, like:

$(1): | $(3)/d
	$$(foreach tgt,$(2),$(MAKE) $(3)/$$($(tgt)))

(chances are I made some major mistake in this thing).

  Or if it does build recursively, you can probably conditionally add 
.NOTPARALLEL in some smart way.

  Anyway, I've marked this patch as Changed Requested.

  Regards,
  Arnout


> + endif
> + else
> + $(1):
> +--
> +2.25.1
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
