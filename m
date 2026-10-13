Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05898CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 13:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D7D6073F;
	Tue, 13 Oct 2026 13:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZ4VNq8MRyej; Tue, 13 Oct 2026 13:49:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6F713606B6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791899396;
	b=SwmdAp438BpGeGenF2jBhhLrlY6YJg+/m5+gSqlAJi0QDc/pIwsUwcjWWPHmd/MOvpNG
	 8JEpYJdNz2KTq6e75FNrji3Fawpghw1b9GEXteGtKgRLV2e5+2eS8hwSGf4WZ8f3HYVts
	 OpwhFKK/rYNx6p7Fac4Eerw6yxdscfMfx+fyiD+859FxS/YKE2FECXTImJ7JAYulb2IL2
	 N0x1kOMEvokloXpXno/Q1/w1w8irkCGwiwst+ZwUj4gHF6ssc91Br7+IE8vOgDURTTkJw
	 lzZphtWo8JG4DgE88rERgs8NNCK1ukc1QZbB1KZ1icKGwHPdNjoZ20VXHp7MGy3AgZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791899396;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:CC:References:
	 Content-Language:In-Reply-To:X-Originating-IP:X-ClientProxiedBy:
	 X-EsetResult:X-EsetId:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=2J5rjFcBFlU2NtHFbRwXh4SBnaeXLubkzVljVBet3pk=;
	b=VcuakQyvRhVdT1Qk64KoDB6EkHZJmsrK+JSGMxV/Dye3ZFmTdmMxeWGaBYaYx706/ijA
	 PSLVuIshEh/GISwZflmQxCk1Fs2kz4BYYLqAvi4bUjPpsls1DdjoC1iCJFrNB6D7B2D+s
	 fKVurYRKrSSqB+likGZVQ3qclTwrel3gFReiaGzi/ABhwSpBeHhqThM9zpe07ohvdM6wF
	 utX2fLGUoeFt7I0Xq3ZFT0lNcBc88V5QGRiYBeL7nrUB5w3YuqVNiaF20+lU4jCRNNHRa
	 OmczrjJrBmPppz0wAuYo7ThTq3ijPVqGrjYGoSudAM1dSKTPYl3X79vFDoBxYGxTfjg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791899396;
	bh=2J5rjFcBFlU2NtHFbRwXh4SBnaeXLubkzVljVBet3pk=;
	h=Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gFz2FtYiriMaeWDnOb1mzf6RRrnDwKRQINE6djRUdh82f25m7CVUY74vqv+fNaGDk
	 FaH9eTPfcGZsZdUefQj/zIVgbrtqE5T5hgbe+TAIF4/iXM+FmQbnrMwVZyrG9q49g+
	 gqvHEqgzzlljgE3VjoUAcN2Cib3IFXSNqzWy2mc5Yf0zKKmxyKsfalEYdUtKmsf2Nt
	 gSCHJPO/KoAzgQZK83zoWXUEQFC5QNq9B4fr0lftBm35eMjqAMXS0N2ueCFMJOyOj0
	 G1r/S2cVmUAEGyu3rmJOvr8PqgduGcqef/riXckzPoVZG/WZxxk2SzFzm+pzAOZrKm
	 egCN4L1nXBJfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F713606B6;
	Tue, 13 Oct 2026 13:49:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 976DDDE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 13:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CFBB40517
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 13:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NP1x4C8l97o4 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 13:49:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 535BC404E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791899394;
 b=ssexkccs6dwU95RZpmpGLnL+q0TQjCXwH+iE7/5g0e3MkdBpTh/Sn2EMkvBJtY5lVpxv
 Lm5YuTegaQGmuOCXxhIEGrgpmceU2rxo4yz86jjpTUN53PrfynnesMjFLzZbuVzGBxb45
 muHF/n+cg9Ti5fu1XXlk6duiM3tIJbuLwCzDROoux6JGCBBJGbBI3e4W6qNNHCwyVMC4M
 Y7P2zr8r1TfNVw71O11hsBlwoIpnDhNh6WFZUzD/3W2uFhmno8ovdjxc+CuNAzE/Rw5tN
 yJ7lG+u1h6uEQORQQrz58E0Dm9CrtFhM8ZEmR4XOl4XDuU8+abA3bl6nwZuQ+SB6B6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791899394;
 h=X-Greylist:Received-SPF:Received:Message-ID:Date:MIME-Version:
 User-Agent:Subject:To:CC:References:Content-Language:From:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
 X-ClientProxiedBy:X-EsetResult:X-EsetId;
 bh=NZ6LcmDgblvebq7WBgywNH8cd9O2CGQxZPRroH0iBRA=;
 b=V19JvGz3uStBcLMx3OXiCeSO6SSEaY6f6PuDbsTGNuj7ybdatTRNeRtN5BWS/gW6esKm
 T/iy5XLRdLWcyNTPZFDTuL9Yu5l5pF3G3Cjx6R1hCs3gIvkP7y7BavHKgLUUnq1nXCAyF
 nyAjzRuUYJtu/RJ/meQqG+C3XiBf02zWZQ/T388WFmUGIjOyGOSYC55Au/pF2aAcYoBc0
 vqh3h3pXn0tX1mkI/lsZRD8ldvI34XTIvn6IyeQCV2Y8JSo/LBK2U7fZn/DdoeKW+pvRp
 e8zDOv1qf+U35HR/kYVAZe1I0XORcb8oyb++jMse+IAdTp044wwK5r0+3LAk88bmv9Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=actia.se;
 arc=none smtp.remote-ip=212.181.117.226
