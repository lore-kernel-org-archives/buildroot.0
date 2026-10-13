Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4449CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7446360824;
	Tue, 13 Oct 2026 21:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MkFOKi4yu8qm; Tue, 13 Oct 2026 21:12:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 91EEE60818
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925951;
	b=Y93erGmoxQhAYJhae7kPW7KxNH0oSPnShZRMOwT+a12hP0+EkIPTs5lYYgzNp9HzXGTc
	 RxUvhBU39z8hfLvQz0RMDlxdtyZwe7xebvoOWBJoO+Ea9Qpcs+5eJ9lUfS2oAq4kI88tx
	 Z8E9rfwxveU3yup5vrZ1ipf7x3Se0Tr4XhYMB8TEMMlaLhv3A2E7Hh4pGGxPVA/BgafCa
	 llkwLxW85Qk331gXMI+nqGpwvo2O6LBCWc4mQ9Jc8eYAzxANb2Ao44Km3+J7GR09DqKRA
	 MzMOilGyjvqevXVig/shvuLW4SyBLxrBwXu2Aq0msTSqYqniF2SMaGkTby9T6Jq3ieg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925951;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GafNtDISf11BsnsDDsRUpSdCMELR9bOnDyqEHm3Plvc=;
	b=GgxdEHQk8bT1e13ICRhPZn/MOLDFirQL+h2+vHI9QCFV6nNtDfGILEDBrEe9pkr1ZW6I
	 +7Mt9djgokUJZjzSjzVt2xt7kDq91e6L61XG/cztsAICL2NirzajDIPb9EkK7wT7HwQl4
	 AOKLfQRuMwIoUjxWERSRbVlaoXPjFJAnGV526m8Bh/IK1fVhXzage99RVOX5sBVP7CldF
	 OPBoZpH25Tfu1LP1CHZJGWd/R8By2kSphCgaMoC9uaapFdQaAgFG83n0z03+4XNyp9/BB
	 8xt1ReXeKnDmGqn8DcQVhpZe01vL7M5N+vaJDZn/BuZyuoXimUBbVWVLXH+WVMnXMZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925951;
	bh=GafNtDISf11BsnsDDsRUpSdCMELR9bOnDyqEHm3Plvc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gFyD7fdfwErrSMv9cfbkuY5JN99p+lObSg7CJVBKocwP9RfgezEP5ZOZuRGNSc4M5
	 TP8KGh83sL3NS0F3wmJQQEsaDxbzQBfAE9pYr/uDIfDwzvSbN3LK7vTq2Qovl21mxK
	 NLhBBJN7ty59SVTuwYyjCpNhDAmJtLIMahf21btqa6qxb41h6VRZvbL9JD0BDF4E8D
	 KKSzB8cBw3hJYQVCAxE6lD5HX2YMBt69X+zuS84venPvKuaaDtGhN62FW6wmnTk59F
	 y1/rRiDjeTlJ0G4xWNP6p3yDo8Y22vhzaJoAEgvchaq4m2E0ZSg6bzykNwLq0c4rv7
	 epY+mN7VuQp0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91EEE60818;
	Tue, 13 Oct 2026 21:12:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A9CB2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BAE760818
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqtU2sUA5PnH for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:12:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87F286081A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925949;
 b=hQ472R+QHzkDEPVU2VG3ZyoZ9F25hZl8Hgd6QB35QxyoJSStQpSKrG39zw4rMsgOpBWk
 lX/+zRWwWvqXkCKjCBHYIZyB0NtNK3OFEA2b0fQDQ8IBNlZ91psd70+4Dfpzs5f9KRDmw
 +wZjzYfwGSR/+6paHlvGKEcWGCMvN/lmeZSM4LZ1ce8fLbaZgNgFec7kJnISLZAuuyexP
 TRppfXANKPMorpkv3rbcs1Sk4Qy2vvUcV04y/kGVI8it/7nx3eOvUb8WgsRdrxEgobqjV
 5B78clE0upXzbG7NniFnnTnYbMkmuxRCL++A2+Kwqmdvi3uAL6vifgbVr+6HhUV0n6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925949;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=dprxZOH0q73i+F+CXzWrPCruiSLunmpVUdsl2HhM7XM=;
 b=ConhHCVz91OuinyPTq10mr1MMx0Jrl8F8MR464nXUZ7mlFz6XhXMb2I5ekhfAA2ZWb/n
 ZypY8uCwFlnvOqQDSU7c2m+VJ8uH+SDgwnNBfdSGc6LOSOsuZ3vaKuZPbS42fqASpFFk5
 zqnbk1v56lR8hg3UBR7eYJQpbYHdWupAuays4Wq/3nFibNyphDBHC9lj0qaL83k+icvlB
 RLjHfX9CeNoLYL+jXgdW2LlCrV8PJitdmfHJoyNzZhB8v4kzGO+ICkusx7rE54seYSYwm
 KKOTi8sC1zEr3at58zaFdPLE1sheeO31nCjfAnToQttj0yeSkem+7NAU5RwZ4RqhOtA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="ve/jtMA7"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87F286081A
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:12:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 52A154E41217;
 Tue, 13 Oct 2026 21:12:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1F86A60362;
 Tue, 13 Oct 2026 21:12:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6868711D71805; 
 Tue, 13 Oct 2026 23:12:22 +0200 (CEST)
Date: Tue, 13 Oct 2026 23:12:21 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <as6eHGluGeyQ9GSt@windsurf>
References: <20261013140423.1941069-1-yegorslists@googlemail.com>
 <20261013140423.1941069-2-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013140423.1941069-2-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/python-zlmdb: bump to version
 26.7.1
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

On Tue, Oct 13, 2026 at 04:04:23PM +0200, Yegor Yefremov wrote:
> Version 23.1.1 ships a vendored copy of flatbuffers as a top-level
> "flatbuffers" package, which conflicts with python-flatbuffers that
> python-zlmdb itself selects:
> 
>   FileExistsError: File already exists: .../target/usr/lib/python3.14/site-packages/flatbuffers/__init__.py
>
> Starting with this release the flatbuffers runtime is vendored as
> zlmdb.flatbuffers, and py-lmdb plus a patched LMDB are vendored as
> zlmdb._lmdb_vendor, built as a CFFI extension. Thus drop the
> python-flatbuffers and python-lmdb selects.
> 
> The build system switched to hatchling. The build hook needs host cffi
> and setuptools to compile the LMDB extension and uses cmake to build
> the bundled flatc compiler.
> 
> Update the license information to cover the bundled LMDB, py-lmdb and
> flatbuffers code.
> 
> Fixes: https://autobuild.buildroot.org/results/e3b026cb48f41ec531e5bdae9e07b8e581f1a06b

When was the problem introduced? I.e does the problem exist in
2025.02.x?

It's always a bit annoying to have to do a major bump to fix an issue,
as it's more risk in terms of backporting to an LTS branch;

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
