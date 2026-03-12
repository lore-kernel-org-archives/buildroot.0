Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E91106ACE4
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 20:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9086C80D15;
	Thu, 12 Mar 2026 20:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5Qj7JSN796q; Thu, 12 Mar 2026 20:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 154F580D09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773346277;
	bh=/2IMvSN4uUlVZE4cCwBCiDGw/Hk5gA3GpWZRnIu3b44=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=goZQ/gFVrA6Su+CxyCC5fBIDpZzda0/kSe6du5F6S1g43IzXix/fj6yP9YR3gbsRN
	 b05tIEnR6YzG2/UKLXA+dUhpvfEwSwhG48m0mOvSqoPLzs+tYNK51AkrURfENdue4a
	 /onYydl77wkMlXfkYIfoaJh0W4HYC6goiu6PlmY8X5L4UT+u3ot/KGpJbSMIe+uibL
	 jMm6tJEN82fdLShg1Anuur8a9nn7qrs8ZXiLEbR+E5nHYctYPSokuWSjnpFX9eKsqw
	 HYo7b2fIbyyFa4HnPLn9UvyFADqsrl9/1AsPGQUVZQjF8bthc1ysk8rY2oKa7iT8y/
	 ruOj2yrDunEHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 154F580D09;
	Thu, 12 Mar 2026 20:11:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29CEA282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C0B040180
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Or-w-hklBrnr for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 20:11:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6131540071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6131540071
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6131540071
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:11:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B357713F86E;
 Thu, 12 Mar 2026 21:11:10 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Mar 2026 21:11:10 +0100
MIME-Version: 1.0
Date: Thu, 12 Mar 2026 21:11:10 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260312163926.3178494-1-bernd@kuhls.net>
References: <20260312163926.3178494-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <9d2f85d6a1e99327c0af078348005081@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773346272;
 bh=qlsxa10FSj3VuNLLYNNsAyFwBiOz880JrkqLuLb5cTc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dkQc129JmgnLUR/KAKb164njK3osL7T0+unNmcZ7ruynIWIy5PmmJF1nvDsQMBVNI
 r89AmeqdwPWL7ZFGPG8IhMBsgARzt070ngHJqsNaB2TRU+wZZ7FkVI8LjHu0nE0nvw
 yQi0Bk7BHN9a9OG/UuxKUJV6TkERpmpXEEnYAdCpn2r0v3hMhaD4uRFq8GiRNWRXmd
 gVgaT8RRWMUKqXyPLgAP6jV8ThdXtpw1ePzv/r6wkLq/W2WaTaWNNjvWzTdEEg3lB8
 UsilyFfMuLHW+nDd6iYndSVeQ2qNMGcyloMP17b1HE0ZyLhWX/xjES9i9HhmiZSeOw
 32kMOu5AI0RQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dkQc129J
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump
 version to 3.8.6
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

On 12/03/2026 17:39, Bernd Kuhls wrote:
> https://github.com/libarchive/libarchive/releases/tag/v3.8.6
> "Libarchive 3.8.6 is a security and bugfix release."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
