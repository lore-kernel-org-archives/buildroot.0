Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5298D2629E
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 20:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEF0D60AD9;
	Tue, 20 Jan 2026 20:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKvoRIsYdlgQ; Tue, 20 Jan 2026 20:42:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2868860AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768941724;
	bh=ejqxbsi4nfGY32VV6jX4j7QpqYYODCzbdgmhIMaCj34=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l240cwvR42toqGjZRSrwIECn8ckserty7meb+NZrRKRwfG7mRqBBshkENEti+Co2V
	 TH42Z4Z7nSfDh7KbE/4kCjCCJomOYioumgO+l0QmUDx7pcTzyQrK+CpJrlcPesLhhD
	 Bxi6qCDfZWvXK5MCBlQy7OubhfwvPYAWP4iuSDoVmMmOZKmQ6zDJd87xp/n7KnOXAB
	 AEdpFIJo2YaTDfdbGEwjs/wmeUs2xUen4ymOl1IPvhiSgqfG2ns9+W/dDg3uU4B40W
	 NGnoBdgZ9g6DMBnGERUPrddvBDB3+h6zTDiLqiJI1NCuFgaF9Gi53sc3cwpw24ylkm
	 55jDAWpzDlzCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2868860AD1;
	Tue, 20 Jan 2026 20:42:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF7A1122
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4F8760AD1
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id essBG64eqhyb for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 20:42:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28A3A60AD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28A3A60AD0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28A3A60AD0
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 20:42:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5F9407804FD;
 Tue, 20 Jan 2026 21:41:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 Jan 2026 21:41:57 +0100
MIME-Version: 1.0
Date: Tue, 20 Jan 2026 21:41:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260120183355.2730446-1-bernd@kuhls.net>
References: <20260120183355.2730446-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <1a2aba4353bcd637ceeae5af2f7a355e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768941718;
 bh=c1iWRe8sutN8gJSICEAJs5ffTWYkPy16jGYVXjCj/TI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f+dhnQTpYMHXhRaiKFiJnwgHegYDdEYZ52Zx2e5vsowPiPkeMSH0t8EHI7NtZNBAf
 TxhCqI17JFJq+ltbNuXSds7AIqgUbhurx1+spAwLZf1eVh657MUlFlXGGk2CndGpeG
 94sV5fj/tkek2iGMOjMJCTWjvZ7bmSAhR9vZORZmhqRrOOGjLzWD/OR6qJUA686Pty
 gIsFP+cRoRuPjnl+sGusgPKSIsbINf792uZIbUJB3u9AQdZRM63w/oIbX3S4EYbqx5
 +pdfgmWjIYK5n4TdhM5G49cfNTB+Mkh+l+/5dpU8+AkSnh+UXfgZ6N0tR370pvXyf2
 Lg/cmErEVg6GQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=f+dhnQTp
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x series
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

On 20/01/2026 19:33, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
