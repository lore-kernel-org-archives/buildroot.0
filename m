Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5287C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 21:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6226240259;
	Tue,  9 Jul 2024 21:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O5IhjysFA01q; Tue,  9 Jul 2024 21:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3526C4038D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3526C4038D;
	Tue,  9 Jul 2024 21:35:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A10561BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A6B84055D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZq5rhP6cNIE for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 21:35:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A8254042E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A8254042E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A8254042E
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 21:35:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 645581C0006;
 Tue,  9 Jul 2024 21:35:09 +0000 (UTC)
Date: Tue, 9 Jul 2024 23:35:08 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240709233508.7433485d@windsurf>
In-Reply-To: <20240702231947.279854-1-james.hilliard1@gmail.com>
References: <20240702231947.279854-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720560909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MldMU5jhqGa3W4nnGCPoLhCUbkTAJQ+5a0xs6HcXBBg=;
 b=J5aSxYIPMH+l3ti+NaDSNnQEivVfeO5jXtWl3DtzxPBSexh4yLUJC2xcyhMBxutywZkozS
 ozxEwahiAAqsy40kfvfhnMFpGLTWFKCtsWGj2WWA2+10BE1jgu8YN6eQTcTKcFmytug2jv
 ZvbCDai9YoLjBvLrzWTQL85JtltRHpiNmfxGEQT1lIof+1t3czwzpHtHIKsLssi1vzJPVe
 Lp2m6auIMxeb3iX8Bq9ruaISqZR77KRNJi7MDnHuQ28x6jyrqmkF1EIdHUsRqIljYBwM/o
 3Cagn0rCbMfn0n09XVSoYMPU3LV5VZNMdjRcWAynMd/mPWqQb0CQZItnYZ9Wjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J5aSxYIP
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2024.05.2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jul 2024 17:19:47 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/swupdate/swupdate.hash | 2 +-
>  package/swupdate/swupdate.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
