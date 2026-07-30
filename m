Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA84C55162
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 14:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 834A580F80;
	Thu, 30 Jul 2026 14:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdWm1w-DU4vN; Thu, 30 Jul 2026 14:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBB2B80F64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785422428;
	bh=q2h/uiAqNU0Hx/Bzd2upVajDnJbp/fDgS2SGATBHpyE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GeCmmLx5+ZVwb4b2I+C0cpUDulav5FAgEGTW5s9ICuIqV4mrRwn+6MTleaBkCQhjs
	 RKLFXgD5QfbyLZkX9Ca3edxTNf1NXlWiAUOK1NuEjwZbS3kdhxvYQY208PrWEajZFG
	 bqkeX1FGnlSSGNhuCQ8waOiwZ+ICoIJRv3b8lQxiTJeBXV5zNdAlLrlnBWDjycPYgj
	 WXnr9drvqnqhAbhFh6WJZtGuBN7Yy+RZQPhz27X8Z+DnS6FwLO0700CSTdva41U6GN
	 48JWdA+Xw8sNmnZROj4PlEYl1EXEyCXCZqmWZ0U7FBpIWU5RRi71UEWxKUk8ZQZW7t
	 +YKsUdnNStFBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBB2B80F64;
	Thu, 30 Jul 2026 14:40:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31B182CE
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 14:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23BD3608AB
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 14:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kljbeU_kXoOA for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 14:40:25 +0000 (UTC)
X-Greylist: delayed 503 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 30 Jul 2026 14:40:24 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3C4C608AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3C4C608AA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.156;
 helo=fhigh-a5-smtp.messagingengine.com; envelope-from=mcdev@playlinux.net;
 receiver=<UNKNOWN> 
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3C4C608AA
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 14:40:24 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 7F9E31400116;
 Thu, 30 Jul 2026 10:32:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 30 Jul 2026 10:32:00 -0400
X-ME-Sender: <xms:X2BranrJWrB9kNx7QH0GZFs4fXBBNkrvhSdeXGflcvqppvfKAVyDRw>
 <xme:X2BratGyuX7uefCcSvcXLKOjoNnwVQdQN7GZ9krZi2q01AsQfq3r47ZHOkdMLWrFW
 Whnd7BWzA3t9Qczt6ELMMMVbRjj4O77CArOmqmfPkZ_E7Df-32kJOBM>
X-ME-Received: <xmr:X2Branv8T2r_NEWrGfm7me-LkzYzMhQ5a_quX3ELyCSllre6-x7Pi6mM>
X-ME-Proxy-Cause: dmFkZTGV1IcvfxMjPcxz95pjq7VISrh8vSoi5ebK2KDPQbZKM0hFLRhpTeqrSsb7S1mTYB
 z05ufdOnWqteU8yjJonEWHj67yaGvfixfV3v98VKMqA6dSttlm177zxw/N6H+r4vz3ZC1R
 DsWr+SQmhsdKcl1HRXkPDEFV+nZzI24A0LLoPFkD9f1FSNlJ5HLtiPrHeycQu64qkzV64e
 iyzNCjulu0AS2+kvaf1G7KCdJLsLk56d9FW0GaL2SLqMf2xpIp24IMeyObcnCIyPCEqcMc
 Bd2Fo+6JpQ7Wza0RcoAfNcf5rhOLdBf/ZOKjYLU6WRTGMWfm091NvgAmjRlHettGBUuuRO
 gDyIcSebl6W4JQMRYAU2WAtklzDNtmif95Dnt2yPoHHoeoVLC9SUkcfMTTTJDnASbVihe4
 9n5IQ0mkHqfiMa7V/7y9z/LvKvUURButAEAEbA8UcbvdmCGEi/zvfHn+OmDB2X5mec5dVo
 3RAMBSXIB08AnSosxGp4SUgNYW/twJ+DbREgFvG6PIvTZFS3XJmYNDkdHH6QDkUcHXpWvr
 T66QauwH6Z2IOUB0IyWkpbwk5kWelJXEaMfPBvnUyATjvEnOaMkd8IAsnFbR8ZdLTqFvHM
 Y+ianqOK0JMcyxsuPox7TBWQ/ANDoEV/G1+bQOtuLyf264h/m2CsyZDGmB6w
X-ME-Proxy: <xmx:X2BravXodaeH-W9AfQUhS7xfMzgSFLwuoYRT_QXRZHSsp3FoEO_Nlg>
 <xmx:X2BrajHhbheHX9t-8o2tnrXQ2mL4-qlPSfkxkC-Z5kGkL4ucHplZDQ>
 <xmx:X2Brah0SVTV7YyPUbFYHaNwNSJDfyjzrcfo3beoRNhHGNu0bTaGuVA>
 <xmx:X2BralOBUDE5vIpFNVJeTAaG2yBnsgjAFnRkwKJGbUB5Qb9cLtHsDg>
 <xmx:YGBraiReZ5T006gdkLGxXJpkQ8C9vhS8C7dYCha7t8J48Fcyd154yFWD>
