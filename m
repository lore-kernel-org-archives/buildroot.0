Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9335C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 21:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D2BF60773;
	Fri, 10 Feb 2023 21:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D2BF60773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wz7CAALM5XjJ; Fri, 10 Feb 2023 21:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D27060758;
	Fri, 10 Feb 2023 21:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D27060758
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EDA81BF276
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 21:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 547D541B36
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 21:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 547D541B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1fSePzcYdsD for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 21:55:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC9FA41A6B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC9FA41A6B
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 21:55:51 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so5025657wmb.2
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 13:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHQBeG7OSkClQZq30ACW6cnfBNFIIGhVZxqilAlhcA0=;
 b=obiMvC8kuRQZbdyYM6HUk5cIIwJ9xvi2Isjj57baQGsrxW7/ykFy3fm457CHliLYiF
 hbJboGbjGtiyw9A5fMCJIJ7rlDL+bzcNEP0F4UtanH7dwGiWhOYprqB+1CleqkfXRIOc
 tPUyGv8ZyNhnzn6NdmFZVdd0qLVFxhhpu0mtQ7E8yXGoIxmUgElECEPBkT9+UfVeFLvK
 yArMR5kqvMNpEPy2ogbiO8XYBl+ze6fhzs9bG4O71hLugJBvVCh1dc7A/SwX2EkIebwo
 865N+F+ptMaG8vSHc3rKuBCkp7Ux+zrF9vzhg5oDMTCufgRcYAdznYkBgqdtHNs68ufn
 kzzw==
X-Gm-Message-State: AO0yUKXROEzD7A92uxd/PokSUeYlVp85EYtSV4de4+VVtfh8QY8OM4a4
 nlQSB9qVWSs+Ceo4PICw6etbjPQisfw=
X-Google-Smtp-Source: AK7set9i8nVylDG+U9TP0gJFGj8Q6h/xuvHkimceXMH/j7W3eanN2MCkGRcLZ5IzwiwrUib4n/Enxg==
X-Received: by 2002:a05:600c:a287:b0:3df:ee64:4814 with SMTP id
 hu7-20020a05600ca28700b003dfee644814mr14051468wmb.20.1676066149915; 
 Fri, 10 Feb 2023 13:55:49 -0800 (PST)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 o41-20020a05600c512900b003dc4aae4739sm10819338wms.27.2023.02.10.13.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 13:55:49 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 22:55:48 +0100
Message-Id: <20230210215548.1050371-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=dHQBeG7OSkClQZq30ACW6cnfBNFIIGhVZxqilAlhcA0=;
 b=NCay/V8YdPQJ0Di8hy6jyOlJBR4GVhcFqxPz1zr+RNZ4yli6FGH3rAapSWNz0VAOM3
 P8En6V/N3tkm2NBSIA6liV08lFYWUAFgy2XXNTt6KVGC1vQaeJ82kVehzsUFtt7SKnz7
 yVxnBJENpuoqejFM8QeNdeWH7KKJIufqSmo4fu4Xpr0Eew+8L9eEpyWA0E3GmvDqJPXe
 v7PqpnkM0k02ecRftbjkDYAaYmEzQfff0GezHWWp1/cuXWx2CGAPmGir5JZF6RixLsJ7
 XbTFppW2OX/UTg5dedKC/I5m1q8N7j0Fgupyaf9e5WbxtLVcY51dfPnuiOoZaxoZJmn5
 rT0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NCay/V8Y
Subject: [Buildroot] [PATCH] package/erlang: do not hard-code the Erlang
 Interface Version (EI_VSN)
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>, Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The note above the erlang version instructs to refer to another note
further down the file. However, even if it is not too difficult to find,
it is still located a bit too far away, and the reference is not very
explicit what note we should look at.

When we introduced that variable in 6c1d128844c5 (package/erlang: export
EI_VSN so other packages can use it), the rationale for hard-coding it
was "to avoid spawning a shell every time the variable is dereferenced".

However, that can get a bit confusing and hard to follow. Also, that in
fact spawns a shell only once for each rebar-packages, so the overhead
is far from being too high.

The EI_VSN is only used by rebar-package packages, is derefrenced from
the rebar-infra and not the packages themselves, and is not needed by
erlang itself (it knows its own EI_VSN), so we can de-hard-code it, and
rely on build-time detection, by looking in the appropriate file.

We have two files where we could look:
  - lib/erl_interface/vsn.mk in the erlang source tree, but it is not
    installed,
  - .../lib/erlang/releases/$(ERLANG_RELASE)/installed_application_versions
    as installed by erlang.

We use the second one, as it is cleaner, for a package, to look into
installed files, rather than to look in the source tree of another
package.

Although both the host and target erlang are the same, we still look
into the corresponding file to extract the version. This is so that it
would be easier if in the future we ever manage to rely on a
system-installed erlang that could have a EI_VSN different from the
target one.

We can't re-use the variable ERLANG_EI_VSN, because it now needs to be
$(call)-ed with a parameter. Hopefully, external packages that use it
directly rather than through the rebar infra, are not legion...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Will Newton <will.newton@gmail.com>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang/erlang.mk | 8 ++++----
 package/pkg-rebar.mk     | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index ac2c204a49..5d6b69057a 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# See note below when updating Erlang
 ERLANG_VERSION = 22.3.4.22
+ERLANG_RELEASE = $(firstword $(subst ., ,$(ERLANG_VERSION)))
 ERLANG_SITE = \
 	https://github.com/erlang/otp/releases/download/OTP-$(ERLANG_VERSION)
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
@@ -36,9 +36,9 @@ ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
 HOST_ERLANG_DEPENDENCIES += host-autoconf
 HOST_ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
 
-# Whenever updating Erlang, this value should be updated as well, to the
-# value of EI_VSN in the file lib/erl_interface/vsn.mk
-ERLANG_EI_VSN = 3.13.2.2
+# Return the EIV (Erlang Interface Version, EI_VSN)
+# $(1): base directory, i.e. either $(HOST_DIR) or $(STAGING_DIR)/usr
+erlang_ei_vsn = `sed -r -e '/^erl_interface-(.+)/!d; s//\1/' $(1)/lib/erlang/releases/$(ERLANG_RELEASE)/installed_application_versions`
 
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index e4e3f3bb6c..4b993dd970 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -32,10 +32,10 @@ REBAR_TARGET_DEPS_DIR = $(STAGING_DIR)/usr/share/rebar/deps
 #
 REBAR_HOST_DEPS_ENV = \
 	ERL_COMPILER_OPTIONS='{i, "$(REBAR_HOST_DEPS_DIR)"}' \
-	ERL_EI_LIBDIR=$(HOST_DIR)/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
+	ERL_EI_LIBDIR=$(HOST_DIR)/lib/erlang/lib/erl_interface-$(call erlang_ei_vsn,$(HOST_DIR))/lib
 REBAR_TARGET_DEPS_ENV = \
 	ERL_COMPILER_OPTIONS='{i, "$(REBAR_TARGET_DEPS_DIR)"}' \
-	ERL_EI_LIBDIR=$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
+	ERL_EI_LIBDIR=$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-$(call erlang_ei_vsn,$(STAGING_DIR)/usr)/lib
 
 ################################################################################
 # Helper functions
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
