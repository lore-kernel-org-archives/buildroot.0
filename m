Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5A3C88E45
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 07:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D73E40AF7;
	Fri, 11 Sep 2026 07:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8tpC_l0ClBC; Fri, 11 Sep 2026 07:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0C8E840B01
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789110358;
	b=a3H1I+bUupFdE5I7uF/chFIsqKfqXFIHycPU/KZ8q8Jp9VwNFgIL5UJWrgGO45oKPIan
	 u1pYebwDamt6mD9fTMGJR1KbwC5GLXX4Utf0Aee8xtOtNWXELPwEj70Y/i6dAOxePfqAb
	 fmDIDwZt38Rh0ns/Ux2Ek0n1mcSyf4OpKM6KlJWQZ+PB1x9jcgRnRZ+ucaoNBXzlmriXK
	 MG56vRo/Hj9V9o9FBmZIGxXu/eCQzBkf3fSxB2wiowvveNBCmQ594kM0XhlQ/x/wMVu1U
	 gnOsME9aVZ8ugj21oe3KxvvPbqVgYPzVKfjOpWfCzxtOYngNS1RiIv460zESSkdM1Mg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789110358;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=kWgRY5LiMPZ5TZbeYiUxVRLnoUvAh4eWt2hi3F0N/7k=;
	b=I8JYzaQ0NU3pSSbiaB7BXx4FZouUZvJ5f3fNQgahAVWNk6exKhNFjnruhTXxWIKBSBmX
	 DaP5tn8livGdJkvu5ssDQbn9FTrThh2Dp2pCNlsBpAAQOQgSRGZUcWt++cNrIOKYR4659
	 67CJjcOmoGBUUtORyk6f+mFs9rUPpzLJA0e1O3sR9xC79NS3eeIY6+XKxqOm6DEfhzUlW
	 oIdVwIe+8w3nqsIFSuVKYsXbwwWSE5GAp43kQ9SL30fchIyMwlrE1NBay+tQXd+xPcDas
	 YRmG6yz+17HgVa7hr2KKo/tgvVd57CSmY5+hU0srsuyIQ8oRZbstZ4udZe4l9kUpStQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789110358;
	bh=kWgRY5LiMPZ5TZbeYiUxVRLnoUvAh4eWt2hi3F0N/7k=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=E1EJWWcF8ypFM35OLIZpuDouo7/L30hM6Nt3pMDjPKghz31BRsFCwTG1pI0epjEFG
	 mYG8lxRMZ5B3wbbO6EX2I9NrDkE+B8hwkMp/5Yh8D3Od6rEx0Dr4xBUde4xfkWKhR4
	 jyB6iuuC0Sy/d+WoEd/j8Olv3FcCT5GLeUDCGoMSXoGX7m5cr70D6G+3p7zAYDc9+S
	 DeVcZExrM5FLysnfVv/SU5KoZUz/iXEYgYagayHhWrTsgaPQAHNwZl7X35N2793m9T
	 ngFXpfqN6RQDxNdVJiq7/3dHYGhfYVnke1mGVZyxL6rmfnnmMz9GFRHJcuzaWADyLh
	 Oc8YRm0GBk6zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C8E840B01;
	Fri, 11 Sep 2026 07:05:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 599892D0
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 07:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B161811EE
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 07:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPE8PsvaFtDv for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 07:05:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 494BB811EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789110355;
 b=eNtIBJCyZQnK+Xii/HYdtN1QDWhikEAuZ4GM5+4yTe6wM/tHatw5dfGJbWHH0SYXPhHW
 GYiKv21mfi4B5wJY/9WH4aJlNNLiYj1pnN8YVjosjQwYR2zawWQ3bw/z7fJAL/OzMlns8
 HZ4USmRHZwV2CSWopzxE/+J8g4h+/Rhz7xqVLgC8LF+mv+whzd/QmDVuD6ZRZ5ZSEZMq1
 2UNm0gXGydR908Br//rcJSjoK6T38q89Di8kyekhMoSRlrV9KmiAfIPl8kkCtHAvRzlKy
 6yeGrL7XFUQFyflbbQvC1eVd+BZs1CFcGbJ2GiU1jRXYyshUUb4dchXYD1mCCcRtxMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789110355;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:References:From:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=TxhxkC8zNg8IhLraR/B1KyVmjYAuydmJVvEV5v0fFVE=;
 b=JEezO4+TRoyk8UUE9UvqMAd9Maf8pR9cAiIjcCRvoT4OpUnPC/2NIn0HZKab5eXg81+/
 egJ4u/0y+NHBDn+oJirJvPcLt+lgzoKHozXA1ajAxTTsDcIHaswmsJkxrATaAr5jFag2+
 8pFnYZnMQ8jkxrcOxsXVOD75bnS4FtHeSFXDNMRjhZoCbu1GBYSp5cI/5wrcXNDsjOl6F
 8rHKVHGSTRM/QiF1IYI0a5fLnMEeTXzxGpFyVWvXZcjlcW1dIilSfMCpAaCxBzID5FD30
 TscfE9kwfMOojS4dvZwWypyySiSAw4h1HBUu3S1lgWrgTdC5r+LaLgNddTemQCL+rlA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=rnout.be; 
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=BjOmhmU2; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 494BB811EC
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 07:05:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E94D0B978B49; Fri, 11 Sep 2026 09:05:50 +0200 (CEST)
Message-ID: <9427a5cc-7a82-41b8-ae77-036780d5136e@rnout.be>
Date: Fri, 11 Sep 2026 09:05:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <buildroot-2025.02.18-announce-1789067743@buildroot.org>
 <87ecf0l44q.fsf@dell.be.48ers.dk>
