Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CBCCD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 18:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D06784E58;
	Tue, 16 Jun 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gQUsK-zf8Jcn; Tue, 16 Jun 2026 18:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F206784D9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781636213;
	bh=D3LMUgZvcIEkCjzFjMaiSsFNXREsySZDxveodntLwXY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hFXnwlJgsnFFVCNvlkkSLgGEXjVMb80gXPpbUy3VN2LNqyAt1gQp/Vm6cFSVlx5sw
	 p3YfPONReIgQlce6pSPYOkZyFjrXcZvq84AcElfrfKdsnwBl+X7Z4saxUYnQhykYFm
	 HSe1HU/PXzxsWQx4j9fRu0XFlgCVpWp6UDW3E7h74uN45hA63eLOZyxCBNeMhIQrvu
	 WcxUOBYMeSwivwnIECbONCfxJkWnhSBIWWU+XhNrXBZjt/QZzNYb4BFgwIbjXts0Xo
	 eVno1uL2cgEXCxxK6a/eiQGA1cMbm+qmHwv0xlXxbmxJFCLv+tB7/tX5Sd0aSiSF49
	 5ZW4FsZ92kGxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F206784D9A;
	Tue, 16 Jun 2026 18:56:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CF242B8
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F31884D25
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfwqFdBOKH8p for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 18:56:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 520C884CE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 520C884CE1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 520C884CE1
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 18:56:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4B5B87803A2;
 Tue, 16 Jun 2026 20:56:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Jun 2026 20:56:46 +0200
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 20:56:46 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260616163414.2771639-1-giulio.benetti@benettiengineering.com>
References: <20260616163414.2771639-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <b53e9bb890b37a584fb96cd400b7e18e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781636207;
 bh=CUVGLGtxAzzvE+xxhLFKXgXmkCZhys2KUQipicmGA+8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c3CzjW/1+sS8VDooYBL03Vcr6XtpQRy+qwI7HlSzuvLqtLuaMM4+6kpKHFuoPStrW
 xm1yOIl6c5CO4ozIfW25g3HXfs/9TaIUeSEH1f+GAqDU7MZH1FYqDiF3nQJmfxZY9M
 UOmAEmiUENdYDbmM4T7PVJVFOh07xM9XvEIeSYTPOtRkJKE32taVZ2CSfP9gtPHi0R
 zLB7NtB0Ot3Y2hqGlmBwfXdOkd0S3uzgO9i9Cwie4oLc2cw2nQ1x9xxaf4X8V1Mj5J
 zMFEVjsc3lT+cx6ODFNnHBYG5051D9OcLpDtlLGEr4o2b8d1uNQk/ICdzC1pqJHw8Y
 EUY3/ABJLdEew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c3CzjW/1
Subject: Re: [Buildroot] [PATCH] package/libnvme: bump version to 1.16.2
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

On 16/06/2026 18:34, Giulio Benetti wrote:
> Release notes:
> https://github.com/linux-nvme/libnvme/releases/tag/v1.16.2
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
