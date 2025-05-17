Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BECC3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 20:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AA438309A;
	Sat, 17 May 2025 20:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKEuUKC1oKkk; Sat, 17 May 2025 20:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D71E830E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D71E830E2;
	Sat, 17 May 2025 20:06:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FF08E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C018407E6
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xnxg2LV8NxHq for <buildroot@buildroot.org>;
 Sat, 17 May 2025 20:05:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64DA2407CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64DA2407CA
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64DA2407CA
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:05:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8189A43ACE;
 Sat, 17 May 2025 20:05:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uGNn9-00Ejjd-07;
 Sat, 17 May 2025 22:05:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Akhilesh Nema <nemaakhilesh@gmail.com>
References: <20250517093925.359219-1-bernd@kuhls.net>
Date: Sat, 17 May 2025 22:05:55 +0200
In-Reply-To: <20250517093925.359219-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 17 May 2025 11:39:25 +0200")
Message-ID: <878qmvdmu4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeiheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptdefledtudefgeefheejgfevuedutefgteegvdevhfehvdegheffhfevffffgfdunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpohiilhgrsghsrdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggshedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsggvrhhnugeskhhuhhhlshdrnhgvthdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepnhgvmhgrrghkhhhilhgvs
 hhhsehgmhgrihhlrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ncurses: bump to version
 6.5.20250510
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > From: Akhilesh Nema <nemaakhilesh@gmail.com>
 > Release notes:
 > https://github.com/ThomasDickey/ncurses-snapshots/blob/v6_5_20250510/NEWS

 > - Drop upstream patch - 0001-fix-XOPEN_SOURCE-detection.patch
 > - COPYING hash changed due to Copyright year update.

 > Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > v2: Bernd: bumped to 6.5.20250510
 >     This bump fixes the build of gdb-16.3 with gcc-15
 >     Build-tested using the defconfig from
 >     https://patchwork.ozlabs.org/project/buildroot/patch/20250120052252.3702-1-nemaakhilesh@gmail.com/#3447368

Hmm, something seems to be going wrong with the wide/non-wide logic when
I did a quick test with:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_NCURSES_TARGET_PROGS=y
# BR2_TARGET_ROOTFS_TAR is not set

..
/usr/bin/install -c ncurses-config /home/peko/source/buildroot/output-ncurses/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/ncursesw6-config
installing ncursesw.pc
installing ncursesw.pc
installing panelw.pc
installing menuw.pc
installing formw.pc
>>> ncurses 6.5-20250510 Fixing package configuration files
/usr/bin/sed: can't read /home/peko/source/buildroot/output-ncurses/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/ncurses6-config: No such file or directory

Care to take a look?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