Content-Language: en-GB, fr-BE
In-Reply-To: <87ecf0l44q.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] Buildroot 2025.02.18 released
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



On 11/09/2026 07:59, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:
> 
> Hi,
> 
> Thanks for doing the release! Some minor comments:
> 
>   > Important / security related fixes:
> ..
>   > glibc: CVE-2026-18374, CVE-2026-19499, CVE-2026-5435, CVE-2026-6238,
>   >   CVE-2026-6368, CVE-2026-6791, CVE-2026-77117, CVE-2026-80489
> ..
>   > localedef: CVE-2026-18374, CVE-2026-19499, CVE-2026-5435,
>   >   CVE-2026-6238, CVE-2026-6368, CVE-2026-6791, CVE-2026-77117,
>   >   CVE-2026-80489
> 
> I don't think it makes a lot of sense to list the glibc security fixes
> twice, just like we wouldn't list mesa3d security fixes for
> mesa3d-headers. Maybe adjust your script to filter out packages setting
> a custom _DL_SUBDIR?

  I actually do that manually - it will be much easier to drop localedef.

>   > Toolchain:
> 
>   > - linux-headers: bump to 5.10.269, 5.15.220, 6.1.187, 6.6.156, 6.12.109
>   > - powerpc: correctly track libquadmath
> 
> ..
> 
>   > Updated / fixed packages: avro-c, bind, clamav, collectd, dejavu,
>   >   dnsmasq, dpdk, dracut, erlang, exiv2, expat, gcc-bare-metal, gdb,
>   >   glibc, go, haproxy, hostapd, libcurl, libde265, libgit2, libheif,
>   >   libldns, libopenssl, libssh2, libxkbcommon, libxml-parser-perl,
>   >   libxml2, linux, linux-headers, linux-tools, localedef, mongoose,
>   >   mosquitto, newt, nodejs, opencv4, openssh, openvpn, perl, powerpc,
> 
> We do not have a "powerpc" package, so I guess that was somehow in
> relation to the toolchain change?
  Heh, indeed, I didn't realize that by writing "powerpc: ..." my script would 
interpret it as a package name...


  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
