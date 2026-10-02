Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146EBCA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 12:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B14CD606FD;
	Fri,  2 Oct 2026 12:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxzBqjn_LsoV; Fri,  2 Oct 2026 12:51:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 909476071D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790945501;
	b=gLEycPEiT9/V/D5mmuAcjSgX2RpJE9oe8IvhYjEt3tHkaSIModoPeySyQf4iSE/nw/Qz
	 +FDhlz+/rwSHo6Jxj5ygkCpSnb1+C5F5LYqeYVIf0XgS+BaHQ9wJLzpIC45LmqeJIV10a
	 Yi1DBE3tCgGqSe9ESn/yV1uAm/yeSNDDzcNbzpe6LZ/UjRbB0dlJZMpemZIEMs/DxOuxv
	 0pWK1EwR/OyP4vJ4AtvPYrqPeh+niB1aYHkE8yW+TDO7mG30q61yLLtgOwlPKnw09XE1z
	 y9enRqrLn/hTjbVBU5Zyk37aoK/oNcuu+H7njKBV59xTKvGhxEOOAm6EQnPkkoX83Xg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790945501;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=NUco/bjC9gFYSB69nJsxVzCV4hnDX+qBMBHMml9+p2c=;
	b=dKj4xmC2IeqXTSTRVK9CuPWGuYsAF27pLVTX/5UMfaHPGFpihJtpP5CtwPupmkp1o8Su
	 DfqsI2hTRs0M3vhErig5faifqXPHvunSGWZ3TeK7fVj1UoZPzszk82hoSDP50uZjjNudt
	 bp7nMTgRVRFZgQQaMMb3XTABm+l6I3JpK6xLVwZA8D8JqcnS2/pN1TCrcJfC65QobHT6k
	 C6V1rd+GrlrJtPZ6olCAzqooM5m4T0Xapn6/cY6t+Rt3hWM4LTnUze7NJFCE6HnUxi44O
	 ULEf2Rl6vC81nhd//7/XwvetnBerQaIzmW2vwO9G4zIsMN+58NyBH/GZTPiD8DMsx0A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GP3Lwscq;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790945501;
	bh=NUco/bjC9gFYSB69nJsxVzCV4hnDX+qBMBHMml9+p2c=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GrpbWC29hsm1b9x7QjCBVQLRUajWhpLAhIBy/nNErcOiRVcpRJNdmMMvSHxHAyKeQ
	 KxTQFnugZ0krW8bvPuHGVKEOR58p/mJ+MxfeKYH6925q00DNF3NitMiLRL5bfyMNON
	 zCNhcMu1z73xRiUjDXl5Zy/6yJl3oBEk4yGPiWvQpgrJprf7OJjlTlbKWD0IRhKzxX
	 35sACOq2L90togWNzns4VdQQ1P7OfYn0QDvYgWpbqFt/8BUTTjXr/bjiuUQ7/1nRYu
	 lUqqIA1ht8PXTTuZm2UpmXUpCyYg/7dQ2pozc84I3KuapGm2Rf+RcbmYFYhvKEtc2z
	 wyMmJ94vJPN8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 909476071D;
	Fri,  2 Oct 2026 12:51:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB6FA4C2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 12:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCC0E606FD
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 12:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Am5gPaNB5V8r for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 12:51:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EC69060666
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790945499;
 b=GpSSw+2kxcrbZ1he7K87bu664Cp6nJUjrXq+MU3bxdNFOUjvk5DMF7SHqFuQlACY8owt
 OVVaxLkGgBajhX8VzXnuoyars/XZ7Qsp7KnNLRvsWsScd3HRujR7lQENbrD5BW1acsN6a
 XnetiH/0j3yoLbbN4tJVHDXXNxrbzYL2WJSqS9XZRxyZT/HZkAsAiKIncDY2dSTzLRdZF
 zNybl5VpSVVsELR8K4BNfSnz9b9fvuM0FE9N5mWgv2cqd+OOJv91R4ti1OCwdwIhS9Sqb
 gAk8+C3KEzynwR1B2kB/3joB2mXaDicu7YV/sNQyDqMDVg/CljBcGhkvIF7OPOIuHEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790945499;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To;
 bh=OufGkYoUvO7HFqzwpHmIBmD+cemwE+8MKDl+UeU4a6U=;
 b=fAX0Fdeuca4pB0JEqZiN1KLqBbttnAKvib32TUG0Qg9nMl+6QcSr4BGXW/YGSYoujXdN
 pewNgsWVTZ9PmurHcnydtujxZp4SfTTmq3PbFfhRmoJnxTPOeRvQa+IETTIeR+rYXgGco
 Q/43uiDH2XC1bbTPzqLqzfGSZUZHTrtR3Bm8UcfA9jKsNGegWOfpe6/YHfw7+0QWxXIb2
 Vwtkv6MkCtYaFAVFJ5iJFZJHyMZy9mJEYOzWypfVb20kDoJpqOxC1BsSe3dbMz+jfgh6l
 PIB07QMrhZQrFSzam5oHbaFHJJ+eq0wAfnU790RhGjkWdoR1fmlAbZmmC7J/HUjCjzw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=GP3Lwscq; 
 arc=none smtp.remote-ip=213.167.242.64
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com;
 envelope-from=laurent.pinchart@ideasonboard.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=GP3Lwscq
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC69060666
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 12:51:38 +0000 (UTC)
Received: from killaraus.ideasonboard.com
 (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B833177;
 Fri,  2 Oct 2026 14:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1790945381;
 bh=vr/H6FpQI9dtl5QlWb/dKJ11QV0qritEi3KUvC9wYas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GP3LwscqTWmH2jc2HeU0bLAIxh6XU9HTL7qYoM3w2xqu+lkvyhUncNSLEKZvXypyH
 mSeCpc5dzBtPRj5cdI3q3RSK78Q6NjNY8bKONkLwkE5gQOPYL1zl+Jqis/1GC8YhH3
 wkSmocFer0NupF2FkB0rugNey/udL9LHGL+w3KWc=
Date: Fri, 2 Oct 2026 15:51:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: buildroot@buildroot.org, tomi.valkeinen@ideasonboard.com
Message-ID: <20261002125133.GA91932@killaraus.ideasonboard.com>
References: <20261002102335.12501-1-paul.elder@ideasonboard.com>
 <20261002102335.12501-2-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002102335.12501-2-paul.elder@ideasonboard.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/kmsxx: Bump version to current
 head as of 2026.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Oct 02, 2026 at 07:23:32PM +0900, Paul Elder wrote:
> Bump version of kmsxx to the current head as of 2026/10/02. Remove
> build options as appropriate.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> 
> ---
> The git commit ID didn't seem like a meaningful version to put in the
> commit message but neither did it feel useful to leave it blank so I
> just filled it in with the date... I hope that's acceptable.

That seems fine, but https://xkcd.com/1179/ :-)

> ---
>  package/kmsxx/kmsxx.hash | 2 +-
>  package/kmsxx/kmsxx.mk   | 7 +++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/kmsxx/kmsxx.hash b/package/kmsxx/kmsxx.hash
> index c141ef7e0725..1d74a0602598 100644
> --- a/package/kmsxx/kmsxx.hash
> +++ b/package/kmsxx/kmsxx.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  99759fe9334369ccd80ab0bbfe1110ee47e74f1e20abc2d7b2f028067ea0a0c3  kmsxx-824bbb1f4cd062d66b457faca50f904b34dfd96c.tar.gz
> +sha256  8671e99766590055cafd58793eaf56782044e2cf1203a8a390a5726457d39f7d  kmsxx-4d2008f5893a5d6ea2b2bf5e70bc539bfcaf6db0.tar.gz
>  sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
> diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
> index f65cc668d484..5aeb48910c7e 100644
> --- a/package/kmsxx/kmsxx.mk
> +++ b/package/kmsxx/kmsxx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KMSXX_VERSION = 824bbb1f4cd062d66b457faca50f904b34dfd96c
> +KMSXX_VERSION = 4d2008f5893a5d6ea2b2bf5e70bc539bfcaf6db0
>  KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
>  KMSXX_LICENSE = MPL-2.0
>  KMSXX_LICENSE_FILES = LICENSE
> @@ -13,8 +13,7 @@ KMSXX_DEPENDENCIES = fmt libdrm host-pkgconf
>  KMSXX_CONF_OPTS = \
>  	-Dkmscube=false \
>  	-Dpykms=disabled \
> -	-Domap=disabled \
> -	-Dsystem-pybind11=enabled
> +	-Domap=disabled
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>  KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
> @@ -23,7 +22,7 @@ endif
>  ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
>  KMSXX_CONF_OPTS += -Dutils=true
>  # extra handling for some utils not installed by default
> -KMSXX_EXTRA_UTILS = kmsview kmscapture omap-wbcap omap-wbm2m
> +KMSXX_EXTRA_UTILS = kmsview kmscapture
>  ifeq ($(BR2_PACKAGE_LIBEVDEV),y)
>  KMSXX_DEPENDENCIES += libevdev
>  KMSXX_EXTRA_UTILS += kmstouch

-- 
Regards,

Laurent Pinchart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
