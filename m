Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87C3C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F6F281330;
	Fri, 18 Sep 2026 19:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUh00dsTkkkV; Fri, 18 Sep 2026 19:39:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4418B81325
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760372;
	b=MPaAEQOj8JsRD78PxAN5ZY1uJSCTCljUPRa3tZsD4Q3VKQUwtieLbfUb6a8S/LLivAu3
	 XH9lWBJvKikNvxCl71fqtViFP6NRR88MjbzZRywTHAGaDLD1yF3PALF2Or9dVRTqlzP5i
	 9vVRHe46bgkjVwyJ7YCMh+5qpYWipXP3YR9EBmBq6PPbDt8YAaG1hGQc0xKbPG0LGBT7R
	 Pg2KCJ+hubvUbHdA+3JMsPEmBrzYp8wls6fuW1EcbNIWvp1gxcxmKM6YY4Jrn3NdhJRvl
	 vsZaTns7den8tImjPWPbw2ZIQZZr/grDpTZgcxsJxzQdduYbib1LqgUr1zF7g6ymTSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760372;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+hAfY+nybP0aQx/LqabqhEwt2t5P1n05azon14/CEoU=;
	b=O/5gEGRb6mR+7SGna9dknDfrLxwtH02s9IslegALkLntpBYlBMfOEN7Ybj2Sl4VfMHnW
	 MTRDba9uhfd9UFjlEE0oDyIUMKKRdPWDRn0etzUCh8hQD+DcVuRzpf3/gsE+AV4AF4a/H
	 T+IKfbSqk6sjxkfWw/qHiDhuuekTLVtUd+SVtCMI5J9aFeJOySSyf/lGnrFOfEQBm0ppe
	 2N62WpjByXcWZwt549msPjXzcD1FeF4ycQZ5JXhEpgngKmJvA1ChCLQfz9j/A/3f+OR0p
	 jzxbXHDd5p8TRaHrPE3MlbHG5SEqsdjVysGcMtIWIaMH9Um+g6cEuDVsXczCkNCOTWw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760372;
	bh=+hAfY+nybP0aQx/LqabqhEwt2t5P1n05azon14/CEoU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=peFwu6L+f9kywn+clJiIuOHmA87ahj+AEAqj2YWNi5wjjGZ6FCPBhINPltpTjrz4r
	 e6CyCWRQRawPF+uBmxAKSLFcva2hz+bF5Nbbmom3AnpLfaBb+nL5ZghBswY/UmRuMW
	 i4OMVJ8YTbA4V//xsiNrmJw8sS9saKfF/nBzuoua9gWcfQI9Q6oBwDSnxKy7uLWA2Q
	 30p4ZzaoMRIzcpHm7IUw6P7hP4WHTogm2x3tXk07EG6K1H7k4XZuQ13SloENr5jXiZ
	 apu0X5CN705mK9eDucpUD2qIRvh0UB2hZOweVg4rKXK9RYY8xXjdJ5+5tkiiYg7IO8
	 lYcCoq5AaQ2Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4418B81325;
	Fri, 18 Sep 2026 19:39:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14D2725B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF5C9400F8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAVEHSquAlWt for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:39:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6B82B4006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760369;
 b=J58oIISQ8atQcHuKN0opgZzRhsvVvYisxgZyYeSZIOoU4+vnxcSjnSUl2PW/H36qFYGj
 7YaQAuThHv1oBx+10BeE6gzJ1e1O0yR1t5oNvbRpaw3wg1RMmHUCjb6emZj176uic24ou
 ZSpAXqiuyYX1UnMApsEFW3F6XM3boK4XRqSkCYqzWgvk1Lztmw/NjQ5GkgkMqnUjhsQpV
 ODtZDN9vUAVhVM4B6kkuzOFleYnH1zYv5Sxd06CAde4mbigEIizNncxhqLA0NYiuG19Gs
 sK89QQ7HcUBTcXarxcsvII3XpdwJ8kaGBU3E5am40DtEkKAA9h33n7sI5tGpSikmnqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760369;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=/XCGt6ZgYoJ3L65DVkRwqCd58R3ZNmAzRyc5QFR1hpE=;
 b=PbkBNbZ5NECOHfj3eUrDP667e46fNNsWYkaHvs1JUtpwGiHuK2G9YLf8nTZtj/MxeEx+
 GL97GPzmunYyzqMq9QHtpzPIAVGPbt7tVE9CgqwdKdyK7kbej3uIC0WdhLX8C6TAdWl7+
 Cx+G72Z125j0zQe/U52+qNbZp9g/S6nKDSYmL5uNlw7tUmXCIB5NUD/GRrRwaQWwN76ph
 iXWhxZAEZYzAKrhDTLNIpW/RC2NzaR8F6FiYrnHesfbI9WNSToiVzEOUqmUMIum6XyM0u
 ylL2uwpu0Daizh3tOgNyHGhLRhDzguJF4+4PuPhtytm7ns0lXAdr4F1Jiq91bnObphg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=I4IYZ6Ou; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B82B4006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:39:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C5637C58475
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:40:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A6BED60649;
 Fri, 18 Sep 2026 19:39:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 19DE410329076; 
 Fri, 18 Sep 2026 21:39:23 +0200 (CEST)
Date: Fri, 18 Sep 2026 21:39:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <aq2TZ-R73l2fAYTh@windsurf>
References: <20260912111428.1896500-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260912111428.1896500-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/oprofile: Fix build with
 binutils 2.47
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

On Sat, Sep 12, 2026 at 01:14:28PM +0200, Bernd Kuhls wrote:
> Fixes build error using this defconfig:
> 
> BR2_BINUTILS_VERSION_2_47_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_OPROFILE=y
> 
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
