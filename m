Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33B6C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 09:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A3368040F;
	Tue,  4 Feb 2025 09:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwXwfIkmBXHV; Tue,  4 Feb 2025 09:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A17280512
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A17280512;
	Tue,  4 Feb 2025 09:42:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A02312F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 09:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09F8C80ABE
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 09:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2_Y2Z93k3AC for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 09:42:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9B1D8040F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B1D8040F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9B1D8040F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 09:42:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 468921F764;
 Tue,  4 Feb 2025 09:42:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tfFRw-00FbID-09;
 Tue, 04 Feb 2025 10:42:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <20250111113625.326385-1-ju.o@free.fr>
Date: Tue, 04 Feb 2025 10:42:31 +0100
In-Reply-To: <20250111113625.326385-1-ju.o@free.fr> (Julien Olivain's message
 of "Sat, 11 Jan 2025 12:36:25 +0100")
Message-ID: <87frkuoxko.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetiedtudelieevjeetieegtefftdevgeeiieehhefgteeuhedvteevveeigeeiveenucffohhmrghinhepkhgvrhhnvghlrdgukhdpkhgvrhhnvghlrdhorhhgpdhgihhtlhgrsgdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepvgiivghquhhivghlsehvrghnghhurghrughirghsuhhrrdgtohhmrdgrrh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/fio: bump version to 3.38
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > For change log since 3.34, see:
 > https://git.kernel.dk/cgit/fio/log/?h=fio-3.38

 > While at it, this commit also updates the homepage url in Config.in
 > (which now points to cgit on https) and the _SITE url (which now uses
 > https) to match urls published in [1]. This commit also adds the md5
 > hash published upstream and a comment about the pgp signature check.

 > Also, fio includes the <linux/nvme_ioctl.h> kernel header. See [2]
 > and [3]. This Kernel header was added in commit [4] and [5], in
 > Kernel v4.5.

 > This commits adds this new kernel header version requirement.

 > [1] https://git.kernel.dk/cgit/fio/tree/README.rst?h=fio-3.38
 > [2] https://git.kernel.dk/cgit/fio/tree/engines/io_uring.c?h=fio-3.38#n34
 > [3] https://git.kernel.dk/cgit/fio/tree/engines/nvme.h?h=fio-3.38#n12
 > [4]
 > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9d99a8dda154f38307d43d9c9aa504bd3703d596
 > [5]
 > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a9cf8284b45110a4d98aea180a89c857e53bf850

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/pipelines/1620835990

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
