Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8FDCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E35605F4;
	Sun,  7 Apr 2024 14:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rz1Bf1fvrVRI; Sun,  7 Apr 2024 14:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58E64605D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58E64605D4;
	Sun,  7 Apr 2024 14:48:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48A801BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41059812C5
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTHB28gx7HvG for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:48:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BF5D80DA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BF5D80DA5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BF5D80DA5
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:48:42 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-416511f13aaso3144825e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712501321; x=1713106121;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gRgr3kaGNfJlVRTedvDcIQo/qsf0mDWp9gX/oUgbf8E=;
 b=YqHJNvnJpxIDqKg48nr93nC6dvpGVicM1MyDdan3FAOBK1VBWJN8z7RfGg9PjhLvBT
 9KvvVOnNkpMHsquJNs+e4JWbHTE9vg4zqkZHh+dti98T6bD9/i4GQ1TU5vvsbZkw2EbA
 j9z7iCaBI7RTZdxZ06sl42rW4u4acfuZXja9zHJ1zap2ydpx4I14bDAnr9HMN5RpH9Ys
 X7yntwyeM3OsenJ/vV4gS78reW+7MfO1TCG9lpQI/2P70FJbnfFdUJ0/BR+KKXlhANrS
 6gpvdL7ieOOkKhOWOy5ECox5c4KYO9PGXeGKlO6xNYABEUie0gs2RWgf7YSepghxS4ZE
 xtPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHMqJ6dDR0HxW3THcPpouysYeArsjEYKBA/mQguP8/mFsAtqcTG7jx+vDI9T54bmn+KC+h5UUUxrIimqu4HRKQP2+N+S2t2w==
X-Gm-Message-State: AOJu0YwUqexaRArpa12F+E18BDe6q8ckOOvmtlFH2Q/7IvgTcU4s2TJ8
 sFoTnZNkXWwSLI5eD7X0S3LBN1JjiLMDj+73Q3c997tfKiz8taY38Mz7UPC1hzg=
X-Google-Smtp-Source: AGHT+IGUx1VLVeGSeHmKrZFGwdXO84tBM2lubv++LxRQZQ6OP6yfVwdv5GbIdtqI+c85QMKxSM/VIg==
X-Received: by 2002:a05:600c:4714:b0:415:52e2:64b2 with SMTP id
 v20-20020a05600c471400b0041552e264b2mr4871149wmo.6.1712501320832; 
 Sun, 07 Apr 2024 07:48:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o32-20020a05600c512000b004163321790esm7318011wms.19.2024.04.07.07.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 07:48:40 -0700 (PDT)
Message-ID: <129e9e89-b2be-4fdf-8307-b6e9bf384cab@mind.be>
Date: Sun, 7 Apr 2024 16:48:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240224121007.435474-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240224121007.435474-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712501321; x=1713106121; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gRgr3kaGNfJlVRTedvDcIQo/qsf0mDWp9gX/oUgbf8E=;
 b=DeY1+XtTkPhYvxLfvG861zVxkwLRQO1W5Gvqt+VK87W6iYrvScWsHuRn2PAMxkFw3l
 H1obthjItlVMU7awwWr2ZvQB6H9lF+zEPeZrgv4xB/bH7Keyq/QPur9Au5aAVJLXI07g
 MXIAMeZd83eIzIL4vYXjjRDUd/zi3cmmsezQ7jJ+Q2oWPrvMvzP+Q4sD9Xyc12P/mPCa
 samC+LhVlO2eFuntAJsYjI9jXmTVWool95EQFI9VWbZBI5G1iIeElIRWvSn9pI+HP91v
 5b5lWWfJiTBimoa0kSBar76CgMLWJyUpkVu+9cuLF3HeN2rIPpS02152HDcbmVc4aPI8
 z1nQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DeY1+XtT
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.9.1
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



On 24/02/2024 13:10, Bernd Kuhls wrote:
> Removed patch which is included in this release.
> 
> Updated license hash due to various version and copyright year bumps:
> https://github.com/ccache/ccache/commits/master/LICENSE.adoc
> 
> Release notes: https://ccache.dev/releasenotes.html#_ccache_4_9_1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-fix-Work-around-GCC-12.3-bug-109241.patch | 29 -------------------
>   package/ccache/ccache.hash                    |  4 +--
>   package/ccache/ccache.mk                      |  2 +-
>   3 files changed, 3 insertions(+), 32 deletions(-)
>   delete mode 100644 package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch
> 
> diff --git a/package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch b/package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch
> deleted file mode 100644
> index 42872597cd..0000000000
> --- a/package/ccache/0001-fix-Work-around-GCC-12.3-bug-109241.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 689168c292f1ed26c5f4a3070aeb649dad7facb5 Mon Sep 17 00:00:00 2001
> -From: Joel Rosdahl <joel@rosdahl.net>
> -Date: Tue, 1 Aug 2023 12:30:12 +0200
> -Subject: [PATCH] fix: Work around GCC 12.3 bug 109241
> -
> -See also #1289.
> -
> -Upstream: https://github.com/ccache/ccache/commit/689168c292f1ed26c5f4a3070aeb649dad7facb5
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - src/storage/local/LocalStorage.cpp | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/storage/local/LocalStorage.cpp b/src/storage/local/LocalStorage.cpp
> -index 3e5abe5074..d0a904e553 100644
> ---- a/src/storage/local/LocalStorage.cpp
> -+++ b/src/storage/local/LocalStorage.cpp
> -@@ -854,7 +854,9 @@ LocalStorage::recompress(const std::optional<int8_t> level,
> -           auto l2_content_lock = get_level_2_content_lock(l1_index, l2_index);
> -           l2_content_lock.make_long_lived(lock_manager);
> -           if (!l2_content_lock.acquire()) {
> --            LOG("Failed to acquire content lock for {}/{}", l1_index, l2_index);
> -+            // LOG_RAW+fmt::format instead of LOG due to GCC 12.3 bug #109241
> -+            LOG_RAW(fmt::format(
> -+              "Failed to acquire content lock for {}/{}", l1_index, l2_index));
> -             return;
> -           }
> -
> diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
> index 736122e0ab..a2537077b6 100644
> --- a/package/ccache/ccache.hash
> +++ b/package/ccache/ccache.hash
> @@ -1,4 +1,4 @@
>   # sha256 computed locally
> -sha256  3d3fb3f888a5b16c4fa7ee5214cca76348afd6130e8443de5f6f2424f2076a49  ccache-4.8.2.tar.xz
> +sha256  4c03bc840699127d16c3f0e6112e3f40ce6a230d5873daa78c60a59c7ef59d25  ccache-4.9.1.tar.xz
>   sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
> -sha256  55ce274f2b898dad70d3695ab13f82656fd455bd8fb6d1c85d6f7c453bef0b2e  LICENSE.adoc
> +sha256  a6aea7358a30ded3f8abbff979219bdbe7b7a9aa489a8c70030afd96a83caf84  LICENSE.adoc
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index ac4bc4aba5..1ac825439b 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CCACHE_VERSION = 4.8.2
> +CCACHE_VERSION = 4.9.1
>   CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
>   CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
>   CCACHE_LICENSE = GPL-3.0+, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
