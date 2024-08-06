Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A499C3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 14:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52F28606E2;
	Tue,  6 Aug 2024 14:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGOjy7kqpXXD; Tue,  6 Aug 2024 14:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA0E060639
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA0E060639;
	Tue,  6 Aug 2024 14:50:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB2AA1BF2B0
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 14:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8A5B40187
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 14:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHEsaU5qfVPQ for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 14:50:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39E01400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39E01400D7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39E01400D7
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 14:50:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 460921C000A;
 Tue,  6 Aug 2024 14:50:51 +0000 (UTC)
Date: Tue, 6 Aug 2024 16:50:50 +0200
To: Christian Stewart <christian@aperture.us>
Message-ID: <20240806165050.234235b4@windsurf>
In-Reply-To: <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722955851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQ7z43pAa+HNEymtfkVigsBLy0BYP3g5hkTBZEa7BrE=;
 b=htqCmO4mDbbT7Sw2JaG7UfisGph8nDCvsRT50rpbWGZDJkKiEo7vdEZQ2GnVXqgz+bgnFH
 bVWstcWtBBFG81p+zpKQb4FQGRGtC4ik2Sw9TJjPsLmkVl1pZz8DPw6NAC28YUefkfYSeE
 yRgQabsrZ1aLtyoq8hNmDlTeLxtwfUUZjoZ7DtYiFajQKsppq+UJlyls31VD/9tfp4kTEv
 N1ft+nX32OMFgUOHqd9sPknCOm2eRIeUoVY7QNZ/Ap/SRpdrtxXcHvo8qF1VKiIAOly7Ey
 Y0yKwwHFPkLC0D0iaYJR/Ijue8NeVN9GeK/P4qtbEi2TF7lJtyjg9wN0hvx2cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=htqCmO4m
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
 Anisse Astier <anisse@astier.eu>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 5 Aug 2024 18:07:37 -0700
Christian Stewart <christian@aperture.us> wrote:

> My suggestion is to either set GOPROXY=direct for all packages, or for
> none of them.
> 
> We could default to setting GOPROXY to empty, which uses the default
> Google proxy.
> 
> The best approach is likely to add a Config.in option:
> 
> Something like: HOST_GO_GOPROXY
> 
> Then we can default that to: "https://proxy.golang.org,direct"
> 
> Which is the default value in the Go source code.
> 
> I think this would be the best approach if we do want to enable
> GOPROXY. This way, users that don't want to use the proxy can override
> HOST_GO_GOPROXY to "direct"

But that is independent of the current problem we're trying to solve
with tailscale.

> We could keep it as "direct" once this issue is closed:
> https://github.com/tailscale/tailscale/issues/12859

Still, I think it's a problem if we can't fix problems on our side and
that we have to wait for upstream to make a new release. For all other
problems, we can apply a patch in Buildroot that gets us going until
upstream fixes the problem and makes a release. I would like to have
the same ability to fix Go vendoring issues.

Could you explain to a Go ignorant like me how is this proxy thing
helping in solving this issue? Should a proxy just "speed up" the
download? Why does it exhibit a different behavior between a
GOPROXY=direct build and a GOPROXY=somethingelse ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
