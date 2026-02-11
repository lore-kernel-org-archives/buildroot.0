Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B28EECD6D6
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 20:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0BC18401D;
	Wed, 11 Feb 2026 20:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9nvZnOXm-D2; Wed, 11 Feb 2026 20:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2540A84020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770841100;
	bh=qVFjOVZG8xM3r/0lAu4A/1xBFDgW1QKWAqeec0YDuXk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PQB+KaIL+Ow0oo6fvp1PvMaNO870ZLAFxTcPPn6EPCG6+GvTJjr9Z7AkkFQm0e0YB
	 j6SkztiqgAPG7WZy+Oz6d9cgoCgYPP1TL1FxXIKtzNK64dGTQAYglV3temvRtF6bCA
	 VcWsmozwoohOPewR4B+O5jYkQLLtnpdXcc6RNl2bHp5JVbGf8HhK59FWskpgvvyjlD
	 eKjEu7IOrKdAxP6kByX++nDNVYvDlkk4S6Dm52h+3bLgFt3NA93GVsW6eHn9ZA8pep
	 YUrAq9mlZjxW42W1ECvCAxS2xL17ckZEKy8I5jj0ELEAQyQrlPXuqi753FykderrZH
	 F2V690CNciEmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2540A84020;
	Wed, 11 Feb 2026 20:18:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92AC023D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7702784020
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5F6BxcB6CRu for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 20:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 804E38401D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804E38401D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 804E38401D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:18:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CB493780505;
 Wed, 11 Feb 2026 21:18:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 11 Feb 2026 21:18:13 +0100
MIME-Version: 1.0
Date: Wed, 11 Feb 2026 21:18:13 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260211163422.987611-1-bernd@kuhls.net>
References: <20260211163422.987611-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <e9de63f3f853773ee3e3855bd1f13b94@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770841094;
 bh=T6YEnJ0thGjokSz/6W09xAx3cgBv2PPcOj9K7fIWeBA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=byhwdLYXJ3b4IZ7EV/V4a81dL5wZjpluQdbZs+MJn9aLofCbANfSxFocpPWoqpCjv
 r981yhvc3k62ftjax7TW9WBZxXNskGy9+JIk3aAvW2QpPWkSP6xpAapORPyuAWUwR6
 nvqOKt9ns7pP9yfI4tFbkONn1lX/n8S4YcTDmOcqON1DRyKgRlevbzZib8RtNXpU9/
 2fI1+NpTDEtUah5zlXYY+rjYCmZHB1E3SxjCnX85VwLxpXvBHxXH3c3K8oARU0DDzq
 jqexvoEKsobrs533no42Oz8UpW+80IfpsT1Lu82lY/CpHiym81OStc9OClIh1uwNVW
 DRZIg73X5gVAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=byhwdLYX
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.19
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

On 11/02/2026 17:34, Bernd Kuhls wrote:
> Updated license hash due to copyright year bump:
> https://github.com/strace/strace/commit/4d6755b556fb00fe5c33b09b08f951bad956c580
> 
> This bump includes two upstream commits
> https://github.com/strace/strace/commit/bf9384561f295340f85c69deb307740fc9dc28f0
> https://github.com/strace/strace/commit/822b5e840dbf4a80262eaea455d9bc7b6a00d245
> 
> that fix build errors introduced by the bump of linux-headers to 
> version
> 6.19 with buildroot commit 566150745bf61fdc1aee68fcf319bc4e8942960a.
> This bump is not included in any buildroot LTS branch so no backport
> necessary.
> 
> Fixes:
> https://autobuild.buildroot.net/results/7a3/7a35bfcae87b1fbe1d6e0c4271a364ce330c1d51/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
