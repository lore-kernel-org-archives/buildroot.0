Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94703C79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 14:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5639160756;
	Wed,  9 Sep 2026 14:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDtqk-8WSH2V; Wed,  9 Sep 2026 14:01:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E14A660769
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788962491;
	b=HqQWe+ulBM3GGEznHJbloRhe3hEIAmdOfeclMWkiYf2V/0K1t2/XEZHhhF/wCg0rF/rs
	 TYi6Zs+Brk1t2Le8pKB0npWSArfGOHCAhKfDDSmbfYZQVvdNLlKvg7VgAuILc2zelPK9e
	 /FMyrcTKKnSTsRQUTHT5+DLNzVUO6Ak62Zc3+FhdQr+Ql2vv52/MDat03hpeoyq46vvJ3
	 +0Yi+Gu5blfzVfdY2yo14LQH1+iKaZ7FBgSYunxTj8PnU7+DlkhZU9Hc/p3HSkLoT6oIH
	 i/86RcUck8VlwZtQdAUbkxVP9rXv911QGG8YbjV+1jsDVuiUsYRGscDcqNSI+A3uSTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788962491;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FHXgc6P8S4vEjTGo+ztKhPK/P3weM3uFTFpW76oBYEc=;
	b=nV53t2TD9Kd5jqxBoyKOC6g07iiWToKNUvmQXug28FpAvSPAka5sfoCK0+R1HIWjm+F7
	 qAUOkKDEiUaJ2TeSjEvQ6IlnL7chwv/HOoXRPkcgevNMx0grjYK8yji38JDvSzJTRXnny
	 RHL03oruUhDZu3NkGwhbTbh/2j+47WKCvlj60AZKJoHosrTegLIZXGnTO/lFH8xVZ9Vot
	 Rtm9zdsra1aWmgXVO5WQD979uMKK3oW6w1IgZySkJ2qXFxQ2ypFTdq4YJxzqfZsPztRhk
	 nFoyfRiTPcYmbRXfAKNVbfsK2Zi/H+rmExVFK1lzrgSz6Th4ZxT0zM2ezRrEnAnf6JA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788962491;
	bh=FHXgc6P8S4vEjTGo+ztKhPK/P3weM3uFTFpW76oBYEc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QJPDOniUD1sgq4IYsIzU9soagpzA7wgnC1oDBIZL58ptc4a+KebAK5jzMG2iEIplB
	 UTqWMv20cePjjiSnmdQz6lBXSKtNtAllVDswvNG2+tKcNj2F8D/dM3lYZvqExoaC79
	 erE4gPM9LwRrn9Dj8yM332L/xtvUd8ioKncvhEf5IZNoiMxyxT5ykANGo2voaaBg7K
	 Hy9sIjmXxId19hKDRH7S6rrdQrMAUJb3MbXVmOlu9MW0nwturiRfSPMnKr3YnjphC4
	 vEaUnlGnvCpWQpBZWOBLDTja4HuTUkl4zVbXGLNWnWv/Khn+um/CKxvXO8RF4KMXbm
	 iDH+x/Zq/3nvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E14A660769;
	Wed,  9 Sep 2026 14:01:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 690F23AF
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EE7980DA7
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVzQIz5sZ8ZF for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 14:01:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9A71380D77
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788962488;
 b=ORwZYMaG4yGLwBOwPrXE5oKXnaCHK8MCjhLwtJ/ZItYXYQImP33rkXdgAx9ldKj5fjcx
 g+6yDYUofXTDu3hGu62opsF7YDps0clk0Ba4VPfSbwHxoGLxLyi0M+YRk0uUJMEF63V/T
 8EGcywLfEoNe3IhJGGdvoF58z1KKCmW9X6m01R3jsouI3RceBFLf1iINbROHQM1Bb+c/M
 EKJsrDT4F1AZ5YjqoKXVJrr9DNTynakCljeVXDnJNcnR+rajl55y0RY2LF2/IrnJH5V0V
 tzrAt5nHxymSkWh3kxglmsmzcdD+oiVljP++mbA0hEcKvySS1oX3hgCN0RMCmmttp0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788962488;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=+YAzZQbtTdkG0Q6UAt4syulbxJshQCIvUGZsj6QG8TU=;
 b=nX9uJRhafFi1cjicFpSFhGBUFzxkgYgTZAdeqdPKrKME+M8p93eDt5AZdVt5ibjguGkG
 YJv5em/CwjtflJVl+6r0exNGOYgK3Lkf7FjtLDuNG701T+JS3z5/W9IYSPAGY7dSoIhWn
 pJH39Cthwcn5YRykWuJXKEPTsgbjO4OVxu1BHctdhGNFcv4jgj2FY4MVVW8mAUSd9VH0Y
 G2tjV/0hBALF5PtPaySkP5n54Z6n8A5cmihDebFsKgKAIpqLKbkgiPgw52j9OlugL7gqq
 RsuH+ywzwGW49Bvy8UmpeAzUGh809R7ypTtp0x1oeWv0ZKi3L/+jSH6BkxFPQvdDN3A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qmB9wuYU; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A71380D77
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:01:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3653A1A1A74;
 Wed,  9 Sep 2026 14:01:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0AF5C60448;
 Wed,  9 Sep 2026 14:01:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F194511C7AF57; 
 Wed,  9 Sep 2026 16:01:15 +0200 (CEST)
