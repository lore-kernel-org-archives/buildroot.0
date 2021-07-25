Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E3FC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:37:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9288260BD3
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9288260BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4877840201;
	Sun, 25 Jul 2021 19:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D2YFt-XOOiIm; Sun, 25 Jul 2021 19:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 834FC401A4;
	Sun, 25 Jul 2021 19:37:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3B901BF405
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF56C40372
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:37:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4PjxJ3Pr9ZI for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 19:37:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18AFA40370
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 19:37:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D9C62200003;
 Sun, 25 Jul 2021 19:37:04 +0000 (UTC)
Date: Sun, 25 Jul 2021 21:37:03 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Dominik Michael Rauh <dmrauh@posteo.de>
Message-ID: <20210725213703.30d03455@windsurf>
In-Reply-To: <20210528152936.368915-1-dmrauh@posteo.de>
References: <20210504165735.86089-1-dmrauh@posteo.de>
 <20210528152936.368915-1-dmrauh@posteo.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3] package/libgdal: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Dominik,

Thanks for your contribution, see below for some comments, actually
just one main comment.

On Fri, 28 May 2021 15:29:36 +0000
Dominik Michael Rauh <dmrauh@posteo.de> wrote:

> +# libgdal fails to detect NEON support on aarch64 or ARM platforms
> +# resp. VSX support on PowerPC based platforms. While linking an
> +# application with libgdal.so, we get an undefined reference to
> +# png_init_filter_functions_neon resp. png_init_filter_functions_vsx.
> +# Some files are missing in the libpng bundled with libgdal, in
> +# particular arm/arm_init.c and powerpc/powerpc_init.c, so disable NEON
> +# and VSX support completely when using libgdal's internal libpng.
> +
> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
> +LIBGDAL_DEPENDENCIES += libpng
> +LIBGDAL_CONF_OPTS += --with-png=$(STAGING_DIR)/usr
> +else
> +LIBGDAL_CONF_OPTS += --with-png=internal
> +LIBGDAL_CPPFLAGS += -DPNG_ARM_NEON_OPT=0 -DPNG_POWERPC_VSX_OPT=0
> +endif

If libgdal can use an external png, then we only want to use the
external libpng, so libpng should be a mandatory dependency (I've tried
building using --without-png, and it fails).

However, you really need to look at the other configure options, and
handle them, at least by explicitly disabling the features.

It seems like there are a number of other libraries for which libgdal
is by default using an internal copy, and where we will want to use the
external library itself:

  DODS support:              no
  ECW support:               no
  Expat support:             no
  EXR support:               no
  FGDB support:              no
  FreeXL support:            no
  GEORASTER support:         no
  GEOS support:              no
  Google libkml support:     no
  GRASS support:             no
  GTA support:               no
  HDF4 support:              no
  HDF5 support:              no
  HDFS support:              no
  HEIF support:              no
  INFORMIX DataBlade support:no
  Ingres support:            no
  JP2Lura support:           no
  JPEG 12 bit:               yes
  JPEG-in-TIFF 12 bit:       yes
  JPEG JasPer support:       no
  JPEG-Lossless/CharLS:      no
  Kakadu support:            no
  Kea support:               no
  LERC support:              internal
  libdeflate support:        no
  LIBGEOTIFF support:        internal
  LIBGIF support:            internal
  LIBJPEG support:           internal
  LIBLZMA support:           no
  LIBPNG support:            no
  LIBTIFF support:           internal (BigTIFF=yes)
  libxml2 support:           no
  LIBZ support:              internal
  MDB support:               no
  MongoCXX v3 support:       no
  MongoDB support:           no
  MrSID/MG4 Lidar support:   no
  MrSID support:             no
  MSG support:               no
  MySQL support:             no
  NetCDF support:            no
  OCI support:               no
  ODBC support:              no
  OGDI support:              no
  OpenCL support:            no
  OpenJPEG support:          no
  PCIDSK support:            internal
  PCRaster support:          internal
  PCRE support:              no
  PDFium support:            no
  Podofo support:            no
  Poppler support:           no
  PostgreSQL support:        no
  QHull support:             internal
  Rasdaman support:          no
  RasterLite2 support:       no
  RDB support:               no
  SFCGAL support:            no
  SOSI support:              no
  SpatiaLite support:        no
  SQLite support:            no
  Teigha (DWG and DGNv8):    no
  TileDB support:            no
  userfaultfd support:       yes
  WebP support:              no
  Xerces-C support:          no
  ZSTD support:              no

Again, you don't need to support all those optional dependencies, but
for the ones you don't handle in libgdal.mk, make sure to pass
--without-<foo> so that libgdal doesn't pick it up "by chance".

Could you improve your package submission according to these guidelines?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
