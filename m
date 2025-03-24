Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5E7C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 12:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84AA560B68;
	Mon, 24 Mar 2025 12:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGc6oK_-Shu0; Mon, 24 Mar 2025 12:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9FEE6058D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9FEE6058D;
	Mon, 24 Mar 2025 12:19:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96758C0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 12:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8885760826
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 12:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJ2n1zU_K4r4 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 12:19:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C7E06058D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C7E06058D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C7E06058D
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 12:19:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5913B442FB;
 Mon, 24 Mar 2025 12:19:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1twgmK-004vrf-2c;
 Mon, 24 Mar 2025 13:19:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
References: <20250316210245.1706946-1-yann.morin.1998@free.fr>
Date: Mon, 24 Mar 2025 13:19:40 +0100
In-Reply-To: <20250316210245.1706946-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 16 Mar 2025 22:02:45 +0100")
Message-ID: <874izi62oz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheeljeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepkeegffdtieevkeejheevteeludetveeffedutedvkeefjeehiedtvdfhkeffueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeihrghnnhdrmhhorhhinhdrudelleeksehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libopenssl do not build in parallel
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > With highly parallel build on a hevily loaded machine, the libopenssl
 > build often (about half of the time) fails with spurious missing rules
 > in its Makefile:

 >>>> host-libopenssl 3.4.1 Installing to host directory
 >     [...] /usr/bin/make  -C [...]/build/host-libopenssl-3.4.1 install
 >     "/usr/bin/make" depend && "/usr/bin/make" _build_libs
 >     "/usr/bin/make" depend && "/usr/bin/make" _build_modules
 >     "/usr/bin/make" depend && "/usr/bin/make" _build_programs
 >     [...]
 >     make[3]: *** No rule to make target '_build_modules'.  Stop.
 >     make[2]: *** [Makefile:3159: build_modules] Error 2
 >     make[2]: *** Waiting for unfinished jobs....
 >     make[3]: Nothing to be done for '_build_programs'.
 >     make[3]: Nothing to be done for '_build_libs'.
 >     make[1]: *** [package/pkg-generic.mk:283: [...]/build/host-libopenssl-3.4.1/.stamp_host_installed] Error 2
 >     make[1]: *** Waiting for unfinished jobs....
 >     [...]
 >     make: *** [Makefile:23: _all] Error 2

 > Ideally, we'd like to fix the issue. However, the Nakefile is generated
 > by the Configure script, written in perl, from the template in
 > Configurations/unix-Makefile.tmpl, which also uses some kind of special
 > (perl-related, probably) templating language. That makes it pretty
 > difficult to see what is going on, though, and nigh impossible to fix
 > without a deep understanding of the openssl buildsystem.

 > So, we can only disable parallel builds until the issue is fixed
 > upstream [0]. Add a comment to both build commands (host and target) to
 > reference the upstream issue report.

 > Note that the issue has mostly been observed in the build of the host
 > variant so far, but there is no reason why it can't happen in the build
 > of the target variant.

 > [0] https://github.com/openssl/openssl/issues/27074

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
