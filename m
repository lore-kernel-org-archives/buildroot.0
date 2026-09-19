Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A90C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 06:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D0E481230;
	Sat, 19 Sep 2026 06:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjI9HYnYloxb; Sat, 19 Sep 2026 06:40:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8E1728121F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789800047;
	b=bmS+P+xlJ2KNN3XO+PYvKAgxHo+hV7u2kQFGYbe1wQBaA5fcsaMQl2nHciTkgC45Ec4R
	 t/fMJzzGmXO+y0ZIKt+djy0q7xMBdwJCSTYEtRqRsNZoB6zTZg+jcxqGPebuYd9f0F48G
	 2/fMiPCV3P900egaDhIiwm6Kp85gW5fIFsC1NB96UKuyq7M5mLZXXFOGqsQTFrQCCyNrd
	 yTSpN2W4Qh1GPR5gPrKJbdHdzMoCaqq4T8L+SSB0Z4zl3bEWLGSvzK/xJB7eSxOn63/4L
	 DNsHfd67ifZdF71sZ2mi41hkJoFBr+4kyJrq9cttrTO5dv2kF9i+gOFC11230RQ0mSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789800047;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZBtkiEV7qvMrIw6FMOVUmX4rcRObEykr+vJV/wG6XyA=;
	b=WMeUBVo7COVRt1VBkHlmfVb/BVzHIL29He3Gx5AnLjaz8T0z1lvoDIIVt1M7NJofXgkf
	 i+JA9lG5wC/xUDbD5AAq/dkb9W+hgk/IXA8I8FITEtxuDYhQP3kSSm3MVpq+eUCTTvOPd
	 Wa/G8Su+sh+PhODHNNMXhs4jNh0lVndl7Ad0y/uLovGQ5KZ1lzqgo+MMblpug2h3uj303
	 vhRL9e2yx/B8OdCnFOPTf90My3RZh3RXbSKQOjGbc+K4SxU8AG1+YDjTE/nhVXb99aTIX
	 kw955k2L50PkfMg3auCN+zRzsILTqooDjmYNRoYtLP0+4+MJWc38nt7NGxYzjfcBETw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789800047;
	bh=ZBtkiEV7qvMrIw6FMOVUmX4rcRObEykr+vJV/wG6XyA=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=llweMh1N4PwkBn7IfZYQkKVxNzyiyPRYL/4Vq3VjFpEnnWwp+wH0K4uas6Ofk1zm2
	 Doz8/41gLg4y0S/OK5QlwfaEvZN7jROzT2IKs62zJi/3z78dTgp6NTB8+K0nraaptx
	 BmN+Vk7KjmFMwyyIfKa9cY6WjtBpB8IjVL+vZdyIMmBIDtmsYhRRb7mg0uj5O7E9Fg
	 L/PkpMcPyy7dMTzeSQIPmfXVVtEdJfVhTpfb1CCl1vJNz8sgdRHFjckpvwRp26cH9G
	 FBSMaF9/iF1OLVH8XU8IeHSpeamCle5zgO8yEKD7MNrg2cXUSpo8y9e+5rTDgw18cK
	 qKMLg+vp4pjsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E1728121F;
	Sat, 19 Sep 2026 06:40:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4C12224
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 06:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB1FB40B88
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 06:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4L54-LAEIcp for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 06:40:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8792140B96
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789800044;
 b=DcJVvW3FRDniDdmvMa5p6J1bEccg4mphK4/g3K8CW47jcBZE+h8ILx+ArC/jCOjXHoyE
 bj4Bu5wagbu0tuOJyi12CJ2uzzIZr0akLARRc8xOpg7d0wLN8HXkcHfZ7HwcQ+WohelbI
 yolieHOVvWshYsrzsOJJ075djejBLV4Pzu9LACPfa6umGVxC76ZMAH9eJdXlerNTLZAWY
 RtW9LAWtbCGdpMXyJFVY/ZDE2V3ETnLsMpcVyOSl6vi/Je09CfBskdTarzfpurWKVXiC0
 TbpF3ndMXZj3WrQWVMzlvqxQD3Rt/s1mfIWBDUNQ2J8e2PHS3lm+ARtf+YnNLNpzygg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789800044;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Operating-System;
 bh=KIQnFhHNy/D3WCsQgTky+cR1A0hbSmOw/afK6yUvWDs=;
 b=Qw1pJrzjSwOULdUMdpeDBr6443KiGKm8uDGQD33bAaef90oHh5GHFF1okWhQfsKEAmYa
 Gn9VOd3x1XoIQ2uw3qDGtXa4nYNNwyPxoULXt6P6Ycif1XNcDGiZhpKk2rv7UgjLSwHMA
 jEVPWh71khC7aOi3fMgZhaRAvibfK1a4HT1A1752sA5jPl5iY7A1dTm1h/T7/PqxQUUkl
 +0R2d0vt704KghGya4vmpFgL49k2a7mJZgci+va9qBQrmcLmA47BHK+NPPf1n2oDQawBy
 SCQ5AXeUJlHsvn98hwlk48u/I1CzxGRBdJP4ofleLTVsNsSIWvMGG41VHbLCRpKplKA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=openadk.org; 
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8792140B96
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 06:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1789800041; bh=6d5VvY3/1IjhFZhaRpEs7cvw3sFS7l9llZbqlOy/2P4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pN8t+WaJst6QFbnD+4SMm7ojDYYxYsdi032FVgc1DjYk8jBpz0byeT74csIs+h2dO
 LyEu+4rdwp9WrIRpnBgLjWJxu+fsO9NQ867je3l+8AD0vZ6gnfKjEh37JtlniB5eab
 yrnATPC7OT6Lwu3K57WrHd1NULgLWaEMzi0hbr/4T0T5rZWF0Nmi1ROf0RyP1Plb59
 Jj31kNWeQhl2SspPKXGvZu3Nu9N8mJO0SESxbrFlmvWWfghUkzVZqYRSSORjBhS8qa
 6smaKnatFqs/nd1ASl2uhBFsEBap2nNE1rWokuUU8FSiog1+faw572UdQjHeqPVRnj
 WBKTKdVxf9YCg==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1213731E01F6; Sat, 19 Sep 2026 08:40:40 +0200 (CEST)
