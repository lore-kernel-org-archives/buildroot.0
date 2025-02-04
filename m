Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174F5C02197
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C35408AF;
	Tue,  4 Feb 2025 14:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9VFagWHsou0; Tue,  4 Feb 2025 14:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E464408B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E464408B0;
	Tue,  4 Feb 2025 14:59:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4E5B12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE20060631
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2h67sUQOBc_b for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:59:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9DC2B605C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC2B605C4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DC2B605C4
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:59:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AADC442E9;
 Tue,  4 Feb 2025 14:59:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tfKOG-00HE2T-2M;
 Tue, 04 Feb 2025 15:59:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Clement Ramirez
 <clement@clementramirez.fr>
References: <20250203142748.1135655-1-thomas.petazzoni@bootlin.com>
 <20250203142748.1135655-4-thomas.petazzoni@bootlin.com>
Date: Tue, 04 Feb 2025 15:59:04 +0100
In-Reply-To: <20250203142748.1135655-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 3 Feb 2025 15:27:42 +0100")
Message-ID: <87y0ylkb7r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeefueevfeetfeehueffgfeludegfeefffduveeljeejtdduudejvefhgfevledvieenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtlhgvmhgvnhhtsegtlhgvmhgvnhhtrhgrmhhirhgviidrfhhr
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/4] package/busybox: fix hwclock build
 issue on RISC-V 32-bit musl configs
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Take a patch from meta-riscv, which was submitted upstream by Khem Raj
 > to fix a build issue on RISC-V 32-bit musl configurations. This issue
 > has been discussed with musl developers who believe this is a Busybox
 > issue. The patch from Khem works around the issue by making it a
 > runtime failure just affecting hwclock on RISC-V 32-bit musl instead
 > of a build failure. The correct fix is not really clear, as there
 > seems to be a disagreement between Busybox people and musl people on
 > what the C library settimeofday() function should do, and that's why
 > Busybox is bypassing settimeofday() on musl by making a direct system
 > call, except this system call doesn't exist on RISC-V 32-bit.

 > In the mean time, this patch fixes the long standing Gitlab CI issue:

 > - tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv32ilp32dMuslStable
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291684

 > - tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv32ilp32dMuslBleedingEdge
 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291683

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
