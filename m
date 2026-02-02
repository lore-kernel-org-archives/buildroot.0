Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0886DE7DF19
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 18:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C91158331B;
	Mon,  2 Feb 2026 18:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLSQ8uhZcbPH; Mon,  2 Feb 2026 18:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF5EC8343E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770056330;
	bh=jCbQehk592IhEDeiO6PDzZsZjquWe5kR3ZwgWWrcPVI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Md6eflUVj7YGsKeoWN1ReeTYcsv5OOW3ISzKWDZhaB6yCw+M8uLe52xNx9f8D7PjL
	 MOCWhJc10EfQYj8QBPaBD+kW/0Uwm0Dw179F+X3F2s6wGFh11P0jlTiGUMTFUezUvo
	 2Swjh//BZjXMKRTveOrvFzJU5Uar04v+hgwAWr/OnKjW6fgwfmGFwHbGjhb6zRJUww
	 t+tVY1nMb38ogaHphu0n8pT8qW4GnidKDU6qi6cMzoMoCcoD2srJhKfcxfb42EY/JO
	 1VFSoX4s9pnlucOwDvnxFcUavDkAqgUamepdAR42V3YIkDKuVm1G/dTjwhOY1qX0WQ
	 kTm2XL+vIwO2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF5EC8343E;
	Mon,  2 Feb 2026 18:18:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4423F4
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9606C607AA
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axpDWCuIBDW8 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 18:18:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2326A6077A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2326A6077A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2326A6077A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 18:18:46 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -480739994; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 18:18:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmyVM-00000007RdD-2fW2;
 Mon, 02 Feb 2026 19:18:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260105194056.2156773-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 5 Jan 2026 20:40:54 +0100")
References: <20260105194056.2156773-1-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 19:18:32 +0100
Message-ID: <87qzr3uhzb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Z293WsToNp2Ubjle6W5u0AQ/1ri+JlymbvPxRLskX/HZ5J6n7YDNQmilr3zecGo33rGVD+07jPHK1/R76/zlby2WwVdPfqzx+akylcQsonxcw1PsDwhOfisDaebZX/0IyjpawF3EhdulAsSYXtl1jd84/CsZVg+AUzkaVgVMqpErerpRHxntRXwW/n9ASNr4VAo3zncZVJBXmG+IEiLJ3T0jLqfm9s74bt4i8ohC1dmEGM3jbcZdbhKaW/XhQA1F12wQ3aBuneb0pgpKOxGnYpULsJJZyOKIDuSMJp5MRYJZJSnoZBnZ4/mtQ1StXaxvE83BMnwNt8ty5K35uoza4w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=CT4M70ITkW3tdT+Ef8kXZprKhpr+Sq2Sn7DGQ6gMKcQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Z293WsTo
Subject: Re: [Buildroot] [PATCH 1/3] package/dc3dd: fix build with gcc-15.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Fixes:
 > https://autobuild.buildroot.net/results/257/2575202e9a5164a4068a943fb36445cd63e61f0c/

 > The build error does not occur with gcc-14.x, tested using this
 > defconfig:

 > BR2_x86_64=y
 > BR2_x86_corei7=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
 > BR2_PER_PACKAGE_DIRECTORIES=y
 > BR2_PACKAGE_DC3DD=y

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
