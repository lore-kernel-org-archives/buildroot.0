Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8BCEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A83461289;
	Sun, 25 Jun 2023 19:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A83461289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjfk5PeqRF9Q; Sun, 25 Jun 2023 19:24:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E43A60F20;
	Sun, 25 Jun 2023 19:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E43A60F20
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D59F21BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEF4E81A12
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEF4E81A12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xIohUXYz6MQQ for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:24:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAA2F81766
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAA2F81766
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:24:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-98e1ccc6673so169141166b.3
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687721055; x=1690313055;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d1wCwajJUT+0cNFLQQ7RqCpXMclXb+pcv3S423JLsGQ=;
 b=H3gd7Pi/kQG7q10/MFvtxsU34IOYw5KEBdwIIlqD9GtnFzghDC5XekxdNbDN2/Zv7q
 UqpddAT2ZyYeeLaU/47yITk9LPZlaLO+Wu+DykR7ZkabszETC5+TZYT+2uPPG7HuuLHb
 gjcdigpYYMkdqUeW6UBxask1CtIe9IieS3cVBFXOFtl/SqatW+SwyENjC15J3ncFUxb9
 GsEJEq7BZM1pWgSw/Vk4B3El/f1YGkZjMtbSxjYZIHjI3NBGteyysB8dxtD+NPaG9Ako
 jfxxPjVxjDfdMjZgZBNqHP4ZmDCZMHAme5Qy3EthaDj4GCwr81xkmC/BQf5kplbrFtqA
 p8oQ==
X-Gm-Message-State: AC+VfDzyhaDKGl04qnXEKABCQOXD2iXP4oQHs05S/Md5wozgdjKLQsi5
 Z+sOmbZdKibLk4Sce9iNGL947dkS7IE/0ELwVrE=
X-Google-Smtp-Source: ACHHUZ61fwiNWfCHaK8xOD/jg+zkwPLKuvSsjDZaBrAAE15LiJv+u/tbcGo/Mn0311lgo6kZXIPEtQ==
X-Received: by 2002:a17:907:7294:b0:988:d841:7f7f with SMTP id
 dt20-20020a170907729400b00988d8417f7fmr16625722ejc.63.1687721054923; 
 Sun, 25 Jun 2023 12:24:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 ss26-20020a170907039a00b0098e422d6758sm1019184ejb.219.2023.06.25.12.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:24:14 -0700 (PDT)
Message-ID: <49628125-1be6-98a0-1886-1fe33605bb5b@mind.be>
Date: Sun, 25 Jun 2023 21:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230625144417.293506-1-bernd@kuhls.net>
In-Reply-To: <20230625144417.293506-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687721055; x=1690313055;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d1wCwajJUT+0cNFLQQ7RqCpXMclXb+pcv3S423JLsGQ=;
 b=PR1ymTkCHbDH3JCTF0gZWTggyhsuMTl03M6VxeCLW4RLSC7t6z/9++QqSjjC6627+T
 mh7Y17LGpynpgugJsU3FIYWfdq0/gheGOi5UNSycT3pvZZLiCYOMd10PFIdWkrT59/mb
 x6vpTurtczfVx7Mw91SQ06xMzaEah5Bv6lohEzCArb47SbEk6dLnYsAUIULUfUCcRMfA
 MFf+pIk2hc+zOyOw/KDJ3B6XZdLXUlgKGiDKk5UbvO6NKd1WMa3VO1T0SbYBUSW00mG3
 n1OF8oAdx6GKPKIywVo0Cqfvy3DPTmZA04cR3TvhanPoivhKa/+GPzaXbW+Smvf3x3k7
 0xsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PR1ymTkC
Subject: Re: [Buildroot] [PATCH 1/2] package/audit: fix musl build
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



On 25/06/2023 16:44, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/a52/a52ff08c3373ffb253b89e9197671583354d1360/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   ...ute_malloc__-with-__attribute__-__ma.patch | 39 +++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
> 
> diff --git a/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch b/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
> new file mode 100644
> index 0000000000..1a276ca2df
> --- /dev/null
> +++ b/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
> @@ -0,0 +1,39 @@
> +From 79c8d6a2755c9dfa00a5e86378e89a94eef0504d Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 9 Aug 2022 23:57:03 -0700
> +Subject: [PATCH] Replace __attribute_malloc__ with
> + __attribute__((__malloc__))
> +
> +__attribute_malloc__ is not available on musl
> +
> +Fixes
> +| ../../git/auparse/auparse.h:54:2: error: expected function body after function declarator
> +|         __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
> +|         ^
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream: https://github.com/linux-audit/audit-userspace/pull/311
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied both to master, thanks.

  Regards,
  Arnout

> +---
> +
> + auparse/auparse.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/auparse/auparse.h b/auparse/auparse.h
> +index 95cf256d..c7dbe5ff 100644
> +--- a/auparse/auparse.h
> ++++ b/auparse/auparse.h
> +@@ -51,7 +51,7 @@ typedef void (*auparse_callback_ptr)(auparse_state_t *au,
> + void auparse_destroy(auparse_state_t *au);
> + void auparse_destroy_ext(auparse_state_t *au, auparse_destroy_what_t what);
> + auparse_state_t *auparse_init(ausource_t source, const void *b)
> +-	__attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
> ++	__attribute__((__malloc__)) __attr_dealloc (auparse_destroy, 1);
> + int auparse_new_buffer(auparse_state_t *au, const char *data, size_t data_len)
> + 	__attr_access ((__read_only__, 2, 3));
> + int auparse_feed(auparse_state_t *au, const char *data, size_t data_len)
> +--
> +2.37.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
