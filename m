Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11D8CD11DF
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 17:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DFCB40108;
	Tue, 26 Mar 2024 17:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Gfu-RXT49h1; Tue, 26 Mar 2024 17:07:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FEE84036F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FEE84036F;
	Tue, 26 Mar 2024 17:07:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FAF61BF37B
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 17:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C93760627
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 17:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEF7R-cTl4r0 for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 17:07:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13CD4605B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13CD4605B5
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13CD4605B5
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 17:07:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 30863CE2266;
 Tue, 26 Mar 2024 17:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89234C43390;
 Tue, 26 Mar 2024 17:06:54 +0000 (UTC)
Mime-Version: 1.0
Date: Tue, 26 Mar 2024 19:06:52 +0200
Message-Id: <D03UH81JULDU.2C8H5T2R9W97O@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Peter Korsgaard" <peter@korsgaard.com>, "Arnout Vandecappelle via
 buildroot" <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0
References: <20240321182126.24115-1-jarkko@kernel.org>
 <20240321182126.24115-3-jarkko@kernel.org>
 <a5a18fd5-6c05-4231-a7b1-a6c1965919c8@mind.be> <87bk719gjc.fsf@48ers.dk>
In-Reply-To: <87bk719gjc.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1711472815;
 bh=3Cr75FA57sDfODRbGF/+qPZahaYAHv6nd+7nTYShy3g=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=IvheJZ8KOBFWNNtogpFHtfVXTyL80YCCyRiS8Da899AvxqJXKHxc6aotlP8sWJ1Dd
 ag/a3bkYtDSam4x0Ox0bl0nSgveIK69F75t9LaoI4Hl+0fX7LxplEnj1321UvktDQL
 GhiXPwcAr3H+qZY4yI1nAAZEgfn/xLjLut2SmiAQNn5FSx2+iPdMFxlwSQ6IjP4LJV
 o3BwV3fiPHRI/BQfJ4QypxK67VxMNc2JHCxoBdb7KQ6lg2sBlwcjptcJD6TUN79hCb
 a004Bb1KPaCvu68PXqnNaEG6rk6Df7tzQbV5tF64ILem3PuQ15s8K6bDuACii/Ujqx
 TOZzt0UC5Rdzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=IvheJZ8K
Subject: Re: [Buildroot] [PATCH RFC 2/2] package/swtpm: add host package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue Mar 26, 2024 at 5:08 PM EET, Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:
>
>  >  Hi Jarkko.
>  > On 21/03/2024 19:21, Jarkko Sakkinen wrote:
>  >> Add swtpm and its dependency libtpms to host packages. These are useful
>  >> for emulating TPM in QEMU environment.
>
>  >  I don't understand... Does it mean that you run host-swtpm next to
>  >  host-qemu and you somehow connect them so it gets exposed as a TPM2
>  > device inside the qemu VM?
>
> yes, swtpm listens on a unix socket and you can configure qemu to expose
> that to the VM with the tpm-tis driver:
>
> https://www.qemu.org/docs/master/specs/tpm.html
>
> Quite handy for doing TPM stuff (E.G. CI) without having to mess with
> real HW.

Yeah, for instance Linux based operating systems have started to use
TPM2 chips for encrypted boot. And it is pretty generic passive smart
card like chip so you have bunch of ways to realize that. BuildRoot is
a great tool for prototyping such things.

And I don't see it totally unimaginable that someone would might want
to do similar e.g. in a home router some day.

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
