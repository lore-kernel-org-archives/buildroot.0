Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C8DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:04:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C730161078
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C730161078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB99404D0;
	Tue,  3 Aug 2021 16:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rWA46_jpSFub; Tue,  3 Aug 2021 16:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAFD4404DD;
	Tue,  3 Aug 2021 16:04:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAB791BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA55C83613
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKhYFdDtB1Bl for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 16:04:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 496B883300
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 16:04:02 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id go31so37039525ejc.6
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 09:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7SzbCR1W3eWyFGnY8+8BfA+ugn4idlvfyKR6WAEylNE=;
 b=Lac2PKgNdnh95ZrfdjtTFcSDAndQYBCnDCZZzpI/P79xguR58gJ/n1AYzV0/2jsXeM
 qMMpNApFUDFfYVLSpnUo/PPAvkLeaHKCevxvirt0n3fMXq8CkH/n8JNeWecmbWlCjNBV
 cup3EwbwJs4crv+g0kNKIcARNz0oEfKiLnugvbwHPUAYmZcRwPj4+NCTZmORfS1QhOPU
 d5ytrnNQyctlMt/WFDem4CRbegu2XzA/Rkef1UsNkT3CFT3bi+TnG/HbE/nRGhqE3wZJ
 gtyq288qZ8IjGoJCP+fK84V1DS5Yq6RrVgFIMW/PKCZ7oDtdM3aa99IdSTeLqB63NliJ
 YJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7SzbCR1W3eWyFGnY8+8BfA+ugn4idlvfyKR6WAEylNE=;
 b=LxmBijtYPsuBNHFyIWRT2blACTt6nMK/p2EPWgfrRnOlCPJrYCIW3MW3P+PyMP7v/F
 eKX3VyljMOlAWHrCRMbyxeTJKa2gL5I6xyeJ59bBXzIjB7Xk76UFFUzhpMBXjL60/ES5
 J2z5XAxeEU9kwpNXkuZjSCOShu+ZH4TTVoVyUdrBM8C2TVDVhcxae7PHIv2fKQHD6rXG
 YCo5jhYO/WQrBVgz4YfCHDmhHUqd7SNNyP6Z2j9XM13/rS9OZLk0xNWLhDWIrCMKNCD/
 V44164XVTWEgS9VpxhjfalmSTASDKpJqF852l8dMiw5Ph7RL0pdqqM1XKHA+Sc1SpyMe
 gMPQ==
X-Gm-Message-State: AOAM532l2LXTc6eGGYJFKkVsU4uEThoYpE5CTVs4gtO7+nc+AwbCySYy
 0Hx2okOdDm8Av66qclKOfnFORQ==
X-Google-Smtp-Source: ABdhPJxjl7XgOyvREVXXbbo7bJ5uRMnpxZdzawZ2GhYtEKibbza7EgvZKJDl6TdpF6re4fwID1nW2Q==
X-Received: by 2002:a17:906:48c5:: with SMTP id
 d5mr21458727ejt.553.1628006640348; 
 Tue, 03 Aug 2021 09:04:00 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id p23sm8371627edt.71.2021.08.03.09.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 09:03:59 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210801225928.2486201-1-james.hilliard1@gmail.com>
 <20210801225928.2486201-2-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <0b0b423d-cde8-c201-acc6-8781d641b05e@mind.be>
Date: Tue, 3 Aug 2021 18:03:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801225928.2486201-2-james.hilliard1@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/2] package/ripgrep: add workaround for
 cargo bug #3349
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Sam Voss <sam.voss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 02/08/2021 00:59, James Hilliard wrote:
> To fix this bug we have to use an undocumented test variable to enable

 That is pretty nasty. Since there is a patch that is merged upstream, it would
have been nicer to just patch cargo instead. Especially because other packages
(external, obviously) are likely to be hit with the same issue.

 That said, since we have a choice to use rust-bin rather than building our own
rust, patching cargo is not so simple... So OK.

 Both applied to master, thanks.


 BTW, when you resend a patch, it would be nice if you could update patchwork to
mark the old one as superseded.

 Regards,
 Arnout

> the nightly target-applies-to-host feature so that the target linker
> doesn't get used for host binaries like the build-script.
> 
> Fixes:
> error: failed to run custom build command for `ripgrep v0.8.1 (/home/buildroot/buildroot/output/build/ripgrep-0.8.1)`
> 
> Caused by:
>   process didn't exit successfully: `/home/buildroot/buildroot/output/build/ripgrep-0.8.1/target/release/build/ripgrep-59eeb7069534e1ef/build-script-build` (exit status: 1)
>   --- stderr
>   /home/buildroot/buildroot/output/build/ripgrep-0.8.1/target/release/build/ripgrep-59eeb7069534e1ef/build-script-build: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by /home/buildroot/buildroot/output/build/ripgrep-0.8.1/target/release/build/ripgrep-59eeb7069534e1ef/build-script-build)
> 
> Details:
> https://github.com/rust-lang/cargo/issues/3349
> https://github.com/rust-lang/cargo/pull/9322
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/ripgrep/ripgrep.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
> index 2cc578383d..450bb020e3 100644
> --- a/package/ripgrep/ripgrep.mk
> +++ b/package/ripgrep/ripgrep.mk
> @@ -11,11 +11,14 @@ RIPGREP_LICENSE_FILES = LICENSE-MIT
>  RIPGREP_CPE_ID_VENDOR = ripgrep_project
>  
>  RIPGREP_DEPENDENCIES = host-rustc
> -RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
> +RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo \
> +	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> +	CARGO_TARGET_APPLIES_TO_HOST="false"
>  
>  RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_BIN_SUBDIR)
>  
>  RIPGREP_CARGO_OPTS = \
> +	-Z target-applies-to-host \
>  	--target=$(RUSTC_TARGET_NAME) \
>  	--manifest-path=$(@D)/Cargo.toml
>  
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
