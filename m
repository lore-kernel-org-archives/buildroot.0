Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9A8D6ACDD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11060611B6;
	Thu, 18 Dec 2025 16:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQVywBtFcJ9I; Thu, 18 Dec 2025 16:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DFD2611C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075867;
	bh=yWjb4nuCtFiWn/1MLB01EW6pDyasjj/GACjs2+Ihn64=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RzQb/qGHBQ3l94My5bWuVsZEqCJCygCmPLtnk+oJOAZWImRfjvwB29ea+AUp8aHcJ
	 J09kxL+k1djq7dm+Ujk57zlV5ZKCfu5JNponwxoEeO9VC+g6cBjq7GeYlIxZ365ojh
	 WRUW20sqdVV0lFy9m+LPevei2Lx0bGkOO+GluKBwe6m95iMtdL9dhpI5gwSMb8qTYL
	 mTUb3/CMLVrbFu2aOaPL2nEnMeR5xV8toP0r8O5KbbR0d9/a4Ox3qAz+RZkSdUgkrs
	 TpIMj+jN7gvjIOtLbH266pzcXdhSU5MmrobbePH4Vk13PJMsqz8HTSRThv6UvMZlRD
	 tHEAa1EwxwVvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DFD2611C5;
	Thu, 18 Dec 2025 16:37:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D89991A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAA38611C5
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0Cthc6UXtom for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B112C611B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B112C611B6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B112C611B6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 62031B97A297; Thu, 18 Dec 2025 17:37:42 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:40 +0100
Message-ID: <20251218163740.379610-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251018171916.1369130-1-bernd@kuhls.net>
References: <20251018171916.1369130-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075862; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=LrUpVuhF2A+LE/GF+uBu9sm8F9Ud6m6wU1kFKmKAg88=;
 b=eDhvwProldiA7S642nwL7nGHvuT8cLhZBgEf6ZZT82W573dJdZGr/zhcKCs/ZnconnczeI
 yaSjbfwyojNOKp2Y/6ukMLLwGTGR8AnBti0sxrfBb5OYvonUh/EahTxv0DMutdoOP0gP7Y
 eATki7mjG+Qc2vhhxuLAxcFahahBFkDB7ayOiA+o2wqxpEpme4xaTXwWjFWsCnV++UW9R0
 wZpvHrfrJSORvfmbcJ4HnncVi7kNfjHRmU5O4yMb1E661Bw6XrQJkakxML8r8etTI1Z6K0
 uxr6iBFtoMj7CB4c/rCX4F4jQOoEgvum0LE4HvjQKMFWjOi7lYFJdFBwW5fGTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=eDhvwPro
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.31.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes build error with libcurl 8.16.0 introduced by buildroot commit
> fb5fb06ee5a886df5036c5c5e6c4536f2bc8e1c1
> 
> Fixes:
> https://autobuild.buildroot.net/results/92b/92b1ed36e750d9ad756793814f9d1133bda0e013/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index 6101fe16f0..cbca2fc355 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,5 +1,5 @@
> -# From https://cmake.org/files/v3.31/cmake-3.31.8-SHA-256.txt
> -sha256  e3cde3ca83dc2d3212105326b8f1b565116be808394384007e7ef1c253af6caa  cmake-3.31.8.tar.gz
> +# From https://cmake.org/files/v3.31/cmake-3.31.9-SHA-256.txt
> +sha256  5d4fdec04247ca8a8e8f63692f0d0f1e9d6d082a2bdd008dff8ab3ba7215aa83  cmake-3.31.9.tar.gz
>  
>  # Locally calculated
>  sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 1eb4da90ad..8f3a54be5a 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
>  CMAKE_VERSION_MAJOR = 3.31
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).8
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3-Clause
>  CMAKE_LICENSE_FILES = Copyright.txt
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
