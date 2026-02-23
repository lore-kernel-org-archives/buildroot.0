Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BABEC1130
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 20:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A76140A08;
	Mon, 23 Feb 2026 20:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-ofJPiHXvaY; Mon, 23 Feb 2026 20:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A832540A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771879695;
	bh=fLJMeW2SWuGPeYYN+C6wsR1u9UsQfuKpexUuuit9OSU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m00JVVjOEfgnsLti2myRFWVWWEZouEP5sE3igUfyLBPQNOSQ03EX4Y+pLQ2amyF3+
	 TLBaIoIBjOHaxcN5Kyr8C2I1R2PA+4ZEMevi5Q5uyoAgimX0dvjxS/wG1LJbanLqvC
	 wnRWMMI5dsXpv1++CaKj+VKvWPejmVSazHDYbUyfi6XMTQSdquooDOTpF5gB4r/mSp
	 Pb9htqpWqG35KhOJnejUXU8GQz7taTVfQ8ms4+P3o+z63sTQB4U9z8+u91q8F8x9RR
	 lQM51Ot05vRn489IWdpl5cHe7M2HsHrW28FD/ppAlTYEqow9igIwtq7V9bKCruealT
	 /++1pjx9NhUvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A832540A3C;
	Mon, 23 Feb 2026 20:48:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2158D237
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06DAA403C9
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkwKsoQEAE2D for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 20:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA8FD4039C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA8FD4039C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA8FD4039C
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:48:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9C99D2003C8;
 Mon, 23 Feb 2026 21:48:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Feb 2026 21:48:08 +0100
MIME-Version: 1.0
Date: Mon, 23 Feb 2026 21:48:08 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Sergio Prado <sergio.prado@e-labworks.com>
In-Reply-To: <20260222175404.1945211-1-bernd@kuhls.net>
References: <20260222175404.1945211-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <46c1f1af73838ac531c0a901c9506bc5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771879690;
 bh=HIOjTH8cJ7NsZtYCpUcncvgKl3HukWtD5O9N3f+zcp0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cf4dJdYNn4Y0dcKfTRbcwIKncc/ysYEHEAR+QUE3zvC7EbIdlVAHMsztngzqAgGhA
 mQtyQnF1iEz9YmbRVJNcUpZpZXC64IMl5/DioevlTSbk7tVQ5HEWpoj3QvyCwYVFwK
 JIWGa87terNMi9Bk6ne1C19U+GkhXJgZ6CHfj6Jcl65GP3pIrnbCLWsKuwRWTJXHDN
 PMIfNSXcWw3tHCpbutJ3uM88+GO+FVbEIG+NqYft07qVj3hDG5h6TcOqMVVeU0o70Q
 EBcf7HEqk3J2cK58+ANxHIsCZtC5XXES+VEtnAIClUEClEA2yxTpajyrZuS5+/jw+/
 eTPgLwPBERBTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Cf4dJdYN
Subject: Re: [Buildroot] [PATCH 1/1] package/snort: Fix build with gcc-15.x
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

On 22/02/2026 18:54, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/3b9/3b92d275a32721bd2cbb10e15c392054dfd42c63/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
