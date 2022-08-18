Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73045C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 21:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09EBB41773;
	Thu, 18 Aug 2022 21:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09EBB41773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vc_2cG5go0EA; Thu, 18 Aug 2022 21:10:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95AD24170D;
	Thu, 18 Aug 2022 21:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95AD24170D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 409771BF315
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 289E0607B5
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 289E0607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nvGRzCBD3-F for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 21:10:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B96960784
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B96960784
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 21:10:50 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id a22so3388454edj.5
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 14:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Qh2q4UI9dmJ4W9UuIdW3IC5/cobMRH9sxsYdhXmsWjQ=;
 b=ns1vQ/v8gc8Hs8J+al0Qt30HpBCAnEHyiB9X9ze9yiYLIB9Q1WlMWai6qBd7HCEOTe
 bFrliGulovktz0QP/SK4SIHGs/tccagAPKVuospOMoCviSTVZMv/FQ+zBuAMVz537+/C
 eoyLd/YD8WRvH00BR8uI2oUtoNkbbtovU4jXSJiuAFC1EJsQw903XrIkmG+4kaOoazWa
 Se3zRDFmo04s9VoMLTSTrojZ7v2+uzzC9nYy68D8fgznn90e0u+HzcTLnBxxuZ77aHUp
 LOQ01xEV7rm/yHDsoH3ZPcWSMtvT5PXz5CGa2BCkOmzfpzWm1SkAb991b/BEvUad4UQ4
 cXdg==
X-Gm-Message-State: ACgBeo353JUehXUtykPwo+hscF011naX4wP7nXuIMObu7ATCR9qNCH6P
 M2Fncb4iKRrJzUX5RGb47BTdmA==
X-Google-Smtp-Source: AA6agR4AQpHSsCzNgocxXNOeEkHmpsjrLD9pSje4vL41j9Fzp2kOxZn1gLWD6vbjYAFKsURyYcSf+g==
X-Received: by 2002:a05:6402:2706:b0:43e:5df1:2e04 with SMTP id
 y6-20020a056402270600b0043e5df12e04mr3554058edd.315.1660857048241; 
 Thu, 18 Aug 2022 14:10:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 cm24-20020a0564020c9800b0043a5bcf80a2sm1802675edb.60.2022.08.18.14.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 14:10:47 -0700 (PDT)
Message-ID: <4b4140d7-6242-765c-8bf7-c27740764413@mind.be>
Date: Thu, 18 Aug 2022 23:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: David Mosberger-Tang <davidm@egauge.net>, buildroot@buildroot.org
References: <a616e2b3d0edf64b98a2114dad8086fcdd1088f4.camel@egauge.net>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <a616e2b3d0edf64b98a2114dad8086fcdd1088f4.camel@egauge.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=Qh2q4UI9dmJ4W9UuIdW3IC5/cobMRH9sxsYdhXmsWjQ=;
 b=HjiIW3LnuFeEpsN/I/299AnmeFeZFc754XJsDAX877ZyPM7imusSA60e9ilwy5ip4Y
 TEmm3S0y04WlojoFs9s/X3a01NuazSyjXgJjz1Zwl7gzEMUsOeiqacy8D5ZBhXnApXHM
 s5SDCa25T1fdIeOgjo+fRUDmnrWBXchNAEgXiqLbje8ozbBtPk90JApbz/Hs0BSfKX58
 PiCe24aKcG4Mlbs+miHXB4N6oYyZMMasaFs0h1HBCTp8aQgTJXakLzWg9P9PvdW0IKFz
 pzsp0qTzUxGqqNQ8cFIWJakIFhkPQZuLbMIyjs3hEuv6wGNdjlzk87ONkUSMbOfgi7bA
 FIXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HjiIW3Ln
Subject: Re: [Buildroot] add support for generating multiple UBI images
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/08/2022 21:02, David Mosberger-Tang via buildroot wrote:
> We have a need to be able to support multiple NAND devices with distinct flash
> parameters.  For example, one device uses an erase block size of 128KiB while
> another uses 256KiB.  Depending on supply-chain availability, we may get boards
> with one device or the other.  Because of this, we'd like the ability to create
> multiple UBI images with a single "make" command so that we can be sure all
> images are always up-to-date.

  That situation sucks pretty hard... It makes upgrades a bit tricky because you 
have to choose a different upgrade image too depending on the hardware...

  My advise would be not to use ubifs. Use squashfs, which doesn't care about 
the LEB size. Writeable rootfs is generally not a good idea anyway. With 
squashfs, you still have the problem for ubinize, but ubinize is anyway just an 
add-on for the simplest case; you can easily add a post-build script that runs 
ubinize twice.

  Also, as an aside: if you don't want to patch buildroot itself, you can also 
add fs options to BR2_EXTERNAL.


> To accomplish this, I modified the build environment as per attached patch.  The
> patch is relative to version 2017.02.5 and I see that, in the meantime, ubifs.mk
> and ubi.mk have been split into separate directories.  Thus, the attached patch
> won't apply directly.  However, I thought I'd share it as a basis for discussion
> in case anyone else has similar needs.  I'm sure there are better ways of
> accomplishing the same, but the patch works for our purposes and, if this is of
> interest to others, I'd be happy on rework it for the latest buildroot version
> and incorporate other feedback.

  I think for upstream Buildroot, the patch is a bit too complicated and the use 
case too rare and specific. In addition, in its current form, it makes the usual 
case less user-friendly.


  Regards,
  Arnout

> With the patch applied, the NAND flash parameters can be specified with a single
> config option BR2_TARGET_ROOTFS_UBIFS_PARAMS.  It expects a blank-separated list
> of triplets which specify the Logical Erase Block size, the minimum I/O size,
> and the Physical Erase Block size in bytes (as hex strings).  For example, with:
> 
>   BR2_TARGET_ROOTFS_UBIFS_PARAMS="0x1f000-0x800-0x20000 0x3e000-0x1000-0x40000"
> 
> You'd get two images:
> 
>   rootfs.ubi-eb128k-pg2k and rootfs.ubi-eb256k-pg4
> 
> with:
> 
>   Logical Erase Block size: 0x1f000 and 0x3e000, respectively
>   Minimum I/O size: 0x800 and 0x1000, respectively
>   Physical Erase Block size: 0x20000 and 0x40000, respectively
> 
> (The patch assumes the subpage size is constant across the images.)
> 
> Best regards,
> 
>    --david
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
