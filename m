Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87430C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CE6460BB2;
	Fri,  4 Sep 2026 11:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDoe6DQ5xsAQ; Fri,  4 Sep 2026 11:51:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3E9D660BB4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788522699;
	b=EpZNWLryQdlZlm0L4t9zaadzKClDLi81uQ9hEu5BqNMNGHQK1wD1NTYHeCk+6binLzHz
	 xod/AYV+zt9UuoK6MXK1cDhGlac6jsmYtrHkDbuNDTTbuXV8cv7fyJKzJGv6B6IWPcBsd
	 qxP6tRt2tyJB53NOxMwdRJrEiLbZ9l7qQboXObZMAmRyJRUDkjrVHBHf16w/ckLRbftXP
	 Jq+MJARj881DZwMCF9QrweQb70uN0YT/cF6OxCmbhBhBMt+gc3sZwRoOOyEgdt9lvZxE4
	 n1DCnuCdy1qkRgP/oIoU0fljcAKcBqYrERCNoOe/HlKkkyyyLEo6BW4v/EhoEZoYHBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788522699;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IdxdU82aTMjxoXtBMSWHBUCy12ossGX5D3URbVTt1PI=;
	b=rHSgrNIjzzfXFwRWT4l2gfGF1QZV6WlQ1uxitA7XMIU5w3+xoaSMAErIBFOYVbjaXqCw
	 TT33alrkUwehszSiIKi83zYHuYkMSS4M20fIfMVrs2eAZvHYREEulBrCmk59A7UIiILh/
	 shkUGY2AXhVEL752qDvMohK8PxiQIw5xMbPg47U/Wi6r2lPP8Z9sE3G0IGpCaPPMsyDGb
	 Qn4EdcwW02PfvUiYlTM5UveycH9h7HdUDU2kXIzdPreHbwJgP2DUSjtzJCFOGRCq1X573
	 4cnxcUYnXFab0pMBoGJyznkbdmMJg+BUFfnUFS+0XZi6j1qVl/RYXdBDsmaYTBmodsw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=FOVhv8jo;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788522699;
	bh=IdxdU82aTMjxoXtBMSWHBUCy12ossGX5D3URbVTt1PI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dAtTjf60kyDrpTHZ9KV8KyLVYJQ9XcYY66MCNJmuGqjmAUhmKFGuTh3GqkfeZAYiE
	 OCOWEzdr9zymhsFJwQ/fiDlns/2/b75HdpGLrOx6U9oalQjUj3ur+0zl6emHJMpZ5q
	 XLmW5qwh364n3tqe4BKm/lnJGK+EB3EVE1U2Sfkp9Ddlt2fkSxtnmGfo6/AUdRyHVP
	 OkbHgp6sy0PmVERWr0R6Ot9RyJQEui0IOe4OslwZB4QYVhx0aLDADPEQMqjHB4ZGPt
	 DaYdLWse9ogDYOK0Y4pKHTD8yUs/Q/V+K9hG0sXzInAzhgnXApnTMBGMnsJjRwlhiD
	 yxhl//OIsD/dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E9D660BB4;
	Fri,  4 Sep 2026 11:51:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 708A82FD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55E5960BB4
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uX_bO84_JSbl for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:51:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 02DD1607FF
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788522696;
 b=KcgQRNHEez08MD050GIucDicbHYAyG/LLM71WBpK6ALdOrHdgJj5F8kpy+uYHeSrvmg9
 cmwRYBVFwHUTR+qBShddyyedEfMGlnRiyecvq0i5nhk1S/y4I3GEP0djE1ubUW6uz9FsY
 XmN50vt9E2faQvzkVuW8We0zg30WaZdHOki0Hz+FISwkshCrnD3XsubpFY0xVgF5g845h
 E/w4d+zUR7BumaUUfYnPcp9oMGaIqYiQyFbZ5ZW6Zbbr0xH1wd8vlFGxeVEHWOuC1JyOW
 Z0+7Kqlua4UTFYHxpuShKKl+Cm9owOpxL2aOycpxGvBIRYAaQuHgebp0dDYzHQKF8oA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788522696;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=RAVdrnUUS0nOSelOmEFTedewevlYU/OcI599WI14V9g=;
 b=mGe1s88UZH6PwsS/KO9CVY8z+pWqZliKJFmXkQ96RwEOJuRCpzRQpsJuIHaUkCmFqju1
 vVsn7n4sMTtT+EIuBATEiWlsrfmfedXLF3I4ZJDxWvX20YN9MtX37Sb12MO1sHeoc/TLK
 Q+Y3+0jmQ9rfyQgP4+/wxthiSFewtW3Vo7V++4Mvke5RJLiv2Kd5dx36GNckgrXtAKej5
 ug2A2S4hmtb6kkgiz5A/dKa0D95xJ+oL0AT2FQPfIfVOUXyZUURfAyzUxaYNUwf5+gGbo
 ikNAtcSMP+52Kok7lqpzbEtOAt0czff21XhK7QC+FEbbrU/XYyJDyfBNI7OgN52KggQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=FOVhv8jo; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=FOVhv8jo
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02DD1607FF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:51:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=FOVhv8jowBFVP4WntNT3G9/L9XIGopuO1o8g4BnPYj2lrpm/wiPLCVPzKWgjB6dibj1y1HvOaK0Rth084kAQ8b6kIdmngSZSG0EeG/qoCgTL+yADKesCiQa4X5JYx6uQllAJwAS7uMzDgaMJcykQPOdPNHPYPoGDIhjLtdUkvQI3Dg+7W1BtUgs5wHs+pnBstw+SlCbaoQXS6FFIUbTh5c8CQKuw30l3vpmEophqZkKoyWypB+X+EXPy+suloF1TQpiI7gJLq/brPhoiePXodLpaVviicJc6VSMxDCaAs5ZIs3jlohl1yt5hKuZ6cINm16/kcQkh0+y/JP4iwnIQ0g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=SnEgyYbETRxFK4xDCXBjod4dwnUasCN+L8su/Gnl+7I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -227306011; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 11:51:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x2SS8-00000007Lla-2PsJ;
 Fri, 04 Sep 2026 13:51:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260903063913.73831-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 3 Sep 2026 08:39:12 +0200")
