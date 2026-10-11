Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9693CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B85F40648;
	Sun, 11 Oct 2026 13:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viZXpsr6y0mT; Sun, 11 Oct 2026 13:12:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C1E5B405A2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724366;
	b=O1ZMn43iRld77U6KYz+S5aYoKD9kNEFDKsdc54ItEg1GfPyXIndFeizCVSHdkMvTWEfH
	 Zdk2y49VyFue+6DzFeAC/61/EHmFuM6c3Gbl0sZtY7FewNqMau4TQNhz5RbkFcmjElB3B
	 L8a5rcQXAlmSNXXRhmyXmT6fuiRlc2VBWx9De1IwWlu2CUDROpFX6xRmxOyXJfnrfMFft
	 gQPtiQwlYPNUVsDnB9dAMNdFhWYpyoFpFaTawQCq2nCuEnZaNhcb3CTGGamqgrzGuCwtc
	 1M5lyUF08IDS2NKeKlAqxFgX3tWHJXCQYM1xW/5I7omd0J9Hv4RV/n9ewgPatEKzPmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724366;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=v4SoeFnfbuuwuJsT0MjHQUvBOSh5Nlxx/5ghbneUNqA=;
	b=b31iVlYy17AaCSUCbu7sgpJWv75tZ94BoMK3tN4FRuVjZyL2CUzx+ag74aS7zL0Cmt58
	 /g3xqLFi6tmSc8WeFGNP+trj//4kPiXYEHg5WAcSer2U/wZRcRVNRQdLLyDZrmH6H9BII
	 /GoU28Xo8k8cl8p6fnfSXTALAmM2XFKyXzzBxw3yEPQ7ck7LkGdwU5QEoXcmw+SHDUKaC
	 o3Elh10p1QJ0eZaLi8JX4wxnW5riwZkJhX3b40q7sRORZZlkRCSDn8KLIIhgg1jXBxLof
	 saBjr3gIgLRPN9XaiVKZdZarg4XbIxTmPf41t2NOzNajElCXlwleBE36kNub+HC39ZA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=cQUwfP1G;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724366;
	bh=v4SoeFnfbuuwuJsT0MjHQUvBOSh5Nlxx/5ghbneUNqA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GQAdliTEziuJR5kIvgD8xK3t6mMtpsjd1HorECNM1DyfsYB/V0Z2aYuUOQ7zZROvi
	 Mg/hpNuEh8g5LJRFzi9R2ch7YB4K/+LdpfkLXvv3QhG3yZeRNUZ9wAPerrUhHkeeii
	 eNINo7arU9HqsVwKB2hUmI2v9E7ElhheaMq1DrLK03Em0gxOzDpviDUN91d7DDOPh6
	 ShWM9obqb0y7cgvm7oTI0tpFjvQRxqfOcw0roYk4flupCW9mGlM0P4BLXJR9ea+pGg
	 /68fvp/k7ud+hkOxE9wMzOILMM8oa1TUH9OWTH1UA/WCXYAcgHC71j6x6lSooCqrSK
	 tV3B0qEYC28Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E5B405A2;
	Sun, 11 Oct 2026 13:12:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 616441A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 475FE40581
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEyFDNRdd2Wn for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:12:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 77187405A2
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724364;
 b=m6HC42S0PGJcMERV2VobJrmQmc9beZ7onpWMe905AbvfewgJ3OA4ZtNkstwA1ojuXKMq
 y6McXLm8YDR2vAN2G1S+7vS227YfRANL8QyB/D66mI7e8Hzbv0+neJtuRqChcl1QTizJf
 OdCRk5KIKeZYIW1sRm/kBm3EQeF4hhUsB41NT49MM4PNx/a1wG8/aLHO/xmnsniyrrcYq
 uPQA4da0JeirkDqEn5e2vnNGgz+2L1moz460Aylnxt0m2o3CU11dNzVAc3VrDNPAiHFba
 fhliCk2aWq4oaLv5z/cG2IRGxVfbA/XIJoJZnMhgFXvHJlMNTM9uT+3G+Cg72Db/rCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724364;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=27vduSz5X4iD6E7RzB/lTivh46zNBhqIdoh4OlhAgM8=;
 b=Wg7TxxlVLX065ay6egfXvUV+dw6ERBXeqFVTINvt7XGxPoohtFKVroO2CgPKcMbu5sI9
 kZmBaHyNtgD/xTvg2a8V4GfPxLAB/aAlydIwes2+BY2NMgeLqzq18rCCNx6NH5RAL+Z8+
 JF+nhamchRTJ/VAZJwPlaWRMZCSNdHqSfswVlmnzrSya6Kl514EcBVnuYucUQycs2qBc9
 VG51BQ/mSESAf7x57G25BTbtq0Pjf8TqRTyK+euLxqV9zk6ePLY3hHkKN3QqNJPzPRPCa
 CqGfk4yPDUcNeufdbnjJ8q4vnfDCWBdFw2FAg1Ke4g8Vh4XQLr2axBZeIGUM+NOiliw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=cQUwfP1G; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=cQUwfP1G
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77187405A2
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:12:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=cQUwfP1GD6CbjZUglDawq/4CooGWh6LgshoKhWh43ShbB0WZkIJYXPgefKOGu0tCLq+4x9VUinClVWzVQ3PdfwI6vSpx/jU03iWXxmqpn7s8k+ThOyNf4/ijPD/MvSag6pUEm+FhevLiZx+8UlvX8M3ZXCXJUtqZA2Juw0hv8seEoXA82JwRa+04yR4gGgvS01BWEDsIk64MOrtoj1SiSJbBU0S11OE/w1FvgOXaPv4oRz6kkWouXWfuz9o1AXgbQ0ijf+kGrE7XtT4AQBzscyDZZgtE/Jn5rURKZj7O/gkQBTpF0niVRlC/h8on1r2Xw6BiPN+1DSM/WEB+PVD6Ew==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=0gYZFPPfOss2yZrYPiKHwtPCklYPp+7kvwLaTYx98zc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1240455180; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 13:12:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFtLz-000000098zd-2I2Y;
 Sun, 11 Oct 2026 15:12:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org,  git@jdknight.me,
 thomas.petazzoni@bootlin.com,  arnout@rnout.be,  thomas.perale@mind.be,
 ju.o@free.fr
