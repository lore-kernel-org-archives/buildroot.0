Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6919AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 088F660BF9;
	Tue, 14 Jun 2022 16:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RqPeISfHbYu9; Tue, 14 Jun 2022 16:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A71D60AF4;
	Tue, 14 Jun 2022 16:56:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E1791BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DC298330B
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HsdbIn7jJsZz for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:55:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6ED56832B3
 for <buildroot@busybox.net>; Tue, 14 Jun 2022 16:55:23 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id c2so12510502edf.5
 for <buildroot@busybox.net>; Tue, 14 Jun 2022 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=XgXt6hjTJvpXV2QOjye+G+KQtJUnUa3eRgtcRtqAVBM=;
 b=DwRtyNJvea6riAnL2XghyjT/Wc2AnUkut41JbF6g04gSrrhqmwCvTnFz9gUz9BuEZQ
 +vpcMpx08nb6T4nOdhOXJTrODHnAhytUHFQPixCKbbDFl4gk4hFUpMt37DTu8bL3y7z5
 RFe+JTP7m7IftqrnHiibA18/UOllYMrZdWjTX1B0FK4BYUlotpkGlhN/uPXXtqJCTdn3
 giAg4+BasaOKQ4u/ZCvaJ6sKFxlV1AWMLuwa7oURGEZgFBl+lMJk/b/0KyTPiM239VfJ
 lxyNZ8dFiMwNU66PmJelQt5MvgZuwtSI1vdp0eIwW9ygnp5I72jIaZ5rUbjPnIGXje+F
 KbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XgXt6hjTJvpXV2QOjye+G+KQtJUnUa3eRgtcRtqAVBM=;
 b=oWrwuee3gmuuvbDEzZb6w80pilD0NcudHpeGLVZhLbtSbOQaQb6nd9cMDhuOiFPMe8
 bxpn0OCnqkZT46JuC4mv9Af6cC85Au4Inda+gwWLJtK6peiLMjh48PM3Lg0XBX79f2JG
 dsBcdm85pzasY6Mxt/i/w6FYWS9ySaOP3F1Ze5TY1jM59mN1ZcA0az2gftC7SOgYGrKd
 /0mQSPoXyq7McxtIqAvkttCOnJBBqe2xlS4pX1cwbRS2f8XCep59wKALrwzgbH6cMzPJ
 DfA+IkTqMzRNVk86RjJG+m75i+ZQa5GkOaECUVQPv8yYydPmGIkFCW82zbN3XrIPcSLf
 wWjQ==
X-Gm-Message-State: AOAM531CEfEDIddFdTydkdewjsQY00vG1AD8Yu6QAUyiSt3NssfEST+i
 g4UcVtKJiXI3iX1fQOkQnbbvlw==
X-Google-Smtp-Source: AGRyM1uhvcI8olKNiNjH6qMY5Yxe4MxIQjROD2tht4GkcTuFggK4Nx9LZDmTwpY4iAmDKw5BuK8nog==
X-Received: by 2002:a05:6402:90d:b0:428:c1ad:1e74 with SMTP id
 g13-20020a056402090d00b00428c1ad1e74mr7291803edz.345.1655225721687; 
 Tue, 14 Jun 2022 09:55:21 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 i2-20020a170906444200b006fed8dfcf78sm5254946ejp.225.2022.06.14.09.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:55:20 -0700 (PDT)
Message-ID: <66d85e07-a32b-4560-8519-e4190ecdfec2@mind.be>
Date: Tue, 14 Jun 2022 18:48:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220610165715.2574492-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220610165715.2574492-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/lsof: bump to version 4.95.0
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



On 10/06/2022 18:57, Francois Perrad wrote:
> remove merged patch
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lsof/0001-remove-susvlegacy-funcs.patch | 12 ------------
>   package/lsof/lsof.hash                          |  2 +-
>   package/lsof/lsof.mk                            |  2 +-
>   3 files changed, 2 insertions(+), 14 deletions(-)
>   delete mode 100644 package/lsof/0001-remove-susvlegacy-funcs.patch
> 
> diff --git a/package/lsof/0001-remove-susvlegacy-funcs.patch b/package/lsof/0001-remove-susvlegacy-funcs.patch
> deleted file mode 100644
> index fca66aee5..000000000
> --- a/package/lsof/0001-remove-susvlegacy-funcs.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff -rdup lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h lsof_4.81/lsof_4.81_src/dialects/linux/machine.h
> ---- a/dialects/linux/machine.h	2007-04-24 18:20:58.000000000 +0200
> -+++ b/dialects/linux/machine.h	2007-05-15 12:17:03.000000000 +0200
> -@@ -616,6 +616,6 @@
> -  * zeromem is a macro that uses bzero or memset.
> -  */
> -
> --#define	zeromem(a, l)	bzero(a, l)
> -+#define	zeromem(a, l)	memset(a, 0, l)
> -
> - #endif	/* !defined(LSOF_MACHINE_H) */
> -
> diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
> index 9e72023d3..7318c608c 100644
> --- a/package/lsof/lsof.hash
> +++ b/package/lsof/lsof.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  c41709c2543ecf9de1e950795790a9786a2f225e51c3cc53d6a9a256f872472b  lsof_4.94.0.linux.tar.bz2
> +sha256  e9faa0fbcc48638c1d1f143e93573ac43b65e76646150f83e24bd8c18786303c  lsof_4.95.0.linux.tar.bz2
>   sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
> diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
> index feb6a744e..21a327b99 100644
> --- a/package/lsof/lsof.mk
> +++ b/package/lsof/lsof.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LSOF_VERSION = 4.94.0
> +LSOF_VERSION = 4.95.0
>   LSOF_SOURCE = lsof_$(LSOF_VERSION).linux.tar.bz2
>   LSOF_SITE = https://github.com/lsof-org/lsof/releases/download/$(LSOF_VERSION)
>   LSOF_LICENSE = lsof license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
