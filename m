Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66A0C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C75D810BE;
	Mon,  5 Aug 2024 20:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuFsz5oVt2IN; Mon,  5 Aug 2024 20:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D6CD810C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D6CD810C9;
	Mon,  5 Aug 2024 20:32:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4AB1BF335
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B7B86078C
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mzxexxIGNHf for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 339DA60774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 339DA60774
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 339DA60774
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:31:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB8C1E0002;
 Mon,  5 Aug 2024 20:31:53 +0000 (UTC)
Date: Mon, 5 Aug 2024 22:31:52 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20240805223152.09ed915b@windsurf>
In-Reply-To: <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722889914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybDFBJp5em7WjjmCfeNSgFbz0jDVDVhcwI+RFdHy3qg=;
 b=ckAEzLs4mjWm+Xp6nXLtLm/HZoNU09r57Y69LqmDjRcNPBtf6faTuoyJIkRotR4rSXT94o
 tF3gwXDcIQMgW2ayf/e1fzNmjsYEzbPTpLoaROwp+1AoZ9QQQjcZWMIK34JCOPHNTI/9Or
 wnraSILz/eTU8kZ9BCAyngOJaqj4xXLx5sqTKSzS0R1hR4U5UVx4T8muIS45y+rhDG8mFU
 TRVd0Nv7r0lEz9NOi1yUuI679w7JYrox/cx5TRT5VjiLmvunyvdB+3UmVBpIEtfwl5Ausx
 JqiyMKpWhpop76Dor0zLjPr5cOOpW3xLnXFBGOSwKynkBahF78gkO9U2YUIVrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ckAEzLs4
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Mon, 5 Aug 2024 10:34:44 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> I still highly disagree with setting GOPROXY per package.
> 
> I have been working with the tailscale devs to fix the dependency issues.
> We fixed most of it.
> 
> Additionally I'm waiting for the anchore/quill developers to get back to me
> about removing some Git LFS files from their module that also break GOPROXY.
> 
> The decision to use the proxy or not (run by Google) should be up to the
> user. If I want to download everything from Git, that should be fully
> possible. (And usually is with GOPROXY direct)
> 
> I'll follow up with those GitHub issues today and see if I can get the ball
> rolling on another tailscale release with fixed dependencies.

Thanks a lot for your feedback. When seeing the new iteration from
James, my initial reaction was "I need the feedback from Christian on
this", and you had already given your feedback.

That being said: should we still have a way to patch/fix those kind of
issues on our side, until upstream fixes it? My understanding is that
this could be fixed on our side if we were able to apply a patch before
the Go vendoring happens. Is that correct?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
