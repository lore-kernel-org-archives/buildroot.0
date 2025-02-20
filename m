Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54DBC021B3
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 21:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42DC741347;
	Thu, 20 Feb 2025 21:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnrGryLCArEO; Thu, 20 Feb 2025 21:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4124D412AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4124D412AA;
	Thu, 20 Feb 2025 21:48:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2B2E194
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 21:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E19DD84054
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 21:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUaW9CCq2dh1 for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 21:48:10 +0000 (UTC)
X-Greylist: delayed 9442 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 20 Feb 2025 21:48:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5035B83122
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5035B83122
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5035B83122
 for <buildroot@busybox.net>; Thu, 20 Feb 2025 21:48:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 022BC44327;
 Thu, 20 Feb 2025 21:48:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tlEOr-002Olt-0y;
 Thu, 20 Feb 2025 22:48:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Fischer <mf@go-sys.de>
Cc: <buildroot@busybox.net>,  Fiona Klute <fiona.klute@gmx.de>
References: <20250220133635.26056-1-mf@go-sys.de>
Date: Thu, 20 Feb 2025 22:48:05 +0100
In-Reply-To: <20250220133635.26056-1-mf@go-sys.de> (Michael Fischer's message
 of "Thu, 20 Feb 2025 14:36:35 +0100")
Message-ID: <87msegp9t6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeikedvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeegtdffgfdtheekgeekieduieelfedtvddvjeekffefgfegtddvvddtteeuvefhvdenucffohhmrghinhepohhpvghnshhshhdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehmfhesghhoqdhshihsrdguvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhshigsohigrdhnvghtpdhrtghpthhtohepfhhiohhnrgdrkhhluhhtvgesghhmgidruggv
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/openssh: security bump version
 to 9.9p2
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

>>>>> "Michael" == Michael Fischer <mf@go-sys.de> writes:

 > Release note: https://www.openssh.com/txt/release-9.9p2
 > Fixes: CVE-2025-26465 (ssh) , CVE-2025-26466 (sshd)

 > Drop upstream patch: 0001-build-construct_utmp-when-USE_BTMP-is-set.patch

 > Signed-off-by: Michael Fischer <mf@go-sys.de>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
