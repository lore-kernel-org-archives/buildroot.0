Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBA7C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:09:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6312660F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6312660F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FED81CFE;
	Tue,  3 Aug 2021 20:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9mdGHo1sklb; Tue,  3 Aug 2021 20:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21EFF81D3A;
	Tue,  3 Aug 2021 20:09:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A1281BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 064E581B72
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqeaXnkVTzK6 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:09:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75CF481A81
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 20:09:14 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x90so603004ede.8
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 13:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GagPPMLcY9kD737AvM0SgcQ/A9lF5L9/G5k2mXozXgo=;
 b=JXrAnT8UeQqnSkYRrDhaN1a3NqTwaFS4KP0s8G2uAB2+iAgx0vqALWHReMpEHl7ruq
 qKs2bi8MxyKpJ3dcKMfdH0ssW+9Bd0hMyJ2LJNpSOqalx4EfDQTqWI/+1gkLhTaoJ6qb
 1673M+hosOjFpmmyQtTWHNHW5BZXONML7isgGD4TdrzOJVZvdxJ0I8MErtOMHZIl8D65
 oBs6WmFzSVh7Lv4ESRNOPt5OyvoiXFwOmkJR9rFMWbCQNvlT7ywoTnUO7+3zeacXQP48
 T8uUd7pny5Ce31tNc7lVvK/Ijrqzooa3NKCB49Gq9Ca9OjUKlXX9quT9HOpWT1f0FNLL
 yo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GagPPMLcY9kD737AvM0SgcQ/A9lF5L9/G5k2mXozXgo=;
 b=S3WAtsOhEIpBK+RvtiMn8O491xk872k4QF+45egPfBjc10zqupZpXXiWx93mIliWPg
 n3Xp0jCwtk8yLPjMAToig5tNFxTISV1dJ4kcAFjQg7S8hE7HOHEGoowH7wve/8IRF1yJ
 cMu7MSZfaioXMhiKETmCNaK3Cy9LVO3wuRPgm5r5FL6eVBduChUMDOC/jVPDjO4S+uXA
 toct7JDbVhwjtCXE6vEezR9UVY9M2rh2sDDqDJiQ+Sc2QMW8lLi7HLhmyOBrjQCTDTwX
 9aix9pBwrv6Z0kBy6wBoKxuK7zWZ8ZezM820fPgMRxVC2UEGEx3wXF7McuVchhARZRt7
 Ixtw==
X-Gm-Message-State: AOAM532vx8QlahDXWOOvST5Jw5BKhRTH8EEdYBjSESs088V6o/NEAzUJ
 CUD7AQYGcKCKtoHMLJbvnqBNozom3Swi3PFHdXk=
X-Google-Smtp-Source: ABdhPJyY7DIOA1sa2leBvbv1JTic6ijtrYJRky5HhZtu38NK8sSZUQUpd+GyqjevKQ/SOIJr9R+5DQ==
X-Received: by 2002:aa7:d3ca:: with SMTP id o10mr27640072edr.383.1628021352567; 
 Tue, 03 Aug 2021 13:09:12 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id m3sm8646750edb.7.2021.08.03.13.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 13:09:12 -0700 (PDT)
To: Dominik Michael Rauh <dmrauh@posteo.de>, buildroot@buildroot.org
References: <20210528152936.368915-1-dmrauh@posteo.de>
 <20210802092426.1259479-1-dmrauh@posteo.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <5401c9d8-558d-b6d7-1c2c-55107f606ca6@mind.be>
Date: Tue, 3 Aug 2021 22:09:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802092426.1259479-1-dmrauh@posteo.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v4] package/libgdal: new package
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

 Hi Dominik,

 I still have a few comments. I could make the necessary changes myself, but I'm
feeling lazy today :-).

On 02/08/2021 11:24, Dominik Michael Rauh wrote:
> GDAL is a translator library for raster and vector geospatial data
> formats. As a library, it presents a single raster abstract data model
> and single vector abstract data model to the calling application for all
> supported formats. It also comes with a variety of useful command line
> utilities for data translation and processing.
> 
> https://gdal.org/
> 
> Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>

 It's really nice that you add this package, because when I added postgis
