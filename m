Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC1AEE57C2
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 21:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93BB960881;
	Tue, 30 Dec 2025 21:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5z63Y0sAjrl; Tue, 30 Dec 2025 21:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FF7F60721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767131840;
	bh=mmJ79MxKw0+bvApnf+bV27X9Av/nj8sTuTkm1P4T7ng=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bk07Qr/wRyyIi96zl8xtxrkrvACMTNazc00HRUZUi5WjTwE+crbjj45kJH85/oeLt
	 QjQmi+N1b1dp45E0Z9rGsu58nvFM6blQ/K/TjKuMnCLWFv0n6Czr2r4xNTDLmezCwv
	 HtrmH1jxoSjPcYimN/VPYhior6OH1Bd3QFmkLYDSiHugOKzopjRQDs2NmUz1uo8awk
	 DfXcA5wL3PYNN8kjtMmQ/yqdnssnGCjZtADOLITAMv1J2fdRnIn9nqqKu554H7JmIc
	 KiE+z5QT8SJpXL2BJZeP1zekSD4HraVtwtCvkZCnnnW78ooMlHFJgPcZdmb/h1YXgn
	 4GsrhdJS37EvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF7F60721;
	Tue, 30 Dec 2025 21:57:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB8ABD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1BEB60721
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5A-GfGmnR06B for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 21:57:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4A47606CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4A47606CE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4A47606CE
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:57:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B087C19F574;
 Tue, 30 Dec 2025 22:57:14 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Dec 2025 22:57:14 +0100
MIME-Version: 1.0
Date: Tue, 30 Dec 2025 22:57:14 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251223214154.582451-1-thomas.petazzoni@bootlin.com>
References: <20251223214154.582451-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <75c9fe5f7d287d319c27fe75d99db787@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767131835;
 bh=QMtvwbU9tav4gvFQyTIRRsRt8KfdCPSi5TVm6vnw2C4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GRm26erF+vxXSEr7Uezdz6EUgC8KxT9X76UDGcizovx4Jg+rZYwaSrs2ZlA4yxVwB
 5tMuqqCzSgiUmo69NOqin3ElOPqGcdRHxjwCYgGSl2EgcyE3VTuQWQRYCWOKXTdpQe
 9DOABAJVDKFlqny+2xbr8sl6BpnvF/rveAnlBlkLAo6lOBZtvHqwuq+0i7yzjvDuAf
 pjergiaPFavUiYQpx77qQ9PmK5Z+jjYj3qyap7+Gpw6fWarBzOi+JgU/dGK8oXFBr1
 hHKEqXrVS1x28IFp8SygCyLNwjCzGIiUL5NHIc+G4e8kSyJvEw9thCXX6PNUeNV5fB
 fEQb/Jln3xTQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GRm26erF
Subject: Re: [Buildroot] [PATCH] package/libdnet: drop support for Python
 module
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

On 23/12/2025 22:41, Thomas Petazzoni via buildroot wrote:
> The libdnet Python module no longer builds with Python >= 3.13. The
> issue has been reported upstream on August 17, 2025, and there has
> been no feedback:
> 
>   https://github.com/ofalk/libdnet/issues/114
> 
> Until this gets resolved, we have no choice but to drop support for
> the Python module of this package.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/4df6bcaa66d79efac3619a47b08f3cb02c13e276/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
