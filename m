Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB6EC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 15:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA9116074D;
	Fri, 16 May 2025 15:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huCErmfRsRTC; Fri, 16 May 2025 15:17:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EFC26114E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EFC26114E;
	Fri, 16 May 2025 15:17:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 021521AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB9A481EA8
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plb7LtyhH6LE for <buildroot@buildroot.org>;
 Fri, 16 May 2025 15:17:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 648F881DF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 648F881DF1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 648F881DF1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:17:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC96C4422A;
 Fri, 16 May 2025 15:17:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uFwoH-009j20-15;
 Fri, 16 May 2025 17:17:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org,  Michael Fischer <mf@go-sys.de>,  Alexander
 Shiyan <eagle.alexander923@gmail.com>,  Thomas Devoogdt
 <thomas.devoogdt@barco.com>
References: <20240830175229.2619362-1-thomas@devoogdt.com>
 <20250209181625.87351-1-thomas@devoogdt.com>
Date: Fri, 16 May 2025 17:17:17 +0200
In-Reply-To: <20250209181625.87351-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Sun, 9 Feb 2025 19:16:25 +0100")
Message-ID: <87frh4a8le.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepvdfhgeetkedttdffgeduleeiffduvedvteffgeeuteevieeigfefgfdtiedtudeunecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggsheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehthhhomhgrshesuggvvhhoohhgughtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehmfhesghhoqdhshihsrdguvgdprhgtphhtt
 hhopegvrghglhgvrdgrlhgvgigrnhguvghrledvfeesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdruggvvhhoohhgughtsegsrghrtghordgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
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

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 > This adds a configuration option to enable the Wayland
 > video driver support in SDL2.

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 > Tested-by: Alexander Shiyan <eagle.alexander923@gmail.com>
 > ---
 > v2:
 > - Added tested sign-off, see https://patchwork.ozlabs.org/comment/3457513/.
 > - Slightly changed the git message.
 > ---
 >  package/sdl2/Config.in | 17 +++++++++++++++++
 >  package/sdl2/sdl2.mk   |  8 +++++++-
 >  2 files changed, 24 insertions(+), 1 deletion(-)

 > diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
 > index f1c22e4f80..018e64a8d8 100644
 > --- a/package/sdl2/Config.in
 > +++ b/package/sdl2/Config.in
 > @@ -22,6 +22,23 @@ comment "X11 video driver needs X.org"
 >  	depends on !BR2_PACKAGE_XORG7
 >  	depends on BR2_USE_MMU
 
 > +config BR2_PACKAGE_SDL2_WAYLAND
 > +	bool "Wayland video driver"
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 > +	depends on BR2_PACKAGE_WAYLAND
 > +	depends on BR2_PACKAGE_HAS_LIBEGL
 > +	depends on BR2_PACKAGE_SDL2_OPENGLES
 > +	select BR2_PACKAGE_LIBXKBCOMMON
 > +	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 > +
 > +comment "Wayland video driver needs a toolchain w/ threads"
 > +	depends on !BR2_TOOLCHAIN_HAS_THREADS
 > +
 > +comment "Wayland video driver needs wayland with an OpenGLES+EGL backend"
 > +	depends on !BR2_PACKAGE_WAYLAND || \
 > +		!BR2_PACKAGE_HAS_LIBEGL || \
 > +		!BR2_PACKAGE_SDL2_OPENGLES
 > +
 >  config BR2_PACKAGE_SDL2_KMSDRM

Moved it after KMSDRM and applied, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
