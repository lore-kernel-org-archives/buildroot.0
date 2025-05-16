Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AABBC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 15:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C687E83A5E;
	Fri, 16 May 2025 15:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hxBm_opFzNU; Fri, 16 May 2025 15:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD2BC83B3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD2BC83B3A;
	Fri, 16 May 2025 15:52:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CF68185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12A3F400D2
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vO1crh_Zse0U for <buildroot@buildroot.org>;
 Fri, 16 May 2025 15:52:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90686400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90686400AF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90686400AF
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:52:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4483C1FCED;
 Fri, 16 May 2025 15:52:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uFxMd-00AFQa-2I;
 Fri, 16 May 2025 17:52:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org,  Michael Fischer <mf@go-sys.de>,  Alexander
 Shiyan <eagle.alexander923@gmail.com>,  Thomas Devoogdt
 <thomas.devoogdt@barco.com>
References: <20240830175229.2619362-1-thomas@devoogdt.com>
 <20250209181625.87351-1-thomas@devoogdt.com>
 <87frh4a8le.fsf@dell.be.48ers.dk>
Date: Fri, 16 May 2025 17:52:47 +0200
In-Reply-To: <87frh4a8le.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 16 May 2025 17:17:17 +0200")
Message-ID: <87bjrsa6y8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepvdfhgeetkedttdffgeduleeiffduvedvteffgeeuteevieeigfefgfdtiedtudeunecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehthhhomhgrshesuggvvhhoohhgughtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmfhesghhoqdhshihsrdguvgdprhgtphhtt
 hhopegvrghglhgvrdgrlhgvgigrnhguvghrledvfeesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdruggvvhhoohhgughtsegsrghrtghordgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/sdl2: add wayland support
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
 >> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 >> This adds a configuration option to enable the Wayland
 >> video driver support in SDL2.

 >> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 >> Tested-by: Alexander Shiyan <eagle.alexander923@gmail.com>
 >> ---
 >> v2:
 >> - Added tested sign-off, see https://patchwork.ozlabs.org/comment/3457513/.
 >> - Slightly changed the git message.
 >> ---
 >> package/sdl2/Config.in | 17 +++++++++++++++++
 >> package/sdl2/sdl2.mk   |  8 +++++++-
 >> 2 files changed, 24 insertions(+), 1 deletion(-)

 >> diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
 >> index f1c22e4f80..018e64a8d8 100644
 >> --- a/package/sdl2/Config.in
 >> +++ b/package/sdl2/Config.in
 >> @@ -22,6 +22,23 @@ comment "X11 video driver needs X.org"
 >> depends on !BR2_PACKAGE_XORG7
 >> depends on BR2_USE_MMU
 
 >> +config BR2_PACKAGE_SDL2_WAYLAND
 >> +	bool "Wayland video driver"
 >> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 >> +	depends on BR2_PACKAGE_WAYLAND
 >> +	depends on BR2_PACKAGE_HAS_LIBEGL
 >> +	depends on BR2_PACKAGE_SDL2_OPENGLES
 >> +	select BR2_PACKAGE_LIBXKBCOMMON
 >> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 >> +
 >> +comment "Wayland video driver needs a toolchain w/ threads"
 >> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
 >> +
 >> +comment "Wayland video driver needs wayland with an OpenGLES+EGL backend"
 >> +	depends on !BR2_PACKAGE_WAYLAND || \
 >> +		!BR2_PACKAGE_HAS_LIBEGL || \
 >> +		!BR2_PACKAGE_SDL2_OPENGLES
 >> +
 >> config BR2_PACKAGE_SDL2_KMSDRM

 > Moved it after KMSDRM and applied, thanks.

Wait, you added the .mk logic in the middle of the BR2_PACKAGE_SDL2_X11
conditional so it only works if the X11 driver is enabled. I'll send a
fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
