Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E182CF513ED
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 14:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F45441E81;
	Sat,  7 Mar 2026 14:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtWCTZOXw-Cr; Sat,  7 Mar 2026 14:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DB4F41D29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772894295;
	bh=6SVtKqO16sb0d0KRQE5Vw8sVnVjB6ixX1amEgE2tDDA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q89ydWIc0il5GD89QSZLrU/CSy9jG68DGl2gL056FH51NJYaNtW8t172OIktxqPu6
	 Ul5/2U+r0lTx/KKNc1XBMGMyzAeezHmf9nxf7bnlBlH24w3DGMysIb6MESpP2NEK7U
	 dhvt7kzK7z2J2QCB7yDArCpMILBpd4zuXlwVa4q/mm4025xYQumm14OIQMAbjJ2NHo
	 6EGCuM2O4QDYAwJEDpPqV3UHW+MCSWXDOI8qlAw4UZGSjpDfmrUJugBM2F7ItBK5TO
	 HX7Q+zlcAB9fMJMqrR0T9Dli3bPJhLnM5Bt1efHyvPPmtAKvEE9NzFByS8EADy7rS1
	 VR2R0Kii0IUzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB4F41D29;
	Sat,  7 Mar 2026 14:38:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A00F1223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85FFB841A2
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 14:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7qNdHzVtCWd for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 14:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 154EE840FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 154EE840FD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 154EE840FD
 for <buildroot@busybox.net>; Sat,  7 Mar 2026 14:38:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 045BA13F8A7;
 Sat,  7 Mar 2026 15:38:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 15:38:08 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 15:38:08 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260307080519.384004-1-francois.perrad@gadz.org>
References: <20260307080519.384004-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.13
Message-ID: <0e3a7e403d0a2b38a709c7783f809627@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772894290;
 bh=Ids4cG8RnMWx+tmuo1Jdogspa60Pis5cccEk5ScSYII=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=maItVu2OdM7Dlle0xCtgFiwKrLq/2+iPVJykiMGiyd+oKQjmcPemHpO5hB4e+DyvM
 LAVnQjyuCe5PR1IT41mr9yYGSARnw9d322U3L8BhoJ2BwYjWY1h5jB5xGm2Iknc8Mo
 VeHMonvPDqQprB39IM4+4sBMlKm7CHTb00UEPmDCa8yg8CQtCtzJKk8LCdaG1xOHRZ
 wICXbuK1lWouM/Qdp/KWicXkAniCpg9ok2vTLJ4dBTwYUH9ijRk+eTJi1yUG1kRY9u
 oBMaBB8DJPMP6VtRFBfg5S/Dyk51N2f6uyC7BQcx/oKVLhArCqzF8bbl46FaPqv8Ag
 EbRh+/kgKyrfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=maItVu2O
Subject: Re: [Buildroot] [PATCH] package/linenoise: bump to version 2.0
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

On 07/03/2026 09:05, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
