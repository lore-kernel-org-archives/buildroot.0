Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA9CC61DE5
	for <buildroot@archiver.kernel.org>; Sat, 21 Feb 2026 13:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4094A841EE;
	Sat, 21 Feb 2026 13:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5sPBshrI9Gh; Sat, 21 Feb 2026 13:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 161A9841CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771681050;
	bh=bkPCso4ynFhyxu8AoHnApA6KvNPbyYCnFCGKi+UvTXM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P30r5fre2noFToPUBecHPv/SGt3PiqhE6BPPAQ9lINCtNAz0gZ5aM1JqIx+Vx+1OH
	 KtR3BOY50tV+QaU8SMaiQkVdjhI8X+gAoEacHR4annl/VOonDHy7ntgZfkhI4cqCN4
	 rUSdEzH0qFjou6Afy5spWllONVb6wClJhv2Hq1kc2b80iaTxWY+50j16Ym79BGO5yT
	 cZ/Jvv5xQReBQlHvsI174zWU4K32hBXOXlfyuTyOQ5A/p3tingBnnoL0YGaq2PeuaA
	 hUOb1Sl/Et/aMw5KQTjTuJGVuwjsPYWV25SeUJxVWwrFZiXeAJ27MtT1Gv6DsROm8V
	 DyquN3BAXRnOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 161A9841CC;
	Sat, 21 Feb 2026 13:37:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B6A31CE
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 13:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CF4840924
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 13:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wc_SGnOhduSX for <buildroot@buildroot.org>;
 Sat, 21 Feb 2026 13:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 26C384091E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26C384091E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26C384091E
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 13:37:27 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1834998553; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 21 Feb 2026 13:37:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vtnAe-0000000GPIJ-2YD2;
 Sat, 21 Feb 2026 14:37:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260220202314.3805964-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 20 Feb 2026 21:23:14 +0100")
References: <20260220202314.3805964-1-bernd@kuhls.net>
Date: Sat, 21 Feb 2026 14:37:20 +0100
Message-ID: <87fr6ugqun.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=UHl21lFEyY3gDs381KL/QVwgvrEbyGLzy6kwm9TvBtqvpq6x5RN9XMgbky8LEfSb53CTn8ija9ukF7jktgqCVVNW1QhAxEWh/YhqxZt7l+GUO1fS3oukiemblGHUelevMfoLIdK+tdsQGRHNgQIJAIqteDmfMyFXRd1Bm+Dhs2WrVlA7k+0k58uaPkvNiVw0TVzcYmHZjhMKPnJTM5sXHd5snihEvBuzvLaGjcZVw7K4QUX7zUD57oi4txa66vlvHlp4GHaeB1h/kEZYjv9gBUpcCoYjFo4WVESL2+M9UkNe6ShYwsSeDzJZRsBhn0IlLslCh789K/UasngRejW9iA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=3TWb1hZ8VTibd7j336VGoUj3vOHtQDnCcDnXARC0lRk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=UHl21lFE
Subject: Re: [Buildroot] [PATCH 1/1] package/flashbench: update tarball URL
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Current site is down, switch to Debian.
 > Fixes:
 > https://autobuild.buildroot.net/results/eec/eecf2cbaafd8a170b5f5c6c24df552280a530204/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Looking around, I see there is a fork of it here:

https://github.com/bradfa/flashbench/commits/dev/

With a few more commits since then. Maybe it makes more sense to change
to that?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
