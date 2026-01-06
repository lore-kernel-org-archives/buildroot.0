Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2756CEFD05
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EDF681B0A;
	Tue,  6 Jan 2026 20:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEEGFl33exkf; Tue,  6 Jan 2026 20:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB3AB81A27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767731492;
	bh=J+sgCFZSvyFGes7ecXHL+qf736+T7ryRxiPx5hZM2gs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lpwy7VYk98iVBB4gunlfXodwqpn8QsRWR1Eq7XGzzvTgbZ7j2fvdHpid4bJ8oG7Pp
	 6Cc+cY5Yg/XIiDrgAgplxW/zto8Wn1jy6FnrqvPztzKCY5n98sbVB078mec5PTrQIn
	 p6iOYlSaYP5rbRm89jbtcQ2PX7bBT8MkMVch66Shcnd0VhSHwny7+sfbT0scoXH0PN
	 dlb8YMskgTEeccnEFyzxTCCpvfUJipb7B6hD8psqYBSIKWsXl0tmygIuNyP5O1Z0yB
	 gJk0QFg9TDeTEBkd7WamnhWScD12M8yAxK0WfsC+Rz/khXHW3r2mH6tqipITC7SGn2
	 5JdAOYIRZuGVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB3AB81A27;
	Tue,  6 Jan 2026 20:31:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 515FC2A3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4257481A27
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHMti2wwPC_0 for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BEB2681919
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEB2681919
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEB2681919
 for <buildroot@busybox.net>; Tue,  6 Jan 2026 20:31:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0D6B1200421;
 Tue,  6 Jan 2026 21:31:25 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Jan 2026 21:31:25 +0100
MIME-Version: 1.0
Date: Tue, 06 Jan 2026 21:31:25 +0100
To: Michael Fischer <mf@go-sys.de>
Cc: buildroot@busybox.net
In-Reply-To: <20260106160221.662427-1-mf@go-sys.de>
References: <20260106160221.662427-1-mf@go-sys.de>
User-Agent: Webmail Free/1.6.12
Message-ID: <3600b70caa8df0d81459e903c336bdca@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767731487;
 bh=coniHS1BdaMj3lh1emC9eWCNysEyj8qLZLbrRkBrxYU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bPmP7i3J0qYmKcu/gdV/+DnjZlwpIm2KrtWyo7faz0EEyw6/5hcAHE+QbEsh1o9B1
 cIASm+J4BeuJDX3DeoU08W7W87FZ/JlPgWX9RTANrGtsoDGkpn/ClqYz10dfWyVszB
 yiTId6YgzpB4OGDR6eCB72K2ygOZ3rNrcuaBYqp1HXenoqW/2qc68gws6w9wQBOtAI
 4mHmCU1sXLxe7QlzPsC8Ee+DsPVjslhrZjOiyLez5kb/ZHLwPi5Zfw6nnzzZ5cb/vJ
 A0/EcZNzJQwSqOiy6rccutkdWkzLSCv7rjfir+AOvjAHheVs8JdAukjTw5HTiPeK1K
 jMoBhAwK/RSsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bPmP7i3J
Subject: Re: [Buildroot] [PATCH] package/gnuplot: bump version to 6.0.4
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

On 06/01/2026 17:02, Michael Fischer wrote:
> For release note, see:
> http://www.gnuplot.info/ReleaseNotes_6_0_4.html
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
