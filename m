Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B303BC369A2
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7322041385;
	Wed,  9 Apr 2025 20:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Csxz5R5iML62; Wed,  9 Apr 2025 20:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A8941423
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A8941423;
	Wed,  9 Apr 2025 20:04:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A7FB201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19BB682194
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdRNxY7qGSA3 for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 899D3820C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 899D3820C3
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 899D3820C3
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so6164470f8f.1
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229034; x=1744833834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wqdDgAfUyufeuQtMxPLXza0MOMNJ6GbTloxbA3+28Sc=;
 b=nLoCnABSd/Of+8mWDo18s6csv86UxJEUrDaRK3kFZamo5yGaHRUXv44Na07AFb8JkL
 RG1/QFSdjiovzGMBjl47UtZSHc9PVj70EbfammdfvBWmaFrbSsNCRLARDeGVmVLzLcP1
 IHZtSwEnnzalvQMQ25jIv+V8m+pPLESklLsj+Z660LszKoQAVWBKDast97rDo3lLHkvn
 JjyrcIBAIYLMf3CkFt8jde5PWBH2aDs0L56hTAIxVv5LPI9RzNfYN/F7h5i0WCMdNZPK
 5isUiSIzG0hGMSled0msXGJr5dJPHyzVgcoZQoVy+7biDcUJm+ubgDxUZdhLwXsyp83J
 8VsA==
X-Gm-Message-State: AOJu0YwcVMJ85uOC38dMmYs21rrV3eL/A2Zsua/dUG9YT1MQyWaDhrGY
 CLAKUI1HxN2wz3Rwl7Zrx9x04pENw40DMiI87BLfbe2mcTqvr/1bvZmRSA==
X-Gm-Gg: ASbGncsrSNG98Ks3a6cMcyhHZryeWhELTu+hlKSV3HOryxnl2Yn+Sd44sp+Ye1xvZix
 YGR64ApORU+pOweJHQAtKyK+xEd1t0JzliubsyUNHvx3mREm5fQD6eefIuE4dGOx3FDH2ToVZeB
 YwrReq06tcWj9PGo8m8SXqfRgnEruufiavXN+XHXoQt7Za2bUa0I/GdXz316FWeIC5cnIKyaJRn
 858L2tT6NxYEL0cbX+JYqjnEIh9uW4gZtG8ytEQPqn7pbj8kwwBho69d0YQTgZbRUxvIYhKzcue
 9xXhS0qdoS5mFmVVeBI23D4rHRxkRJGITKiZ8D/xfyA6WlNhw5E=
X-Google-Smtp-Source: AGHT+IFndCg7DF5DQLUoHhGTWFkb3Gvh0TIMIkzu9HVUgv9Ob5aj/PFlMXlUy4eBcGF0JDTfMXLlBA==
X-Received: by 2002:a05:6000:420f:b0:39a:cb5b:78fe with SMTP id
 ffacd0b85a97d-39d8f473299mr61136f8f.34.1744229034250; 
 Wed, 09 Apr 2025 13:03:54 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:54 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 22:03:36 +0200
Message-ID: <504eb60d090de873c306ea5df2d96aa85ab53258.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229034; x=1744833834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqdDgAfUyufeuQtMxPLXza0MOMNJ6GbTloxbA3+28Sc=;
 b=ffS9BgBunCNsl2ARy5u1DOLoQlyWU8NOEa1HaRsNkUjObrCTuLc2EkVxIM9X/qpA0d
 GQgFTbKQKb0sw9R8gPPE/ys1jdAaBpDfvdNhrjm6mMHFICpaf9UKgOwcF3IfvtofWrmS
 JIx1F4T1J2y+fxlRaQrGQuRKzxNcsLgakfOFDnqZ66UuWyqA7/aMCDuYIVuoJ7iWFk3j
 RPa5cQFhl0154fXwc4WfXeD1togTPF1pr38SPr4FUMr41Vcp/EmFdhNyV8ptzSfuz5Od
 uuTLHmcS0FZMYYlVPNb8ps4Dr4Jpxm9vekDLzNY6rzB0p6d5RBkslYUmgdIp4sHJ92r/
 yG2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ffS9BgBu
