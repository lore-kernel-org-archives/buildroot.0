Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FBEC25B74
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 267F4606C4;
	Mon, 13 May 2024 19:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LB4iECRHoT3Q; Mon, 13 May 2024 19:55:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFBD060817
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFBD060817;
	Mon, 13 May 2024 19:55:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A44C91BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DFE68234E
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NUMqTZRMdAO for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C037982334
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C037982334
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C037982334
 for <buildroot@busybox.net>; Mon, 13 May 2024 19:55:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AA6E313F8C0;
 Mon, 13 May 2024 21:54:57 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37658])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 May 2024 21:54:57 +0200
MIME-Version: 1.0
Date: Mon, 13 May 2024 21:54:57 +0200
From: Julien Olivain <ju.o@free.fr>
To: Michael Fischer <mf@go-sys.de>
In-Reply-To: <20240513142612.21594-1-mf@go-sys.de>
References: <20240513142612.21594-1-mf@go-sys.de>
User-Agent: Webmail Free/1.6.5
Message-ID: <539ed29ae939926055a69e93fe984721@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715630099;
 bh=kCfg2NDdtNPYEIHD1MIjt8zb50ia53c8ClflmoZTH7E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pzScVJ1RbLP8K6XK+GQOg0Z6t7kDtBr6LE0dWjknWawQ2MII7uFVjt3tVtWq0pngX
 E3EGXF6hj2HjW49WuHXAK2vfzUxwoZNpb15bwO9wadDsxH1aayb6eu3AwpffY2QV2U
 d3g/rtpDYZBJlXiMFi1uEK1xR4GOEp1HceP16RzSDR3eo0fDolbZutP8qJdHsq1dlR
 IZVLoQ9QZzw14LgkhvjStBsiojY7/l5aYAWFbe7Lp/JpWeAwRtHKy/21iVpXrsGTY3
 7u2dhtHsmNwhVUYaeCkAlbgT3AGvC4PVGeb5cKhgvO8Wi6XwpmFSKn7KZopXU52+fz
 kH/vFiPR7IRZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pzScVJ1R
Subject: Re: [Buildroot] [PATCH] package/gnuplot: bump version to 6.0.0
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

Thanks for your patch!

Testing this patch on branch master at commit bd4efc8 with the command:

     support/testing/run-tests \
         -k -d dl -o output_folder \
         tests.package.test_gnuplot

fails with output:

     
/buildroot/output_folder/TestGnuplot/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabi/12.3.0/../../..
/../arm-buildroot-linux-gnueabi/bin/ld: history.o: in function 
'read_history':
     history.c:(.text+0x78): undefined reference to 'gp_read_history'

Removing --disable-history-file in GNUPLOT_CONF_OPTS workaround the 
issue.
Maybe this is an upstream bug?  Could you investigate this please?