Date: Wed, 9 Sep 2026 16:01:15 +0200
To: matt@thewebers.ws
Cc: buildroot@buildroot.org, Matthew Weber <matthew.l.weber3@boeing.com>, 
 Clayton Shotwell <clayton.shotwell@boeing.com>
Message-ID: <aqFllswijRr-sqsf@windsurf>
References: <20260827185951.3180679-1-matt@thewebers.ws>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260827185951.3180679-1-matt@thewebers.ws>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/5] package/libc-test: new package
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

On Thu, Aug 27, 2026 at 06:59:48PM +0000, matt@thewebers.ws wrote:
> From: "Matthew Weber" <matthew.l.weber3@boeing.com>
> 
> Add the musl libc-test suite as a Buildroot target package. This
> provides POSIX API conformance tests for musl libc covering the
> upstream test suite.
> 
> Includes one patch:
> - 0001: adds a cross-compilation build target
> 
> Tested using: https://gist.github.com/matthew-l-weber/a028a69bdbb99690a43b5729dcd641c5
> 
> Signed-off-by: Matthew Weber <matthew.l.weber3@boeing.com>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@boeing.com>

Thanks for this contribution, which makes sense.

Note that we received PATCH 1/5, 2/5, 3/5 and 4/5 on the mailing list,
but not PATCH 5/5. Is it intentional, or was there a technical issue
along the way?

> diff --git a/package/libc-test/0001-add-build-target-for-cross-compilation.patch b/package/libc-test/0001-add-build-target-for-cross-compilation.patch
> new file mode 100644
> index 0000000000..8f711d7521
> --- /dev/null
> +++ b/package/libc-test/0001-add-build-target-for-cross-compilation.patch
> @@ -0,0 +1,32 @@
> +From cb892239cd677bd74a4633f1bcda02ac57b4e9d3 Mon Sep 17 00:00:00 2001
> +From: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
> +Date: Wed, 22 Jul 2026 18:58:21 +0000
> +Subject: [PATCH] add build target for cross-compilation
> +
> +The default 'all' target both builds and runs tests, which is not
> +suitable for cross-compilation. Add a 'build' target that only
> +compiles the test executables without attempting to run them on the
> +build host.
> +
> +Upstream: https://repo.or.cz/libc-test.git (not yet submitted)

Can you submit it? It seems simple and reasonable.

