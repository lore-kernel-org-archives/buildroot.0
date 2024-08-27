Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44906C54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BE6F40553;
	Tue, 27 Aug 2024 16:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2Pt1iT2QfMj; Tue, 27 Aug 2024 16:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC1AE40644
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC1AE40644;
	Tue, 27 Aug 2024 16:29:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F34041BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0529403A7
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifNg0OgH7hGg for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:29:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 777A340131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 777A340131
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 777A340131
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:29:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E033E0003;
 Tue, 27 Aug 2024 16:29:13 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:29:12 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240827182912.3b18ce08@windsurf>
In-Reply-To: <20240827074017.10184-1-buildroot@heine.tech>
References: <20240827074017.10184-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724776153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5RpvQxDODeJS9wZgEXsXzN2uCv7hGQTmZ3kKM3PA+fc=;
 b=VpWIFcGOTZu1Wm+TjWoe0ANV5RjbuIIHjKN7kFockmRlEZriFun0qYvGCOzQ+ZZfaSf/4t
 vfSn9E4EVKo4uGiC+F8oYzbkffCUqJV+FEp907U+4M1gdnULhbIikGeJAcO51jgBDT/ivo
 r80YSuStyzQRpGUOMbCiTh1xKhWb0vQwWrcp2mE1nJgV/AhramQ2fLa58DCP/i02i0gLuB
 vzJiHHJ8kgRw4D29CCtnPlWtnl1GgpTcBGQHHt39siBUl3cjvelGoC9eEOS4rDYW2duo3y
 g/6JrLh0R+ToTg77uom9jDmePz2BnN2xKS6Lt33o1Up+Bi/rMTcA6BBfATZLdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VpWIFcGO
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.7.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 27 Aug 2024 09:40:17 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/catch2/catch2.hash | 2 +-
>  package/catch2/catch2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
