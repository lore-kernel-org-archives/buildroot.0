Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E80FD26D9D
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 21:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E357E60F30;
	Fri,  9 Jan 2026 21:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8wjAKdqC3BN; Fri,  9 Jan 2026 21:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB3F560F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767994636;
	bh=i29VClT/UwpfYDTSnqy7QYXb0IsjrpgrVwOZ8I3mHr4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F/YgIidoU7wSELA2vz6Y/1BQ91sXll7J345pX8uqhHrBEIJyyxVdVD6nj3z1zO1fX
	 ZrQNlnzR2m0y7Kx3nKe2yKSurT7sICpAXotr3D+ItzNPf29bZnic3ZFfvkNqWcjTVt
	 6J/qnWpaD2Dtwxy9C8eOicD4F8exP/JTXoHMNBZB6PJ21kl0ALb131I8owkYQVHU3P
	 HLBiYRB1jpKfqfLm07AfVwchsA/5uPh9lTCawl180CAHxzKjD4YEVhSGW7mtwD3AU9
	 aa4Ps+uz8/4NODKMeXjnIz4M3NEQOYpTjSur2vI5th8oZ8CzxKF0KMr6qo/kvrvjir
	 osvOlfp4yrsxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB3F560F26;
	Fri,  9 Jan 2026 21:37:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47777131
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 21:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E2B240CB4
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 21:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHduECV4lDK2 for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 21:37:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F120140CB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F120140CB3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F120140CB3
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 21:37:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 84AA819F5A5;
 Fri,  9 Jan 2026 22:37:07 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Jan 2026 22:37:07 +0100
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 22:37:07 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Fabio Urquiza
 <fabiorush@gmail.com>
In-Reply-To: <20260103190259.1904724-2-bernd@kuhls.net>
References: <20260103190259.1904724-1-bernd@kuhls.net>
 <20260103190259.1904724-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <7e17169896257a406e36e3caea1c06d0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767994630;
 bh=efTYwHWQqssMQo7NNu75ZSTLgTtL6ETH3XKJXpexdQ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tI1LM1XNAw8RUQxRj2cnWFqVAvBuedpdvMOFkPg2Rxsw3mwD3NxxwZhUnNmsRLlLi
 CzN4KHVvCy3XVR/9gUW3VtxwmBqT6NCxCun/Md/mUPIHLHopw4IxOFRoQioMrArBfA
 zgy9X38qq1AVpOGoIahNKK5NphnMhpA3GCBSZ7eOSzDSyoWvQ/A/r/o1jFK6WTVERW
 H8e02CymNeZTSi8mNUpY8Tl4wwTIEVH7dePNIPRp3m1iNYMfZxedbCXjvh+3cX5gZs
 BjM1uhNqrmMshgLu/3MCU67Ll2HTspMutef93Eq8TzilBbManJaERtW64uWfKIzN3I
 13nxLeTSsB2FA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tI1LM1XN
Subject: Re: [Buildroot] [PATCH 2/2] package/bitcoin: bump to version 30.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 03/01/2026 20:02, Bernd Kuhls wrote:
> https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-30.1.md

Due to a bug in version 30.0 and 30.1, the source archives have been 
removed. See:
https://bitcoincore.org/en/2026/01/05/wallet-migration-bug/

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

So I'm marking this patch as rejected, and I suggest we wait for the
version 30.2 to be released. There is already a 30.2rc1, so this version
should be released soon.
https://bitcoincore.org/bin/bitcoin-core-30.2/test.rc1/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