(contributed by Maxim) I didn't notice that it had on optional dependency on
GDAL, which wasn't added yet...

> ---
> Changes v3 -> v4 (after review by Thomas Petazzoni):
> -  Bump version from 3.3.0 to 3.3.1
> -  Configure libgdal to use external libraries where possible
> -  Explicitely disable libraries not yet handled by Buildroot
> 
> Changes v2 -> v3:
> -  Bump version from 3.2.2 to 3.3.0
> 
> Changes v1 -> v2 (after review by Peter Seiderer):
> -  Disable NEON and VSX support when using libgdal's libpng
> -  Disable compilation for toolchains with binutils bug 21464 or 27597
> -  Add the proper "depends" demanded by proj
> -  Fix the comment in Config.in
> -  Hopefully add the complete LIBGDAL_LICENSE information
> 
>  package/Config.in                             |   1 +
>  ...1-port-cpl_recode_iconv.cpp-use-cast.patch |  38 ++++++
>  package/libgdal/Config.in                     |  31 +++++
>  package/libgdal/libgdal.hash                  |   6 +
>  package/libgdal/libgdal.mk                    | 121 ++++++++++++++++++
>  5 files changed, 197 insertions(+)
>  create mode 100644 package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
>  create mode 100644 package/libgdal/Config.in
>  create mode 100644 package/libgdal/libgdal.hash
>  create mode 100644 package/libgdal/libgdal.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 046c04e994..dbbdc35390 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1929,6 +1929,7 @@ menu "Other"
>  	source "package/libevdev/Config.in"
>  	source "package/libevent/Config.in"
>  	source "package/libffi/Config.in"
> +	source "package/libgdal/Config.in"
>  	source "package/libgee/Config.in"
>  	source "package/libgeos/Config.in"
>  	source "package/libglib2/Config.in"
> diff --git a/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch b/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
> new file mode 100644
> index 0000000000..9fa958524f
> --- /dev/null
> +++ b/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
> @@ -0,0 +1,38 @@
> +From 0730ebc7a1e22a169bf3a1d873e130e079a68b3d Mon Sep 17 00:00:00 2001
> +From: Dominik Michael Rauh <dmrauh@posteo.de>
> +Date: Sat, 1 May 2021 20:11:30 +0200
> +Subject: [PATCH] port/cpl_recode_iconv.cpp: use cast
> +
> +Fixes error: invalid cast from type 'int' to type 'iconv_t' {aka 'long
> +int'}
> +
> +Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>

 Please add a line here with the upstream status. The intention is that you
contribute the patch to the upstream project, so it can be removed again after
updating to a future release.

 If for any reason the patch is not applicable to the upstream project, please
indicate why not

> +---
> + port/cpl_recode_iconv.cpp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/port/cpl_recode_iconv.cpp b/port/cpl_recode_iconv.cpp
> +index d341bb1..2346012 100644
> +--- a/port/cpl_recode_iconv.cpp
> ++++ b/port/cpl_recode_iconv.cpp
> +@@ -87,7 +87,7 @@ char *CPLRecodeIconv( const char *pszSource,
> + 
> +     sConv = iconv_open( pszDstEncoding, pszSrcEncoding );
> + 
> +-    if( sConv == reinterpret_cast<iconv_t>(-1) )
> ++    if( sConv == (iconv_t)(-1) )

 The proper C++ way is to use static_cast. An alternative is to use an explicit
type initilisation. So either

if( sConv == static_cast<iconv_t>(-1) )

or

if( sConv == iconv_t(-1) )


> +     {
> +         CPLError( CE_Warning, CPLE_AppDefined,
> +                   "Recode from %s to %s failed with the error: \"%s\".",
> +@@ -234,7 +234,7 @@ char *CPLRecodeFromWCharIconv( const wchar_t *pwszSource,
> + 
> +     sConv = iconv_open( pszDstEncoding, pszSrcEncoding );
> + 
> +-    if( sConv == reinterpret_cast<iconv_t>(-1) )
> ++    if( sConv == (iconv_t)(-1) )
> +     {
> +         CPLFree( pszIconvSrcBuf );
> +         CPLError( CE_Warning, CPLE_AppDefined,
> +-- 
> +2.31.1
> +
> diff --git a/package/libgdal/Config.in b/package/libgdal/Config.in
> new file mode 100644
> index 0000000000..1f3861e944
> --- /dev/null
> +++ b/package/libgdal/Config.in
> @@ -0,0 +1,31 @@
> +config BR2_PACKAGE_LIBGDAL
> +	bool "libgdal"
> +	depends on BR2_INSTALL_LIBSTDCPP # proj, libjson
> +	# configure can't find proj, when linking statically
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
> +	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
> +	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597

 Please explain in the commit message how you arrive here. So add:

test-pkg shows that this package is affected by binutils bugs 21464 and 27597.

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
> +	depends on BR2_USE_WCHAR # proj
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBJSON
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_PROJ
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  GDAL is a translator library for raster and vector geospatial
> +	  data formats. As a library, it presents a single raster
> +	  abstract data model and single vector abstract data model to
> +	  the calling application for all supported formats. It also
> +	  comes with a variety of useful command line utilities for data
> +	  translation and processing.
> +
> +	  https://gdal.org/
> +
> +comment "libgdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, not binutils bug 21464, 27597, threads, wchar"
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
> +		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
> +		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_USE_WCHAR
> diff --git a/package/libgdal/libgdal.hash b/package/libgdal/libgdal.hash
> new file mode 100644
> index 0000000000..ea770a38d2
> --- /dev/null
> +++ b/package/libgdal/libgdal.hash
> @@ -0,0 +1,6 @@
> +# md5 from: https://download.osgeo.org/gdal/3.3.1/gdal-3.3.1.tar.xz.md5, sha256 locally computed:
> +md5  7611300fece06853a1a88149e0cc8922  gdal-3.3.1.tar.xz
> +sha256  48ab00b77d49f08cf66c60ccce55abb6455c3079f545e60c90ee7ce857bccb70  gdal-3.3.1.tar.xz
> +
> +# Hash of license file:
> +sha256  b82e6cca0b13f5db2f22ab667f22254fb1f4b135ea73d5bd6238ef89aff31f6c  LICENSE.TXT
> diff --git a/package/libgdal/libgdal.mk b/package/libgdal/libgdal.mk
> new file mode 100644
> index 0000000000..337b8a7fb7
> --- /dev/null
> +++ b/package/libgdal/libgdal.mk
> @@ -0,0 +1,121 @@
> +################################################################################
> +#
> +# libgdal
> +#
> +################################################################################
> +
> +LIBGDAL_VERSION = 3.3.1
> +LIBGDAL_SITE = https://download.osgeo.org/gdal/$(LIBGDAL_VERSION)
> +LIBGDAL_SOURCE = gdal-$(LIBGDAL_VERSION).tar.xz

 We generally try to follow the name of the upstream package - that's also
easier for CPE and release-monitoring tracking. So it would be better to call
this package gdal instead of libgdal.


> +LIBGDAL_LICENSE = MIT (GDAL/OGR), BSD-3-Clause, BSD-Style, APACHE-2.0

 Where does the BSD-Style come from?

> +LIBGDAL_LICENSE_FILES = LICENSE.TXT

 PROVENANCE.txt gives a nice overview of the different, complicated licenses, so
I think it's useful to add that as well.

> +LIBGDAL_INSTALL_STAGING = YES
> +LIBGDAL_CONFIG_SCRIPTS = gdal-config
> +# libgdal at its core only needs host-pkgconf, libgeotiff, proj and tiff but
> +# since by default mrf driver support is enabled, it also needs jpeg, libpng
> +# and zlib. By default there are also many other drivers enabled but it seems,
> +# in contrast to mrf driver support, that they can be implicitely disabled, by
> +# configuring libgdal without their respectively needed dependencies.
> +LIBGDAL_DEPENDENCIES = host-pkgconf jpeg libgeotiff libpng proj tiff zlib
> +
> +ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
> +LIBGDAL_DEPENDENCIES += postgresql
> +LIBGDAL_CONF_OPTS += --with-pg
> +else
> +LIBGDAL_CONF_OPTS += --without-pg
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +LIBGDAL_DEPENDENCIES += libxml2
> +LIBGDAL_CONF_OPTS += --with-xml2
> +else
> +LIBGDAL_CONF_OPTS += --without-xml2
> +endif
> +
> +LIBGDAL_CONF_OPTS += --with-cpp14 \

 In Config.in, the comment is C++11 and the minimum GCC version is 4.7. Here,
however, you claim that C++14 is supported, which means 4.9 or 5 (depending on
exactly which features are used). Perhaps just remove the option and let the
configure script figure it out?

> +					 --with-geotiff \

 Continuation lines should be indented with a single tab.

 You can make them align nicely by writing:

LIBGDAL_CONF_OPTS += \
	--with-cpp14 \
	--with-geotiff \


 Regards,
 Arnout

> +					 --with-libjson-c \
> +					 --with-libtiff \
> +					 --with-libtool \
> +					 --with-libz \
> +					 --with-jpeg \
> +					 --with-png \
> +					 --with-proj
> +
> +# disable not yet handled packages and thus the associated libgdal drivers
> +LIBGDAL_CONF_OPTS += --without-armadillo \
> +					 --without-cfitsio \
> +					 --without-crypto \
> +					 --without-cryptopp \
> +					 --without-curl \
> +					 --without-dds \
> +					 --without-dods-root \
> +					 --without-ecw \
> +					 --without-expat \
> +					 --without-exr \
> +					 --without-fgdb \
> +					 --without-fme \
> +					 --without-freexl \
> +					 --without-geos \
> +					 --without-gnm \
> +					 --without-libkml \
> +					 --without-grass \
> +					 --without-libgrass \
> +					 --without-gta \
> +					 --without-hdf4 \
> +					 --without-hdf5 \
> +					 --without-hdfs \
> +					 --without-heif \
> +					 --without-idb \
> +					 --without-ingres \
> +					 --without-java \
> +					 --without-jp2lura \
> +					 --without-jpeg12 \
> +					 --without-jasper \
> +					 --without-charls \
> +					 --without-kakadu \
> +					 --without-kea \
> +					 --without-lerc \
> +					 --without-gif \
> +					 --without-liblzma \
> +					 --without-libdeflate \
> +					 --without-mdb \
> +					 --without-mongocxx \
> +					 --without-mongocxxv3 \
> +					 --without-mrsid \
> +					 --without-jp2mrsid \
> +					 --without-macosx-framework \
> +					 --without-mrsid_lidar \
> +					 --without-msg \
> +					 --without-mysql \
> +					 --without-netcdf \
> +					 --without-null \
> +					 --without-oci \
> +					 --without-odbc \
> +					 --without-ogdi \
> +					 --without-opencl \
> +					 --without-openjpeg \
> +					 --without-pam \
> +					 --without-pcidsk \
> +					 --without-pcraster \
> +					 --without-pcre \
> +					 --without-pdfium \
> +					 --without-perl \
> +					 --without-podofo \
> +					 --without-poppler \
> +					 --without-python \
> +					 --without-qhull \
> +					 --without-rasdaman \
> +					 --without-rasterlite2 \
> +					 --without-rdb \
> +					 --without-sfcgal \
> +					 --without-sosi \
> +					 --without-spatialite \
> +					 --without-sqlite3 \
> +					 --without-teigha \
> +					 --without-tiledb \
> +					 --without-webp \
> +					 --without-xerces \
> +					 --without-zstd
> +
> +$(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
