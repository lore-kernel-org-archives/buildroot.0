Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A39DC5DF87
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 12:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD44560661;
	Fri, 21 Aug 2026 12:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ST0i7RIa4A2m; Fri, 21 Aug 2026 12:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787315919;
	bh=3DXkYMfi+EQvj7MgLawFvysYRWG3g3w1gp7s8Q6rfjA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SX2oY3ABj0z4mZ1CEXZ+G1DGc1l9UZ+B0/bt4Tr12G62MpA7LTLBYExKI/xZ3LnRF
	 IuZuyFKm0N8aI+uKEAc+9lvlfL9NGJDcA/LjKe4MPQq0JIxI4py2l7gh2daDIVl6zb
	 o1KcXBVax1nPeh4XwW1epyh9AzleK286Jp1nzQwFFXUBE5Vv+6MPFX9Ii0/Zy9tT1Y
	 zDs1gwnZQokIfsB3rA2nUAgzt6f4lpBspfpP9puemOy2KNaMD7aBwXyAQCIgGVccbg
	 Wor19EeXTL1ykf3Er+4EYWGq3U3VloChC+0FIdVnlY9F+YGzhYa/z+Sg45S0+S6MBC
	 pmRd1n6E7NLew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C178F606A6;
	Fri, 21 Aug 2026 12:38:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9F4A263
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 12:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C77244097C
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 12:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6l4FsPJJ6Mc for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 12:38:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D84E4096F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 12:38:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 945F54E41319;
 Fri, 21 Aug 2026 12:38:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5698F604AA;
 Fri, 21 Aug 2026 12:38:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 785FA11C77095; 
 Fri, 21 Aug 2026 14:38:27 +0200 (CEST)
Date: Fri, 21 Aug 2026 14:38:26 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>, 
 romain.naour@smile.fr, Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 guenther.harrasser@mobileye.com
Message-ID: <aohFF1WM2HaL7WU9@windsurf>
References: <20260727100739.1847998-1-jimmy.wesolowski@mobileye.com>
 <87qzkmq21f.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87qzkmq21f.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/openssh: enable DES when using
 libopenssl
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

Hello Jimmy, Hello Peter,

On Tue, Jul 28, 2026 at 10:42:20PM +0200, Peter Korsgaard wrote:

>  > Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
> 
> Hmm, with what configuration is this? Presumably not one where
> BR2_PACKAGE_OPENSSH_SERVER is enabled, as that pulls in libxcrypt on
> glibc?

Issue can be reproduced with:

  BR2_aarch64=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
  BR2_INIT_NONE=y
  BR2_SYSTEM_BIN_SH_NONE=y
  # BR2_PACKAGE_BUSYBOX is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2 is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2 is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2 is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2 is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_IDEA is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_SEED is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_DES is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3 is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST is not set
  # BR2_PACKAGE_LIBOPENSSL_UNSECURE is not set
  # BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_ARGON2 is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_CACHED_FETCH is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_CMP is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_THREAD_POOL is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_ECX is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_PADLOCK_ENGINE is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_MODULE is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_QUIC is not set
  # BR2_PACKAGE_LIBOPENSSL_SECURE_MEMORY is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_SIV is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_SM2_PRECOMP_TABLE is not set
  # BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL_TRACE is not set
  BR2_PACKAGE_OPENSSH=y
  # BR2_PACKAGE_OPENSSH_SERVER is not set
  # BR2_PACKAGE_OPENSSH_KEY_UTILS is not set
  # BR2_PACKAGE_OPENSSH_SANDBOX is not set
  # BR2_TARGET_ROOTFS_TAR is not set

So basically, OpenSSH enabled, client only (since enabling the server
would pull in libxcrypt) and disabling all OpenSSL sub-options.

The code in OpenSSH goes like this:

# if defined(WITH_OPENSSL) && !defined(HAVE_CRYPT) && defined(HAVE_DES_CRYPT)
#  include <openssl/des.h>
#  define crypt DES_crypt
# endif

So basically, the idea is that if we have OpenSSL, we don't have
crypt(), but we have DES_crypt, then we use DES_crypt() as
crypt(). Otherwise, the crypt() call in the OpenSSH xcrypt() function
remains crypt(), and things blow up when you're building with glibc
and you don't have libxcrypt around to provide crypt().

So indeed, we have two options here:

- Always provide a crypt() implementation by making libxcrypt
  mandatory for OpenSSH as a whole, not just for the server-side

- Require OpenSSH to provide DES support, which is what Jimmy was
  proposing.

I honestly don't have a strong argument. My vague feeling is that DES
being obsolete, it feels odd to be forced to enable it. Though perhaps
libxcrypt would in fact provide exactly the same obsolete crypto
algorithm?

Peter: thoughts?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
