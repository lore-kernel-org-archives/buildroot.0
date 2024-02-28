Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337F6C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 19:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE14782410;
	Wed, 28 Feb 2024 19:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YGoYdRI2Ad7c; Wed, 28 Feb 2024 19:57:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8A3182416
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8A3182416;
	Wed, 28 Feb 2024 19:57:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 029F61BF4D5
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 19:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F177A60A48
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 19:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Foaw6tnco-_2 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 19:57:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B3CCF60A3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3CCF60A3E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3CCF60A3E
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 19:57:35 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4EFF52C80248;
 Wed, 28 Feb 2024 20:57:33 +0100 (CET)
Message-ID: <2637d00b-2a67-4e72-9db6-d7ecd1631b79@bubu1.eu>
Date: Wed, 28 Feb 2024 20:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240224121007.435474-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20240224121007.435474-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1709150253; bh=PkvLyhg7bhN4pQOG4Tnpd3wb7RadS5ObspJKJqyCZsI=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=ZLrhiv0wEDGpQbpWeVB/m133ufISJ53aJjrQsOZHaNfWbQVm/yyW9XABzSd7fJnbW
 fZPTHu1PhDdogawHkPTc0BEhNsGIMfMooqV8DlCLtM4E3BYOyXkRl64XMuoGLBSMe4
 gWbpFjdRzeDIQF3ncbTKmytZHrTxKaxcwDkL7BNkojjdrupYyKMMUsyXs79xUKfyWq
 u+Zpa1ccoWTm5jAIpmWBNqHbCcefk9JppTsx0YCvRnThJSB2o46kRVOP+vcYFVsgpR
 Dk78Ao4JhIEJChYJv4uwoAXv7CppMb/P3qtlS6ZYv7KuzMGufd58RTBs2/Gp84rzZI
 Tj4Gv6DewkuSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ZLrhiv0w
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 24.02.24 13:10, Bernd Kuhls wrote:
> Removed patch which is included in this release.
> 
> Updated license hash due to various version and copyright year bumps:
> https://github.com/ccache/ccache/commits/master/LICENSE.adoc
> 
> Release notes: https://ccache.dev/releasenotes.html#_ccache_4_9_1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Tested-by: Marcus Hoffman <buildroot@bubu1.eu>

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
