Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D545C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 853D3423CF;
	Fri, 22 Jul 2022 21:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 853D3423CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahR9XCcXxg9W; Fri, 22 Jul 2022 21:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35BDD42384;
	Fri, 22 Jul 2022 21:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35BDD42384
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B20FF1BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BD7684889
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BD7684889
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wVZu0nvomWYh for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:15:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48B7F84887
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48B7F84887
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:15:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CB5F81C0003;
 Fri, 22 Jul 2022 21:15:18 +0000 (UTC)
Date: Fri, 22 Jul 2022 23:15:18 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220722231518.1536cd2f@windsurf>
In-Reply-To: <7202d505-f0fa-9fba-b21b-8dc8cb44b01b@mind.be>
References: <20220720125707.1899437-1-festevam@gmail.com>
 <20220720183856.742c4a09@windsurf>
 <8CF2C8F5-F7EA-43C2-80BA-1D4122D22A66@withsecure.com>
 <20220720222430.7eb519f6@windsurf>
 <7202d505-f0fa-9fba-b21b-8dc8cb44b01b@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658524519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSz0yzL/quXmhJNlkftSFAVvBJtqu3gM4EO56Obt+yo=;
 b=gdfCrcRgaJqIAoFW/ltKu9wYVvG+5hx346fpvnW7USQ1mhQ/imyh+xdMizCjk9lyiedhim
 dLUTzkv7UYtjCBRUQdroikrsEBZw75nHNna8TaRCeskVwyPJQxSz3Z2/SjTcBr28yXnP9+
 CRFLbaw9Q3M2HVkVY4JRpLHN5man5SzLiTHgEmXkGN+y7KWnoPgs82wrxGoY4UO79C3Hbx
 NZY1Kn8KmYWmHP2N8gAHDMTELW10E1xZ1Oki1Rf2NK8Gx5o3RVkqlLY3M+mVHd+B0phCcy
 D29xSp0Tp8+Khj+mtXDgxWLbZiG4XDi/MJWZru4sjVD17mhIack69Vwwub/NWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gdfCrcRg
Subject: Re: [Buildroot] [PATCH] package/crucible: Pass 'osusergo netgo' tags
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: "Barisani, Andrea" <andrea.barisani@withsecure.com>,
 Fabio Estevam <festevam@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 22 Jul 2022 23:04:57 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   AFAICS, CGO_ENABLED is only set in HOST_GO_MAKE_ENV, which is only used in the 
> host-go build commands. So it's not really possible to set it per package. 
> However, apparently it is possible to override it:

I see this:

HOST_GO_COMMON_ENV = \
        GO111MODULE=on \
        GOFLAGS=-mod=vendor \
        GOROOT="$(HOST_GO_ROOT)" \
        GOPATH="$(HOST_GO_GOPATH)" \
        GOPROXY=off \
        PATH=$(BR_PATH) \
        GOBIN= \
        CGO_ENABLED=$(HOST_GO_CGO_ENABLED)

HOST_GO_TARGET_ENV = \
        $(HOST_GO_COMMON_ENV) \
        GOOS="linux" \
        GOARCH=$(GO_GOARCH) \
        GOCACHE="$(HOST_GO_TARGET_CACHE)" \
        CC="$(TARGET_CC)" \
        CXX="$(TARGET_CXX)" \
        CGO_CFLAGS="$(TARGET_CFLAGS)" \
        CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
        CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
        GOTOOLDIR="$(HOST_GO_TOOLDIR)"

so HOST_GO_TARGET_ENV has CGO_ENABLED=$(HOST_GO_CGO_ENABLED)

and then HOST_GO_TARGET_ENV gets used in:

# Build package for target
define $(2)_BUILD_CMDS
        $$(foreach d,$$($(2)_BUILD_TARGETS),\
                cd $$(@D); \
                $$(HOST_GO_TARGET_ENV) \
                        $$($(2)_GO_ENV) \
                        $$(GO_BIN) build -v $$($(2)_BUILD_OPTS) \
                        -o $$(@D)/bin/$$(or $$($(2)_BIN_NAME),$$(notdir $$(d))) \
                        $$($(2)_GOMOD)/$$(d)
        )
endef

Am I looking wrong?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
