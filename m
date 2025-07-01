Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9232BC8302F
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 06:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 388A860B53;
	Tue,  1 Jul 2025 06:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEaJQP6RpaAt; Tue,  1 Jul 2025 06:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FE1960B9D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FE1960B9D;
	Tue,  1 Jul 2025 06:56:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99202DF
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 06:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A49E407F6
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 06:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1X9pUY03UAL for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 06:56:47 +0000 (UTC)
X-Greylist: delayed 334 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 01 Jul 2025 06:56:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DDCD403C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DDCD403C2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DDCD403C2
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 06:56:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7F554B970068; Tue,  1 Jul 2025 08:56:42 +0200 (CEST)
Message-ID: <bbad38d8-426a-4e69-b57f-c3641f4f6c5f@rnout.be>
Date: Tue, 1 Jul 2025 08:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20250629092123.608605-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250629092123.608605-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 2025.02.x]
 support/dependencies/check-host-cmake.mk: set host-cmake max version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/06/2025 11:21, Thomas Perale via buildroot wrote:
> Since the introduction of CMake 4 in several distributions, build errors
> started occurring on those distributions for cmake packages that
> included calls to cmake_minimum_required() or cmake_policy() with a
> version older than 3.50 (see [1]).
> 
> To avoid backporting numerous individual fixes for affected packages,
> commit [2] was previously applied to the LTS branch as a workaround.
> 
> Following further discussion (see [2][3]), that raised concerns about
> policy changes between CMake versions that could lead to breaking builds
> in non-obvious ways, a different approach was chosen.
> 
> This patch reverts commit [2] and instead of applying a global
> compatibility variable, we now enforce building host-cmake when the host
> system provides CMake 4 or newer.
> 
> [1] https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features
> [2] 70aac2d9e8 package/pkg-cmake.mk: force config version >=3.5
> [3] https://lists.buildroot.org/pipermail/buildroot/2025-May/780262.html
> [4] https://lists.buildroot.org/pipermail/buildroot/2025-June/780372.html
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
> Hi list,
> 
> Since this patch is targetted at the 2025.02.x branch I didn't modify
> the infra to support passing 'max' version over 'check-host-*.sh'
> scripts.
> If this is something that is valuable for the master branch as well I
> can send a v2 of this series.
> 
> Thomas
> ---
>   package/pkg-cmake.mk                     |  4 ----
>   support/dependencies/check-host-cmake.mk | 10 +++++++++-
>   2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 08fe7c431e..ba287d244a 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -53,10 +53,6 @@ define inner-cmake-package
>   
>   $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
>   
> -# Some packages requires CMake 3.0.0 but latest CMake requires >=3.5
> -# Set the policy version minimum to force these packages to 3.5 or greater.
> -$(2)_CONF_OPTS += -DCMAKE_POLICY_VERSION_MINIMUM=3.5
> -
>   # The default backend, unless specified by the package
>   $(3)_CMAKE_BACKEND ?= make
>   
> diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> index e367690319..781c7a3631 100644
> --- a/support/dependencies/check-host-cmake.mk
> +++ b/support/dependencies/check-host-cmake.mk
> @@ -6,11 +6,19 @@
>   # cmake infra will catch it and build its own.
>   #
>   BR2_CMAKE_VERSION_MIN = $(BR2_HOST_CMAKE_AT_LEAST)
> +BR2_CMAKE_VERSION_MAX = 4.0
>   
>   BR2_CMAKE_CANDIDATES ?= cmake cmake3
>   BR2_CMAKE ?= $(call suitable-host-package,cmake,\
>   	$(BR2_CMAKE_VERSION_MIN) $(BR2_CMAKE_CANDIDATES))
> -ifeq ($(BR2_CMAKE),)
> +BR2_CMAKE_MAX ?= $(call suitable-host-package,cmake,\
> +	$(BR2_CMAKE_VERSION_MAX) $(BR2_CMAKE_CANDIDATES))
> +ifneq ($(BR2_CMAKE_MAX),)

  This looks super complicated... There is actually no reason to pass 
BR2_CMAKE_VERSION_MAX as a parameter to the shell script. We only do that for 
CMake because the minimum version depends on which packages you have selected 
(some packages require a higher minimum version). Look at other check-host-*, 
the required version is normally encoded in the shell script.

  Also look at commit f1ee7015a48e7820e74dc99c58708a732e14c0aa which introduced 
a maximum version for tar (later reverted to a higher _minimum_ version for tar).

  Regards,
  Arnout

> +# If BR2_CMAKE_MAX is non-empty, the host cmake version
> +# is >= BR2_CMAKE_VERSION_MAX.
> +BR2_CMAKE = $(HOST_DIR)/bin/cmake
> +BR2_CMAKE_HOST_DEPENDENCY = host-cmake
> +else ifeq ($(BR2_CMAKE),)
>   BR2_CMAKE = $(HOST_DIR)/bin/cmake
>   BR2_CMAKE_HOST_DEPENDENCY = host-cmake
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
