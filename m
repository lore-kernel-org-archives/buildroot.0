Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5F2C3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33CAC612F2;
	Fri,  2 Aug 2024 21:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rp0D_8D6jkBJ; Fri,  2 Aug 2024 21:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CC39606A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC39606A5;
	Fri,  2 Aug 2024 21:41:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 820E81BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 704FB820A8
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lipkdZDDDV1P for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:41:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5917481C19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5917481C19
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5917481C19
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:40:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6C66240002;
 Fri,  2 Aug 2024 21:40:56 +0000 (UTC)
Date: Fri, 2 Aug 2024 23:40:55 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240802234055.3d4374f8@windsurf>
In-Reply-To: <20240802233908.6e7a3dfa@windsurf>
References: <20240719030537.3156999-1-james.hilliard1@gmail.com>
 <20240802233908.6e7a3dfa@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722634857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HBDE0pqNrwyJCZn9ZEUdQVbPH1VWimJWdRqHRN/Q7os=;
 b=iiyaeMOgdbaJPXvLeJUKmyMyYCBhDpoU2ScdheClhhUzxeT+YWYo4MHGtBUVKGfR0Q0wb8
 2jCj9voEfIymnBqQD87lxFjIcuFdlslRui9fK7UxCTKjVe98N/mAqgnEzglqXrGfo0AHMg
 /+1Fe+ftmOsY1ZFw2uZ+Wy9xt2w9siDlrAVEp91gKY5MK4dM/ropXmW0E5VZQCibejA0u0
 9mzBD1kP+X2E4GZcxslUsWL1ae4Wtdt5ANTOqKonzFUMzWlv3XbgiA+hqawAW2HPxdqzbE
 oCc4+iqGQ9aUODIArmoAKlezXRWdQV4PzR33jsWJOb9CA/4NcbQ6BgqwgNl/Mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iiyaeMOg
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-golang.mk: allow packages
 to override download GOPROXY
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 2 Aug 2024 23:39:08 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Considering the feedback from Christian on this PATCH 1/2, I have
> marked the series as Changes Requested. Could you resend once the
> vendoring issue is resolved?

Crap, I realized this was v1 (which was still in patchwork), and you
already sent a v2 and v3. So I'll mark the v1 as Superseded instead.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
