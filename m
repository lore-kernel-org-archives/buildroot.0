Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05159C369CF
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 20:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFADE4069F;
	Sat, 19 Apr 2025 20:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkS-PktHp1UW; Sat, 19 Apr 2025 20:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D12024069D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D12024069D;
	Sat, 19 Apr 2025 20:16:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82DC6228
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6927C4015A
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBSiaYnZNSmh for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 20:15:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 669EC401DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 669EC401DD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 669EC401DD
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 20:15:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EEF943969;
 Sat, 19 Apr 2025 20:15:56 +0000 (UTC)
Date: Sat, 19 Apr 2025 22:15:55 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, aperez@igalia.com
Message-ID: <20250419221555.6ac56459@windsurf>
In-Reply-To: <20250419183800.93602-1-thomas@devoogdt.com>
References: <20250419183109.0286277d@windsurf>
 <20250419183800.93602-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeekudeuueeiudevhefhgefhueffffeigeeljeevteegffethfejieeijeeitdffnecuffhomhgrihhnpeifvggskhhithhgthhkrdhorhhgpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsseguvghvohhoghguthdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsu
 hhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghpvghrvgiisehighgrlhhirgdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745093756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFDiA4SiUeSWACuus0cT92s8d538yc3L0Mq1/ERpu0c=;
 b=UKyMUxUp+UuaO39XXni60e7jJZHnSozJrap6YnLYNi/Hj5JP7S7WaZ6EEv5DqTNw2EvXKz
 sjnnVnGyp5qmCSmBdZ0cldvjGWZxT8LxCISiYlZBExXcukI1Ga71to9SO0O7Rk43Y6I6ku
 tGos75M0kF1//WiMFH9TM+OjS4GNxbDzgbHE37ejqgLlNYyy+RStkMIhEhDm6zobB9TR01
 9EyFAjXhtBBEMiBg6HWqzYlHGuNkfjQ7v0yD5/oCAjlw/QysWr75YVkc+lNJW2cnNi/F0G
 DUADQU7RxU3EMkyuiCpoF+1YhSufl8aGIrg+USmFP/H0qYhVSKg2M603h+ZKWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UKyMUxUp
Subject: Re: [Buildroot] [PATCH v3] package/webkitgtk: bump to 2.48.1
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

On Sat, 19 Apr 2025 20:38:00 +0200
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
> v3: resend using git send-email
> ---
>  package/webkitgtk/Config.in      | 6 +++---
>  package/webkitgtk/webkitgtk.hash | 6 +++---
>  package/webkitgtk/webkitgtk.mk   | 9 ++++++++-
>  3 files changed, 14 insertions(+), 7 deletions(-)

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
