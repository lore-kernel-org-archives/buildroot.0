Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDED1C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 16:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F354058F;
	Sat, 19 Apr 2025 16:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMX8bohhXpf4; Sat, 19 Apr 2025 16:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1753E405A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1753E405A5;
	Sat, 19 Apr 2025 16:31:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA273230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F8CE606DA
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fX2euJRuS4DU for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 16:31:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E94DC606BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E94DC606BA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E94DC606BA
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 16:31:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F9864387D;
 Sat, 19 Apr 2025 16:31:10 +0000 (UTC)
Date: Sat, 19 Apr 2025 18:31:09 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: Adrian Perez de Castro <aperez@igalia.com>, Arnout Vandecappelle via
 buildroot <buildroot@buildroot.org>
Message-ID: <20250419183109.0286277d@windsurf>
In-Reply-To: <CACXRmJgW8m7jNxfo_n=QoLfMz-ROgc=N2Ms7GcWh=UQOsnUBQQ@mail.gmail.com>
References: <CACXRmJgW8m7jNxfo_n=QoLfMz-ROgc=N2Ms7GcWh=UQOsnUBQQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeekudeuueeiudevhefhgefhueffffeigeeljeevteegffethfejieeijeeitdffnecuffhomhgrihhnpeifvggskhhithhgthhkrdhorhhgpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsseguvghvohhoghguthdrtghomhdprhgtphhtthhopegrphgvrhgviiesihhgrghli
 hgrrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745080271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ht0LVOyUg/G2Ppyj/ixBnmuqUmYrtE9j+m5k1P2CB18=;
 b=IB4GN9cZmE5/c92vgvPr9Q1fArLYYIIJgA/VJTByNvZX9H/vnnX0fS5vxGtA/L/A1IL4RH
 nOp2+4kTM0l5bZl+9xkX1TTCdz9nM2zKgVnj5jyqS0gAl/yMIHhOtmHCMkCm1ONgal2Ub7
 zI1uxvUKbKplsO1IEEtEe179OEQpsQpd6X7rNxdloDjAocqqszyKYtqWxVC/BWaXnn7yKi
 z44I5rojpxTb4W5g+uOwzqHzDopjQ8KR996B/SzLpFn9b6XPSHXlCycUGPNcvZFLink5PL
 j+1PnS+7S4UXot6kMtVMAZ/2Ib/WgUcdsvIBjIl5MDrMNE2wfYWc6sDS79LYDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IB4GN9cZ
Subject: Re: [Buildroot] [PATCH v2] package/webkitgtk: bump to 2.48.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Thu, 10 Apr 2025 10:23:09 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> This bumps webkit to the 2.48 stable series.
> 
> WebKitGTK+ 2.48 highlights:
> https://webkitgtk.org/2025/04/08/webkitgtk-2.48.html
> 
> News:
> - https://webkitgtk.org/2025/03/14/webkitgtk2.48.0-released.html
> - https://webkitgtk.org/2025/04/02/webkitgtk2.48.1-released.html
> 
> And brings some security fixes:
> - https://webkitgtk.org/security/WSA-2025-0002.html
> - https://webkitgtk.org/security/WSA-2025-0003.html
> 
> Also,
> 
> - Raise the minimal GCC requirement [1],
> which should have been raised by the 2.46.4 bump.
> 
> - Handle SPEECH_SYNTHESIS, which has been enabled
> by default in commit [2].
> 
> [1] https://github.com/WebKit/WebKit/commit/682ac4ba74c53d0cd488c7a595096224a9abb036
> [2] https://github.com/WebKit/WebKit/commit/10381a8de938024f31935184af470ccbce0b22d9
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> v2: added additional security report and a link to the release highlights
> ---
>  package/webkitgtk/Config.in      | 6 +++---
>  package/webkitgtk/webkitgtk.hash | 6 +++---
>  package/webkitgtk/webkitgtk.mk   | 9 ++++++++-
>  3 files changed, 14 insertions(+), 7 deletions(-)

Thanks for your patch. However, it has been damaged by your e-mail
client making it impossible to apply. Could you resend using git
send-email?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