References: <20260903063913.73831-1-bernd@kuhls.net>
Date: Fri, 04 Sep 2026 13:51:28 +0200
Message-ID: <874ig5p73z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libopenssl: disable atomic
 operations for m68k Coldfire
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

 > This patch fixes a build error with OpenSSL-enabled libcurl which was
 > detected by the Gitlab pipelines:

 > checking for openssl options with pkg-config... found
 > configure: pkg-config: SSL_LIBS: "-lssl -lcrypto -pthread"
 > configure: pkg-config: SSL_LDFLAGS: "-L/builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-5208-uclibc/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib"
 > configure: pkg-config: SSL_CPPFLAGS: ""
 > checking for HMAC_Update in -lcrypto... no
 > checking for HMAC_Init_ex in -lcrypto... no
 > checking OpenSSL linking with -ldl... no
 > checking OpenSSL linking with -ldl and -lpthread... no
 > checking for SSL_set_quic_use_legacy_codepoint... no
 > checking for SSL_set_quic_tls_cbs... no
 > configure: OpenSSL version does not speak any known QUIC API
 > configure: OPT_OPENSSL: /builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-5208-uclibc/host/m68k-buildroot-uclinux-uclibc/sysroot/usr
 > configure: OPENSSL_ENABLED:
 > configure: error: --with-openssl was given but OpenSSL could not be detected
 > make[1]: *** [package/pkg-generic.mk:263: /builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-5208-uclibc/build/libcurl-8.21.0/.stamp_configured] Error 1

 > Although OpenSSL was found using pkg-config the build tests fail.

 > A local build shows the concrete error in config.log, for example:

 > configure:27577: checking for HMAC_Update in -lcrypto
 > configure:27599: /home/bernd/buildroot/output/host/bin/m68k-linux-gcc
 >  -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 >  -D_FILE_OFFSET_BITS=64 -O2 -g0 -fno-dwarf2-cfi-asm -Wl,-elf2flt=-r
 >  -static -Werror-implicit-function-declaration -Wno-system-headers
 >  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 >  -D_GNU_SOURCE     -Wl,-elf2flt=-r -static
 >  -L/home/bernd/buildroot/output/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib
 >  -L/home/bernd/buildroot/output/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib
 >  conftest.c -lcrypto  -lssl -lcrypto -lz -pthread -lz  >&5
 > /home/bernd/buildroot/output/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real:
 >  /home/bernd/buildroot/output/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libcrypto.a(libcrypto-lib-threads_pthread.o):
 >  in function `ossl_rcu_read_lock':
 > threads_pthread.c:(.text+0xa4): undefined reference to `__atomic_fetch_add_8'

 > This error occurs many times for various atomic operations:

 > $ grep "undefined reference to \`__atomic" output/build/libcurl-8.20.0/config.log | sort -u | grep -v real
 > threads_pthread.c:(.text+0x28a): undefined reference to `__atomic_fetch_sub_8'
 > threads_pthread.c:(.text+0x3b4): undefined reference to `__atomic_fetch_add_8'
 > threads_pthread.c:(.text+0x9c8): undefined reference to `__atomic_is_lock_free'
 > threads_pthread.c:(.text+0xa4): undefined reference to `__atomic_fetch_add_8'
 > threads_pthread.c:(.text+0xa9c): undefined reference to `__atomic_is_lock_free'
 > threads_pthread.c:(.text+0xb66): undefined reference to `__atomic_is_lock_free'
 > threads_pthread.c:(.text+0xc30): undefined reference to `__atomic_is_lock_free'
 > threads_pthread.c:(.text+0xcdc): undefined reference to `__atomic_is_lock_free'

 > The build error can be reproduced with the current buildroot tree using
 > this defconfig:

 > BR2_m68k=y
 > BR2_m68k_cf5208=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE=y
 > BR2_PACKAGE_OPENSSL=y
 > BR2_PACKAGE_LIBCURL=y

 > Although the toolchain lacks atomics support

 > $ grep ATOMIC .config
 > $

 > it emits atomic-related defines, for example:

 > $ echo | output/host/bin/m68k-linux-gcc -dM -E - | grep __ATOMIC_ACQ_REL
 > #define __ATOMIC_ACQ_REL 4
 > $

 > This specific define __ATOMIC_ACQ_REL is used in OpenSSL to enable
 > atomic support at various places:
 > https://github.com/openssl/openssl/blob/openssl-3.6.3/crypto/threads_pthread.c

 > causing the build errors we see with the mentioned defconfig.

 > To fix the problem we use an OpenSSL-provided define to forcefully
 > disable the usage of atomic intrinsics.

 > The misdetection of atomic intrinsics for m68k coldfire is not a new
 > problem:
 > https://lists.buildroot.org/pipermail/buildroot/2017-May/180841.html
 > https://lists.buildroot.org/pipermail/buildroot/2026-May/803110.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > v2: fixed patch description (Baruch)

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
