Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451A4C44521
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 12:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 710544057B;
	Sun, 19 Jul 2026 12:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWwrbx5f6DmH; Sun, 19 Jul 2026 12:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E8A940566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784463833;
	bh=/1R+NnTaqHx6IUcj8xeO6QRYmUbl43Mq4xB5nTiHOEQ=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iW6EfSXg5cGa8vlv+O3C3LJ+PK1JVCBCN2qx+TF3vRk6yioQec2vvM7rCVmQHdadW
	 IktcukorWC6J8eqQpyyCoj4EKzOhIjToq8NlTYHOdYfX7ZE68lxpA9nQJ7h7wipSnp
	 B9oQOYau6FKG3sZrB5I9P8YDVoCW+uVU/AUC2eyU5SZOlGjaH2Ys7npCdbD8RxGPc5
	 9gZ0cRZ9tBtd7bn8x+oOgEz/J/IR1i8OSYHVJ5Fsl0dg/0S0YWdwUwXETBRGZrmvqs
	 vt44dvWNEtDzncNQk+pgSbAOw1r+H5VOC+UfxijCHZez0tdJKf3TTXR1S2l/YtSMP+
	 Lmfc7RcOfCAiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E8A940566;
	Sun, 19 Jul 2026 12:23:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71A0F282
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 12:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F6C5808E7
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 12:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAlGuZkNui-U for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 12:23:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5EBE2808D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EBE2808D1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EBE2808D1
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 12:23:48 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1612157408; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 19 Jul 2026 12:23:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wlQYb-00000000IV5-0Mdm;
 Sun, 19 Jul 2026 14:23:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Mir Rahman Rahmani <rahmani.mirrahman1991@gmail.com>,
 buildroot@buildroot.org
In-Reply-To: <CAP67CnTg=4=9EcmP+0a1mmG5Tz3MN5zGEnQzQmtsZ59_VZMQnA@mail.gmail.com>
 (Mir Rahman Rahmani's message of "Sat, 18 Jul 2026 22:40:07 +0200")
References: <CAP67CnTg=4=9EcmP+0a1mmG5Tz3MN5zGEnQzQmtsZ59_VZMQnA@mail.gmail.com>
Date: Sun, 19 Jul 2026 14:23:44 +0200
Message-ID: <87qzkz5fsf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=JlEo8HoxIGOKyyxsSeOZLK8wQOLHRdlRQLpXm7bhZ7fNgUD3lMJwrZ88incUONLZIZ9JWybT0547J44kIefUGdNoJX1n7o7aw4TizD8pCIDO7iOocI1VVyJoN29vLRAUW9Lh5xFlv1y88u8EQ1TYM8VZQ7no3IkvnXkNZhfRHI37zKGG/vU9b6wFVF4l7zff26zN3fth/a5Ovyk1BkAMHN7uTnYFXGBKJ5kTHEPGPOm9l/jEXrtKrlJAdQHAt+sDJnqAyZz7rwUPg5jUjmc7Jpr8e4w2OYrNC2onWQYInql61+0/+as5flpW+2wl5uTpaWp5Zqx6ViboxJG9GE4p1w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=LhEKK773FvX6T2zHqKSZUs1jGW4XsImlUkbbfvfVTcE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=JlEo8Hox
Subject: Re: [Buildroot] Please bump the WireGuard buildroot package
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

>>>>> "Mir" == Mir Rahman Rahmani <rahmani.mirrahman1991@gmail.com> writes:

 > Hey,
 > As a user of your WireGuard buildroot package, I thought I'd let you know
 > that wireguard-tools version 1.0.20260223 has been released. Could you bump
 > your package?

I am not sure I follow? The wireguard-tools package was bumped back in
March with:

commit ef12f5bb2c79a533e978cbaaf911b5ba96e97439
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Fri Mar 20 07:53:29 2026 +0100

    package/wireguard-tools: bump version to 1.0.20260223

    For details, see the announcement:
    https://lists.zx2c4.com/pipermail/wireguard/2026-February/009514.html

    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
    Signed-off-by: Julien Olivain <ju.o@free.fr>

What Buildroot version are you using? If you are using the 2025.02.x LTS
series which indeed does not have this version, can you explain why you
think bumping the version would be good there (E.G. specific bugfixes)?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
