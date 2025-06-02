Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A797DC5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 11:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7343681024;
	Mon,  2 Jun 2025 11:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HVsYofnT5Lm; Mon,  2 Jun 2025 11:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C27081003
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C27081003;
	Mon,  2 Jun 2025 11:47:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71DD9222
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62E6481003
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grE1aw-Nlv4e for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 11:47:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8FFE580FF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FFE580FF5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FFE580FF5
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:47:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDEB6439FE;
 Mon,  2 Jun 2025 11:47:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uM3d7-006ZGr-0h;
 Mon, 02 Jun 2025 13:47:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20250530164017.473549-1-neal.frager@amd.com>
Date: Mon, 02 Jun 2025 13:47:01 +0200
In-Reply-To: <20250530164017.473549-1-neal.frager@amd.com> (Neal Frager's
 message of "Fri, 30 May 2025 17:40:17 +0100")
Message-ID: <87h60ypdqi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeehkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetgfelveffveehtdevgeefjeeiudduledtffehgefgleekteektedutdfhleeiueenucfkphepkedvrddugeefrdelhedrvddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekvddrudegfedrleehrddvvddtpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrrhhnohhuthesrhhnohhuthdrsggvpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfr
 hdprhgtphhtthhopegsrhgrnhguohhnrdhmrghivghrsegtohhllhhinhhsrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2025.1
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 buildroot@buildroot.org, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Bump bootgen to xilinx_v2025.1 release.
 > With version 2025.1, bootgen executable is now in the build/bin dir, so
 > the install step is changed accordingly.

It could be interesting to add a shortlog of the (fairly limited) amount
of changes done:

git shortlog --no-merges xilinx_v2024.2..xilinx_v2025.1
Shaik Salauddin (4):
      Latest versal specific changes push to main branch for 2025.1
      RDI version update to 2025.1
      Adding placeholder in build directory for bootgen bin generation
      Fix for sdcard bootup failure in zynmp/zynq

bsaihema (2):
      merged and restructured code for versal_2ve_2vm and spartanus+
      optional data fix for versal_2ve_2vm

Please also document why the LICENSE hash changed, E.G. LICENSE file
changed by a conversion from DOS to UNIX newlines by commit 86b862096bcb
(merged and restructured code for versal_2ve_2vm and spartanus+), no
content change.


 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 >  package/bootgen/bootgen.hash | 4 ++--
 >  package/bootgen/bootgen.mk   | 4 ++--
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/bootgen/bootgen.hash b/package/bootgen/bootgen.hash
 > index d040a2e280..7670a5d1ee 100644
 > --- a/package/bootgen/bootgen.hash
 > +++ b/package/bootgen/bootgen.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256  2c8345a3bea4fcec6ceb6c8f8e727a610aaca3ec71cdf7f892d7f89f88438650  bootgen-xilinx_v2024.2.tar.gz
 > -sha256  4da5f5eff0592e5d275f1871faf9e9a4fc0f6346027bfb777fa59d0aa6a59aa3  LICENSE
 > +sha256  3de43a331e10b2a8079d4681ad72cef4884bc3a09250d3d80811d677f3ffe560  bootgen-xilinx_v2025.1.tar.gz
 > +sha256  36e278ff2cc9ef95154a923bf4a9450414f358779045ae4f863c8d77fb18dbdb  LICENSE
 > diff --git a/package/bootgen/bootgen.mk b/package/bootgen/bootgen.mk
 > index 51eacde462..939872b29c 100644
 > --- a/package/bootgen/bootgen.mk
 > +++ b/package/bootgen/bootgen.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -BOOTGEN_VERSION = xilinx_v2024.2
 > +BOOTGEN_VERSION = xilinx_v2025.1
 >  BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 >  HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf
 >  BOOTGEN_LICENSE = Apache-2.0
 > @@ -19,7 +19,7 @@ define HOST_BOOTGEN_BUILD_CMDS
 >  endef
 
 >  define HOST_BOOTGEN_INSTALL_CMDS
 > -	$(INSTALL) -m 0755 -D $(@D)/bootgen $(HOST_DIR)/bin/bootgen
 > +	$(INSTALL) -m 0755 -D $(@D)/build/bin/bootgen $(HOST_DIR)/bin/bootgen
 >  endef
 
 >  $(eval $(host-generic-package))
 > -- 

 > 2.25.1


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
