Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18575CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 677F8812E4;
	Sat, 10 Oct 2026 08:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1jrKPEAb_Xh; Sat, 10 Oct 2026 08:42:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B4CB580FB0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791621753;
	b=cBQYdl6lX89O7kRH4s3WnusdDvw5hmfTAWj7MDU/mcfs3I8mX8PIPDv0Nciqp9fijSCE
	 o6Dyg8sk2eGiWRMHTvcoKeQ7y2l1iIP6fmyYoyrcYgRa3OkiQnrGNgFqxJYmGNrHe4wq8
	 /xpclfqVMEFhZCQxf6UCOXtvPlopdKlBhf327iKTfpsMfl1kxpsldw4t9Gez0fN6VwiVC
	 7gvtqLsWCIFuE/5+G/5VnBwkyb03mlCOQmi+zqZ6FxEXn0xJMKzZD9L8w9Q5ee96zAxeV
	 6/Jg3mfAWJrROuMD/lrt4yX3wJiPKGDlHyHX2ShBngyOIi3aj3ZkCNyy2TncKxAlsGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791621753;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AxZxRObQ4ML8J+y6acr2M/V2nQVCBT/kwhnUQrQJ73o=;
	b=NM/mdOPH0g3QsDAyRR2nP0j83dQOQuKtYH/RPzbqws+SEIdilmxJh1Qwy/ybOdWmJ8I6
	 lmXyEe0ZL9fcmGBj2awq2iaODInuADAQe2FhoPcy5j51XQO/KxxwcGl41apIzlibYl65W
	 hiU0hR1vx+ldEHjmxqXFiymkznxn1IZjzD7wxaa0KPF0IS/+nTODKXElf3eDUtMnGPFes
	 hc5tY/CAoTYy+i+q5TFIR9xQjCAWMktJ8UcJBOqWm4+bCyfAFB+lQlm62sAZ47FlDhstM
	 bVNgWInz+qDaden9Ms1gLS42MUhDD+uAmRxC/rsuAG6NRNgA3NeeLMv3mTQRawDtDHA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791621753;
	bh=AxZxRObQ4ML8J+y6acr2M/V2nQVCBT/kwhnUQrQJ73o=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DX5pqPLEYr7AiEUOFFGjO3wTwZiRFAEntm6uAoiucxLoFjsi+VZCNjsN/XiYemq0Q
	 x+gAbAJ9/NCgJ9s/e/LyAXHUortgSZVh3zvhC4AgGiWj/xNHlfyfwCmY+Nz0hIkB02
	 lw9o7SUzHINI9C2wo7gT5k04AeZjmaXdATAxwBVgZmv7wNQsrOWNGc18CpEJY4cqEI
	 CAiVJMYa48o6fWD6awL7VfCQjMNY08R3mY5HqonNZPgcNURevFrwvqT+tpPTyWw2o1
	 5SOundj0+esFqEQNixM4PwiWD7e1vfw3opBX7tYRWY+QH28Kqn0iXX8i272obg1eFY
	 LVw4kxeMSMbqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4CB580FB0;
	Sat, 10 Oct 2026 08:42:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 888C9111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A3B44006F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTtyFghKEuDi for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:42:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AB8DC40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791621751;
 b=cExMFCq28WcY2g1mHoRsmd51gI6xZ50+pKc0Vk8PTtrijymLO1IRujlJhN4ZbXHTYEFd
 trzaVHCdKSqyQjbFcyO+3Ib0J6vdv7re0O+O+05TwFkc57m4MO5ShD1pBEkzgeijPteDo
 AVWi5SsZtRF/sZUQM6GV+X5+mz41NA2cnIUiJ+wn+urBvy2pod5f46FPG9UPHBJ2cpl0x
 Xd/b/tLpjn/UeqGRNmTHf/YKo/e21aYy16T97ml6SujO/nOEatziOylZmLfx+cnGRDSug
 /BsOt+MdFK5xT6PDnEVAzg3m4/Fl3NRjc8keqTPrE7y71Wq08H4fyZ8WB111Ns8HebA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791621751;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=cEqcQWU+1P2cVErK4p492Wc3Af5K/ho2oph5kt1NVqI=;
 b=NxLozDQfLtvOWJzCdasPg2Ri0BWhRJ4HUdoI4b5Rxd3sPbDhidqqKJstQneYIMc4gVEO
 thZhDpWUnDA/+P63A78bsc+7+OFDdJ8gVQI570ERWEKPKhmMV2stsY7wkqOqmrBuS5BdZ
 zpsHXUMGqSbLx7QHTU/YYEEsmGOodS0hZPvfBw7OL16DWB3sCYP7r5ZEUfM4OwtsFbXI6
 3CMcCFvJE4ba1QdOxI/zuPAFyNJH2OevNu7Xo68lW39EXHsO0GmxepmXfs2VMa4+0LCG6
 lE5dtGH8kdR+e/Bb7KstOsjplIssdrMapE8o4VaGjx1zkHE/r+GkZaEl4ugwH3nLl2A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=cyewbD8u; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB8DC40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:42:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7152F1A11A4
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:42:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 45B926075C;
 Sat, 10 Oct 2026 08:42:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 583E011D70089; 
 Sat, 10 Oct 2026 10:42:28 +0200 (CEST)
Date: Sat, 10 Oct 2026 10:42:27 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asn6cCXwukBFuf8m@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-36-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-36-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 35/84] package/libesmtp: Fix build with
 OpenSSL 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 06, 2026 at 06:20:16PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
