Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38055C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 20:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D9183B5A;
	Fri, 16 May 2025 20:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llJ4lWTgpWtF; Fri, 16 May 2025 20:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3266083C8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3266083C8D;
	Fri, 16 May 2025 20:00:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 199E91137
 for <buildroot@buildroot.org>; Fri, 16 May 2025 20:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ADF860ABF
 for <buildroot@buildroot.org>; Fri, 16 May 2025 20:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2thbFrc5-c8 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 20:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E9AA960A99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9AA960A99
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9AA960A99
 for <buildroot@buildroot.org>; Fri, 16 May 2025 20:00:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA85A439F0;
 Fri, 16 May 2025 20:00:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uG1EM-00BPXX-1k;
 Fri, 16 May 2025 22:00:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Cherniaev Andrei <dungeonlords789@naver.com>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250516150830.313732-1-dungeonlords789@naver.com>
Date: Fri, 16 May 2025 22:00:30 +0200
In-Reply-To: <20250516150830.313732-1-dungeonlords789@naver.com> (Cherniaev
 Andrei's message of "Sat, 17 May 2025 00:08:28 +0900")
Message-ID: <871pso497l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfefgheefledvfffgledujeefiedvjeeigfffteevheekgfejfeevhfeiheehjeeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggshedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughunhhgvghonhhlohhrughsjeekleesnhgrvhgvrhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpv
 ghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] boot/grub2/readme.txt: fix script
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

>>>>> "Cherniaev" == Cherniaev Andrei <dungeonlords789@naver.com> writes:

 > Fix regression of commit 552ba600eef0884bb7bf7f09a67cd66747d1efa8 Without `--show` loop_dev variable will be empty so the script never works...

That commit was the cherry-pick of of commit 7dd56b6cd9 to the 2024.08.x
branch, so I have reworded the commit message and applied, thanks.

> ---
 >  boot/grub2/readme.txt | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
 > index d0999ec390..3b7df3a47d 100644
 > --- a/boot/grub2/readme.txt
 > +++ b/boot/grub2/readme.txt
 > @@ -10,7 +10,7 @@ Notes on using Grub2 for BIOS-based platforms
 >        is enough free space *before* the first partition to
 >        store Grub2. Leaving 1 MB of free space is safe.
 >  3. Setup loop device and loop partitions
 > -   loop_dev=$(sudo losetup -f disk.img)
 > +   loop_dev=$(sudo losetup -f --show disk.img)
 >     sudo partx -a "$loop_dev"
 >  4. Prepare the root partition
 >     sudo mkfs.ext3 -L root "${loop_dev}p1"
 > @@ -65,7 +65,7 @@ Notes on using Grub2 for x86/x86_64 EFI-based platforms
 >      - Create a second partition, type 8300, for the root
 >        filesystem.
 >  3. Setup loop device and loop partitions
 > -   loop_dev=$(sudo losetup -f disk.img)
 > +   loop_dev=$(sudo losetup -f --show disk.img)
 >     sudo partx -a "$loop_dev"
 >  4. Prepare the boot partition
 >     sudo mkfs.vfat -n boot "${loop_dev}p1"
 > -- 

 > 2.45.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
