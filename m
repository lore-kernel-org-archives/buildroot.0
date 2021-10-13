Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7810AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:56:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC61F6008E
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 18:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC61F6008E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4BC48294A;
	Wed, 13 Oct 2021 18:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NuskTOHw3tiX; Wed, 13 Oct 2021 18:56:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F42781C56;
	Wed, 13 Oct 2021 18:56:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F8221BF38C
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84DCB40837
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 18:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yeEYabcOMFyx for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 18:56:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9073E40836
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 18:56:29 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id i20so13784765edj.10
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 11:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=H0rxppaPMleDr30wUbaN4gr12Qapj9aT4KKewE3EQI0=;
 b=JIKkdQ9kB3RlYXWUzmccCu0jTlHbnUbB3XRIp5USEr+fDn/yqN12Ug0WHdjVu0QlhC
 AG0KpJiyRO/9zyQ4n7UKXwUCcaTHxd/VsSYw6rb9Q8vgY0nvASScOlqnyS/oG4/qDoeJ
 PA/sdgszJpjwNaNd5b7zAjuxCIU9uIhYeQOwcvWOTvp9RADwWmGLVdUJdiNrMRx80/ju
 +3b74k7yXAY7YGHn0HvUrhZxgvfM0ZKEx9xfWmYsMOLKoxH8G7CDpPgs8KsP8gK6OAr8
 t8XwAttMiFvivInxkzYOhFHerm54O3uZ/Ux4r7YF5B3lge2C2lq4vgJJSZq43Ycsnn8X
 1Mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=H0rxppaPMleDr30wUbaN4gr12Qapj9aT4KKewE3EQI0=;
 b=U2QzDcPh43uiTh2zz59Qz6CojRS/v9Sc/gwWKA2tsQrupNS8sB6uCh5F9iaHMZdHOM
 S6p0tDDxD5s5oV0GOk40wn6IOvpmkHlmo0upY/Yu6WeIqAogfLPKLGEvBNnmltxK1vc+
 3xUIqDucj4lJQ2UXA6cPI0IN0N+dl0T7HZLv8TFiM4DRnJoM4+ZV5nntAPP3gGBLo2la
 +J6Lvy8KoWaPE3Ufl3NPWpfozOFNB44+gDhJ2K0GfwGbNn2aHm5FessHO15UDV4ZIncs
 D7yAN396r5iW8+tdn3N+JzMqdIOAl513eXDRm6IVqJIMBmPuMtaQh04X5N1DqdXnyDo2
 gE2g==
X-Gm-Message-State: AOAM5316UZ1mJv14xezN2FphfQP7GvmOhOHVRV7zNJ5jLjeN8joVyiE7
 S5ozBUd9dFdshGgfMK/7mn1z+99OJ90qM2cF
X-Google-Smtp-Source: ABdhPJynYr+HmiJ9gKWrykqNupu0TSGhgvfNELAq+qzNnIQFVmHEHsv20hH25taWmeJTCSxsMM6h9Q==
X-Received: by 2002:a17:906:2b91:: with SMTP id
 m17mr1168162ejg.202.1634151385190; 
 Wed, 13 Oct 2021 11:56:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bw12sm297221ejb.9.2021.10.13.11.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:56:24 -0700 (PDT)
Message-ID: <4e0cc347-9344-29c3-1c91-0569b852a025@mind.be>
Date: Wed, 13 Oct 2021 20:56:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211006204023.3185616-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006204023.3185616-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ruby: fix build with autoconf
 >= 2.70
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/10/2021 22:40, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of autoconf to version
> 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:
> 
> checking whether the C++ compiler works... no
> configure: error: in `/home/buildroot/autobuild/instance-3/output-1/build/ruby-3.0.2':
> configure: error: C++ compiler cannot create executables
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/63f32033aff5c800a933d8b1c805be0d9d6abea6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ruby/0002-Needs-AC_PROG_CC.patch | 28 ++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>   create mode 100644 package/ruby/0002-Needs-AC_PROG_CC.patch
> 
> diff --git a/package/ruby/0002-Needs-AC_PROG_CC.patch b/package/ruby/0002-Needs-AC_PROG_CC.patch
> new file mode 100644
> index 0000000000..647358be70
> --- /dev/null
> +++ b/package/ruby/0002-Needs-AC_PROG_CC.patch
> @@ -0,0 +1,28 @@
> +From 912a8dcfc5369d840dcd6bf0f88ee0bac7d902d6 Mon Sep 17 00:00:00 2001
> +From: Nobuyoshi Nakada <nobu@ruby-lang.org>
> +Date: Thu, 30 Sep 2021 18:24:37 +0900
> +Subject: [PATCH] Needs `AC_PROG_CC`
> +
> +Although `AC_PROG_CC_C99` has been obsolete, `AC_PROG_CC` is not
> +and the latter is necessary not to make C++ compiler mandatory.
> +
> +[Retrieved from:
> +https://github.com/ruby/ruby/commit/912a8dcfc5369d840dcd6bf0f88ee0bac7d902d6]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index b24a8f59b0d2..c7059ee1ecf4 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -218,7 +218,7 @@ rb_test_CXXFLAGS=${CXXFLAGS+yes}
> + # BSD's ports and MacPorts prefix GNU binutils with 'g'
> +
> + dnl Seems necessarily in order to add -std=gnu99 option for gcc 4.9.
> +-m4_version_prereq([2.70], [], [AC_PROG_CC_C99])
> ++m4_version_prereq([2.70], [AC_PROG_CC], [AC_PROG_CC_C99])
> +
> + AC_PROG_CXX
> + AC_PROG_CPP
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
