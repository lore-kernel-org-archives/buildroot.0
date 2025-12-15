Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60403D5B86F
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FFD181E2E;
	Mon, 15 Dec 2025 21:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkYhlGE-5tYd; Mon, 15 Dec 2025 21:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A6BE81E25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765835546;
	bh=FvvObChQCt3PuF88KX/unFVenPRJ+3/OCnELO8klPf4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dxK4o3m6wLEGmQ8+sciO3PW8C1ccUCvMtkvhkjud2vMCuzwber+eU/jz69whfBhD6
	 HJ8+tUCdKRfWIc6YxXfL5wmpqcLLhtxTn3LGOx7UUvOtOSO21dOwL6H/nbISyW4fv+
	 kI2TqoSTjvb9jQpTDZBF7ONWOu+PLNPoVF6BOtowMQB7MS+LqTT6i4RbtayIWhW3Lg
	 OAkxEITl7aOZTCp6BfdBLZa/3APfKSpAEoU3aI5xaW5FiiRNnVmBIh+ZIOlP+UkWls
	 0BJFNwjZov+oSd0F8+LOWAlfdSTerf/h+xbmOp724v/Ntn/gawLUkLIT2q+nfdO3gN
	 dn6djvWeJHMUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A6BE81E25;
	Mon, 15 Dec 2025 21:52:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC3D1151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B799260EF8
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wbiYgU_Q3GA for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB5FB60EAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB5FB60EAD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB5FB60EAD
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:52:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8A86B13F86E;
 Mon, 15 Dec 2025 22:52:18 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Dec 2025 22:52:18 +0100
MIME-Version: 1.0
Date: Mon, 15 Dec 2025 22:52:18 +0100
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20251215135023.3541586-1-pkerbrat@free.fr>
References: <20251215135023.3541586-1-pkerbrat@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <737ca3b7b32b87ccf9370981a67392ca@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765835539;
 bh=gARRGHJTmNFVv6QNd1+OsWypSrPb2bwkVJJyZ76o8To=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZXfIKtlEPnPPbpsX2bxJzCDoa/J1LpFPiXUz4FAYGT96DUzQeiFLaexnFLGqrqWMP
 NVWH7dRLi+KPQsJPu5FY53n4fJd9BkcD0J9heXLuYje9vD9nTvQr/1yPw6sezFNi1v
 6wnlAohvhgnsaVExgKgmREk03Jrngsac1namSgcshfHlEeAfz4mZlc319YzW7xAk55
 AUyfBY9uEI+cbo/PiPYJWZgjozB6eg0JHf0gUTQk2YCD4tLW4M+uZ6CdA2DEOMqw7m
 eEU5zc0z4mIIqKdhTo0xXBg2uPvWMEblcm/C6L4iZQkHbWJzOISgPbSzp3T39k8v/B
 8pDGa9RB8pmhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZXfIKtlE
Subject: Re: [Buildroot] [PATCH 1/1] package/ed: bump package to version
 1.22.3
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

On 15/12/2025 14:50, Pierre-Yves Kerbrat via buildroot wrote:
> Changelog:
> https://lists.gnu.org/archive/html/bug-ed/2025-12/msg00000.html
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
