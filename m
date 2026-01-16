Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F549C982FE
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 20:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 404DC41810;
	Fri, 16 Jan 2026 20:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhyGssMXHdzs; Fri, 16 Jan 2026 20:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A7F41812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768595097;
	bh=p3CQYohTPeGRFhOWwvCYX1IdPo2Izh48lSseXiMhj1M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ffrNqxsmiiavpiPEecnhDdQfZCkzBs7XCHBxKcrWwX2P49Bfuvlp0ciitjqqPHH8/
	 07rLh1i3HbNjwtt6bW8y1vwz6k04QFuN1ohJtICAw/qIx6fvZHCdwqTxVMwIpe7+mw
	 XynsVa+E+T0fQKpCqPtILRYprrlVu/wDp1v4LEDQYXQ5VLWSutLH3LsDhBYsoI64ED
	 RkoYmjr0NlxrxBv+909XMYAnIZZfay2zGDrZsnd+yTESgzJGuwwyXzVToPlTg/P4Wu
	 r0Ly+WM5OR/jrj3WOvJC6CuKiww7qoHHfWKxZrlzguniplo8qvZ3fCSGdwyLhT2ywV
	 H1rDVz0Qb63kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66A7F41812;
	Fri, 16 Jan 2026 20:24:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36F972CC
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BA514025E
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3mxKe4wspdS for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 20:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A66740027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A66740027
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A66740027
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:24:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 955B51A28CE
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:24:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5F59C606F9;
 Fri, 16 Jan 2026 20:24:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA6D510B68DD2; Fri, 16 Jan 2026 21:24:50 +0100 (CET)
Date: Fri, 16 Jan 2026 21:24:49 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aWqeff4I0f-_M-cN@windsurf>
References: <20260105174328.373330-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105174328.373330-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768595091; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=FdWdt1YHuEFVzACZuL156gvbSeV0cekBYg9pd0sUIUw=;
 b=SVIPX7ScjGvZRh/2Cja8dwp0YjVMdSDImm9IP9Y7LmOIHivWAbh+UTjcgr0MvnPXwDvhQ/
 YNVTkoCRlaRRn2e+nwnRAkwSPAMB/aHPJnBzyg84DzUFW5f10xUczuPpU6Mif8ZbB3FDIh
 sRfknMqGkZIg/i31MSYbWOzLI7vZCkBbV1hIeKAwKEApRF31GWpvB9Z+1IVKbIN9y0C6N4
 fmi2rbTvqxYq2LVZllp6kSodveDnBn4Qdd3Uh1pXGYT86W8FXtGEi/fyX5of+ujKB/ZB+f
 rN00ZHzqyq52Z4X8dM9a87BzvZliy98P6PdIJeBlYq9p4Sk7kht2syQcq3UW+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SVIPX7Sc
Subject: Re: [Buildroot] [PATCH 1/1] package/ddrescue: bump version to 1.30
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, Jan 05, 2026 at 06:43:28PM +0100, Julien Olivain via buildroot wrote:
> For release announce, see:
> https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00001.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
