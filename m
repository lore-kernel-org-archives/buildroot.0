Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6ED0C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:59:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC342615A2
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC342615A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E05F4072E;
	Wed, 29 Sep 2021 19:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xjumq9J-Uc96; Wed, 29 Sep 2021 19:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8553340730;
	Wed, 29 Sep 2021 19:59:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9F8D1BF21A
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7F04833A0
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osbccorLJQKX for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 19:59:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 046A08316F
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 19:59:33 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id s17so12812662edd.8
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 12:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S56jt0xKeubdhFqTbG2E0zOTnGlI7eKg+4vuXTXUPQ0=;
 b=aE/OeG/prTEgnPPWZRJB8ctCDXNX6TGq3gu+fGY3SkPkB2sSlZyFvQFBrlXfKY5+dN
 HaPbaEB+TX6pgKqG4YdtV9sn2W/osAyKil6PvbXwrXbQRxx9ZH3OBbnnzokeQWyo/D2f
 CXl7l8/AvxjiPkQwkqStYuvEztL9g+Zr93FtrlSpC/um4sOcgCLePRwVplzrfwKqBWCG
 Iervkqjfda+n5ztT2H6laBaq4UBJni0dxARYGK1siPXDzXP1S1WByJzpGf9i0de426/D
 Wvf0pdPBXt6UTCEK/csXm+4M9z5S9tXVzp7N/3Irmid7wPfzxwPAlMzRbFQkj8E8ONAA
 GaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S56jt0xKeubdhFqTbG2E0zOTnGlI7eKg+4vuXTXUPQ0=;
 b=iyqX5Jf6qghL1Jpm2qBquWQYLI9Z4Xu3UywIwslDXMgWMnI/ROs2J9J0J9KsRqInXC
 FwqLdyx0Y95XFaWNc1fAhMzIUlpXpZng43c/fkC2cH0DRYYGuCXlNtTp8B1E04iE1MCq
 Goi+Bg6O9HM1JyaOlajJ6wwUGly9Uv/w4B2qnhB4jmCIycy9Qk6jOVU9LSss34FsW8ji
 JPMaHynRlUNgFVq4h09gy1Z1fh3C9G4+vfTGV1yELWblMCDvzPZ4IFaaqPo6JA3ZsKz/
 70/3yOzboDOrZObv8jCqBDIndfrlO9v8NEsda/mq5AnVruxB1eqV/f/ALpdhGvpr868L
 XTrg==
X-Gm-Message-State: AOAM530t98bObP30MqYiKwIMrHUqm5suDMtKNYoRKEEBznwjsyunBLo7
 qatXq5Dghc098jhQ0LKwrSqTEw==
X-Google-Smtp-Source: ABdhPJx68yexLPjPXfYcbBjaEhNAPf8QBhcgAFCLbebto7DCeoqB2apPZwzLAvMpXMrXfaM3H65ZQA==
X-Received: by 2002:a17:906:a59:: with SMTP id
 x25mr1985512ejf.33.1632945571976; 
 Wed, 29 Sep 2021 12:59:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b2sm442154ejj.124.2021.09.29.12.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 12:59:31 -0700 (PDT)
Message-ID: <a87c586e-1e73-a3e3-7722-c56e48809d76@mind.be>
Date: Wed, 29 Sep 2021 21:59:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Markus Mayer <mmayer@broadcom.com>, Petr Vorel <petr.vorel@gmail.com>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210928195533.1736944-1-mmayer@broadcom.com>
Subject: Re: [Buildroot] [PATCH 0/1] Build issue related to "command -v"
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
Cc: David Laight <David.Laight@ACULAB.COM>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Markus,

  Thank you for this extensive investigation!

On 28/09/2021 21:55, Markus Mayer wrote:
> Hi all,
> 
> After commit ca6a2907c27c[1], our automated nightly builds started
> experiencing build failures. It took a little while to track down what
> was happening. I think I understand now what is going on.
> 
> This is a bit of a lengthy email as it was a bit of a lengthy
> investigation, and I want to relay my findings and some concerns.

[snip]

> One thing of note is that our post-build script calls "make legal-info",
> and that is when the problem happens. The purpose of doing it like this
> is to include the result of "make legal-info" in the image.

  Calling into Buildroot's Makefile recursively from within a post-build script 
