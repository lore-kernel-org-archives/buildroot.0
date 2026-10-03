Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDD5CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53B0A606ED;
	Sat,  3 Oct 2026 16:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rG3EWzso1pzV; Sat,  3 Oct 2026 16:31:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 71B6B606C0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791045070;
	b=oybg1GmlBNOIxdvZNyCduVYE5zXJptda/B+5apgoU4IOQ3nweNFHdXaw9ZvhbIVbKIHY
	 42RU6dwPeWX/cgRyKyz6Zl5tgjumKRZMfJICExqKmUuF9Z4Z6QXCgHuJfm0g5Hh22pFhO
	 0B0BnaDnivLQr6QkWZtkvFMnEAqU2mt0A6MxGSkoibiXd1ijr13M8kfEDg4tJ15ZcMRU+
	 4oBuoRlBpI9yUbcWGcxWrtjWemlTGUOfF26Hu0CsUtMagvA9XYFbU1joGTcarGRPPR8y7
	 3qUwKSsGF+Y631/INplrXUSVWZRO3OeGGEULnHfQrfREnAlLMt69aqBYJ3Do1JXFpgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791045070;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sx5iWV58vt4YXWTtliZgWF8G6q/7Q8eknJg5zuOgH4Q=;
	b=PplEfMMXrIY24U5qHegva6yvK13LtjfdtwnHROao6ybTD5Lo3Dhf9OIq09DnGapfmbK4
	 HouJmwbGbEvqp7nUIGXZUfth+ppFyNAQewHYMVAaeJW1d+1qK1D/cc2UvKARSzYqvPbyT
	 5y6vLjgJr+QgQoyV/BWU/IWZPUKERrYW4boH4v2fhoQc/sc3A4VftLoFx/lDZ2iKIxlao
	 sRCPbf1NGWV6LDnsH2jkI+x3ZT32sSTj/KNEirSIaYfwIiVtJmF4lFVnNJdcFYMDsX5RT
	 OhvI6UoM/C4d/I4GNLj1Ua0a85RsmT2uje2JZZRX46J3uB9MA0ehssotLoz/Xy4o+pQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791045070;
	bh=sx5iWV58vt4YXWTtliZgWF8G6q/7Q8eknJg5zuOgH4Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CzIu1wsZjJdIBT6iHYUA4lqRAgWzIoAiUxTPkS9+Ck0cU4Y+Gtysr6nfvNjjcfAXi
	 Qz4JptOBHefIsnPBLbq7zq2tGVm+o4jVaohAx9QwpnPK7ivyNjKZrIboSExIEbsxi0
	 IET7eLkj+Qcy53TBFoWqvMvWh9N/P4iKmaoiZjdWQp2hvNdbcPheFUlpxRoG8LcGuJ
	 D6B+EBV8LF7IE0ColgevnyUMJrtYqITq1tF4zdJQKsGjIdjLj9iN7JBsHKk5O/KWWP
	 aQQ4ZN9oopGwR6vQdh73I6PGwk0DwsT1+uAkH2npTPQ4kZk8IYWTE9n4fVekDNWBqM
	 zyTgEC/u4grYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71B6B606C0;
	Sat,  3 Oct 2026 16:31:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E772E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02B6140BFD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkL8UbnCXCcA for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:31:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A6A2F40BF1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791045067;
 b=eVtJwsLg1BKX2V/oDOt1H4IwhRFOkCXwuNdrzAdiIZm84r9g0/NI0ZYI7q6p/uDRPr0/
 kuR+DllT7rCSYfUuI7jqGf37boV/lqHAh2Lqlsz3vyh6Kpr3V2/nOtNJCnoeZLM8VGQ9d
 deOSK7qnz+t6l8OKNV9ET7baEh/T1zF3ZcF/9IlJ+wl55Lokll7P2gR9kXLhCsewWgafn
 5d1E98eiLM/C4OBpGtsbAGflp01ye0Fbh8D+MVFtvq0/z1gzNPaJG0Mg0D0OqQ4tMlf1C
 I+/tIteQcd5Z4Gsw0AmHVk8QpRglbI1Fek3UtxPwzRWlLTGs33UhEtP+oV8HW+OSjMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791045067;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=fROTe1rIYC+1vLXbQBnVTifOvWJOEOQT/haHskWxFUU=;
 b=HaT6Ukbf69GUvVZL47McifclWSAXwW0XPumGDfftMTEaE075lYBKeRjigZGWOu76nSPB
 jDy0k7Xb8reeVISw2pn0boEnOzLKgwfm7szjV1+fzoe9bpAQy+2k8cTNvnhSTgPJekbF6
 5liUN++V1+SzfPPv2FhA9BY9hbsoSI5WNRx6j9sIvEU91/omj8yZMEMQ6DM8d4dmyey+f
 sAQbOU52WLPbES6GnmudVdifLCK/+j4gmM6za7VanLtm9h/IHeUx5K0GcSDA8t5pmtsbA
 JKzRUxjeTWov2dxbrOBpbIm74gsdAE0EsKKdyh6iHrb56op3Pa28NFVqqUlFaew81Zg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JR4L49R1; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6A2F40BF1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:31:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1F0981A1108
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:31:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E4E7E604FF;
 Sat,  3 Oct 2026 16:31:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1732010328170; 
 Sat,  3 Oct 2026 18:31:03 +0200 (CEST)
Date: Sat, 3 Oct 2026 18:31:03 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
Message-ID: <asEtw61UbLFXZVLm@windsurf>
References: <20260918123409.22775-1-fl@n621.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918123409.22775-1-fl@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] linux: fix pahole discovery when
 BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
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

On Fri, Sep 18, 2026 at 02:33:37PM +0200, Florian Larysch wrote:
> Around Linux 5.11, upstream started introducing checks that execute
> "pahole --version" for feature discovery (e.g. [1]).
> 
> However, when building with BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE Buildroot
> only lists host-pahole in LINUX_DEPENDENCIES, so it isn't available for
> the configure step when using BR2_PER_PACKAGE_DIRECTORIES. This results
> in the host pahole being used (resulting in host-dependent behavior), or
> no pahole being detected at all when the build host doesn't have it
> (which will then disable Kconfig options that require it).
> 
> Fix this by adding host-pahole to LINUX_KCONFIG_DEPENDENCIES.
> 
> A similar issue occurs when running "make linux-menuconfig" and friends
> because PATH deliberately gets stripped when pkg-kconfig.mk builds
> x_CONFIGURATOR_MAKE_ENV. Explicitly pass the pahole path to fix this.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=5f9ae91f7c0dbbc4195e2a6c8eedcaeb5b9e4cbb
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

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
