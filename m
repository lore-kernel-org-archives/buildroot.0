Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169C1C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:19:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C687960EBC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C687960EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A128C605FB;
	Wed,  4 Aug 2021 21:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbBkocKw_8kP; Wed,  4 Aug 2021 21:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7866608AE;
	Wed,  4 Aug 2021 21:19:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E1AD1BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BB8960606
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vMPJBTEozgPI for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:19:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43883605FB
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:19:08 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id x11so5774193ejj.8
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 14:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RW0yB21mT3r1x0+O3kKAK3QvTFHT5GwlUhIRmhZ1NiU=;
 b=KDdAmMinKDllrLSeZ8yjhqbMKZaw4Ol8wOhGhg0KhygZBETgCJ3VgvkNDKkGy4W3fZ
 9GH8VBeo93jGgFF7CA+OeB9I+IMhaztg81Fcfi4tyCGeZaOUF1epzjTufTOIBXt07f8C
 3nSSmQbDXo25pzPcJSe2HbbFSf3pFlZ5yU+zAFpRYjlwWEfC9tSNjiMpIdgJCJ+aYGCg
 L/HjDiMPjb0C3uCfs1RHJoeGlVQrBjjCsNDkeHdx3zCjBMk/I0eCoSBfuDWtDVImJrh9
 MU+rKtQa2ld4jwD0NN5xDT+wm5zmnpRPVAEhlPs7nCkRmb7xlS9i6QCPjmvurRNj7ane
 Uelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RW0yB21mT3r1x0+O3kKAK3QvTFHT5GwlUhIRmhZ1NiU=;
 b=o8FmazaXJtEEprS+meiFKbO9rKGBtvJ4c5210c/tUG6odua3RL8ig1f81OadR/QmHB
 EI+UpiiI7TP0lUnUove2c3rBB9RuHzTqhMD1WkDWzo8BQi/tVJfMIBxSJcdGlzKnBlxH
 3iTlwy7kNDJVsE4nojg9wYnqF8k+8gm5SYIEq/4AqNGMUY6DnKldJEUhENY+J15nhThj
 vd8gdcRHmmIc9xSD89dgnx53EF7JSLRd4UlbEadhXNfgIOYl68HDkSRdVX6oh3qQOduD
 JIMkaKysUX4PnLfIgjsx68tfoIfNcFba8Xpr1VNyEkdoiIXdf1WIxTocpNWBWkgzicd1
 zJbA==
X-Gm-Message-State: AOAM532OO0WhzGLjRww2pt3hj3LMnT/jYjeaZ/NVpxt8ZTdMXaAtVfii
 TldOeoc38ENFdrPCPhlQ+ZduCA==
X-Google-Smtp-Source: ABdhPJxEaiJ0lOTxvC1tV1F+5z/Hu2aCe0biQW6mi9tZLmVpdRMJQK3G7UCbENSqzAvlsyoJX3goyg==
X-Received: by 2002:a17:906:2d51:: with SMTP id
 e17mr1109196eji.500.1628111946526; 
 Wed, 04 Aug 2021 14:19:06 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id s3sm1009690ejm.49.2021.08.04.14.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 14:19:06 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210804094505.930847-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <f852af76-a358-59c1-3967-1faad23ab384@mind.be>
Date: Wed, 4 Aug 2021 23:19:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804094505.930847-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/libuwsc: fix build with gcc 11
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 04/08/2021 11:45, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 11:
> 
> /tmp/instance-1/output-1/build/libuwsc-3.3.5/src/lua/uwsc_lua.c: In function 'uwsc_lua_on':
> /tmp/instance-1/output-1/build/libuwsc-3.3.5/src/lua/uwsc_lua.c:177:5: error: this 'else' clause does not guard... [-Werror=misleading-indentation]
>   177 |     else
>       |     ^~~~
> /tmp/instance-1/output-1/build/libuwsc-3.3.5/src/lua/uwsc_lua.c:180:9: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'else'
>   180 |         return 0;
>       |         ^~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1b031667e6d184493ea55ea6630272af4e475375
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  .../libuwsc/0002-fix-bad-indentation.patch    | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/libuwsc/0002-fix-bad-indentation.patch
> 
> diff --git a/package/libuwsc/0002-fix-bad-indentation.patch b/package/libuwsc/0002-fix-bad-indentation.patch
> new file mode 100644
> index 0000000000..f33f944d06
> --- /dev/null
> +++ b/package/libuwsc/0002-fix-bad-indentation.patch
> @@ -0,0 +1,27 @@
> +From 8cb416140741a596235b8acc46b2b119b13ebfab Mon Sep 17 00:00:00 2001
> +From: Rosen Penev <rosenp@gmail.com>
> +Date: Tue, 6 Jul 2021 21:01:52 -0700
> +Subject: [PATCH] fix bad indentation
> +
> +Fixes error with GCC11.
> +
> +[Retrieved from:
> +https://github.com/zhaojh329/libuwsc/commit/8cb416140741a596235b8acc46b2b119b13ebfab]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/lua/uwsc_lua.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/lua/uwsc_lua.c b/src/lua/uwsc_lua.c
> +index de6932e..84689fe 100644
> +--- a/src/lua/uwsc_lua.c
> ++++ b/src/lua/uwsc_lua.c
> +@@ -178,7 +178,7 @@ static int uwsc_lua_on(lua_State *L)
> +     else
> +         luaL_argcheck(L, false, 2, "available event name: open message error close");
> + 
> +-	return 0;
> ++    return 0;
> + }
> + 
> + static int __uwsc_lua_send(lua_State *L, int op)
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