In-Reply-To: <20261010201508.963412-3-titouan.christophe@mind.be> (Titouan
 Christophe's message of "Sat, 10 Oct 2026 22:15:07 +0200")
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-3-titouan.christophe@mind.be>
Date: Sun, 11 Oct 2026 15:12:39 +0200
Message-ID: <87se2ccreg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] linux: add first-class support for all
 upstream linux versions
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

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@mind.be> writes:

One more thing:

 > Add new KConfig symbols for all actively supported longterm versions of the
 > Linux kernel. This makes it easier for individual configs to follow updates
 > of their kernels, without having to frequently update them. This should
 > generally improve the security of the target systems, which receive frequent
 > security updates while preserving a stable feature set.

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

 > -ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_VERSION),y)
 > +ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_SERIES),y)
 >  BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 >  endif

When we do this then we also need to ensure the hashes for all these
versions are available, so I added the version symlinks like we have for
the linux-headers package:

lrwxrwxrwx 1 peko peko    11 Oct 11 15:08 5.10.271 -> before-6.17
lrwxrwxrwx 1 peko peko    11 Oct 11 15:08 5.15.222 -> before-6.17
lrwxrwxrwx 1 peko peko    11 Oct 11 15:07 6.1.189 -> before-6.17
lrwxrwxrwx 1 peko peko    11 Oct 11 15:07 6.12.112 -> before-6.17
lrwxrwxrwx 1 peko peko     9 Oct 11 15:07 6.18.55 -> from-6.17
lrwxrwxrwx 1 peko peko    11 Oct 11 15:07 6.6.158 -> before-6.17

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
