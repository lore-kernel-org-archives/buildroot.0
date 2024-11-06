Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE235D59F67
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F3F54092C;
	Wed,  6 Nov 2024 21:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-b1Ve9iSpvj; Wed,  6 Nov 2024 21:26:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E1BE40936
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E1BE40936;
	Wed,  6 Nov 2024 21:26:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FDAE3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EB1F60B05
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wRMTkKYtluZ for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:26:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 279BE60AF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 279BE60AF2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 279BE60AF2
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:26:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBFAD240003;
 Wed,  6 Nov 2024 21:26:11 +0000 (UTC)
Date: Wed, 6 Nov 2024 22:26:11 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, Woodrow Douglass
 <wdouglass@carnegierobotics.com>, Julien Olivain <ju.o@free.fr>, Asaf
 Kahlon <asafka7@gmail.com>, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>, Robert Rose
 <robertroyrose@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241106222611.338f4a97@windsurf>
In-Reply-To: <20241030190020.1444105-1-james.hilliard1@gmail.com>
References: <20241030190020.1444105-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730928372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3wu5zyZc95zhj+DgdBw+HagCzqpT8/lTN/WrbZ/qt0=;
 b=VViO2WXGijpPak3kcesAuKozMWlL3GsBxlr0JxY759go3iQepKDcq/j5x+xaC4ujZfwOKC
 u4DDTG5J4c+c4EltNE8IX7qqQPf/B3La6Dh60bZPAZxC+83p+H8xAY4zul/A1DhuNByK/E
 WpRJbznv03VzCcADh9o5gbdz0QsUEGTD3rHp4wEPZ5FStC6lTZ6DkjWZ3/mYP3yYoqoqM8
 uxoFN3R2pjJX6URdN/tbiynXCkxRep+/Y9DO0mj4I7NnRCe9sY4sGidt51zmINjgio429C
 e8X99N3Pf3nVbThElo5EVJw2Xwvv5Ylo6eZBO1oXMu5WcPZCC6XX+EPRG1pmKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VViO2WXG
Subject: Re: [Buildroot] [PATCH v4 1/6] package/{python-}protobuf: bump to
 version 28.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for your work on this complicated package.

On Wed, 30 Oct 2024 13:00:15 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate protobuf build from autotools to cmake.

Unfortunately, while doing so, you have missed to review carefully
protobuf.mk, and you left some code that was autotools-related, and
therefore no longer taken into account after the cmake migration.

In particular:

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
PROTOBUF_CONF_ENV += LIBS=-latomic
endif

is not taken into account after the cmake migration, but is still
needed, otherwise the build breaks for example on SPARC. It needs to be
changed to:

 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-PROTOBUF_CONF_ENV += LIBS=-latomic
+PROTOBUF_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif

Also:

PROTOBUF_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
PROTOBUF_CXXFLAGS += -O0
endif

ifeq ($(BR2_or1k),y)
PROTOBUF_CXXFLAGS += -mcmodel=large
endif

PROTOBUF_CONF_ENV = CXXFLAGS="$(PROTOBUF_CXXFLAGS)"

is not taken into account after the cmake migration... but is in fact
no longer needed, and therefore should be dropped (perhaps as a
preparation commit). It is no longer needed because:

    The BR2_or1k workaround is removed, as protobuf depends on
    libabseil-cpp, which isn't available on OpenRISC.
    
    The BR2_TOOLCHAIN_HAS_GCC_BUG_85180 workaround is removed, as this
    workaround is for Microblaze, and protobuf depends on libabseil-cpp,
    which isn't avialable on Microblaze.
    
Finally, this protobuf bump breaks the build of kismet (at least).
Could you check this, and generally check more reverse dependencies of
protobuf?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
