Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBB4D6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCAB460733;
	Thu, 22 Jan 2026 19:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcNdCg0LVt56; Thu, 22 Jan 2026 19:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9666E60720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769109989;
	bh=XbW6sn1tyxrkCqGe1YFzt8DBZtudKswjOvFU0Wk8+nc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W1g/GVSrHzC6j5KTPs9v3+7ReZEfZHddhl5qmd0zH68+VGims1LVsxqe0Vztl9BZE
	 l+/M6x1cVMi9KQcPiUn8oEzvPMANCyrMnRfHnuGbHAbM2+SO42vA67YL6xjqoTyuX1
	 IJkfpYP6XUab4h7vD6ckfDTlmsjlCIub90r25hHVNcnRfP80UNPp4RJyITUHJLnQHp
	 6MGSF+bFLPOki8+JvO3lQuw0GYXlxlGSMMmYujTDeRP6A6mlVbyZR3SPhbGXkVPmv6
	 o2JubYQryapGdJPpWAztncS8422P0FvhKUDaRwK4bquxw2g2p6UiZ8IeKzSWrrUEqt
	 lDkZn3eOcMTwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9666E60720;
	Thu, 22 Jan 2026 19:26:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 430AF122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D6A640156
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JpUN1ITrO4J for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:26:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2D3564012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D3564012B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D3564012B
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:26:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5FCC719F574;
 Thu, 22 Jan 2026 20:26:23 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 20:26:22 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 20:26:22 +0100
To: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260121051556.2884162-1-daniel.crowe@maxmine.com.au>
References: <20260121051556.2884162-1-daniel.crowe@maxmine.com.au>
User-Agent: Webmail Free/1.6.12
Message-ID: <74879dc7bc0d0463c6ebfad75113e846@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769109985;
 bh=hpRKp5ltBhQRHEimtct7HFkkCGcdowlZjpSfzaRxbr4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tEDtWaKQ/s/3XMuuWAUX006usepLUEvQIWLwxxYT+RS20KrICWR/tEdQhtlwkJmy4
 FRNChVlD4wZ40Un8rBsPT1dIyizGbFHQjssH1riry/ihvRBeyrQz/vVPq5o4DSUXS+
 ZEA+Z0Jgv6Ch1sI6o3ZGs5BDCYtleDvbi/XpapUCf05rbA/AlAgTSk7yTOokDlmdHw
 2ABgDNEhwSaPGFvkTphnxXs66vQ/mdsCILal0oIirhkPvYvWOYX8IxM2nXsqjx0NBA
 bGhKpWMtOn+xnvnSwx1t+XS0bNJNPEqyymT5K2yADBCfAKTN5YiAMi6HBtYXPN+O2C
 CaOlB/obCnaKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tEDtWaKQ
Subject: Re: [Buildroot] [PATCH 1/1] package/monit: bump version to 5.35.2
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

On 21/01/2026 06:15, Daniel Crowe wrote:
> Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
