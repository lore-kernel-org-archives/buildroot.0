Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D68C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A96AF80AD0;
	Sun, 30 Jun 2024 14:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2qizooSrGgY; Sun, 30 Jun 2024 14:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92CE680AF9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92CE680AF9;
	Sun, 30 Jun 2024 14:48:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78F581BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65E77408A5
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtJWt28OYX2n for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:48:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A25BB405DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A25BB405DE
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A25BB405DE
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:48:51 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4256aee6e4dso16097355e9.1
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719758929; x=1720363729;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hax9E3GeNavI/sr2d70bCq2tYfMqUKIv6vQnz53w5KA=;
 b=kdJlR9sH2PUbkLGOFRIor2lG0smdmqKpd3gtz8gx50VphbenKO5M1zQa+dYnrNyeUY
 8XzsKkTOTztofIRQ+KjdoEfmVsXXC/jAQynEw1Gd+LRsKMGbw33+BZeK+w63wtdC/hQ3
 dz4KdBeGnecCYEf/Lr5EJnwC1MhmszDZ6nqcniXvdpx7MfTamQjE2MPPgEUXEiyNdl1f
 difitqSufouKpo8VgoprdopWXbeDUHGJZ0Qk7JnCch/KuR/ssc1MlU6xhGnYgEf5ZKLt
 ewLzrqZJhct2Ah+5QoQbM4ev412+q/MWXZchzgIrox2VdOewgXqKnC3k1i+jgrAcuFDy
 WbRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlOZdDQJGJhERnNojCQFrfB0x0QyDsjhBcfA/t14Qiqz9YXK2JwdaAHmp4SxcaBO0moWccKF3CY8KfOp0uDwVCsK4lkU9vZQ==
X-Gm-Message-State: AOJu0Ywf232z/mXIJS9PfeOLPvN68yzNJszyo+iny6blc7vl15i664xG
 zdjmwevZEdkPpQ1RIqtB2JtxhJtFWuUyW82hvEi7wMOgO2x9rKagRvXOW8ZuFpa1bKSEGWkW4WJ
 y
X-Google-Smtp-Source: AGHT+IHbbFonPx2S3RAeGMC43LLieVyh7GgKKWOmw4agqm5qcosubMrkTyG0BxGZIVaajl1fCZoR3A==
X-Received: by 2002:adf:f80d:0:b0:366:e838:f5d4 with SMTP id
 ffacd0b85a97d-36775699f64mr2046263f8f.3.1719758929470; 
 Sun, 30 Jun 2024 07:48:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd5f1sm7668308f8f.6.2024.06.30.07.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:48:49 -0700 (PDT)
Message-ID: <0c924bf0-e51f-4ab0-80a6-b44237851f9b@mind.be>
Date: Sun, 30 Jun 2024 16:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240629082152.3438355-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240629082152.3438355-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719758929; x=1720363729; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Hax9E3GeNavI/sr2d70bCq2tYfMqUKIv6vQnz53w5KA=;
 b=aASNlWTi0xazBsBTRX1k8fzy8qNp9AY9AEUEG7oq9as2zbYH2EI8v10DKwS2l3NXvL
 y51e9vYUsoNuOKOG24u4RkV9zmmQLMJNVGm7ZJrAZkOmQKgIqyU/cAjuEoeB0FVqwCyl
 phCp1KR3i7Og50jVs4KkJ8YAxLuoALBWNSa0TevHert4iPUO77nfMHs70AaIcpCKAmbS
 GMl41X+dZBxGvDLStCDwE5UIDfdMYZ8ABMJ71JeBxPcfZD9SXsOf7oR4Nxg86sIh56QD
 ckJqtIwflXAclk9vc3qd1KQQwjGa3ku2E0ymj8B69EkqIVW39dBLGeEhPjGKnV3Ao0lw
 jdww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aASNlWTi
Subject: Re: [Buildroot] [PATCH 1/1] package/libgcrypt: bump version to
 1.11.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Bernd,

On 29/06/2024 10:21, Bernd Kuhls wrote:
> Release notes:
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=blob;f=NEWS
> https://dev.gnupg.org/T7166
> 
> Rebased patch.
> 
> Updated license hash due to upstream commit:

  It's not sufficient to point to the commit, you should also explain what 
changed (in particular, make it clear that the license hasn't changed).

  I did that and applied to master, thanks.

  Regards,
  Arnout

> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commitdiff;h=2538430a35b02b9ac002a84930650bf4767fc473
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   ...0001-configure.ac-add-an-option-to-disable-tests.patch | 8 +++++---
>   package/libgcrypt/libgcrypt.hash                          | 6 +++---
>   package/libgcrypt/libgcrypt.mk                            | 2 +-
>   3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
> index 5ddde9df1b..bc0f9ebe7f 100644
> --- a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
> +++ b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
> @@ -15,6 +15,8 @@ Fixes:
>    - http://autobuild.buildroot.org/results/50a8ba572e3fafd3c6a39bd54bcfcaf78b5ad325
>   
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Bernd: rebased for version 1.11.0]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>   ---
>    Makefile.am  |  7 ++++++-
>    configure.ac | 10 ++++++++++
> @@ -38,13 +40,13 @@ index 7fa4fa4d..f0bd90e4 100644
>   -SUBDIRS =         compat mpi cipher random src $(doc) tests
>   +SUBDIRS =         compat mpi cipher random src $(doc) $(tests)
>    
> - EXTRA_DIST = autogen.sh autogen.rc README.GIT LICENSES      	           \
> -              ChangeLog-2011 build-aux/ChangeLog-2011 doc/ChangeLog-2011    \
> + EXTRA_DIST = autogen.sh autogen.rc README.GIT LICENSES			   \
> + 	     ChangeLog-2011 build-aux/ChangeLog-2011 doc/ChangeLog-2011	   \
>   diff --git a/configure.ac b/configure.ac
>   index e8c8cd39..1a6b61e5 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -3231,6 +3231,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
> +@@ -3777,6 +3777,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
>    AM_CONDITIONAL([BUILD_DOC], [test "x$build_doc" != xno])
>    
>    
> diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
> index ffe30e1455..ced8087ca9 100644
> --- a/package/libgcrypt/libgcrypt.hash
> +++ b/package/libgcrypt/libgcrypt.hash
> @@ -1,5 +1,5 @@
>   # From https://www.gnupg.org/download/integrity_check.html
> -sha1  359e1d01ad2eb9cd2db964ea96ef3712d0c2c649  libgcrypt-1.10.3.tar.bz2
> -sha256  8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa  libgcrypt-1.10.3.tar.bz2
> +sha1  dd2c68e0685bb99249efeeb06046fae15b5214ba  libgcrypt-1.11.0.tar.bz2
> +sha256  09120c9867ce7f2081d6aaa1775386b98c2f2f246135761aae47d81f58685b9c  libgcrypt-1.11.0.tar.bz2
>   # Locally calculated
> -sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
> +sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
> index 2e4bf7448e..7a68a95c98 100644
> --- a/package/libgcrypt/libgcrypt.mk
> +++ b/package/libgcrypt/libgcrypt.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBGCRYPT_VERSION = 1.10.3
> +LIBGCRYPT_VERSION = 1.11.0
>   LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
>   LIBGCRYPT_LICENSE = LGPL-2.1+
>   LIBGCRYPT_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
