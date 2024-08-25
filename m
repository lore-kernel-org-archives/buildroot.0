Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283E5C5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 10:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB74E4013C;
	Sun, 25 Aug 2024 10:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqu_HW8X0Lnv; Sun, 25 Aug 2024 10:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 935F44044D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 935F44044D;
	Sun, 25 Aug 2024 10:07:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7A741BF317
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 10:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C24DF8118A
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 10:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-EpLiYqSDH5 for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 10:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BAF0481183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAF0481183
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAF0481183
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 10:07:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2764DE0006;
 Sun, 25 Aug 2024 10:07:17 +0000 (UTC)
Date: Sun, 25 Aug 2024 12:07:16 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240825120716.3cd46eb3@windsurf>
In-Reply-To: <20240825081205.562228-1-bernd@kuhls.net>
References: <20240825081205.562228-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724580446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gGPZUkwdMEiPCZJjK1sGx3MPcvLK8Gf6mdaGHXXAD9s=;
 b=T3KdPdUYM+AJf4SGgu4SW3QiDMOtZvX/Ymg1ADryAx/rq/JoI29eVvHzDwL1Qzvy9I0TJk
 zRWRh2Nkh5vPBSbHqprYLmONJfP0fdK0cl53yubUDrG6gk8weaioydvC4c/5950p1BTe7N
 BG9yvM+gsgGv8fHSunych/9jbxCAa/DJI8CgstNkTXfb93XCe2T7R5fRZrNDDmDPNppB/I
 AxEOUaQxe7H3vJnrfXVwVbxFfhg9jUBwV/FCx+f9zm82yL/sZoNEeafVLqCOhAOnFUQUx3
 jkwz0Lw9V9KCIoH3Ph+1YVor0v/eMObmHEmQfs7I0gk1j5YNxIGBCVn+IogMLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T3KdPdUY
Subject: Re: [Buildroot] [PATCH 1/1] package/sofia-sip: fix static build
 with openssl >= 3.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Aug 2024 10:12:05 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.org/results/de08bd5c68f5fcdaa5c0374a4f5051c4751ebb88/
> and many others.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...-fix-static-build-with-openssl-3.2.0.patch | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 package/sofia-sip/0002-fix-static-build-with-openssl-3.2.0.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
