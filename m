Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F354C4320A
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 20:25:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01CF96056B
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 20:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01CF96056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=starry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7AE84047E;
	Tue, 31 Aug 2021 20:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCiwEtUrrEef; Tue, 31 Aug 2021 20:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 539FD40708;
	Tue, 31 Aug 2021 20:25:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12B431BF853
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 20:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ECE660632
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 20:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=starry.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKHB6yqYCba5 for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 20:25:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6725C6062C
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 20:25:29 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id e18so184779qvo.1
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 13:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starry.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFL16sB8X9MvocWsQGi1R0oCWbzIdOTZwtkbso6wNAA=;
 b=QDm9sIRm73ii9KaDl3QiosVUK30lor81MDgZ4NeyJKCtuk7r0z3A+u4gp4RL+qWYCo
 znbpyHCoKrt58g2MHwjHiekVucZT8ZLhmRrB8f2D3YUN9XKnyzfOgpb1R1k0iKuQlp15
 lA9RCyHZhEKyMuv7Jn2TGSDq4RqzwSeQRU/vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFL16sB8X9MvocWsQGi1R0oCWbzIdOTZwtkbso6wNAA=;
 b=dmbH+njYr1KyhLseUSDRHdNL4bBx8IT+LqTAzLtVeOQbs9QxDOj1U9kcSn3RRFBj1u
 lQABuO1PMe0lmqBtUeOsfBab9h7pMT0bo2Dt+bsPEr87Ug1SgFbwYzj0jr8C8sazTQZH
 f3+qavDGJb/Zdg/P3k6V4PbQEHL/TtRgj2qGoCOnUtM5UyjBpek4/D5n+9nf8BEMynJh
 smfvonVugvqygkY0JNQ+95dICtqZ2rmjAPMCyHgsZnXmK4lZwG2TjtBrp9SAc9xu+xDd
 DinVBb0krPHuDVj3TdzAfUNSk1CBIJLaEghJ3CLhgwMyNUCuhrdHqzAzFm/C8OLiyuGN
 +63w==
X-Gm-Message-State: AOAM531xKG62gGzY5B8bmWUqUXnL2HBN7lANHoC7Vh/A8/p8YaES1eDs
 2CviTDE8iIUn5E2rpmVlGD8EkU3POkr0fg==
X-Google-Smtp-Source: ABdhPJzswsnBCqjWcWO0FyPpsadcsY3on+TyOzb5q/eW7F0GlmVLxqrheqiL7Mq/XFdCJat75YaU9Q==
X-Received: by 2002:a0c:f550:: with SMTP id p16mr16126954qvm.25.1630441528117; 
 Tue, 31 Aug 2021 13:25:28 -0700 (PDT)
Received: from starry.com (205-201-16-55.starry-inc.net. [205.201.16.55])
 by smtp.gmail.com with ESMTPSA id a185sm14557133qkg.128.2021.08.31.13.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 13:25:27 -0700 (PDT)
From: Nevo Hed <nhed+buildroot@starry.com>
To: buildroot@buildroot.org
Date: Tue, 31 Aug 2021 16:24:50 -0400
Message-Id: <20210831202450.18238-2-nhed+buildroot@starry.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831202450.18238-1-nhed+buildroot@starry.com>
References: <20210831202450.18238-1-nhed+buildroot@starry.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nginx: override endianness
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Nevo Hed <nhed+buildroot@starry.com>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Though several cross-compilation patches exist in buildroot's nginx
package dir they do not seem to address endianness.

The test program generated by the configure script compiles but fails
to run (as it is built for another architecture) but the script does
not distinguish between the failure to run the program and an
indication of certain endianness.  As such the fallback of big-endian
is used.  This setting then causes http2 headers (anything not in the
static dictionary) to come out as undecipherable trash on 64bit
targets (see ngx_http_v2_huff_encode_buf()).

This commit includes a patch to the configure script to allow a
`--force-endianness=big|little` flag as well as setting that flag in
buildroot's package makefile.

Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
---
 ...-of-endianness-for-cross-compilation.patch | 118 ++++++++++++++++++
 package/nginx/nginx.mk                        |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch

