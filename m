Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD23C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 04:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B22A812B5;
	Fri, 10 Jul 2026 04:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7PSPbU0s9Bp; Fri, 10 Jul 2026 04:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4886B81291
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783657769;
	bh=btN1XOD+qUImt68j2zvDB8pj+JYrYN3Gxr85FqNax7g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dFTCQYooLag8k4fBA7QpJ/9kjmDy78y3GKRZMU0oM6ThMYJnH9I0oK4/1peTdyVPB
	 YE8SH5SxlbPfsWsN6/wU1ECvF73ms5AEaItzRL2HYNK1MCrQXvhGzBaPVuo7y6AzO7
	 UN62IQTypMYilG+XfhOaPUHkTL0abM7PV8zjWDO1Bt6PLgsP0+GhbYz/Jl+y1AwsrE
	 fqsAaQEMuz4qEhwgpYeHzLLzT4n6xfBv+JteMFu+26HVqquA3mjaJDN/RdsSWZufAF
	 Xx9exBwf98wu4hynTHTTILwkRvHFAKeS7diuXIGOQEyFFmP4mEW9rs7s5ueTybB/x8
	 +tD/3Us11hFDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4886B81291;
	Fri, 10 Jul 2026 04:29:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25395A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 04:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0324F40995
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 04:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3V0hzeM4yRT for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 04:29:26 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F8A540990
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F8A540990
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F8A540990
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 04:29:23 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id BE3E3BDE0335;
 Fri, 10 Jul 2026 06:29:20 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 04:29:20 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <152271d1-20f6-4a18-ae06-5efa548d91b0@kuhls.net>
References: <20260709140143.449145-1-br025__10977.6866667502$1783605750$gmane$org@umbiko.net>
 <152271d1-20f6-4a18-ae06-5efa548d91b0@kuhls.net>
Message-ID: <2ef5e82fe443306bb20a35b21e5e7f87@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783657760; bh=SYYb8+1tkrmEnzwtDM9pLS7r6jMMkVaKVAFFjXqAikA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=oKffBNN3Crx4Swo+HSnQOl+0DEIwTqIX5yXeIPExDuOhxwDDmg2JlLG/UAQZyHgsN
 bEn2T/lqjQnACototqipu9qOLzsCf7vA4/fO+Z/1l5bo9Hkb4UNutADCWNoB/eIiBu
 sXZhKChDl+oLqV3insTZOXW+M0gfM/tC+JZsAafI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=oKffBNN3
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd fix build failure with fmt
 12.2.0
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

Hi Bernd,

On 2026-07-09 14:55, Bernd Kuhls wrote:
> [This mail was also posted to gmane.comp.lib.uclibc.buildroot.]
> 
> Am Thu,  9 Jul 2026 16:01:42 +0200 schrieb Andreas Ziegler:
> 
>> Building mpd with fmt 12.2.0 fails with:
>> 
>> ../src/net/ToString.cxx: In function 'std::string
>> ToString(SocketAddress)': ../src/net/ToString.cxx:80:37: error: 
>> 'format'
>> is not a member of 'fmt'
>>    80 |                         return fmt::format("[{}]:{}", host,
>>    serv);
>>       |                                     ^~~~~~
>> ../src/net/ToString.cxx:84:29: error: 'format' is not a member of 
>> 'fmt'
>>    84 |                 return fmt::format("{}:{}", host, serv);
>>       |                             ^~~~~~
>> 
> 
> Hi Andreas,
> 
> what about backporting
> https://github.com/MusicPlayerDaemon/MPD/commit/
> 88d5b5248d71862815da336cfd1c6f66626bb4d4
> 
> The patch applies cleanly to mpd-0.24.12.

Thank you for pointing this out, I will use this instead.

> Regards, Bernd

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