Feedback-ID: i0df9467b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 10:31:58 -0400 (EDT)
From: Michele Comignano <mcdev@playlinux.net>
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 16:31:27 +0200
Message-ID: <20260730143130.18903-1-mcdev@playlinux.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=playlinux.net; 
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm2; t=1785421920; x=1785508320; bh=v9QSVVj5ZC
 NhOHES5oI0UzGUho0grHPcvbm3oJRlU30=; b=caBfjy2k7hX/cM/ytbvV6di47U
 hqypEjEYRtiQ6pRVCDogjQR8vLmQtix5fE/i1NDj+RORjoxJXVnFe/bFdaKWFIdz
 djtxWV82rHu7lq90xSCkEH6DWuQy1t0hqtqGF2F6WLVJQwMESaFYc4OnjNBZVo1C
 mjLoRdeFt98mUnXnlO783FVKGzTSArfSBG8M0Tv1g2Ol3ho72p5t3WhpY2jQc9O1
 u6YMuc4bhfFTsKUsSsQz4PP6hQjNVB49L0ObPBuPpQIOjp35Yxd2yvUWS8xXJt3k
 Cgoiuf2rENxmO3bxh0T9NMVKbNKUGvIiIrzh5VrpldU0RKM8MoQwbM9ZYlpA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1785421920; x=1785508320; bh=v9QSVVj5ZCNhOHES5oI0UzGUho0grHPcvbm
 3oJRlU30=; b=N9IJoQvLdIAyZgBSUvhxbpMi9wyz9xkbmRKgVqX5MQz4FVVm3sQ
 7XQti5K1M4fFiZwGfPvBMPXpF7CWVtJGVSv7J+4sFlvNu1XAadD5cMZdXKuPLA7p
 hrrK2qlEDy/2CnF0sz7BMa9r9lGzpYxjifI0Ym8Uj923Mc0vV9l5YNn72a9T8HGs
 ldO4QIjT1mNCL/LJ5ebTBbxIOSfU9dJIUBehwSVKD5kYT/chWDRObn/4o37I6IvJ
 0Pc1ZMiS5Ba95f2qqFEJRtH9hWxACY3nviw9SEmlmYOOY7oEkUYPdrLPM46MGtOE
 5f4q1tNR8E9QMCcLH+F8a5Bfc2k4w72rfGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=playlinux.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=playlinux.net
 header.i=@playlinux.net header.a=rsa-sha256 header.s=fm2 header.b=caBfjy2k; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=N9IJoQvL
Subject: [Buildroot] [PATCH 1/1] package/libgpiod2: bump version to 2.3.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Boerge Struempfel <boerge.struempfel@gmail.com>,
 Michele Comignano <mcdev@playlinux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

changing build system from autotools to meson+ninja as for upstream
no breaking changes, still depends on kernel 5.1.

Signed-off-by: Michele Comignano <mcdev@playlinux.net>
---
 package/libgpiod2/libgpiod2.hash |  2 +-
 package/libgpiod2/libgpiod2.mk   | 23 ++++++++++++-----------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index a12752261a..48f7c77855 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592  libgpiod-2.2.4.tar.xz
+sha256  e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54b3566484650a30  libgpiod-2.3.1.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index d83fdbd94a..6c851e6dd3 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,35 +6,36 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.2.4
+LIBGPIOD2_VERSION = 2.3.1
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
 LIBGPIOD2_LICENSE_FILES = COPYING
 LIBGPIOD2_INSTALL_STAGING = YES
 LIBGPIOD2_DEPENDENCIES = host-pkgconf
+# v2.3.x switched from autotools to meson
 LIBGPIOD2_CONF_OPTS = \
-	--disable-bindings-python \
-	--disable-examples \
-	--disable-tests
+	-Dbindings-python=disabled \
+	-Dexamples=disabled \
+	-Dtests=disabled
 
 ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
-LIBGPIOD2_CONF_OPTS += --enable-tools
+LIBGPIOD2_CONF_OPTS += -Dtools=enabled
 else
-LIBGPIOD2_CONF_OPTS += --disable-tools
+LIBGPIOD2_CONF_OPTS += -Dtools=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 LIBGPIOD2_DEPENDENCIES += libedit
-LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
+LIBGPIOD2_CONF_OPTS += -Dgpioset-interactive=enabled
 else
-LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
+LIBGPIOD2_CONF_OPTS += -Dgpioset-interactive=disabled
 endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
+LIBGPIOD2_CONF_OPTS += -Dbindings-cxx=enabled
 else
-LIBGPIOD2_CONF_OPTS += --disable-bindings-cxx
+LIBGPIOD2_CONF_OPTS += -Dbindings-cxx=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
