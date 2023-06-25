Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EAAEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C84160F25;
	Sun, 25 Jun 2023 19:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C84160F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZKarZbNAGYKJ; Sun, 25 Jun 2023 19:19:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF6CF60672;
	Sun, 25 Jun 2023 19:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF6CF60672
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F374C1BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCDC660672
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCDC660672
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wnl_FOOcBpY for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:19:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBA306066D
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBA306066D
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:19:18 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-987341238aeso302579066b.3
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687720757; x=1690312757;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QjsPOUBEw5IcvhjOST7imqncqgAOeUzhZmULireZZ2o=;
 b=OlBBK4WoXlbJDZwGdj8roz405NF4bCQfcHU8QiW59RLMBblDhPYW0scup/utnnvgSo
 bdLvYhIHmVqWhaVYADstUFht5s9NyTcc0OeyTNOsC58irmMjaToFZfuQdQg2Z4+5MSCi
 EcMrngZF6qVoGItghM1qNqlfD0e2c+vkJPB10bzivO0JCGwHZh0Yo0QDOKf3e/PlvX49
 FkJxg5oOUGUMeo0pPrrt/iUJdl71n3cTPVpAp9iPXKuwPM0d2D6LRkrhLsiBaXOOY4I8
 7VFZ88AbNii6fMegB0od0PevXsBBnr0Slit4ZwZE45XdN3yfLYqoEVM9fn9L11l6VKN+
 E0tA==
X-Gm-Message-State: AC+VfDxngUphsWxvLkw8IFmPPEoJCyKC9UOY7t7uttEMzIbM0MbSJdAF
 PN5zKthKbjQeqky3wmGULkmm8eHt0mclfwzFKYw=
X-Google-Smtp-Source: ACHHUZ6VbYHOWoWzMzDtg3Qlo9UQ4tTJMP4GV2Y2DwQPKdghGBBRDbW6goWgHODdQ8F14U6pIqTlnA==
X-Received: by 2002:a17:907:7b96:b0:973:9f60:c57e with SMTP id
 ne22-20020a1709077b9600b009739f60c57emr27153875ejc.2.1687720756814; 
 Sun, 25 Jun 2023 12:19:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a170906055500b009890e402a6bsm2338518eja.221.2023.06.25.12.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:19:16 -0700 (PDT)
Message-ID: <398d6d59-854d-e413-5007-4afb4942a7a4@mind.be>
Date: Sun, 25 Jun 2023 21:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230622051703.2543-1-bernd@kuhls.net>
 <20230622051703.2543-2-bernd@kuhls.net>
In-Reply-To: <20230622051703.2543-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687720757; x=1690312757;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QjsPOUBEw5IcvhjOST7imqncqgAOeUzhZmULireZZ2o=;
 b=Tphp+BHQd6X3W2taQuSa92pw9+q0NIo48MA4IWwMU0rKHbe98eqt2PU0GDWR0BVUwP
 Rjm1a7hDmAltH/LhZ1/j8NcK8ml8zXJYs+diu1y0K8HiocyUqusOqwSOaTR2zBKBZQnh
 HG6z8rKlo3ocZj/zHKMydYNCjZSFvZxWqG9Sjf2bIqWNbQ2ZwhmCYIVHibBrVQami5O4
 JH6aaZMFWmmZgU96HTJBSZKJfPA2Ob0OZyRFn1hzZb7cwC4CtJuTAu0D9Ol35uE1QLbq
 uPyrSSa6Jo9p1k4CswMSSKZ4JSrCX9JidwVKh1vsbn1zfJM+Y6wUTrBimtxLUFMDgOgF
 oIZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Tphp+BHQ
Subject: Re: [Buildroot] [PATCH v2 2/2] package/raptor: fix build with newer
 versions of libxml2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/06/2023 07:17, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/6a5/6a5139fe86b8370477dc6cb044bf29180bd145df/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v2: no changes
> 
>   ...s-to-entities-checked-private-symbol.patch | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch
> 
> diff --git a/package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch b/package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch
> new file mode 100644
> index 0000000000..cd9542a9a9
> --- /dev/null
> +++ b/package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch
> @@ -0,0 +1,35 @@
> +From 4dbc4c1da2a033c497d84a1291c46f416a9cac51 Mon Sep 17 00:00:00 2001
> +From: David Anes <david.anes@suse.com>
> +Date: Thu, 4 May 2023 11:54:02 +0200
> +Subject: [PATCH] Remove the access to entities 'checked' private symbol for
> + libxml2 2.11.0
> +
> +Since version 2.11.0, some private symbols that were never intended
> +as public API/ABI have been removed from libxml2, therefore the field
> +'checked' is no longer present and raptor fails to build in this
> +scenario.
> +
> +Upstream: https://github.com/dajobe/raptor/commit/4dbc4c1da2a033c497d84a1291c46f416a9cac51
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + src/raptor_libxml.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/raptor_libxml.c b/src/raptor_libxml.c
> +index 538c2c8e..8bcee139 100644
> +--- a/src/raptor_libxml.c
> ++++ b/src/raptor_libxml.c
> +@@ -246,10 +246,11 @@ raptor_libxml_getEntity(void* user_data, const xmlChar *name)
> +
> +     ret->owner = 1;
> +
> +-#if LIBXML_VERSION >= 20627
> ++#if LIBXML_VERSION >= 20627 && LIBXML_VERSION < 21100
> +     /* Checked field was released in 2.6.27 on 2006-10-25
> +      * http://git.gnome.org/browse/libxml2/commit/?id=a37a6ad91a61d168ecc4b29263def3363fff4da6
> +      *
> ++     * and was later removed in version 2.11.0
> +      */
> +
> +     /* Mark this entity as having been checked - never do this again */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
