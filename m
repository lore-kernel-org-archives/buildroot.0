Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43CCE77180
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 18:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B47606C7;
	Sat, 14 Dec 2024 18:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55Xd8ztFfUty; Sat, 14 Dec 2024 18:50:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F16A606FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F16A606FA;
	Sat, 14 Dec 2024 18:50:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 626F9C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 18:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FD47400F6
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 18:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aD3LSSGJ6oef for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 18:50:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8CFCA40042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CFCA40042
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CFCA40042
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 18:50:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 36DE1780372;
 Sat, 14 Dec 2024 19:50:24 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42442])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Dec 2024 19:50:24 +0100
MIME-Version: 1.0
Date: Sat, 14 Dec 2024 19:50:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241214161137.3283154-1-bernd@kuhls.net>
References: <20241214161137.3283154-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <5644605f34c6a8627008f1ccb2301419@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734202226;
 bh=B5lLXj9eYGaBKxElKNbOfI5fAEf+RB5t2PyCWLrGLgM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h44JNyBUexbDr4SdWCSw+W/GczvGTIfjiGZDOKpS5xHuPNLH+dOYFRiCV4BU4zmyY
 bDxCw3AJaPbgqFnWM4VmpVFDR9rwru60yoA9Q5e+ODCNhcCsovW5GnU3wmD8C+xYLO
 1VVxv6pGa/qthpCYUj5AApoZBcIOw04PVRJkwwgOwG17cXhIkWTCbJCKdqXKFfjrah
 9WE5u9FOwJRsDGKovx0YIFXmRQTZeeJd3PxOd/Fks6rOfx9iJpeKWAvpsXHZK68LWs
 8k9ugQmOAPyP5ioDNO+sN9uaUhUMNuO/gX/V13v/ex++0QRWlrAr2KF6tvYzlgdP3l
 B4QSZ4BNI9Kzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=h44JNyBU
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.31.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/12/2024 17:11, Bernd Kuhls wrote:
> Release notes:
> https://www.kitware.com/cmake-3-31-2-available-for-download/
> 
> Rebased patch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  package/cmake/0001-rename-cmake-rootfile.patch | 4 ++--
>  package/cmake/cmake.hash                       | 4 ++--
>  package/cmake/cmake.mk                         | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/cmake/0001-rename-cmake-rootfile.patch 
> b/package/cmake/0001-rename-cmake-rootfile.patch
> index 7e6e0a8cf7..c73e0dfe02 100644
> --- a/package/cmake/0001-rename-cmake-rootfile.patch
> +++ b/package/cmake/0001-rename-cmake-rootfile.patch
> @@ -12,7 +12,7 @@ This buildroot-specific patch makes sure ctest looks 
> also for
> 
>  [Vincent: tweak patch for 3.6.3]
>  [James: tweak patch for 3.15.4]
> -[Bernd: tweak patch for 3.27.0]
> +[Bernd: tweak patch for 3.27.0 & 3.31.2]
> 
>  Signed-off-by: Davide Viti <zinosat@tiscali.it>
>  Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> @@ -26,7 +26,7 @@ diff --git a/Source/cmake.cxx b/Source/cmake.cxx
>  index 3772f09985..c317e4af38 100644
>  --- a/Source/cmake.cxx
>  +++ b/Source/cmake.cxx
> -@@ -1891,7 +1891,12 @@ int cmake::AddCMakePaths()
> +@@ -1896,7 +1896,12 @@ int cmake::AddCMakePaths()
>                         cmStateEnums::INTERNAL);
>   #endif
>     if (!cmSystemTools::FileExists(
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index f214c21925..89c2662091 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,5 +1,5 @@
> -# From https://cmake.org/files/v3.31/cmake-3.31.1-SHA-256.txt
> -sha256  
> c4fc2a9bd0cd5f899ccb2fb81ec422e175090bc0de5d90e906dd453b53065719  
> cmake-3.31.1.tar.gz
> +# From https://cmake.org/files/v3.31/cmake-3.31.2-SHA-256.txt
> +sha256  
> 42abb3f48f37dbd739cdfeb19d3712db0c5935ed5c2aef6c340f9ae9114238a2  
> cmake-3.31.2.tar.gz
> 
>  # Locally calculated
>  sha256  
> 0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  
> Copyright.txt
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 7fc1f0181d..1032ec6e39 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -6,7 +6,7 @@
> 
>  # When updating the version, please also update 
> BR2_HOST_CMAKE_AT_LEAST_X_Y
>  CMAKE_VERSION_MAJOR = 3.31
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3-Clause
>  CMAKE_LICENSE_FILES = Copyright.txt
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
