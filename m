Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30401C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E654980E97;
	Thu, 17 Sep 2026 07:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZVu9Q0uJvQH; Thu, 17 Sep 2026 07:57:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 04C7080E1B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631863;
	b=q5UTmZMlR0V9v0rg8zR3FB/yeYNfVwpPZZNieRcLM+Z809KBIEquPd38mtVItEs94d6S
	 Ir1/2awlWtay7wJDod/YD/J29Sl0Wt840okn5a2Agh/j0Rt/ZWctHjAZLslhHT0YUeHbf
	 nT5kFmKusBH1QqLXjPh6G4ipM/rYxBdazWTJOJxDXCIyiLskhHD9Er09ZclXBaDvD4luv
	 t9uWlkm2SSkCwoGGK9agikzNRLg/8obxCQCIZu1Ras+CVzGB3Lxhai+pqd/qQOx/ogmzE
	 Wvnd7Mvk4Ibt159aQq1bPRvCRBO4ArJ41Nx5Xbfu3JNeJrYMgzqJ6/McqiWp4zR0hrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631863;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VDi14xsmtd9kD6mEb6vqhRKIA5doeH4XsNcyyTLjE1w=;
	b=IavNKSCcyJLmqMgS/AnjaUMvkv96FAPBDs2yAHRHQfcz3BRCnmHjrsTC4luoyK0plkku
	 Bpmt2i5V4f34oM59lhsULbhVzst/O4Iqh8Sr4koRK+j2UqvVLvjHSDGLnbpu+tq9phvu8
	 0fvamw7z4sexV5QKTdiWN05SDk9Ehy3wGqBgAMZiD/Plq0r+FyJRuIOu3vNb1mr+rinTr
	 t0ViZe3UzSOP42opJlEw5oyZj9YkS1q75zKr7u8OLDYbKeDxFqd5x9QupdcnBbBv3gFLd
	 sFSkIakbejfqpuuLIH3Cz0DT7YwlobgNmajaH4c3rKyXls7gsEoJxwSuIzOkosWOVnw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631863;
	bh=VDi14xsmtd9kD6mEb6vqhRKIA5doeH4XsNcyyTLjE1w=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=W63K0EmKK6QNRCIqg/CZ4oAeJm3kfUhKUGA/oOWTaJA4Rh0aWKi8tlsS/HpHR7bG5
	 w9/MIkDlGvTmTLNUwovyoYCul3p6IYK0dWNpP9yMeFo13SU1YgrMGSdyQhasl0g6rY
	 ziqeYXe5Nwl8RlkBvs0kuiIQxNPSpDdQOyS4/vCCRgqzQ8/d5R3YzCQNabTcUoTi8t
	 Hv+oqHsvaHq2e1QZfWNoa5u5E7yO4Nl/h2WygKFXxar7k4e0F0CrfooxvT+fqMc4BK
	 NtVj8aghQllokpYy8uLpfGhdU0EFRlP4/bZA0OOALH2o9BqJzXMmM3JUypGIwg5D/3
	 e5JkbMeoUT75Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04C7080E1B;
	Thu, 17 Sep 2026 07:57:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E3E029B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BACA60659
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBxO9lLEoQJV for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:57:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 820AE60604
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631860;
 b=h1TPMPWLOp0zi4zffGvFVZNwiDKBND68z7TXX10HVdCduWt1vS5XQfY/Hfoo9qzurJd9
 Cb3TvkdL9up+sE78IC1t7DcNJhgkGQLO8q6Y8ErJ52TOJNjHfHkSlZwErR2bIrOseENLs
 2DMeNS3lrBFvIbQjkt4/U9c1+Lo+Yn6U2/oOP0QJAVVthVrydVGJSGFPnsD52rJSsYW6e
 RDtjUZxzO9VYpA8NC4hO21zk0SUSbEm3gU5rp7KX4arl8J1x3GgsXwbdZedO0oLsbijUl
 OGy4tlUKrFDIOU4OB7YI5CD2SpZVnOXDNqwL2mhOCVzFMhjGELuts4JPg8zbA7ZE4xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631860;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=dCQzm44iE9QUQnAYX6lBO7PIXgGJZlml+GH3izhlhTA=;
 b=AakxS57XtR0sLKI64FObM5uwMjnzN6uOkFNwGZNpgFcr+LWCFDivzH2PSpCKYYqAPQYt
 XEiXeBXnyC+i9yhEIlvggnAi74+rHhPb55KNWaykhkal7HjCi3V0RDptoeyIMinUoxs4e
 2GZURF3JRHb3p6d3vmPpLMBquTqh9bJfUh+gti452SuBMmcFCzbcBZ1UVgtjm3Xr+ZLPB
 i4FtI5/eET1wRYgmR3mqrg1UjFH5lTguJFeSwlPuWojXzt7staIDPMc9ufEf12XRZNWGa
 uJxlZkES7X15KjJw1OIHs/+trCAFEfPVh0KpksgG6DRUAS14QVD6Ow3oBFXNs1NSkAA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=KTHXQz6u; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 820AE60604
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:57:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 74989C63440
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:58:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2B46B5FAA3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:57:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9918E11C7B051
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:57:37 +0200 (CEST)
Date: Thu, 17 Sep 2026 09:57:37 +0200
To: buildroot@buildroot.org
Message-ID: <aqudbD18eOSl7Vsb@windsurf>
References: <20260917075128.210AB96AE1@busybox.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917075128.210AB96AE1@busybox.osuosl.org>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [git commit] package/lttng-tools: remove unneeded
 patch
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

On Thu, Sep 17, 2026 at 09:45:41AM +0200, Thomas Petazzoni via buildroot wrote:
> commit: https://gitlab.com/buildroot.org/buildroot/-/commit/feb628adb03c6df435753a1dc84a336ff7ff9ec8
> branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master
> 
> Upstream added the configure option --enable-tests with commit
> https://github.com/lttng/lttng-tools/commit/6ba949601d077c90e736fcce4e722487c56a09cb
> which was first released in version 2.15.0.
> 
> While bumping the package from 2.14.0 to 2.16.0 with buildroot commit
> edd3a015cd90441291d2b5513c71e2eabf682e24 this new option was not taken
> into consideration. We can therefore now remove our own patch to
> implement this configure option.
> 
> Renumbered remaining patch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

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
