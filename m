Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B081CC3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 15:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8151E811BF;
	Sat, 17 May 2025 15:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEhR8cBNgLqp; Sat, 17 May 2025 15:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCCFC80F56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCCFC80F56;
	Sat, 17 May 2025 15:49:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CC99223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32D6881166
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VK7pXlk3ebQn for <buildroot@buildroot.org>;
 Sat, 17 May 2025 15:49:38 +0000 (UTC)
X-Greylist: delayed 71723 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 17 May 2025 15:49:37 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F28780F56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F28780F56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F28780F56
 for <buildroot@busybox.net>; Sat, 17 May 2025 15:49:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9826E43A22;
 Sat, 17 May 2025 15:49:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uGJn5-00Dkkq-0O;
 Sat, 17 May 2025 17:49:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad via buildroot <buildroot@buildroot.org>
References: <20250424073814.1880903-1-francois.perrad@gadz.org>
Date: Sat, 17 May 2025 17:49:35 +0200
In-Reply-To: <20250424073814.1880903-1-francois.perrad@gadz.org> (Francois
 Perrad via buildroot's message of "Thu, 24 Apr 2025 09:38:13 +0200")
Message-ID: <87a57bw834.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeitdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepkeegffdtieevkeejheevteeludetveeffedutedvkeefjeehiedtvdfhkeffueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsghuihhlughrohhothessghushihsghogidrnhgvthdprhgtphhtthhopehfrhgrnhgtohhishdrphgvrhhrrggus
 ehgrgguiidrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] configs/olimex_stmp157: bump Linux and
 U-Boot
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Francois" == Francois Perrad via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  board/olimex/stmp1_olinuxino/patches/linux/linux.hash | 2 +-
 >  board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash | 2 +-
 >  configs/olimex_stmp157_olinuxino_lime_defconfig       | 6 ++++--
 >  3 files changed, 6 insertions(+), 4 deletions(-)

 > diff --git a/board/olimex/stmp1_olinuxino/patches/linux/linux.hash b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
 > index 8691d5ffd..48b74dae9 100644
 > --- a/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
 > +++ b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
 > @@ -1,2 +1,2 @@
 >  # Locally computed
 > -sha256  5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a31444fd93  linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz
 > +sha256  58c00229e95817918f9310f5c9adb0e3d1cfa7f28377aa7292431a110b6111a9  linux-e9b70672e21c96c02d9a731a9379baa897ea2ac7-git4.tar.gz
 > diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
 > index a991a1922..153acf382 100644
 > --- a/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
 > +++ b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
 > @@ -1,2 +1,2 @@
 >  # Locally computed
 > -sha256  6aaa18a9023db29ceaad5bca240605990b68a6bf348aaefad0bee8be8d37648e  uboot-efadf793a0a5924e2c96362dc1df3e56622ebb97-git4.tar.gz
 > +sha256  1b99d3fd4fc778562c011de42193f9c29b3f2d0d7717ba22ac0c412446186382  uboot-23d8f769a94ae230b7a68fa812cc3c4dc0cbf1c9-git4.tar.gz
 > diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
 > index b1f9b7645..efd267fcb 100644
 > --- a/configs/olimex_stmp157_olinuxino_lime_defconfig
 > +++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
 > @@ -12,7 +12,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
 >  BR2_LINUX_KERNEL=y
 >  BR2_LINUX_KERNEL_CUSTOM_GIT=y
 >  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/OLIMEX/linux-olimex.git"
 > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fc74113e14d76aea9482264ff42e07397b94553d"
 > +# branch release-20231222-v5.10.180
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="e9b70672e21c96c02d9a731a9379baa897ea2ac7"
 >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 >  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
 >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > @@ -25,7 +26,8 @@ BR2_TARGET_UBOOT=y
 >  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 >  BR2_TARGET_UBOOT_CUSTOM_GIT=y
 >  BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/OLIMEX/u-boot-olinuxino.git"
 > -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="efadf793a0a5924e2c96362dc1df3e56622ebb97"
 > +# branch release-20250305, based on 2021.04
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="23d8f769a94ae230b7a68fa812cc3c4dc0cbf1c9"

NIT: You can also use git describe output in _REPO_VERSION, E.G.:

git describe --abbrev=40 23d8f769a94ae230b7a68fa812cc3c4dc0cbf1c9
v2021.04-29-g23d8f769a94ae230b7a68fa812cc3c4dc0cbf1c9

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