Subject: [Buildroot] [PATCH 21/29 v2] package/boost: use positive logic to
 enable libraries
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

boostrap.sh has supported --with-libraries since its inception on
2005-10-07, with upstream commit a3595d0d7570 (Initial shot at a
configure script for Boost), and since its was first available in a
release, with Boost 1.34.0 released on 2013-04-13.

Using negative logic is counter-intuitive, and we avoid doing that in
Buildroot whenever possible, especially when using positive logic is
just as powerful.

Additionally, if a new version of Boost incldues a new library that we
missed, and that `./bootstrap.sh --show-libraries` also does not report,
then that new library would be built with the current use of negative
logic (i.e. all that is not disabled is built). By using positive logic,
only what gets explicitly enabled gets built, and such a new library
would not be built; thus, an interested party would late rnotice, and
add the necessary support.

Furthermore, by using positive logic here, and because we know that the
'headers' library will always be enabled, we know the list is not empty,
and thus we can simplify the code slightly.

Note that we would have liked to also explicitly disable libraries not
enabled in the configuration, but that is not possible: Boost's
buildsystem only accepts one of --with-libraries or --without-libraries.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/boost.mk | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 7538dcb8f4..aa7b93a375 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -74,13 +74,13 @@ HOST_BOOST_FLAGS = \
 	--without-icu \
 	--with-toolset=gcc
 
-HOST_BOOST_WITHOUT_FLAGS = \
+HOST_BOOST_LIBS = \
 	$(foreach lib, $(BOOST_ALL_LIBS), \
-		$(if $(BR2_PACKAGE_HOST_BOOST_$(call UPPERCASE,$(lib))),,$(lib)) \
+		$(if $(BR2_PACKAGE_HOST_BOOST_$(call UPPERCASE,$(lib))),$(lib)) \
 	)
 
-HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED = $(subst $(space),$(comma),$(strip $(HOST_BOOST_WITHOUT_FLAGS)))
-HOST_BOOST_FLAGS += $(if $(HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED))
+HOST_BOOST_FLAGS += \
+	--with-libraries=$(subst $(space),$(comma),$(strip $(HOST_BOOST_LIBS)))
 
 HOST_BOOST_OPTS += toolset=gcc threading=multi \
 	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
@@ -130,13 +130,13 @@ endif
 BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
 endif
 
-BOOST_WITHOUT_FLAGS = \
+BOOST_LIBS = \
 	$(foreach lib, $(BOOST_ALL_LIBS), \
-		$(if $(BR2_PACKAGE_BOOST_$(call UPPERCASE,$(lib))),,$(lib)) \
+		$(if $(BR2_PACKAGE_BOOST_$(call UPPERCASE,$(lib))),$(lib)) \
 	)
 
-BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
-BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPARATED))
+BOOST_FLAGS += \
+	--with-libraries=$(subst $(space),$(comma),$(strip $(BOOST_LIBS)))
 
 # how verbose should the build be?
 BOOST_OPTS += $(if $(QUIET),-d0,-d+1)
@@ -201,7 +201,7 @@ endef
 BOOST_PRE_INSTALL_TARGET_HOOKS += BOOST_REMOVE_TARGET_LIBRARIES
 
 define BOOST_CHECK_TARGET_LIBRARIES
-	@$(foreach disabled,$(BOOST_WITHOUT_FLAGS),\
+	@$(foreach disabled, $(filter-out $(BOOST_LIBS),$(BOOST_ALL_LIBS)), \
 		! ls $(TARGET_DIR)/usr/lib/libboost_$(disabled)* 1>/dev/null 2>&1 || \
 			! echo "libboost_$(disabled) shouldn't have been installed: missing select in boost/Config.in" || \
 			exit 1;)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
