Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85509C531F9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 08:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E51B360B16;
	Sat, 25 Jul 2026 08:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PocHuWB7LCjm; Sat, 25 Jul 2026 08:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86A3860608
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784967492;
	bh=UaSZOOUsbDkvsXr64/vD9tMP91FaXyGiRq2s5HCVOBs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hhWY3yXWRmZp0SDslSe0KuA0QtTleODohwP1KchlziWteMusxEUvUWEll3/3DNFsk
	 H9buByNfErMzZJDftdK0N11HPHqmxVx+02VXpnBpCa6a6aXoAOtz4/aq/txo7B4QZM
	 2DKtWseiR8RC5I5awYQLRlBjZlqmPN9W2K3TISOxHbkK9jW/Y3+g1qn2GRTPSFMzmN
	 3rN1hjALoWECDLSR1mXZ9Bw2yYpn8NJafGQz4CDSl3935HzWWPLcdPFaR+JxoPeE/a
	 ZbGGYqmUDn+LT4Ly7frk8ou2tZK6b9x0jkcaLcFcstA4HOzbtxyXm8d09WhIyi0U7b
	 zTigEtNcTRp0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86A3860608;
	Sat, 25 Jul 2026 08:18:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8028350
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 08:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D83B40067
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 08:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWCSIQqP9c3A for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 08:18:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29BF64005E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29BF64005E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29BF64005E
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 08:18:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id ABF6B78035B;
 Sat, 25 Jul 2026 10:18:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jul 2026 10:18:05 +0200
MIME-Version: 1.0
Date: Sat, 25 Jul 2026 10:18:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260725064253.15470-1-bernd@kuhls.net>
References: <20260725064253.15470-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <cc0224e41bac738cbdd061460480eba6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784967486;
 bh=3mHN8WX+sXOPEDLolRBxxQ6iHjXs/6G1LhGu0PMx8YA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=he6TIodG4kbOBHrWAvLdcvG9falVP/bmv58amrqRvC1R4LDyCn23YN6qAN8tOjmtR
 D5wao4Vi0U9mkTcDQtsNYetwo4JXUFVRFle0O2ioKbHFXXROSP1z1k+fo+Q3TuslVv
 r9Xs2n0vc99I0FNMYKaTn5aZzfhy1At+nxN+Mah7CCFNiSRJscih6oQxbUml/c5Nm1
 00eLM55pFFm5+uxMiKNXKJa8qB+cXiSLAm6srtwJWqUyMY7Rid4CR7U1QIXCgWE41T
 YfpzaqegmgdpqkIvQDVqze/+kj4hufTqznLPDYeS1OS1qCAQnuzzqpzzipCe0sQeNO
 k2snsRbpmBvTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=he6TIodG
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 6.6.x, 6.1.x, 5.15.x, 5.10.x, 7.1.x, 6.18.x series
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

On 25/07/2026 08:42, Bernd Kuhls wrote:
> Update the latest kernel releases to:
> 
>  - 7.1.4 -> 7.1.5
>  - 6.18.39 -> 6.18.40
>  - 6.12.96 -> 6.12.98
>  - 6.6.144 -> 6.6.145
>  - 6.1.177 -> 6.1.178
>  - 5.15.211 -> 5.15.212
>  - 5.10.260 -> 5.10.261
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