Date: Sat, 19 Sep 2026 08:40:40 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aq4uaBQ3z1J6Yf6p@waldemar-brodkorb.de>
References: <20260908132030.3792569-1-yegorslists@gmail.com>
 <aq2UaCJzYpQBy_XZ@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aq2UaCJzYpQBy_XZ@windsurf>
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Yegor, all,
Thomas Petazzoni wrote,

> Hello Yegor,
> 
> (+Waldemar in Cc)
> 
> On Tue, Sep 08, 2026 at 03:20:30PM +0200, Yegor Yefremov via buildroot wrote:
> 
> > diff --git a/package/e2tools/0001-write-do-not-pass-struct-stat-st_size-to-store_data.patch b/package/e2tools/0001-write-do-not-pass-struct-stat-st_size-to-store_data.patch
> > new file mode 100644
> > index 0000000000..86dd01192c
> > --- /dev/null
> > +++ b/package/e2tools/0001-write-do-not-pass-struct-stat-st_size-to-store_data.patch
> > @@ -0,0 +1,74 @@
> > +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> > +From: Yegor Yefremov <yegorslists@googlemail.com>
> > +Date: Tue, 8 Sep 2026 12:00:00 +0200
> > +Subject: [PATCH] write: do not pass &statbuf.st_size to store_data()
> > +
> > +store_data() takes an 'off_t *', but put_file() hands it the address of
> > +'statbuf.st_size', whose type is whatever the C library declares in
> > +'struct stat'. Those two types are not required to match: on mips64
> > +uClibc-ng declares 'struct stat::st_size' as '__off_t' (long int), while
> > +'_FILE_OFFSET_BITS=64' makes 'off_t' an alias of '__off64_t' (long long
> > +int). Both are 64 bit wide, but they are distinct types, so gcc 14 and
> > +later reject the call:
> 
> Are you sure this is the correct fix?
> 
> When I look at stat(3type) it says:
> 
>        struct stat {
>            dev_t      st_dev;      /* ID of device containing file */
>            ino_t      st_ino;      /* Inode number */
>            mode_t     st_mode;     /* File type and mode */
>            nlink_t    st_nlink;    /* Number of hard links */
>            uid_t      st_uid;      /* User ID of owner */
>            gid_t      st_gid;      /* Group ID of owner */
>            dev_t      st_rdev;     /* Device ID (if special file) */
>            off_t      st_size;     /* Total size, in bytes */
> 
> So st_size is an off_t, so passing &blabla.st_size to a function
> expecting an off_t* should always work.
> 
> And the fact that this (apparently) only occurs on uClibc makes me
> think that this is more likely a uClibc bug.
> 
> Waldemar, do you have any thoughts?

I believe you are right, it is a uClibc-ng Bug. I could reproduce
the issue with MIPS64 (LE) N32. A fix is committed to uClibc-ng 
git repository.

https://github.com/wbx-github/uclibc-ng/commit/4d307481e2c73e4ec6ae3e37c881d29c182bed58

best regards
 Waldemar

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