diff --git a/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch b/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
new file mode 100644
index 0000000000..3810412b52
--- /dev/null
+++ b/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
@@ -0,0 +1,118 @@
+From 4bd8fe780ff2064f2d4e9c905d8a98dd0f9b6191 Mon Sep 17 00:00:00 2001
+From: Nevo Hed <nhed+buildroot@starry.com>
+Date: Mon, 30 Aug 2021 13:28:13 -0400
+Subject: [PATCH] Allow forcing of endianness for cross-compilation
+
+Upstream-status: Invalid (upstream doesn't support cross-compilation)
+See https://trac.nginx.org/nginx/ticket/2240
+
+Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
+---
+ auto/endianness | 61 ++++++++++++++++++++++++++++++++-----------------
+ auto/options    |  6 +++++
+ 2 files changed, 46 insertions(+), 21 deletions(-)
+
+diff --git a/auto/endianness b/auto/endianness
+index 1b552b6b..4b2a3cd7 100644
+--- a/auto/endianness
++++ b/auto/endianness
+@@ -26,25 +26,44 @@ int main(void) {
+ 
+ END
+ 
+-ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
+-          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
+-
+-eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
+-
+-if [ -x $NGX_AUTOTEST ]; then
+-    if $NGX_AUTOTEST >/dev/null 2>&1; then
+-        echo " little endian"
++case "${NGX_FORCE_ENDIANNESS}" in
++    little)
++        echo " little endian (forced)"
+         have=NGX_HAVE_LITTLE_ENDIAN . auto/have
+-    else
+-        echo " big endian"
+-    fi
+-
+-    rm -rf $NGX_AUTOTEST*
+-
+-else
+-    rm -rf $NGX_AUTOTEST*
+-
+-    echo
+-    echo "$0: error: cannot detect system byte ordering"
+-    exit 1
+-fi
++    ;;
++
++    big)
++        echo " big endian (forced)"
++    ;;
++
++    "")
++        ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
++                  -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
++
++        eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
++
++        if [ -x $NGX_AUTOTEST ]; then
++            if $NGX_AUTOTEST >/dev/null 2>&1; then
++                echo " little endian"
++                have=NGX_HAVE_LITTLE_ENDIAN . auto/have
++            else
++                echo " big endian"
++            fi
++
++            rm -rf $NGX_AUTOTEST*
++
++        else
++            rm -rf $NGX_AUTOTEST*
++
++            echo
++            echo "$0: error: cannot detect system byte ordering"
++            exit 1
++        fi
++    ;;
++
++    *)
++        echo
++        echo "$0: error: invalid \"--force-endianness=${NGX_FORCE_ENDIANNESS}\""
++        exit 1
++    ;;
++esac
+diff --git a/auto/options b/auto/options
+index 80be906e..85a06456 100644
+--- a/auto/options
++++ b/auto/options
+@@ -17,6 +17,8 @@ NGX_USER=
+ NGX_GROUP=
+ NGX_BUILD=
+ 
++NGX_FORCE_ENDIANNESS=
++
+ CC=${CC:-cc}
+ CPP=
+ NGX_OBJS=objs
+@@ -196,6 +198,8 @@ do
+         --user=*)                        NGX_USER="$value"          ;;
+         --group=*)                       NGX_GROUP="$value"         ;;
+ 
++        --force-endianness=*)            NGX_FORCE_ENDIANNESS="$value" ;;
++
+         --crossbuild=*)                  NGX_PLATFORM="$value"      ;;
+ 
+         --build=*)                       NGX_BUILD="$value"         ;;
+@@ -432,6 +436,8 @@ cat << END
+   --build=NAME                       set build name
+   --builddir=DIR                     set build directory
+ 
++  --force-endianness=<big>|<little>  force endianness
++
+   --with-select_module               enable select module
+   --without-select_module            disable select module
+   --with-poll_module                 enable poll module
+-- 
+2.31.1
+
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 1f996cc613..31b6e276b7 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -49,6 +49,7 @@ NGINX_CONF_ENV += \
 
 # prefix: nginx root configuration location
 NGINX_CONF_OPTS += \
+	--force-endianness=$(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN))) \
 	--prefix=/usr \
 	--conf-path=/etc/nginx/nginx.conf \
 	--sbin-path=/usr/sbin/nginx \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
