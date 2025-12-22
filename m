Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B8BE6ADC7
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 20:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E121B60B0B;
	Mon, 22 Dec 2025 20:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30ccex5JiFNC; Mon, 22 Dec 2025 20:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B90C36067F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766434554;
	bh=PydB1DepNLxD0dYTsxAaNWtXFacix8tz4Kmd5iz9lhk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B4rNpnZJsUTelq6mSovgmYzuzZn/KTBCzPdVxkk4jS7Qnoroce5xG9zWT9PS/Ik0y
	 4DJXerqpB2izUX3wcMug2JEewD5j6IhpQqCIDJQgMEDX7gQmwBZTfygMDwITeqDanC
	 nZqXEXqDql94Y7wm/1BMkfDaN6aoXzyoo/2PgFD+fRp1p/yUK1fzbMOaZmoiVEGiuz
	 QLgUxTXLo/EiQcT+Cyk93GZX0I4P7DJv5CmfGo1R2PDH9oHjMvP/aY5QuSuetycXhO
	 giDarw4OZ7zQ7SLt4JgP0g7TQJFveYiQnbT68wMmY5QKHebZqOnv75XO47SsGFJfIZ
	 Hlcau7JQyZvQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B90C36067F;
	Mon, 22 Dec 2025 20:15:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C31A1119
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5462403CB
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RI4sE1YFoK4J for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 20:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36696405EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36696405EF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36696405EF
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:15:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 86A7878035E;
 Mon, 22 Dec 2025 21:15:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Dec 2025 21:15:47 +0100
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 21:15:47 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, vjardin@free.fr
In-Reply-To: <20251215114302.32596-6-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
 <20251215114302.32596-6-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <fda599c63ad69b9290c46983098610da@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766434549;
 bh=0/WeLU4fQlIyXkQOik2XMALLm6izcvh3SPVbo0Va8+s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b9Mml2JbFfTMhsgdjU3Dp+lfnNAP+K7ITCy7XcZkMrZpvhkaQUve3s1ea1sJLD11k
 ra5VKcjzEXmuVd0XosXLTNPveuuT1gdMtYJdXdyc/2cE+vdoFBuTijxl15oIBJb+XJ
 zDP0Q7zrajLDCbZmo6429CvjwpNPQlNHJ7unspin8p97T126a+u+pPH3VsH2Tm/D5B
 beHIYnCkT/PpmOyaxIoO/H9blUo3UUaJ7xhAYQ/WlevQPyNbLaK4rzOV72JQCn+Nfy
 bOO+cKQhGVbzWY0ckD6mOeULlGwkGIm91IKY69gDOeJbKanGXHtf7FOZbR2I1voyob
 1ieA5c9ijq4EQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=b9Mml2Jb
Subject: Re: [Buildroot] [PATCH v2 5/7] package/grout: bump to 0.14.2 version
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

On 15/12/2025 12:43, Maxime Leroy wrote:
> See the release note of the new versions:
> https://github.com/DPDK/grout/releases/tag/v0.14.0
> https://github.com/DPDK/grout/releases/tag/v0.14.1
> https://github.com/DPDK/grout/releases/tag/v0.14.2
> 
> Since v0.14.0, Grout uses the libmnl [1], the dependency are updated in
> consequence. Grout also requires VRF support in the kernel, as it 
> creates
> a VRF on the Linux side to allow TCP/UDP termination by Linux
> applications in different L3 domains. [2]
> 
> [1] https://github.com/DPDK/grout/commit/2eb97af1e8
> [2] https://github.com/DPDK/grout/commit/391f9fa032
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
