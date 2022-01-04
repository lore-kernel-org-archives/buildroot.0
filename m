Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21859C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2CEF82718;
	Tue,  4 Jan 2022 17:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id huqoxVqGb-4P; Tue,  4 Jan 2022 17:15:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA208267C;
	Tue,  4 Jan 2022 17:15:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 019A21BF32A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2A4A40118
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1aUzlJlaMe8 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:15:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0331840104
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:15:38 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id bm14so151134137edb.5
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qDceJErUD5zxTjfOyruRzsufv1Qlpgr1RPh9TF6UTMs=;
 b=R+P5re8xGCcYiPPDGDalVsgB/oc8ztEz6QkzlhwQqCd0W/LeoMyiAr7oBMcimFO/CB
 SyObhJQdycA76oZruFt01PqrJ2m6m1a0VFj5CEvL7orTh2nlJ283yKbuOWusn4TmqdlA
 Q53+7A1pyL7GUBCBOLlH6QWgXL04zWO2mROY0KarKjuVuQkiJ+wwc/ZH6mOSosvsf76f
 l77EK8Ujaiek2J/9kgwXbElASR0zhufdk4mLS0XQjGvPp5t1w9ucUYRDF71YTj8XFIBK
 1SLvD7p1z2Ly/NLpO1z/AHkQiwPykuflCogQdkzH4tX57zbMDGtSdCy0AeYDCgg6zPku
 82pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qDceJErUD5zxTjfOyruRzsufv1Qlpgr1RPh9TF6UTMs=;
 b=VlC4zL0ECBvqpFk0rei40pv+M8fe3WWA0jpU7vy4S3VjiODo9wImN9e2nvmfFxPYg0
 76eP7a8Y334xmhfIRsa6RDw8+rRSPvh5Ji9TVmJCtigqVco4TZx7GLbBfwJYMI2z5AVm
 1pjTRW0uUnbJ/COif55FTZr54v1buh3iA7zC748gQLQ4cf4KSEBHavQigIiuwdDqlYhN
 Ff/8W+cYgx0FPzlBpDlXzhz9naCDVsRVMos5NPSOOFMUeADlbF7TO3/Q4ZK5GtEeCWk6
 6HyCtMIY8oRpahuUvULt6Bt0XT0pg6bedigs9AcXiTlGXhJfO3y4NO270zdAe3vQBukY
 q4Hw==
X-Gm-Message-State: AOAM532H38AcK2N3rUIzmkcOCWrRmasnMaaOvEef4WTF/2lyt+Tf0YwA
 6PDrKSVdsAct0NEWJt3KKkuOKLgRnDnA4A==
X-Google-Smtp-Source: ABdhPJxVQHJNs075plcjAmfWbqFomh/hdBHhE0zTGqlgZHyv+htmrFay0Phtpvpm1WNQv2greA5COQ==
X-Received: by 2002:a50:bae2:: with SMTP id x89mr49630619ede.337.1641316537248; 
 Tue, 04 Jan 2022 09:15:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b73sm14826592edf.37.2022.01.04.09.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:15:36 -0800 (PST)
Message-ID: <c396ad5c-68bf-9cb2-5002-3d4b8008ee98@mind.be>
Date: Tue, 4 Jan 2022 18:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220101214034.2152144-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101214034.2152144-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] Makefile: disable 'printvars' and
 'show-vars' recipes for Make 4.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 22:40, Giulio Benetti wrote:
> Make 4.3 is buggy and leads to a "Segmentation fault (core dumped)" when
> calling 'make printvars' or 'make show-vars', so let's refuse to execute
> those recipes if Make 4.3 by adding 'check-make-version' recipe as
> depedendency of 'printvars' and 'show-vars' as suggested by Yann E. Morin.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Yeah, this has been bothering me for ages... I hope this gets fixed soon.


  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   Makefile | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 0b8c7b2867..ac98b84425 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1058,13 +1058,20 @@ ifeq ($(NEED_WRAPPER),y)
>   	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
>   endif
>   
> +.PHONY: check-make-version
> +check-make-version:
> +ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3),)
> +	@echo "Make 4.3 doesn't support 'printvars' and 'show-vars' recipes"
> +	@exit 1
> +endif
> +
>   # printvars prints all the variables currently defined in our
>   # Makefiles. Alternatively, if a non-empty VARS variable is passed,
>   # only the variables matching the make pattern passed in VARS are
>   # displayed.
>   # show-vars does the same, but as a JSON dictionnary.
>   .PHONY: printvars
> -printvars:
> +printvars: check-make-version
>   	@:
>   	$(foreach V, \
>   		$(sort $(filter $(VARS),$(.VARIABLES))), \
> @@ -1077,7 +1084,7 @@ printvars:
>   
>   .PHONY: show-vars
>   show-vars: VARS?=%
> -show-vars:
> +show-vars: check-make-version
>   	@:
>   	$(info $(call clean-json, { \
>   			$(foreach V, \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
