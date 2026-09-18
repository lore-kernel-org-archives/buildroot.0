Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E16C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81BC460ECF;
	Fri, 18 Sep 2026 19:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p6dbTZ_Abi3T; Fri, 18 Sep 2026 19:45:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 276CD60E9C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760748;
	b=KbYwYUA8rHwBlXpfxt1Xqihe3WwAfXdmBqiyC/Usm3jftgmG+aRiNU/LNRJa2Xz8/blD
	 qBXwv8uIVU+IHf2EmDsdSmL6fy/9XwpIWzt7iiYROWmL/84cwaxZ5D2PzuvhAmams+f06
	 u4S/mYLUUCqxvmrFeLne0UN7Q4VKsQfOBPUOD3OcUnB3CyQQE9A1LgQ2/CpJZ7ud5lyWu
	 NtbAu3pqQZ693d1w6caT/Iy1cNmhbgsaz/CbK5rqWF+ZpqhGyOPdTTjqpyAqx0leEtKYi
	 eubEtk68zJ10NtdqXA8M8tXoZOmwQ7pVDLxjSlkuYY/6HxoABi1QrBzeK9+zYvHbBXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760748;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=j6XZ/AJ+WHd/BsuM02/q2FF4vybw+Dqs/3ejuHFSTPA=;
	b=Blwg+fP3f9M5d3dDcVh4AhGFOQ4KNnoEo7qQbw6ZCGuy6lH/b4gLBQ7I1vlLmHQ1XnV8
	 sQ7Y4EA0wtXrNK8mSAOkbZsEFmHFBlanXHHIiFkjfmfTybwYra8vPmh+L5JJKvlGnRABp
	 9GQX8VQjwr4i81tgd5AY/eMXgXCeuozcL+CNKo0CA6zsV7JIcPVlqg1M7UbCmRh/l2hH8
	 P2PH/vbpHtmiFq5S4GFH80XyQdvPVGwdBvzKx3Fw2/y2iE6r4volq2lCORNJCZPeZUELl
	 PSyUrDTCFOAUoUba1sTv9FbtB9SZEW9DDbvqQZBkvzVMFRrsyQ3cS+3PYxDUnvTF54Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760748;
	bh=j6XZ/AJ+WHd/BsuM02/q2FF4vybw+Dqs/3ejuHFSTPA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=MMUl4mypIPAeqlu3tyFYe9deNMEN5z2LVds+CTD259s8ghH+eTqiTY+Pck4OnPEti
	 2pSD4OGROnJtn8fg/BK57GaMph9X45I31r5aI0EQg9FfZju3WxpQCATQTENJGXo26R
	 pTKuYq/vIa9ggtlGiWkep9S57pelKDArL3Ff28d/xseVG5y1LEjtdA0dpT0O25jBY9
	 J9cf7RlnuxgtEJ2DAqSSCoJyQJJh5PYmEc6PMazHBLQ9F1MtfMZ/d2GbfG0yPF4Lv5
	 Gy+Gnpx+a6obN1jdNxd3F/m44nKmDkMG1oD+M1iYd5I1JLZCBixtJInzRqb1m+vEa5
	 Ug4eP2wbZsu8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 276CD60E9C;
	Fri, 18 Sep 2026 19:45:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5AE33B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7663400FC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2JKqJ6j4lBM for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:45:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3C97F4006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760745;
 b=k8PDU+2r1kcm/76aLAiAZDmI/964woL6scuQMycf4Bx8BEvkTmtXJ4sOJclAjUrrUqB9
 PwzB9cOhL2AVLiSlTgwkW4IJRe+ENdW782F8jH7/yUkaabf7bHFujdKxjHewCc6IEniOv
 Q/sfx9M7WyPIHzVPbnFV7z4oNGvGS58NdN8ofoPJBXZe7cWz/7Fj3xt/bEvjQZTonT5RD
 H1MHCCnXm9e6slAHVfEjvByuYbIztBTvQ+w93WKcGcgOHhURGR476Znme5mTu+Ybasfys
 6B4yFZKfDeHXOLYWEA51v5xXoV1Wvseh3GVhuKAHnmYPDUb1QU4y/8WoaeVLVrl7GTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760745;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=2C+eQDmYNmLAftcAy9EJdjKdVEk5B1lj+m+2N4NXFnE=;
 b=gBmbneEefKEvWQ6zLWdQvgRRaidPAVW8Epz5o2ohrOIeS7nhpU6MUM/7opVKm8qBAyuF
 tulhmUo7WsIeuto3Hm/uNWf4d+ZaTCADaC8yK/RjFEmfkaLfOrukYTitdhO5T1p7KAs9y
 WsUD3MlFo+Xfhi0MBdmomj3+A1G1mblAO8h411QnDRQ0qfNfL5g3/Ai5q61r5Ra65YY9c
 I2Gpc2x/7YtVg6hFtMCnnSio7c2ZFwF+jx0CBW4EeTETFnSEOPHNTELc+7Gg2IHi1GDCk
 9XSylJgKckW5y2qv3iTMwtLOWSpO/mNOt7KzdPGWFS4Z6yCWatM3/DrmxVsmx8vZSUQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=lAvz5evi; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C97F4006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:45:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B9DBD1A099D;
 Fri, 18 Sep 2026 19:45:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 73BDA60649;
 Fri, 18 Sep 2026 19:45:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 541B710329072; 
 Fri, 18 Sep 2026 21:45:36 +0200 (CEST)
