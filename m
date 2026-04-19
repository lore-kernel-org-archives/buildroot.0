Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A706EA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 22:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9D8761005;
	Sun, 19 Apr 2026 22:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56ScHwY_2EXI; Sun, 19 Apr 2026 22:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4A4061004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776636227;
	bh=dKuxSAPR1goVpcFf+EeF+UiY0Ntc61PRNLta1XYNojg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pUCu7tiEriY89IK7TreGMSxVfxCpewWddJCAlMSDs7+mdXmlmIizgq/08m0WicvFF
	 NE+wA4Lv6UYXCFOVNpiQRqjN8PJwbcCizSZOz2aipeauX2MDhIt1cfc+vpDt1ewMqp
	 CaDlQSwUPxBe2ATT8+/noRVGDRld7qtSDIwfgKMbVhpQGi+8DV8KKfLUV4d22fh60L
	 kq8cUD2SE1WK70xG8pymF9oFyJErHJtHsPpxz/x4wrWsMtGliw0JHd9G5LEh91MMFZ
	 fyEAGdClr9moaGapDIcjia4RUdINTQFqsnfgEtdB7CCbJkArCTuQFd9go3D2GrQxC8
	 5sBSEymcTehnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4A4061004;
	Sun, 19 Apr 2026 22:03:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 780902B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 22:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D52D61004
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 22:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFLUkE8jSk4J for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 22:03:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C67C60AA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C67C60AA7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C67C60AA7
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 22:03:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 80E56B00548;
 Mon, 20 Apr 2026 00:03:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Apr 2026 00:03:39 +0200
MIME-Version: 1.0
Date: Mon, 20 Apr 2026 00:03:39 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260408193359.4047938-1-giulio.benetti@benettiengineering.com>
References: <20260408193359.4047938-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <e98bb64502955c421b078d7f296b2caf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776636222;
 bh=W5ozB7CHQCyJFYR1wvQ4ZKExSDL1eorjmdpj46eV0xU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F/JpeuXv0gGVukLxKkBWnUTjKvYWouTdez4PAKNT61F2kpCl4wlbMbmsctocCWSiz
 8Wos3kjz5H5DxGsDGpUAyWXhYhf/H0qE2IvVBh8gSRj34ZbqtBhNl/D3CYwGdsLHA7
 VXBo2s1mdBpqQjSkO764j4Cw3V8dsos0wtOZa8lTM7Rx6ehCTzduMEWZgbqSp47FQH
 XWV5ZC3fr+j8335z0gGHPYRz7q4OANwzOhiUm7WIOp3RgpnfiPpAZn0lj1auGPtRTD
 xUQd1veMGNupCcsENZjexJytJPm5uDqNsPry6Z7sdEoCqd3YMJbY4TFOlTcW9kkRiU
 WoNLr0wP7LGIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F/JpeuXv
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libnl: enable host package
 variant
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

On 08/04/2026 21:33, Giulio Benetti wrote:
> host-libnl is needed for host-nfs-utils.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
