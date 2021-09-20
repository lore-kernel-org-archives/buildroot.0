Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D5BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:23:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD7B161184
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD7B161184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA671401E2;
	Mon, 20 Sep 2021 19:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3s_DwqUGYgZ8; Mon, 20 Sep 2021 19:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A65F4019D;
	Mon, 20 Sep 2021 19:23:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE19A1BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA4F0401B6
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUoeyyjrEfZl for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:22:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F50A4012E
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:22:41 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id t6so65115783edi.9
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 12:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=BevM5q4MUh+KWJx814XY/9CnUosjnsJh+dAKg5yi62I=;
 b=SZC6gtDa2Di/7UA3X9CRvHlHevc8ymF7pQsPX6wPciItNwncOvlt1jhlHEHQiaqM+D
 xNZzT026+X9Rm+CrjNmctlU9rOHsaAHXvcSHUtNZFEvO9bJajuunrLu4Z+h5IhcE742U
 rxq/sUzsgWKFSUDMjhwbk/nGQ5R8Mhv9Ol/+BJpjAlkv1RVC+exzn7BMrmVAMTlEZ/3a
 fo3WG73H+2S+1mvs/99bAUOdSZ4Yvl3ujnfTtSBwroiYoWE+Dgl0Jxk3P+fUGwb6/bYU
 +TY/7r0u/CileqkNA6//8elOg/ShXXADE1FKWuBCCOxr6CuX0zrBXcBMyi4q3NdjXnuT
 Of2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BevM5q4MUh+KWJx814XY/9CnUosjnsJh+dAKg5yi62I=;
 b=AuWDGPinGOG0iodIBxUIebcxJfsC0OfOYPrK5lgzgFx6HAw4sjshtJEcd8GNp5DmRC
 IwUwTqAZ6g/+F/3U8OADsC9b8zL83rkSY3SzXH+4Cs7fsKfklehRY+PzEHKSjcq25+N3
 8FiVRHYr9V8eX8AVA0t01pH2BdtJdMrAfVGPzLvewIZaVnu4APIHcqM5Q0/KKKetRuEc
 /clL1Qjbo/1HN4sOKgARp7K5r8tZkRLvhZUcOY9SyT+tNn4er4qZEPYDRg2+KeQV3cSm
 JrpdlGS+R7+Zo1fIBdBD1BX9SSAj8FbWcEWx6xcUNtllLvQKRzwmW0tdrqIjUhvOL0KJ
 4j1Q==
X-Gm-Message-State: AOAM530egUgyg43+KmI2Ka9y9Uymrl56bIE3ng+FPGd8fM9MZx3O3Uup
 vT01jbAT0sHDDb5fYo3onDB8NA==
X-Google-Smtp-Source: ABdhPJxT64Z2LenR9SIq5qVs32ngvszDk16PBpScIes5XbLJ0sevr03kCDN/hob6EpU/xnfFetV3Nw==
X-Received: by 2002:a50:cf89:: with SMTP id h9mr30127120edk.75.1632165759527; 
 Mon, 20 Sep 2021 12:22:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w10sm7402413eds.30.2021.09.20.12.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 12:22:39 -0700 (PDT)
Message-ID: <4fa8167c-0ab5-0ede-dfda-9a182eb1f4b4@mind.be>
Date: Mon, 20 Sep 2021 21:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210908200058.593544-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908200058.593544-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/tinycbor: bump to version 0.5.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 08/09/2021 22:00, Fabrice Fontaine wrote:
> - Drop patch (already in version)
> - Update indentation in hash file (two spaces)
> 
> https://github.com/intel/tinycbor/releases/tag/v0.5.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...able-build-for-different-c-libraries.patch | 39 -------------------
>   package/tinycbor/tinycbor.hash                |  4 +-
>   package/tinycbor/tinycbor.mk                  |  2 +-
>   3 files changed, 3 insertions(+), 42 deletions(-)
>   delete mode 100644 package/tinycbor/0001-Enable-build-for-different-c-libraries.patch
> 
> diff --git a/package/tinycbor/0001-Enable-build-for-different-c-libraries.patch b/package/tinycbor/0001-Enable-build-for-different-c-libraries.patch
> deleted file mode 100644
> index 40f9288604..0000000000
> --- a/package/tinycbor/0001-Enable-build-for-different-c-libraries.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 085ca40781f7c39febe6d14fb7e5cba342e1804b Mon Sep 17 00:00:00 2001
> -From: Ricardo Crudo <ricardo.crudo@gmail.com>
> -Date: Sat, 30 May 2020 22:03:01 +0200
> -Subject: [PATCH] Enable build for different c libraries
> -
> -The open_memstream.c was using GLIBC macro definition to test if the
> -library is building on a Linux box. This makes impossible to build
> -tinycbor against other C libraries, as musl for example.
> -
> -Signed-off-by: Ricardo Crudo <ricardo.crudo@gmail.com>
> -[Retrieved from:
> -https://github.com/intel/tinycbor/commit/085ca40781f7c39febe6d14fb7e5cba342e1804b]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/open_memstream.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/open_memstream.c b/src/open_memstream.c
> -index 18f3de8..3365378 100644
> ---- a/src/open_memstream.c
> -+++ b/src/open_memstream.c
> -@@ -38,7 +38,7 @@
> - #ifdef __APPLE__
> - typedef int RetType;
> - typedef int LenType;
> --#elif __GLIBC__
> -+#elif __linux__
> - typedef ssize_t RetType;
> - typedef size_t LenType;
> - #else
> -@@ -101,7 +101,7 @@ FILE *open_memstream(char **bufptr, size_t *lenptr)
> -
> - #ifdef __APPLE__
> -     return funopen(b, NULL, write_to_buffer, NULL, close_buffer);
> --#elif __GLIBC__
> -+#elif __linux__
> -     static const cookie_io_functions_t vtable = {
> -         NULL,
> -         write_to_buffer,
> diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
> index 8ff706bb67..29f0cfabf0 100644
> --- a/package/tinycbor/tinycbor.hash
> +++ b/package/tinycbor/tinycbor.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256	956eb4b670ea4969eaee67395b5bb6437b153960385b77357d6692e979d1b12d	tinycbor-0.5.3.tar.gz
> -sha256	3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e	LICENSE
> +sha256  e63668a71fd6d7abf1727dc31682ec7f107599a3c024a445c3e5da6af9328983  tinycbor-0.5.4.tar.gz
> +sha256  3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e  LICENSE
> diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
> index ef095ea67d..476da67363 100644
> --- a/package/tinycbor/tinycbor.mk
> +++ b/package/tinycbor/tinycbor.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TINYCBOR_VERSION = 0.5.3
> +TINYCBOR_VERSION = 0.5.4
>   TINYCBOR_SITE = $(call github,intel,tinycbor,v$(TINYCBOR_VERSION))
>   TINYCBOR_LICENSE = MIT
>   TINYCBOR_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
