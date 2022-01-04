Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFDEC433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77B9B40920;
	Tue,  4 Jan 2022 17:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4OUm-xeZYx5d; Tue,  4 Jan 2022 17:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D3241508;
	Tue,  4 Jan 2022 17:59:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41C2F1BF27A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 312D9818D0
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbuBLeXu6y1p for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:59:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A109818A1
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:59:52 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id j6so151481700edw.12
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/RXH+tcEbMchU0WZuwGt94C3+hBCmM1lzsAnC7HLz1c=;
 b=eh79y86Ggj+WROVOEhzA3U3YbuTSVYfYt6RxrtM9o2bje0oc9hRwMZsuh9upjiMp3H
 44VrffAw0NQAKBiQ7kIEr3SC4s0dX33wPr8RIZWPuFG9VtMZE+8fMl4VNWDAT5FAr4gQ
 GtM2jOMSzPgTE7OONEprI/T8MbgCE4v0S+Mg4NUkAYIxgIpMrQM/4t707TSRtkkRMDFZ
 K8Wf8K0FuV7wYICRHjhiyIU2kYaU5ygbYo5qiu7tUEuo01DmbzASQXzdV08+1Ntij3eX
 V86mv5sGukMTDh0sP9ntkJtSOIJDhwUBYdq9AznHtMmJMjrcGDSmfeZNBW7DB+wqDG1o
 AAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/RXH+tcEbMchU0WZuwGt94C3+hBCmM1lzsAnC7HLz1c=;
 b=I8tlbUZu5KS8ftfq5sQNFfLIFGoTBLQCWFpVQGuCfPlpFL1ygafACMcvlGHoYcvmkV
 H7WS/pLFWz6cc+1mzlAmHB6UfeD91Wqpx36W93wCTvFTj5O/3CqA2DATv3AhTLzIIvMF
 SvYI2cX8JHU6tfzm+XvxqwfDt1OWUABtWyN/Y2sW27j8JEGd/JmEZ2RoybcUh1DMduRy
 lJRHBujtAvyfc3B3UuforPfsegVMid8aDibyPN/Ge1Hi879oHfTgVOdo16wbekj18um6
 +TjYmWePy2zX7jG3iOeFA9vC1SE83dQMvMISytUlLJs97+HisQUf0RkxkAJECD48h//C
 qKOA==
X-Gm-Message-State: AOAM531fbkhx+e9UkjDFTCtZeUSKH4Dm5Qmofg4BxrCS+WR446lyk7aX
 BJ+7IvqfwIE5p+aJg+o37IgjLg==
X-Google-Smtp-Source: ABdhPJzGs5bqMWnShM0A1WUydspshlcEx1Q+qlfSY1z8O1/8cNEHaKqdya8r2bM40RW3+KxVby0C2Q==
X-Received: by 2002:a05:6402:40d5:: with SMTP id
 z21mr50906136edb.166.1641319190439; 
 Tue, 04 Jan 2022 09:59:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cz3sm15107514edb.88.2022.01.04.09.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:59:50 -0800 (PST)