X-Greylist: delayed 303 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 13 Oct 2026 13:49:54 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 535BC404E8
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 13:49:53 +0000 (UTC)
Received: from [10.12.12.95] (10.12.12.95) by S185ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 15:44:45 +0200
Message-ID: <90acb039-68fa-449f-8210-cc7887fba92f@actia.se>
Date: Tue, 13 Oct 2026 15:44:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, Neal Frager
 <neal.frager@amd.com>, <buildroot@buildroot.org>
CC: <alistair@alistair23.me>, <stefano.stabellini@amd.com>,
 <ibai.erkiaga-elorza@amd.com>, <luca.ceresoli@bootlin.com>,
 <micheal.saleab@amd.com>, <yann.morin@orange.com>,
 <matthew.l.weber3@boeing.com>, Matthew Weber <mathew.l.weber3@boeing.com>,
 <brandon.maier@collins.com>, <brian.j.wood2@boeing.com>, <ju.o@free.fr>,
 <stewart.hildebrand@amd.com>, <thomas.petazzoni@bootlin.com>,
 <arnout@rnout.be>, <romain.naour@smile.fr>, <michal.simek@amd.com>,
 <romain.naour@gmail.com>
References: <20261001124057.1941988-1-neal.frager@amd.com>
 <ff2b41ff-0c2a-44c9-8938-cb39cfb5ca7a@mind.be>
Content-Language: en-US
In-Reply-To: <ff2b41ff-0c2a-44c9-8938-cb39cfb5ca7a@mind.be>
X-Originating-IP: [10.12.12.95]
X-ClientProxiedBy: S185ANL.actianordic.se (10.12.31.116) To
 S185ANL.actianordic.se (10.12.31.116)
X-EsetResult: clean, is OK
X-EsetId: 37303A29379CA95B657163
Subject: Re: [Buildroot] [PATCH v6 1/3] package/xen: add custom version
 support
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
From: John Ernberg via buildroot <buildroot@buildroot.org>
Reply-To: John Ernberg <john.ernberg@actia.se>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

On 10/12/26 12:01 AM, Titouan Christophe wrote:
> Hello Neal and all,
> 
> (replying to this first patch, but the comments apply to the whole series)
> 
> On 1/10/26 14:40, Neal Frager via buildroot wrote:
>> Add the ability to configure specific Xen versions while leaving the 
>> default
>> version unchanged to avoid breaking any builds already using Xen 4.22.0.
> 
> We brought this topic to the Buildroot developers meeting this week-end
> after ELC. While there was no strong argument against merging this,
> there wasn't any in favor either.
> 
> What was agreed upon is that it misses a justification for doing so, ie.
> what is the actual reason prompting for this feature ? An alternative
> could be to package these alternative Xen trees in a br2-external, or to
> use OVERRIDE_SRCDIR but there might be a good reason for not doing that ?

Our use case is that we receive a Xen git-tree from a 3rd party with 
additional features implemented that are not available upstream yet.

We currently have our own Xen recipe which we need to maintain which is
a copy of this one, replacing the download bits.

We're not using the qemu parts however.

> 
> Moreover, Xen has a track record of regularly breaking the build and
> requiring manual tweaks to xen.mk. For example, since Xen 4.20 no longer
> bundles qemu-xen in its release tarball, the bump to 4.21.1 required
> adding a separate qemu-xen package to avoid downloading submodules from
> the internet during the build.
> 
>> To test:
>> BR2_aarch64=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>> BR2_PACKAGE_XEN=y
>> BR2_PACKAGE_XEN_CUSTOM_VERSION=y
>> BR2_PACKAGE_XEN_CUSTOM_VERSION_VALUE="4.21.2"
>>
>> Add to package/xen/xen.hash:
>> sha256  
>> 9c5c2ad0b4ab86ddd378f60ecc5b1ed53d36b436249ba27c86831003e1281fa3  
>> xen-4.21.2.tar.gz
> 
> Additionally, all your patches mention manually editing xen.hash to add
> a new entry, which somewhat defeats the purpose of the custom version:
> users could as well edit xen.mk to chose an alternate version.

That looks like an artifact to me, it also works to place the hash file 
in the global patch dir.

Best regards // John Ernberg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
