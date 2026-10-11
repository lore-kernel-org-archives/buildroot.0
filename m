Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B0DCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 15:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A12605EE;
	Sun, 11 Oct 2026 15:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UW5QEUhL0qAe; Sun, 11 Oct 2026 15:33:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1CA8B6060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791732785;
	b=ifnGtfzPgynhr6mP/WvgMtdA38KkGJwIqrtSBHeAoZvKe9T1tmt8yHKSGpg5Fe6GpB+m
	 8wQrkJlRAhjqejT4tPxiHa8ddmUJr6Gi6rJFYZzv2DsULlVXBBOfIxXGd06kJXYi6qGAM
	 YdEnxO1TvY/s832tMtl7Ewmh9DzSluGZ5WlfBgjem6foz3O5srDaamPGBJ9uPsZ9kQae1
	 A4X8eMat7C/Z9TtIpKqvP3qKbIr3VFuSQdy2KRIcGuRk+EdsaLnTMkbcj0RNwxSqwjn8e
	 IFrGgU1m/uedtTsHUd9PcBHzWL0sx15nvETk6MHdYzeu1pRoX0DhrEwgi8nQ+UkaAwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791732785;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SBcH5kRWRIeHBK8nmsajR6NdYPa6cx7GtDZbiNKkZKA=;
	b=HipboWKzcH4blZyeDqh+ga3qcmmMhizJ5l5I/dSesOSEQkUCxUx/c1xxS6eQSi0htGEc
	 im6rf3ibRzFzCYWXixsYlMczPAAiQj4/s2C9E0IRBco0Ba2QQg2zEUqVM68PKkg3cYuyl
	 AJZY84oPpIxtnwhGVoSk3i5zsxrpyeHi66SzUSTVA5PvR4Yugh4h477iTmHG69AOsKZ13
	 Cu93G1wd5tcFbf6MBtg2vs3tLIF6YKEUBErTXa+B7sboxwqhpeUnZCLzXect8XbeYdNw1
	 fB+xoJK2vQlRz/JKRoG+sIvj+Al2oXjtbLVuCuQa4JptnJv4njsC9slPeftAAwoP1Tg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791732785;
	bh=SBcH5kRWRIeHBK8nmsajR6NdYPa6cx7GtDZbiNKkZKA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QuuvuC5gGknwsSPNgfwAO6nRpAyAuKBVscIB71+bUGKL4TF/5A2AUlYgEtBWgqim4
	 8LORJc7FkgoHR/AeUdSKq77BGlmyEeoJVMULq8EyRxvgaEMIjRvZSO/gasrVY1Ry8t
	 7Pd5Xi/byu5ellacQN93gwB3kceakWKYr/8T9wHQCEh7lcbfeekGhh8ep/4isZGpqJ
	 RfxBdxtRT/AE2VjXYeD3NRRRmTHT3oBnzjqjX4Y68ut/v47JKWsHfmaQ5OIdwPdFsy
	 9vN3udQs1T5dGWrP5fUVGIwVW3T/ARr17vvyEMtg02YqlnPW27Q4ZLJOZig85qd4Xm
	 7RvOYZ9G1Y0/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CA8B6060E;
	Sun, 11 Oct 2026 15:33:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1856D194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A0424060C
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haUiImW5eHmK for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 15:33:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DE82B4060A
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791732782;
 b=KQBKrK6HOk2Erp5GDNstTXmJcJWb/RO2QKC8ngDYUAhbPqyokpANxoAchBRUHEmiTqkG
 6Fxi6IpW3BpFuBVZgmusQSaVnl6x8IsWJrKLiM/xFM8V96HJAiYLdmx9qfdFYjLp0INMG
 ls9yQ/d+w7EKJTyf/WL9xMXwkgCNoxTXxt0VXGCy1XJHKM0nFQ3spKA9mqRcXdCjHwZr0
 GE6tFeMA8p75Z/VGE8DaQb24e+uCyceXtrPS+oTSq7q1UrDNOwLTDQ8ElnTT6eKCzrzRg
 Jpt1q12UaKeiAFa4LZMCE27ao/6q78XbMkPjFBei+RSXoS1SN4y8vpLjHNj1atTIv4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791732782;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=OKFRS1rMfcjbEpWIvw/mGcHZ+K4FUle6q0L5HkFvw9I=;
 b=S6ZfSNrsM3NGvEfFpL8zV+NI3XcPuGn3V6sS/fxMPNwP/R4ZANmaCOAhhggX12DOan9a
 j2rEAMkcKX8X72+faErSBB6MVJH9C50XMPBRw6Bab28zFn1tkV4pc70jxP2rfkz3JXn1d
 2SungIPmbEnTvy7HTspZ+VZiaXVeXYPp4xxkj+diai1514q8bvDU9r7l2zBlrFXKKnhME
 ieD1/zHkkPPr9/BZb8JRrCg+6QjAaKq8/ahIFU5PaGanFwPKpl7hwHqqCSSd5wE0hSvD0
 p1dFnDF5lhbYVkslHXNBmOfIrqVdWcERygozzEJBXKeO4YDfTzErQrwrQep2VXuzGCg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=Cvy1ULZ7; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Cvy1ULZ7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE82B4060A
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:33:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Cvy1ULZ7WWRRVm2i/RiI3wgjVdRFV6IlmFETIRHHAt2Tm45aIWoOT6aYNmN4mqeYaOl+RU/k5oYcX82SKPiJuPK1+U1AJwznMm5trhaf7tkcYxd+3NFGzL/oYGrepj7upsGnzU/+8l6ehyH/ARuea//CafREuo8npkf5wQLwqusrvK9anB29hm4H7Ad6grslzm4gxsGwCd76eICMMSnQAx+0MxHvzTEUkuHPIhOzmpztyj/OLxS0oRosQIWFCxNlhJ3BqnMOknyhojmDlQbuJxX1GbDKaWbSMkjvkruHhM0UT9TnlRY4iDjw9/VfuCGehIKlMGIh1BJvx0ISdXWA1w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=tBzfkfdm8UmQKYYzQ6KsjFAp5wlGPuB1Mc9gKGej9jw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 208790943; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 15:32:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFvXh-00000009ESa-0tay;
 Sun, 11 Oct 2026 17:32:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261011130904.3449631-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 11 Oct 2026 15:09:04 +0200")
References: <20261011130904.3449631-1-bernd@kuhls.net>
Date: Sun, 11 Oct 2026 17:32:53 +0200
Message-ID: <87bj908d7e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 4.4.4
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

 > https://cmake.org/cmake/help/latest/release/4.4.html#id4
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
