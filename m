Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE71D2FED9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 20:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70EFC4030F;
	Tue, 27 Jan 2026 20:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpRofJLy9tuK; Tue, 27 Jan 2026 20:54:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4570402F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769547288;
	bh=u8HmohBn16CbuD/B7PUtUEv2xQDXyeBCvEJXv+Xpx0M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AlJ4QQsbbctSrqaogbD7czcAmW+kY9GurpeNlTsGKlgJTVSTEkFbSUuZlxKyMeLd0
	 HkeWpog5mplJ0IkrwATAYClWAUqRH3ueG8ZRIaZpIag6V/e7T0/9DD6/ZGC6pMd2w+
	 5GC/755VOOw/Vt1Cp5iyrdWHEbGsQV6n8QkVwrXo0ISUafNO/OoL3UucnXPc/wEx5p
	 tVuG6JvKjmvwbFQiujH4BxJVzr5mRtoLZPXBPnY43fJmrwG0S5VCUu5vx1ulx7d1Ba
	 qM/9iiCLmogzKjGwoUn9b2puGFPKD152/EUvKl/NGTF0UN93jCHZKZAZU1v9bDC87M
	 N8uYZaEYIRweg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4570402F3;
	Tue, 27 Jan 2026 20:54:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D73C160
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3215C80CDF
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ef8Vv0s2J-2 for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 20:54:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDC0780DAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDC0780DAC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDC0780DAC
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 20:54:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 66F1AB00563;
 Tue, 27 Jan 2026 21:54:42 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 27 Jan 2026 21:54:42 +0100
MIME-Version: 1.0
Date: Tue, 27 Jan 2026 21:54:42 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260127163528.283380-1-peter@korsgaard.com>
References: <20260127163528.283380-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <1e6b5da91e102aa420c4f684e519ab10@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769547283;
 bh=l073BultK1GMqyL5XHRqx6FYLN5BHF2B+FiMF4CjFWI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UXkU6lrNRdBVYC0VZEEKWcQpJ0gYD027IvY7BcPYDz8vvEpRlqjAZN64qlbsn5a+Z
 NXKNNwrcyWzOjatuh/fsM1MSmrUXko5VgmgWqGOsVyRJySQb0DkzATsXeNSAsJs+TA
 LuGT2oEAV8uhzDpuc8iBp84lHjcWrDNX9VO7LHUTiJbPFw9CUnasYgMzVzpgb6yHIt
 ZemS2zMkXjvTnMeN8zltuqmUkfqyCePXwA6/NHkTQ5Y/bati5o2c4VD+JP3jUMP+e0
 wWh9MbgmPJmQQpDpkod1ravRl0cv3QbkSPSf1nHCLs4iaRaAA58pNOtD11Rb4wcB7e
 CBnUe+IBVLK1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UXkU6lrN
Subject: Re: [Buildroot] [PATCH 1/2] system/Config.in: do not reference md5
 for sha256 option
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 27/01/2026 17:35, Peter Korsgaard wrote:
> Commit bf3626002f ("system cfg: remove mkpasswd MD5 format option") 
> dropped
> the MD5 option, so stop referring to it from the sha256 one to limit
> confusion.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