On 13/05/2024 16:26, Michael Fischer wrote:
> 0001-configure-add-without-demo-option: adapt patch to 6.0.0 version
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  ...01-configure-add-without-demo-option.patch | 42 +++++++------------
>  package/gnuplot/gnuplot.hash                  |  8 ++--
>  package/gnuplot/gnuplot.mk                    |  2 +-
>  3 files changed, 21 insertions(+), 31 deletions(-)
> 
> diff --git 
> a/package/gnuplot/0001-configure-add-without-demo-option.patch 
> b/package/gnuplot/0001-configure-add-without-demo-option.patch
> index a557e279bc..4eb9833fe7 100644
> --- a/package/gnuplot/0001-configure-add-without-demo-option.patch
> +++ b/package/gnuplot/0001-configure-add-without-demo-option.patch
> @@ -8,32 +8,19 @@ Signed-off-by: Thomas Petazzoni 
> <thomas.petazzoni@free-electrons.com>
>  Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  [Michael: adapt patch to 5.4.0 version]
>  Signed-off-by: Michael Fischer <mf@go-sys.de>
> +[Michael: adapt patch to 6.0.0 version]
> +Signed-off-by: Michael Fischer <mf@go-sys.de>
> 
> -diff -Naur a/configure.ac b/configure.ac
> ---- a/configure.ac	2020-07-12 02:29:47.000000000 +0200
> -+++ b/configure.ac	2020-08-06 14:21:17.918756893 +0200
> -@@ -713,6 +713,17 @@
> -                [ Define if you want to read .gnuplot from current 
> directory (SECURITY RISK!).])
> - fi
> +--- a/configure.ac	2023-12-19 00:28:58.000000000 +0100
> ++++ b/configure.ac	2024-05-13 15:41:18.313920528 +0200
> +@@ -715,6 +715,32 @@
> +
> + dnl Process rest of with and enable options
> 
>  +dnl Whether we want to build the doc files
>  +dnl Does nothing here, is passed on to the doc subdir
>  +AC_ARG_ENABLE(doc,dnl
>  +[  --disable-doc    do not build doc files])
> -+
> -+dnl Whether we want to build the demo files
> -+dnl Does nothing here, is passed on to the demo subdir
> -+AC_ARG_ENABLE(demo,dnl
> -+[  --disable-demo    do not build demo files])
> -+
> -+
> - dnl Sort help/subtopic tables by row or column
> - AC_ARG_WITH(row-help,dnl
> - [  --with-row-help         format help and subtopic tables by row 
> (default)
> -@@ -1095,6 +1106,24 @@
> -   AC_DEFINE_UNQUOTED([DIST_CONTACT],["$DIST_CONTACT"],[Contact 
> address for modified and binary distributed gnuplot versions])
> - fi
> -
>  +dnl build doc files
>  +if test "$enable_doc" != no; then
>  +  AC_CONFIG_SUBDIRS(docs)
> @@ -43,6 +30,10 @@ diff -Naur a/configure.ac b/configure.ac
>  +fi
>  +AC_SUBST(DOCSUBDIR)
>  +
> ++dnl Whether we want to build the demo files
> ++dnl Does nothing here, is passed on to the demo subdir
> ++AC_ARG_ENABLE(demo,dnl
> ++[  --disable-demo    do not build demo files])
>  +dnl build demo files
>  +if test "$enable_demo" != no; then
>  +  AC_CONFIG_SUBDIRS(demo)
> @@ -52,12 +43,11 @@ diff -Naur a/configure.ac b/configure.ac
>  +fi
>  +AC_SUBST(DEMOSUBDIR)
>  +
> - dnl Substitute variables
> - AC_SUBST(PACKAGE)
> - AC_SUBST(VERSION_MAJOR)
> -diff -Naur a/Makefile.am b/Makefile.am
> ---- a/Makefile.am	2020-03-31 19:28:16.000000000 +0200
> -+++ b/Makefile.am	2020-08-06 14:34:12.995097799 +0200
> + dnl without-extra-coordinate may leave a hole in "struct coordinate"
> + AC_ARG_WITH(extra-coordinate,dnl
> + [  --without-extra-coordinate    leave possible hole in struct 
> coordinate],,)
> +--- a/Makefile.am	2023-12-19 00:28:58.000000000 +0100
> ++++ b/Makefile.am	2024-05-13 15:54:21.189906680 +0200
>  @@ -1,7 +1,7 @@
>   ## Process this file with automake to produce Makefile.in 
> -*-Makefile-*-
>   AUTOMAKE_OPTIONS = foreign
> diff --git a/package/gnuplot/gnuplot.hash 
> b/package/gnuplot/gnuplot.hash
> index 39dacd50a4..dd587a8220 100644
> --- a/package/gnuplot/gnuplot.hash
> +++ b/package/gnuplot/gnuplot.hash
> @@ -1,6 +1,6 @@
> -# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.10/
> -md5  334851e63450362bdb95e67fa8a23665  gnuplot-5.4.10.tar.gz
> -sha1  9981e5b0111c07d376deef571ccc75ce4b4ebbd2  gnuplot-5.4.10.tar.gz
> +# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.0/
> +md5  10246eb96bbf3a151d6eb9bbcc223e4e  gnuplot-6.0.0.tar.gz
> +sha1  3abea0cccad89b0c8fb6619ad51b83a971ee24b9  gnuplot-6.0.0.tar.gz
>  # Locally computed
> -sha256  
> 975d8c1cc2c41c7cedc4e323aff035d977feb9a97f0296dd2a8a66d197a5b27c  
> gnuplot-5.4.10.tar.gz
> +sha256  
> 635a28f0993f6ab0d1179e072ad39b8139d07f51237f841d93c6c2ff4b1758ec  
> gnuplot-6.0.0.tar.gz
>  sha256  
> 895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  
> Copyright
> diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
> index 91e9bfb9bf..26b2daaf24 100644
> --- a/package/gnuplot/gnuplot.mk
> +++ b/package/gnuplot/gnuplot.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -GNUPLOT_VERSION = 5.4.10
> +GNUPLOT_VERSION = 6.0.0
>  GNUPLOT_SITE = 
> http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
>  GNUPLOT_LICENSE = gnuplot license (open source)
>  GNUPLOT_LICENSE_FILES = Copyright
> --
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
