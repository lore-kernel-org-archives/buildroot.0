Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAB1C282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 21:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6797460882;
	Sun, 16 Mar 2025 21:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDJYhUg4ZOcE; Sun, 16 Mar 2025 21:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44C04608C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44C04608C6;
	Sun, 16 Mar 2025 21:02:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A01ED61
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 21:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E5DB81FB9
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 21:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZN2a-C1Oypbi for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 21:02:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6CAE581FBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CAE581FBA
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CAE581FBA
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 21:02:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43bb6b0b898so14607615e9.1
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 14:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742158966; x=1742763766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kesbCyZzmT6ARY1KeXyqWxrKVUJi4bVFZdXEiRraHV8=;
 b=tWtu2aipWvYO3ac+7YF7qnmM5Auv7uNEsVebow8Xqf1bOfOvQTCUyxua6joqmJqycy
 uwH4l85cfP6Ikhlf2+1ykYveIpVE1DMv2kyoKDpPMWLm1cXAYxVJtx8Dip8Mhq1kNccc
 TNJWNsRcN1ZRnmpr8ucoILi7KHXjiaP+7CLGJf5P6XCudiQDNbE5vwAW2lWWvR48rqbZ
 McOBxP5xf6hQqbs22UVuWWG1ZATzrXyHAHdV/imKgSTL1Bk3rEMDA1RvnMzmpbisC9KY
 mWkw80NTx8+ZhHI0r+SEe7jg5VKw4OXOImP9M5bLv+f8sTdFPO8ZioSQoWTU4pxOdoX1
 kz/Q==
X-Gm-Message-State: AOJu0YzttAkqyP5yymRGibH086tQopiE70vWRbPadkDcNNO9fEBkRQwj
 Q/5EFnYa84IpGfgJPBG44WcXeEzXlp3PFz2LnlQEsxkjpXD7FBMRCac0oQ==
X-Gm-Gg: ASbGncuvFkYttobGq1XIV9mtvC8OGjt789A380z9zmbL2Zr7Lbam/ponvRL4b8dmwyi
 /rQSqLRXP4+etrZ1L8tesS0Vim3ls+EUcwhL2b8V7GCvaXemSXXy9ffY1WkWElKy4zIBKWVWDqa
 CD1Vl5fdWuKK4UHpdMdvF2ii+oavnVcE5Cj8FEUQqxyr9Hu5f/iWnJOoIEheddbWVkvT/apzd3I
 x6suNNxhHX8n0wHjKFpM3JlzRrj6p79K9V/m2+CqiJI9y5jq23aS0kF/rkETczYe0MxfEL+Cfr9
 d5fTwNsA5ObQyjCVXPvGWs0qnIBHLwZ60PkFO10JwFq1QE5dUkVxxcn5
X-Google-Smtp-Source: AGHT+IHSqhuhz+ib7NDR4+Fcoxl5kXtprXFYsrKtMmCjz/XekuBtnxwv4gURbcJtmNmALJ54q41Vpw==
X-Received: by 2002:a05:600c:4747:b0:43c:ec0a:ddfd with SMTP id
 5b1f17b1804b1-43d1ec7250fmr95715095e9.6.1742158966104; 
 Sun, 16 Mar 2025 14:02:46 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffc450esm86678045e9.23.2025.03.16.14.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 14:02:45 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun, 16 Mar 2025 22:02:45 +0100
Message-ID: <20250316210245.1706946-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742158966; x=1742763766; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=kesbCyZzmT6ARY1KeXyqWxrKVUJi4bVFZdXEiRraHV8=;
 b=jWZnvkP64qZtRoP3mT6BPYuem8FGRdHqLcfn7IOiKVN/n86bEFbbZ+vHc5QQ+FlbFv
 4hMxDW+IwsQgWVcEaKJqWKbDM84VnUJe5Oqu7J99Yih5P5pfW3g2ItaPvorQH0bEkset
 yVqk0h6NEEdBCRFnzMJWOBhfJEXF6J+FS8doSwAzp8nDpQOOXvTyt2qYvQAU3MSuFYM6
 5sfRQxs9t7nyh6vxowS04YxiZfC4tss4i6/TPd+9KJtmZOj44X1JI1ewjL8LyWhcjP1A
 kllEYSAX/XKtVjdNo0C0imHxmsjNUtLZtLwnt95daXKQ93OZ/BG8DzBrDFeR38s8T3Ey
 OH7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jWZnvkP6
Subject: [Buildroot] [PATCH] package/libopenssl do not build in parallel
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

With highly parallel build on a hevily loaded machine, the libopenssl
build often (about half of the time) fails with spurious missing rules
in its Makefile:

    >>> host-libopenssl 3.4.1 Installing to host directory
    [...] /usr/bin/make  -C [...]/build/host-libopenssl-3.4.1 install
    "/usr/bin/make" depend && "/usr/bin/make" _build_libs
    "/usr/bin/make" depend && "/usr/bin/make" _build_modules
    "/usr/bin/make" depend && "/usr/bin/make" _build_programs
    [...]
    make[3]: *** No rule to make target '_build_modules'.  Stop.
    make[2]: *** [Makefile:3159: build_modules] Error 2
    make[2]: *** Waiting for unfinished jobs....
    make[3]: Nothing to be done for '_build_programs'.
    make[3]: Nothing to be done for '_build_libs'.
    make[1]: *** [package/pkg-generic.mk:283: [...]/build/host-libopenssl-3.4.1/.stamp_host_installed] Error 2
    make[1]: *** Waiting for unfinished jobs....
    [...]
    make: *** [Makefile:23: _all] Error 2

Ideally, we'd like to fix the issue. However, the Nakefile is generated
by the Configure script, written in perl, from the template in
Configurations/unix-Makefile.tmpl, which also uses some kind of special
(perl-related, probably) templating language. That makes it pretty
difficult to see what is going on, though, and nigh impossible to fix
without a deep understanding of the openssl buildsystem.

So, we can only disable parallel builds until the issue is fixed
upstream [0]. Add a comment to both build commands (host and target) to
reference the upstream issue report.

Note that the issue has mostly been observed in the build of the host
variant so far, but there is no reason why it can't happen in the build
of the target variant.

[0] https://github.com/openssl/openssl/issues/27074

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libopenssl/libopenssl.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index c1c5b818d7..663e8d9b9f 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -132,24 +132,26 @@ endef
 LIBOPENSSL_POST_CONFIGURE_HOOKS += LIBOPENSSL_FIXUP_STATIC_MAKEFILE
 endif
 
+# Parallel build broken: https://github.com/openssl/openssl/issues/27074
 define HOST_LIBOPENSSL_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)
 endef
 
+# Parallel build broken: https://github.com/openssl/openssl/issues/27074
 define LIBOPENSSL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
 endef
 
 define LIBOPENSSL_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define HOST_LIBOPENSSL_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install
 endef
 
 define LIBOPENSSL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
 	$(RM) -rf $(TARGET_DIR)/usr/lib/ssl
 	$(RM) -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
