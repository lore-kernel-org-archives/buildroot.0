Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85576CA0EE3
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 07:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E5BE40C2E;
	Thu, 14 Aug 2025 07:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3ujDS2RXL-b; Thu, 14 Aug 2025 07:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86EAB40CC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86EAB40CC0;
	Thu, 14 Aug 2025 07:54:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9A4E271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 07:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BF2C40CC0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 07:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4QjKPJH6Otm for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 07:54:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 932D340C2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 932D340C2E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 932D340C2E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 07:54:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3915344359;
 Thu, 14 Aug 2025 07:54:13 +0000 (UTC)
Date: Thu, 14 Aug 2025 09:54:13 +0200
To: Luc Beaufils <luc.beaufils@savoirfairelinux.com>
Cc: Yunus Bas <Y.Bas@phytec.de>, buildroot <buildroot@buildroot.org>, Thomas
 Perrot <thomas.perrot@bootlin.com>
Message-ID: <20250814095413.45e41061@windsurf>
In-Reply-To: <1129278814.79180.1755157301522.JavaMail.zimbra@savoirfairelinux.com>
References: <657a4a78e8df2a586faebb61d46ff3e8cfc7032d.camel@phytec.de>
 <1129278814.79180.1755157301522.JavaMail.zimbra@savoirfairelinux.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteeifeetvdehvdeflefgfeffvefhffdtkeeukedthfehudegjeehjedtgeeiteeinecuffhomhgrihhnpeguvggsihgrnhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhhutgdrsggvrghufhhilhhssehsrghvohhirhhfrghirhgvlhhinhhugidrtghomhdprhgtphhtthhopegjrdeurghssehphhihthgvt
 gdruggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755158054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pYXHyMqpoU9NZ/J5AH182/1E66iyBTYNkcRt344SMKA=;
 b=pmKAFfAsNv/9+y6hUkQyFKjxVnn6F9/azqPLMo1ThivBzma61hbLpvOpzzVZMseNVxU57p
 vwNgY9SfAFEgFta6eVZKYdSC5uD/R0JGTz2iGtbvyle/8R6flg4Rsvr+FnO5iizW+qSt4v
 dIU6pN2Lj09o7Gy2a6i4RzLurxgm8Z04mCuX5Bc+qLTjEJzJd5asZybG8iFuEge41EVbQn
 VBjGy/dY4DPNmInp0yGZgAQvtw2YEM/NdHlAfwC/0Y9uPhm7NRMW4CXe6JBdesbPBcfqUC
 lzSYtJ4MacOm2HCD3JC6JV+cm2aTpgOvOZMBSdnHY88F2R11oVwgE8xq97IpeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pmKAFfAs
Subject: Re: [Buildroot] [PATCH v2 0/2] Support for i.MX Code Signing Tools
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

On Thu, 14 Aug 2025 03:41:41 -0400 (EDT)
Luc Beaufils <luc.beaufils@savoirfairelinux.com> wrote:

> The 3.4.0+dfsg version has been removed from the debian repository. 
> The series should bump to the 3.4.1+dfsg version.

The series is correctly using https://snapshot.debian.org/archive/,
where the tarballs never disappear and have a stable URL. That of
course doesn't mean a version bump would not be useful, but the current
series is correctly using tarballs that still exist.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
