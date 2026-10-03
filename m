Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E231ECA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A15CC40B51;
	Sat,  3 Oct 2026 17:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVee9oJf1Wkm; Sat,  3 Oct 2026 17:49:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D6C7240ADF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791049757;
	b=G4DA1/xXyi1Gqqc4ptjAgP8Th2MJMcwx0GSYbJeMhD2+I/We/ctBXfWxfrXGCIMDQuIV
	 JbUhUhPJOvJ05HfzUIgeaeFUOYMcK5eZs+xvI7tx+QPGbfJf1oOmW26LFKwv1ClCOjVxL
	 dNHQtbG8B5X0o0zIr5gpN21i0sCU2NDVk+iijDQUjRvZrPtqRDl5qhD0dx9MzSmmen18z
	 xwMBbNQkwHP4UlM0vM8BUWOSwBT8sQ20DmVNQ6qo/+BXG2vI1paWnMClqFLv+ExnBMjEZ
	 sUJ5SwQNJitpZkFQOronKE/xmswpi1vcrstm691fglEZkF/hkxDYdVdoY0h48fLFsPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791049757;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5W4AB5GU3H/loEF9XOZsi6TKe+OpwbuALsgmTUaGBWI=;
	b=YOUFIk7OsGENTQDyiGxRBV5R6yHou3hE9sYZFbpcC5+2QYKYkxyzV3ExVGHSePmr/alM
	 4PKtgN+h4QuePcbm4EkIi9B0glfI2wrfpj5YxdTLiPnfFTqTDI9h/Np/nsb7idC4n7Aml
	 kG8jw96k4wBftb9xWwVoReokrSdlwRjkKEe7VfXj44O4pWH3aEHZvCEXEqCv77c4IDAOD
	 avhr+D3LrCZziwWf1rUwL/GI7rdbfeBf/dYVF01dB2mOO8c5QlTUapO027WwlJY6ewpX5
	 2ch0lINxDjGnTkGeTNmVg6GvwJh29xJRsBG5fz8UVxizQczS9srtOc+FumOJtzA3Tyw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791049756;
	bh=5W4AB5GU3H/loEF9XOZsi6TKe+OpwbuALsgmTUaGBWI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=F9ncc2Bz5wRhYlz6wk2/jcEIqMAaLLX7bH/a7jCp6U6z8F2NxngjDzNXJ/Ips/cFu
	 gQwAGfdyWbuY/bf7tDI1uFL+Bcfqowv2+5S5UE+uWhqh8pFa7hapxpESlSrjKbeoJV
	 1+lRTjOeVrSMuKuvIuPbG4LQ6QJndN3xsQS0mYApQswKp01ILUbXUmnPHeGSrrOuVa
	 cqkxohhEaYY6czgtrmgFK2vS3o729ks1FnPFrcReLlXe+ZAI8WN+10aDOvvo5W7Ga3
	 zYFmhimmafkzGZZkAp0RYxv6X75XwYbT62DSesUZdQoWdqBDO9JK6D7S/+mdZAUjve
	 BOOM2J3UQCWZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6C7240ADF;
	Sat,  3 Oct 2026 17:49:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7CC81D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A99F540ADF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqKzGNUl1G0S for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:49:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 32D6040AD0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791049754;
 b=qA1vQ6aerXPTqWDnL7RSnrtC6hyr3V2woFtYzyjXOC1IikNNZmhWnmDzhAEV1Qb8ukRA
 wHwBIeuU4OveIb83cbHHoLiGOyEKpH/HvUUjpg5xIoVonGEbpO5XfR5brpoFjGQSHkaUt
 ec7tlpn3P9AtTlWLSDiTMZn2evQoArSWCZx+Ir21aKyhc5R9eo2/QJpynGJYy4+0swMt+
 D5x6jI1WAhrg8bE6pxCTGHsVG/AcyAIbV/75vqA0JxqImKE8j2xDmg9mO88Jdr2wf2kig
 qMDm09300sq1ZleUaBCC71eFPc2FpRk+10twWd8LwBvDAAphnm4SZfyOFVBLgQi0iPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791049754;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ngUuuWKbsIeGtzn1ygVBxEmWcJLMXofz00dQ+5+HuLg=;
 b=MPkdVDI5Il+ATW8v6N67bC9JLx4YA4NFEIhVfQvNcaBSO+I3O2/Z0l0pyBPGMqcSTzlo
 z1XmYcNeI7LHCDn8ceG1y/AYA89ddziXHrsriu6EBi6WDg61TxkVLUGP5iHk9k76kbF1x
 uoi+fz4wQIU1Lrs1WXLwPA6yB+JaZV+9zH9w/0HiRvuPx1aYOxSnkVzdWc2dlsVuNFqDZ
 yLmeG160yKjLRsYpbkHSQ++SBtqOsqfJyhHmuYI/9eGm7yBwih9epY79m9KsSzgIJkK0S
 kQf+Iqr0G5JF+3ibTkWePoXZ6FgWtNZOq2LFs7M32XjVHC46uVeFGwyT34az3L8YDZg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oxN+RCgS; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32D6040AD0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:49:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 848A24E41138;
 Sat,  3 Oct 2026 17:49:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 446C4604FF;
 Sat,  3 Oct 2026 17:49:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BD87210328170; 
 Sat,  3 Oct 2026 19:49:09 +0200 (CEST)
Date: Sat, 3 Oct 2026 19:49:08 +0200
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org, 
 Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <asE__QNwC3fjP1V1@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-30-bernd@kuhls.net>
 <arre8lj8jx80KDcF@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arre8lj8jx80KDcF@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 29/82] package/poco: bump version to
 1.15.3
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

On Mon, Sep 28, 2026 at 11:42:16PM +0200, Thomas Petazzoni via buildroot wrote:
> On Sun, Sep 27, 2026 at 12:42:07PM +0200, Bernd Kuhls wrote:
> > https://github.com/pocoproject/poco/blob/poco-1.15.3-release/CHANGELOG
> 
> Thanks for the patch. In this changelog, for major version 1.15.x I read:
> 
>   "This is a major feature release with C++20 as the default standard"
> 
> is GCC 8.x as the minimum version still sufficient?

Any feedback on this?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
