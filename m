Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09665D59F73
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF26340A7A;
	Wed,  6 Nov 2024 21:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hlg7FVI3ctkD; Wed,  6 Nov 2024 21:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E71A40B5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E71A40B5F;
	Wed,  6 Nov 2024 21:30:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DADA34C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA1C640B5F
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhhZvqFgZGy2 for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23B00409F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B00409F8
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23B00409F8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:30:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 93B77E0003;
 Wed,  6 Nov 2024 21:30:16 +0000 (UTC)
Date: Wed, 6 Nov 2024 22:30:15 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, Woodrow Douglass
 <wdouglass@carnegierobotics.com>, Julien Olivain <ju.o@free.fr>, Asaf
 Kahlon <asafka7@gmail.com>, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>, Robert Rose
 <robertroyrose@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241106223015.75d7b3b4@windsurf>
In-Reply-To: <20241030190020.1444105-2-james.hilliard1@gmail.com>
References: <20241030190020.1444105-1-james.hilliard1@gmail.com>
 <20241030190020.1444105-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730928617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfJTehZX2CYkANYxIddG3i7n5CA5sJgwmXU4AvkukLQ=;
 b=FPCHEH/v1GlTjowLytDh83AukotbjuBH3bJzcV1GbZQUUnTS7BvWS8dlrfqVYWbOdjSpWv
 s5QkyTaKBNumcetlAwcL6NC1sMUgUioEy2arBaKNkDCDOaDq6lOF4rBpssP/HcQopxdlvA
 cgPs9rQfUp63H+0BR76Iapg4cVYibzDpyFdbkZpjYlyRvhhmhoL7Hbet3TRGWQkYtsCinZ
 IXOQSW7xpfJdC2YiHctE5wNaFXaEhbn4782/goLlp9A/8MwscVQuAwZuoG9h/2fmTe5oEz
 uFtESPIcth04jZcbmUaYtyanUoZXv7R5PLY0k6Rs8U+LiaESQO6Nxd1qB81/mA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FPCHEH/v
Subject: Re: [Buildroot] [PATCH v4 2/6] package/grpc: bump to version 1.66.1
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

On Wed, 30 Oct 2024 13:00:16 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new -DgRPC_BUILD_CODEGEN=OFF config option which is required if
> no plugins are enabled.
> 
> Drop no longer relevant add GPR_DISABLE_WRAPPED_MEMCPY patch.
> 
> Rebase remaining patches.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

There's something I'm not super happy with with this bump:

- It is needed to fix the current build breakage in grpc
  (http://autobuild.buildroot.net/results/b2dfc13dcac8396bc7510a4d992558a01d3c9f22/),
  which is caused by your bump of libabseil-cpp in
  0d40b47866753340b214e811af53e6a95216bbb3.

- But this grpc version bump *requires* the protobuf bump (apparently).
  So it's a lot of version bumps needed to fix a build issue.

I would have preferred a more minimal fix of the grpc build for the
current master, and separately a bump, but backporting the fix for the
libaseil-cpp issue seems difficult.

So, fair enough, let's do it with a protobuf bump + grpc bump.

Overall, I did not apply this patch because it requires your protobuf
bump, but the protobuf bump needs more work.

However, please add into your patch series the following additional
patch:

commit 122e581244877ce4383448a1a298dd9ae480cde7
Author: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date:   Mon Nov 4 23:27:44 2024 +0100

    package/grpc: remove BR2_TOOLCHAIN_HAS_GCC_BUG_85180 dead code
    
    This work-around was added in commit
    716f8b34c526c702aa19e9a66a25df5d3a6ea663 ("package/grpc: work around
    gcc bug 85180") to work around a bug on Microblaze. However, since
    commit
    ae0557403a3a4cbf5354f0ab1784a08623382e5e ("package/libabseil-cpp: add
    BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS"), grpc depends on
    libaseil-cpp, which isn't available on Microblaze, making the
    GCC_BUG_85180 no longer needed, and effectively dead code. This commit
    drops it.
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 47ebf1997c..39be4f583f 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -59,11 +59,6 @@ GRPC_CFLAGS += -DGPR_DISABLE_WRAPPED_MEMCPY
 GRPC_CXXFLAGS += -DGPR_DISABLE_WRAPPED_MEMCPY
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-GRPC_CFLAGS += -O0
-GRPC_CXXFLAGS += -O0
-endif
-
 GRPC_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(GRPC_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(GRPC_CXXFLAGS)"



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