(or a package or whatever) is not something that is supported, in the sense that 
it's not something that anybody ever tests. The use case definitely makes sense 
though. I even heard of people starting the build of a different configuration 
in a post-build script (e.g. for an initramfs).

  So maybe we should add a test in support/testing that validates this scenario.


> However, when make is invoked a second time with HOSTCC already
> defined to call ccache, it'll still assign
>     HOSTCC_NOCCACHE := $(HOSTCC)
> which now redefines HOSTCC_NOCCACHE to *INCLUDE* ccache (since HOSTCC
> does, from earlier)!

  This is clearly wrong. Your patch helps, but we still have a similar situation 
with HOSTCC which will be .../ccache .../ccache /usr/bin/gcc in the recursive 
invocation (i.e. with two times ccache). Although maybe that's not really an 
issue - "ccache ccache gcc -v" at least gives the expected results.

  I'm thinking that maybe we should detect recursive invocation in the top-level 
Makefile and behave differently. For example, everything that is exported 
doesn't need to be exported again, and stuff like that. Or at least we could 
protect the entire HOSTCC etc. block against recursive override.

  Also, the entire handling of HOSTCC is a bit flaky. It is still from 
prehistoric commit 8027784 with no clear requirements (e.g. is HOSTCC allowed to 
be a command with arguments? Is it allowed to be a relative path?). It has been 
documented after-the-fact in docs/manual/common-usage.txt, but I wonder if we 
really still need it? I guess it's a way for people to use a host compiler that 
is more recent that the distro-provided one, but it could just as well be added 
to $PATH and be done with it...

[snip]

> Here is where it gets interesting. "which" will return two lines, one
> for each of the commands:
> 
> $ which $HOSTCC_NOCCACHE
> /local/users/mmayer/buildroot/output/arm64/host/bin/ccache
> /usr/bin/gcc

  As mentioned by Nicolas, we really should quote the argument to "command -v", 
or apply $(firstword ...) to avoid this issue. Indepedent of which or command -v.

[snip]

> As such, relying on "command -v" seems a little risky in that it opens
> up the possibility for strange build errors that others cannot reproduce
> and that nobody would ever think to investigate as being related to the
> "command -v" implementation of a specific shell.

  It is solving an actual problem (i.e. that "which" is deprecated in some 
distros), so the best we can do is make the change early enough before a release 
so people can discover problems with it.


> There is also the issue of some developers working with different
> distributions. Somebody developing a feature on distro 1 might create
> build problems for others using distro 2 and vice versa. Neither would
> have a way of knowing ahead of time that there will be an issue.

  That issue exists regardless of "which" (which BTW has different 
implementations on different distros anyway, so it can also cause problems). We 
try to minimise the external dependencies of Buildroot, and removing "which" 
from the external dependencies is a good thing IMHO.


  Bottom line: I think we need to take four actions here.

1. Apply your patch.
2. Improve on it by detecting that the Buildroot overrides have already been 
exported and don't need to be exported again.
3. Verify all calls to "command -v" and make sure the argument is either quoted 
or uses $(firstword).
4. Consider the removal of HOSTCC and friends as user-settable variables.


  Regards,
  Arnout


> I am wondering if it might be prudent to provide a host-which package,
> such that Buildroot can build its own "which" command if the system
> doesn't have one and stick to using "which" despite it being deprecated.
> At least for the time being and until "command -v" can be explored and
> evaluated a bit more.
> 
> "which" has been around for a long time, and it is a known entity. To me
> personally, and after what I learned here, relying on "command -v" seems
> to be a bit like opening a can of worms. Who knows what else will happen
> some time down the road when nobody is even thinking about the "which"
> -> "command -v" change anymore?
> 
> With all of that explained, I'll defer to you on the final call on the
> matter of using or not using "command -v".
> 
> However, please accept my Makefile change irrespective of the "command
> -v" situation.
> 
> Regards,
> -Markus
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=ca6a2907c27c
> 
> Markus Mayer (1):
>    Makefile: set HOST*_NOCCACHE variables only if unset
> 
>   Makefile | 4 ++++
>   1 file changed, 4 insertions(+)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
