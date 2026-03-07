Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9DCFC9ED3
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 075658425D;
	Sat,  7 Mar 2026 10:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlrPtg1JIdIy; Sat,  7 Mar 2026 10:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 355FA8424E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772878155;
	bh=IMgHJmjEcSLjIjY2RS1q/KtXOGy40XaOw6IDXldfMLA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KxhK4UdJW5kMof6Y7VTtxoSxKFEVHUd4OzkDFortfl0ISqJlbSt8W4rIEjGz5EHXr
	 BdNLa39xhgtZ771JgNTdyl0YjzEM5AOc8dQ/D7RHyarxvA+1noOIPyDc3OtvVDchX8
	 JOQx3saV4BzO5lp9vbt1AzeehFRBEIQs7vhigj+m0IdZLttfYoLfW2nqY7XXR/dYby
	 OTiwx7IwKlUJhcqB6F1n4myYepW9Rl617hKv6++LMOgOh0bb0UJreTrAj/fTSXhjxk
	 TcK0+oG8diFUhOu70eyfrXD/nA3f1yOxF4kENsM++1vPvAQ0NJWeupXouzpowTyKFZ
	 H3FyYq72rej6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 355FA8424E;
	Sat,  7 Mar 2026 10:09:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0F8A223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9299341F25
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWhakKMb1fh8 for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:09:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D381441917
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D381441917
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D381441917
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:09:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D097513F89A;
 Sat,  7 Mar 2026 11:09:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 11:09:09 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 11:09:09 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304181405.3739915-1-james.hilliard1@gmail.com>
References: <20260304181405.3739915-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <c5dc2d299beb2f1268ec7d9aedd4ba93@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772878151;
 bh=mL/GeAww8y1tQnXRZX0lEQqtnRO3O3J/qz5dDNwTWrI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ajngcP0hBb7P3+61AMFU05hMEZ+EWdw+xv8jwgGjinyaQTQ+ggP8FSrO4zq7mVCJA
 Z4IsEkssinxZIp/VATqmQ96PbdPWu9EbiADQbH9kl4J+cyvsSHEyqbgLQ3e/8MbRL5
 2D5lroiQD29FXytwBvrFMh9x7JUXLfhszkZ6cYe4ahftxG24ZoicKDLTutNBD1K2JO
 9E3kZ31ZDP8uY8GCr0B/bCeurPSWSDw2Cq6t5EKkC91AoQcvs00lICkY8ki1C8ue/S
 i2BNY/wK/5aHFmSmNZb8mxglqi5quaWCk+mUzlnm0D7NedmuHaqo58/SmnaqtbJMVe
 k93gS9sGl9hGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ajngcP0h
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 1.1.5
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

On 04/03/2026 19:14, James Hilliard wrote:
> Drop no longer required python-pytz runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