> +Signed-off-by: Matthew Weber <matthew.l.weber3@boeing.com>
> +---
> + Makefile | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index cf2ab2b..ccaec4e 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -150,5 +150,7 @@ $(B)/%.exe: $(B)/%.o
> + %.err: %.exe
> + 	$(RUN_TEST) $< >$@ || true
> + 
> +-.PHONY: all run clean cleanall
> ++build: $(BINS) $(LIBS)
> ++
> ++.PHONY: all run clean cleanall build
> + 
> +-- 
> +2.34.1
> +
> diff --git a/package/libc-test/libc-test.mk b/package/libc-test/libc-test.mk
> new file mode 100644
> index 0000000000..30b3b72200
> --- /dev/null
> +++ b/package/libc-test/libc-test.mk
> @@ -0,0 +1,54 @@
> +################################################################################
> +#
> +# libc-test
> +#
> +################################################################################
> +
> +LIBC_TEST_VERSION = 97e8e863b4fbfa7a9d74254a9a33db0a3dbf41a1
> +LIBC_TEST_SITE = https://repo.or.cz/libc-test.git
> +LIBC_TEST_SITE_METHOD = git
> +LIBC_TEST_LICENSE = MIT
> +LIBC_TEST_LICENSE_FILES = COPYRIGHT
> +
> +# The upstream Makefile both builds and runs tests in the default target.
> +# We only want to build during the Buildroot build phase; tests are run
> +# on the target at runtime. Patch 0001 adds the "build" target.

I'm not sure how relevant that is here. At best this should go above
the LIBC_TEST_BUILD_CMDS.

> +# The Makefile uses config.mak for compiler flags. We generate one
> +# suitable for musl (no glibc-specific libraries). The Makefile's own

I don't think it makes sense to generate "one suitable for musl" since
the package is musl-independent: it can be used for musl, uclibc-ng,
glibc.

> +# CFLAGS already includes -I paths for the test framework headers, so
> +# we must not override CFLAGS on the command line.
> +define LIBC_TEST_CONFIGURE_CMDS
> +	printf '%s\n' \
> +		'CC = $(TARGET_CC)' \
> +		'AR = $(TARGET_AR)' \
> +		'RANLIB = $(TARGET_RANLIB)' \
> +		'CFLAGS += -pipe -std=c99 -D_POSIX_C_SOURCE=200809L -Wall' \
> +		'CFLAGS += -Wno-unused-function -Wno-missing-braces -Wno-unused' \
> +		'CFLAGS += -Wno-overflow -Wno-unknown-pragmas -fno-builtin' \
> +		'CFLAGS += -Werror=implicit-function-declaration' \
> +		'CFLAGS += -Werror=implicit-int -Werror=pointer-sign' \

Why do we need those gazillions CFLAGS? I mean in the context of
Buildroot, we don't really care about all those warnings. Same for
-pipe, etc.

> +		'LDLIBS += -lpthread -lm -lrt' \
> +		> $(@D)/config.mak
> +endef
> +
> +define LIBC_TEST_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) build
> +endef
> +
> +define LIBC_TEST_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/lib/libc-test/src/common
> +	mkdir -p $(TARGET_DIR)/usr/lib/libc-test/src/functional
> +	mkdir -p $(TARGET_DIR)/usr/lib/libc-test/src/math
> +	mkdir -p $(TARGET_DIR)/usr/lib/libc-test/src/regression
> +	cp -a $(@D)/src/common/runtest.exe \
> +		$(TARGET_DIR)/usr/lib/libc-test/src/common/

$(INSTALL) -D -m 0755 $(@D)/src/common/runtest.exe \
	   $(TARGET_DIR)/usr/lib/libc-test/src/common/runtest.exe

> +	find $(@D)/src/functional -name "*.exe" -exec cp {} \
> +		$(TARGET_DIR)/usr/lib/libc-test/src/functional/ \;

	find $(@D)/src/functional -name "*.exe" -exec \
		$(INSTALL) -D -m 0755 {} \
		$(TARGET_DIR)/usr/lib/libc-test/{} \;

and then drop the mkdir -p above.

> +	find $(@D)/src/math -name "*.exe" -exec cp {} \
> +		$(TARGET_DIR)/usr/lib/libc-test/src/math/ \;
> +	find $(@D)/src/regression -name "*.exe" -exec cp {} \
> +		$(TARGET_DIR)/usr/lib/libc-test/src/regression/ \;

Ditto.

Of course, completely untested :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
