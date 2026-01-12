Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B783ACF45BD
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 17:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E421C60BC1;
	Mon, 12 Jan 2026 17:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDo9_qO9ebP8; Mon, 12 Jan 2026 17:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EB8C60BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240445;
	bh=y7OtYNWkv+krberRYDC/6YpTapdovCXKKvhaPTvJxzc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k9raHucnRRL9IazDFHI8OjRLcFkfIeOal0U/en11srDMgSE/0aw75v5JxJo/Oldm4
	 0SavrysNNQtyUjJLi0+xTyxUM9IMsetoq1ePy3+Zaaadr0AfqrFCB1EQ759btsH/x4
	 owO2IKblVobidBn4suFFW9RX5BwtN15pxiQW+1fQtZy2R2B5BdBxYkj/QUh0UJnRlK
	 /lfqK6Nyxc06dvJ71qYtakCCp87j2ARTJtpL1q8CXhDeSzFRoFiWLGYikHA/9ZBfpP
	 Cxo1ejYxBkh2H9FwtUipWsTSl6UeMgwd0D0oTjVrAWpLHt84ibNFCoGSXhh2wWylN2
	 LYggRrKoz7Tsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EB8C60BB3;
	Mon, 12 Jan 2026 17:54:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 052741CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB35B403B8
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-Ma7c4rBpQX for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 17:54:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30BDC400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30BDC400C1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30BDC400C1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:54:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 95B5713F88E;
 Mon, 12 Jan 2026 18:53:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 Jan 2026 18:53:59 +0100
MIME-Version: 1.0
Date: Mon, 12 Jan 2026 18:53:59 +0100
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20260112075136.49022-1-fido_max@inbox.ru>
References: <20260112075136.49022-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.12
Message-ID: <01e29e4794674958908a7a57a11dfcef@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768240440;
 bh=rA4Cm2R0YFxC+ACMOlX4JMERvSJmrArQm8EZM+VT/pk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pLafUBCRWcpb4QTzH4ea666eHHB2UAC9Dtm9In1exrKeLjrc6GwG+F9bQ5bCIcjS8
 c/Z2NGMpkCGEskAz1R95xX5ZUUXsMY+Z9HzsdKbKCSKMqixAAtD6cMQc3y89aP2xn3
 VuFXWhdCoT2sxrFCAkOzQqQl9cuJ4+3yfMquOuOAJzQZHcroE3ZIIjrLlK6KUEGJxv
 S9Df9bIw4aldoFOLSy0XJePJsrFzbGAlXf9e2IOxzSD5534+N/3IgJ5EwNw3aMyXt3
 lmBFfP+AqsLFnmnM1cmm2uFYVVX2gFaqSekP2pLdkWZ643d8x8cICcTwQ9hhL19sVC
 RBc8u69MfVhdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pLafUBCR
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.6.1
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

On 12/01/2026 08:51, Maxim Kochetkov via buildroot wrote:
> Changelog: https://github.com/postgis/postgis/blob/3.6.0/NEWS
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