Date: Fri, 18 Sep 2026 21:45:35 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <aq2UaCJzYpQBy_XZ@windsurf>
References: <20260908132030.3792569-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908132030.3792569-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/e2tools: fix build with uClibc on
 mips64
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yegor,

(+Waldemar in Cc)

On Tue, Sep 08, 2026 at 03:20:30PM +0200, Yegor Yefremov via buildroot wrote:

> diff --git a/package/e2tools/0001-write-do-not-pass-struct-stat-st_size-to-store_data.patch b/package/e2tools/0001-write-do-not-pass-struct-stat-st_size-to-store_data.patch
> new file mode 100644
> index 0000000000..86dd01192c
> --- /dev/null
> +++ b/package/e2tools/0001-write-do-not-pass-struct-stat-st_size-to-store_data.patch
> @@ -0,0 +1,74 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Tue, 8 Sep 2026 12:00:00 +0200
> +Subject: [PATCH] write: do not pass &statbuf.st_size to store_data()
> +
> +store_data() takes an 'off_t *', but put_file() hands it the address of
> +'statbuf.st_size', whose type is whatever the C library declares in
> +'struct stat'. Those two types are not required to match: on mips64
> +uClibc-ng declares 'struct stat::st_size' as '__off_t' (long int), while
> +'_FILE_OFFSET_BITS=64' makes 'off_t' an alias of '__off64_t' (long long
> +int). Both are 64 bit wide, but they are distinct types, so gcc 14 and
> +later reject the call:

Are you sure this is the correct fix?

When I look at stat(3type) it says:

       struct stat {
           dev_t      st_dev;      /* ID of device containing file */
           ino_t      st_ino;      /* Inode number */
           mode_t     st_mode;     /* File type and mode */
           nlink_t    st_nlink;    /* Number of hard links */
           uid_t      st_uid;      /* User ID of owner */
           gid_t      st_gid;      /* Group ID of owner */
           dev_t      st_rdev;     /* Device ID (if special file) */
           off_t      st_size;     /* Total size, in bytes */

So st_size is an off_t, so passing &blabla.st_size to a function
expecting an off_t* should always work.

And the fact that this (apparently) only occurs on uClibc makes me
think that this is more likely a uClibc bug.

Waldemar, do you have any thoughts?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