Message-ID: <2214f965-06d7-ddb8-1709-14bc1c7cdb4e@mind.be>
Date: Tue, 4 Jan 2022 18:59:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220102174556.2824179-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220102174556.2824179-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dnsmasq: fix build with gcc 4.8
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/01/2022 18:45, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 4.8 raised since bump to
> version 2.86 in commit 5b29096f8fcb0acd8890073a56ba9d620b1f911c:
> 
> option.c: In function 'one_opt':
> option.c:2445:11: error: 'for' loop initial declarations are only allowed in C99 mode
>             for (char *p = arg; *p; p++) {
>             ^
> option.c:2445:11: note: use option -std=c99 or -std=gnu99 to compile your code
> option.c:2453:11: error: 'for' loop initial declarations are only allowed in C99 mode
>             for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
>             ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/39b34a4e69fc10f4bd9d4ddb0ed8c0aae5741c84
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-src-option.c-fix-build-with-gcc-4.8.patch | 52 +++++++++++++++++++
>   ...9080ff8743133fbd52427b4b2213171-typo.patch | 36 +++++++++++++
>   2 files changed, 88 insertions(+)
>   create mode 100644 package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
>   create mode 100644 package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch
> 
> diff --git a/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch b/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
> new file mode 100644
> index 0000000000..50ecf2f18a
> --- /dev/null
> +++ b/package/dnsmasq/0001-src-option.c-fix-build-with-gcc-4.8.patch
> @@ -0,0 +1,52 @@
> +From 46312909d9080ff8743133fbd52427b4b2213171 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 31 Dec 2021 17:29:44 +0100
> +Subject: [PATCH] src/option.c: fix build with gcc 4.8
> +
> +Fix the following build failure with gcc 4.8 raised since version 2.86:
> +
> +option.c: In function 'one_opt':
> +option.c:2445:11: error: 'for' loop initial declarations are only allowed in C99 mode
> +           for (char *p = arg; *p; p++) {
> +           ^
> +option.c:2445:11: note: use option -std=c99 or -std=gnu99 to compile your code
> +option.c:2453:11: error: 'for' loop initial declarations are only allowed in C99 mode
> +           for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
> +           ^
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/39b34a4e69fc10f4bd9d4ddb0ed8c0aae5741c84
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream commit 46312909d9080ff8743133fbd52427b4b2213171]
> +---
> + src/option.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/option.c b/src/option.c
> +index ff54def..c57f6d8 100644
> +--- a/src/option.c
> ++++ b/src/option.c
> +@@ -2525,7 +2525,8 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
> +           arg += 9;
> +           if (strlen(arg) != 16)
> +               ret_err(gen_err);
> +-          for (char *p = arg; *p; p++) {
> ++          char *p;
> ++          for (*p = arg; *p; p++) {
> +             if (!isxdigit((int)*p))
> +               ret_err(gen_err);
> +           }
> +@@ -2533,7 +2534,8 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
> +
> +           u8 *u = daemon->umbrella_device;
> +           char word[3];
> +-          for (u8 i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
> ++          u8 i;
> ++          for (i = 0; i < sizeof(daemon->umbrella_device); i++, arg+=2) {
> +             memcpy(word, &(arg[0]), 2);
> +             *u++ = strtoul(word, NULL, 16);
> +           }
> +--
> +2.33.0
> +
> diff --git a/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch b/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch
> new file mode 100644
> index 0000000000..8cdf5b3f1b
> --- /dev/null
> +++ b/package/dnsmasq/0002-Fix-46312909d9080ff8743133fbd52427b4b2213171-typo.patch
> @@ -0,0 +1,36 @@
> +From 2748fb81e23b71e2c44956e99321816aca91905d Mon Sep 17 00:00:00 2001
> +From: Simon Kelley <simon@thekelleys.org.uk>
> +Date: Sat, 1 Jan 2022 23:03:26 +0000
> +Subject: [PATCH] Fix 46312909d9080ff8743133fbd52427b4b2213171 typo.
> +
> +[Upstream commit 2748fb81e23b71e2c44956e99321816aca91905d]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/option.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/option.c b/src/option.c
> +index c57f6d8..6f56ce8 100644
> +--- a/src/option.c
> ++++ b/src/option.c
> +@@ -357,7 +357,7 @@ static const struct myoption opts[] =
> +     { "dhcp-ignore-clid", 0, 0,  LOPT_IGNORE_CLID },
> +     { "dynamic-host", 1, 0, LOPT_DYNHOST },
> +     { "log-debug", 0, 0, LOPT_LOG_DEBUG },
> +-	{ "umbrella", 2, 0, LOPT_UMBRELLA },
> ++    { "umbrella", 2, 0, LOPT_UMBRELLA },
> +     { "quiet-tftp", 0, 0, LOPT_QUIET_TFTP },
> +     { NULL, 0, 0, 0 }
> +   };
> +@@ -2526,7 +2526,7 @@ static int one_opt(int option, char *arg, char *errstr, char *gen_err, int comma
> +           if (strlen(arg) != 16)
> +               ret_err(gen_err);
> +           char *p;
> +-          for (*p = arg; *p; p++) {
> ++          for (p = arg; *p; p++) {
> +             if (!isxdigit((int)*p))
> +               ret_err(gen_err);
> +           }
> +--
> +2.33.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
