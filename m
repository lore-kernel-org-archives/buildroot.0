Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601C2C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:57:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1626861037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1626861037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBE6F83C88;
	Wed,  4 Aug 2021 20:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9aAXc4FMTk4E; Wed,  4 Aug 2021 20:57:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0174483C9F;
	Wed,  4 Aug 2021 20:57:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 343951BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CB0740E43
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eoxnyayXtVR9 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:57:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07E624069A
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:57:53 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gs8so5634924ejc.13
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HHYSMuQB1wEm8+F4e4gRYcAm5d2Euj6MaYVYnx5sJN4=;
 b=GqNp/QClHCJkb2Il44qMk5TvrF3bpR/OyrXogkMKnCGGoY+LwPzPjaX2wUUbtAABJ1
 Gdb+hU0gSww5n+K1OVaO1ahJvl/1x+dXjW2bSp8qMa5GkUvS0FCaXQEzCJocNMbj4Fg2
 HIWt9gRhRQ2gqGWCcKMNtBj+aSkfOvcX+m3+CLr6eRWfk9UOgPCmazLH5T7F37TpjawJ
 n+jlEBFGdA5cWeKZMqMtfEnEaVF+ZR9yF1vmc35rtTfmQMkCMyHd42/mENhvBHX6YjUT
 HTZQgQwS6QUBG34m0Ju6/URYMUlV06BD0eVufAFrQ7KcaLKP7ppW/UOtQxEtm+XqbuBz
 dkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HHYSMuQB1wEm8+F4e4gRYcAm5d2Euj6MaYVYnx5sJN4=;
 b=cQQEPHa0q1rcG3y8avgN8NCRQr21YzkFIGirBbPehX8Xm0r5nYAAPHlbvnLo05u+YW
 fhDhMrjCwTyyKv6MUuLyVxcnOamBOvjLw/1gdXbTJmpAMbWh2UB4ISpX/7+T5lbtAB5a
 hGxBe7YdE+q10uQcnfx7m3IXBg01ky9cFKLcB93LcAeTDZ8Eh6qlN4pjVGfIGBjjU6Vl
 qRF57Z1OyzNxN4wS1tU0aWqAl9Uce/KaFYsTkOm0ZH52h6QZ8xCxuybazi6/4mPilupO
 3FYrKfK5OJgU5/0hZmAyroZunscxsFtcn6NX9xExHxzrLOZAlatCPILCNKw/C+ZYPWwE
 ihYw==
X-Gm-Message-State: AOAM530n7+3ArUKry1wTKFeNRUGikL97yl3zNC2PDT4ctQtCVerX//wt
 w733eLOPBONtkXOowXjdXNjeGw==
X-Google-Smtp-Source: ABdhPJwMqBKPAfrn62IhHnvF/99xYCtC0e1IhtGm9HuMAUo21e/FyvKMjPjJmHJO/qJgp0N5w9rXDA==
X-Received: by 2002:a17:906:ccd9:: with SMTP id
 ot25mr1027512ejb.508.1628110671946; 
 Wed, 04 Aug 2021 13:57:51 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id l9sm1389738edt.55.2021.08.04.13.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 13:57:51 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210803224106.1619032-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <c7c2a618-924a-edbe-02c1-7862520e954c@mind.be>
Date: Wed, 4 Aug 2021 22:57:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803224106.1619032-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/libfuse3: fix build failure on
 Microblaze due to wrong symver attribute detection
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 04/08/2021 00:41, Giulio Benetti wrote:
> Add a patch to fix symver wrong detection. As explained into the patch
> pending upstream[1] __has attribute() gives false positive when an
> attribute is not supported[2] and this leads to assuming symver attribute
> is present but it's not. This consequentely leads to build failure. I.e.
> Microblaze doesn't really support it since it doesn't include include
> elfos.h in config.gcc that determine symver to be available.
> 
> [1]: https://github.com/libfuse/libfuse/pull/620
> [2]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766

 Excellent explanation!

 Applied to master (after adding the Fixes: line), thanks.

 Regards,
 Arnout

> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...on.build-fix-wrong-.symver-detection.patch | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch
> 
> diff --git a/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch b/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch
> new file mode 100644
> index 0000000000..da20c26f19
> --- /dev/null
> +++ b/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch
> @@ -0,0 +1,61 @@
> +From 3aba09a5c56e017746c5c1652dbc845f4db7374a Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Tue, 3 Aug 2021 23:39:46 +0200
> +Subject: [PATCH] meson.build: fix wrong .symver detection
> +
> +As pointed here [1] __has_attribute() is broken for many attributes and
> +if it doesn't support the specific attribute it returns true, so we
> +can't really rely on that for this check. This lead to Buildroot
> +libfuse3 build failure [2] where that shows up with:
> +```
> +error: symver is only supported on ELF platforms
> +```
> +Indeed Microblaze doesn't support ELF since it doesn't include elfos.h,
> +but __has_attribute(symver) returns true.
> +
> +So let's substitute the #ifdef __has_attribute() with a stronger test on
> +a function foo() with __attribute__((symver ("test@TEST"))).
> +
> +[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766
> +[2]: http://autobuild.buildroot.net/results/d6c/d6cfaf2aafaeda3c12d127f6a2d2e175b25e654f/build-end.log
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + meson.build | 16 +++++++---------
> + 1 file changed, 7 insertions(+), 9 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index b0250ee..a7281f3 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -96,20 +96,18 @@ endif
> + # to have __has_attribute, then they are too old to support symver)
> + # other compilers might not have __has_attribute, but in those cases
> + # it is safe for this check to fail and for us to fallback to the old _asm_
> +-# method for symver
> ++# method for symver. Anyway the attributes not supported by __has_attribute()
> ++# unfortunately return true giving a false positive. So let's try to build
> ++# using __attribute__ ((symver )) and see the result.
> + code = '''
> +-#if defined __has_attribute
> +-# if !__has_attribute (symver)
> +-# error symver attribute not supported
> +-# endif
> +-#else
> +-#error __has_attribute not defined, assume we do not have symver
> +-#endif
> ++__attribute__ ((symver ("test@TEST")))
> ++void foo(void) {
> ++}
> + 
> + int main(void) {
> +     return 0;
> + }'''
> +-if cc.compiles(code, args: [ '-O0', '-c'])
> ++if cc.compiles(code, args: [ '-O0', '-c', '-Werror'])
> +      message('Compiler supports symver attribute')
> +      add_project_arguments('-DHAVE_SYMVER_ATTRIBUTE', language: 'c')
> + else
> +-- 
> +2.25.1
> +
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
