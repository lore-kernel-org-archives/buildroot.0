Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADDCC4320E
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 13:50:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05B5160EE5
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 13:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05B5160EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0D00606A7;
	Sat, 28 Aug 2021 13:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UT-7B1e6yM5h; Sat, 28 Aug 2021 13:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5012F61510;
	Sat, 28 Aug 2021 13:50:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0266C1BF30D
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 13:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E67CA8379C
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 13:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VC_LWVmCUykY for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 13:50:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D01DA83EE9
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 13:50:08 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id n5so14895978wro.12
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 06:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qN/hygbDgO/h894fvzBqpHb9seFR5pA/nARssk71yAo=;
 b=CJmcNFpE+1+wCfA1LK5ADNcpcGUk0f3ojScmWTDNGPWVft+K5K4RQscJZIwroFHmc0
 ObXuAPpFkkV4QGWzZzV43cxnMyrC7a6DL+TxSc5w/SQ2Ljz7b/UkOtREorJKKCTj40NJ
 K2/TNKD5KhfwkW1QqA4iJkGrC7scyUzohAW7mMWLAkJqMd9ybd3groBB0B0drhBxVGWh
 99vNdFjJ6rSO+xOB53Ifc611WEgcKVCtMlXiIRhJ8Kt6+WDkMpo8BRnkyEUW5vWDb0vl
 EfN0ZnMU1OWB7WVcVPeJxbukYqsOfXMMT2vIJeG7R0x6j9mwSL0/6jxHaCnfOroYwFZj
 EbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qN/hygbDgO/h894fvzBqpHb9seFR5pA/nARssk71yAo=;
 b=Y4pYJdGMx5jobhzt8faZW4dkC+a2+5qADjOlnARHjj1zZ+8ooJktZia1ZK1Xs+6cPT
 hSG//F8ytY5j5nzh2pdX+8la0OndijBNp3NKbJ3n/1duOXgqpy47ktFrWvZ3PzG6Kcac
 NLQ3FmcU8habHBrpJfYWjg7huQUhtuRuNGCe9pbjXM4/gcWUGSYprGkfylXU/gmzBwIb
 K4+xThgb+Eg1+OKQfFSqH6l3ZAx33CxTw1KqGpeTi3vsSPVWVSjUpqEb59NibMxAkj/r
 cAW6WrBxaqq8+Y3viiHncA7WYhKF87xzT2Qx0YmMN2Y7q+WZ2sLyRBtsCPgmDCaIftWA
 solg==
X-Gm-Message-State: AOAM532egn+JBpUFkDG4aM1V1+f5SFd0azkR+ECS6OzAdUxsQWrro3yZ
 BosDYJJlC/jefn/uE2TQqBHpJazh/v23fA==
X-Google-Smtp-Source: ABdhPJxyTtXR2eGLi+mfDeVDV1jn6mfQHtdWEItADxVOJSjOZWevdJbas+W0iQ5qxPlbtfZ6ilxgVQ==
X-Received: by 2002:adf:c148:: with SMTP id w8mr8658273wre.317.1630158606992; 
 Sat, 28 Aug 2021 06:50:06 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id z19sm9707208wrg.28.2021.08.28.06.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 06:50:06 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210828071352.359497-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <ba48fd48-031d-a85d-c021-4aeb4f41aad6@mind.be>
Date: Sat, 28 Aug 2021 15:50:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210828071352.359497-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/ushare: fix NLS build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 28/08/2021 09:13, Fabrice Fontaine wrote:
> Commit c4e1a075101914f8e0d47f8bb9c06bea13ba0fd2 forgot to add
> --enable-nls to patch resulting in the following build failure:
> 
> Unknown option "--enable-nls".
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6ab2555b419355f01310f230fe612f2a3699bbfd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Has the patch been updated upstream?

 Regards,
 Arnout

> ---
>  ...-t-build-po-files-if-NLS-is-disabled.patch | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
> index f0fa89998f..3fbda2838e 100644
> --- a/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
> +++ b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
> @@ -1,4 +1,4 @@
> -From 977171781f5d49e61b46c0241fb67cbb7d666498 Mon Sep 17 00:00:00 2001
> +From c9f5783bb2df4a19c6281daeda30e8ab905d2ca3 Mon Sep 17 00:00:00 2001
>  From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  Date: Sun, 22 Aug 2021 10:44:48 +0200
>  Subject: [PATCH] Don't build po files if NLS is disabled
> @@ -7,8 +7,8 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  [Upstream status: https://github.com/ddugovic/uShare/pull/12]
>  ---
>   Makefile  | 7 +++++--
> - configure | 1 +
> - 2 files changed, 6 insertions(+), 2 deletions(-)
> + configure | 3 +++
> + 2 files changed, 8 insertions(+), 2 deletions(-)
>  
>  diff --git a/Makefile b/Makefile
>  index ebd8f91..6686cfd 100644
> @@ -31,10 +31,19 @@ index ebd8f91..6686cfd 100644
>   	for subdir in $(SUBDIRS); do \
>   	  $(MAKE) -C $$subdir $@; \
>  diff --git a/configure b/configure
> -index 4a3efe0..162a776 100755
> +index 4a3efe0..f48806a 100755
>  --- a/configure
>  +++ b/configure
> -@@ -723,6 +723,7 @@ append_config "LDFLAGS=$LDFLAGS"
> +@@ -414,6 +414,8 @@ for opt do
> +   ;;
> +   --with-libdlna-dir=*) libdlnadir="$optval";
> +   ;;
> ++  --enable-nls) nls="yes"
> ++  ;;
> +   --disable-nls) nls="no"
> +   ;;
> +   --enable-dlna) dlna="yes"
> +@@ -723,6 +725,7 @@ append_config "LDFLAGS=$LDFLAGS"
>   append_config "INSTALL=$INSTALL"
>   
>   append_config "DEBUG=$debug"
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
