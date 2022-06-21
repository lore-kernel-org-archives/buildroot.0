Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EFFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 18:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7501C41A01;
	Tue, 21 Jun 2022 18:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7501C41A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5AqHLP80aeR; Tue, 21 Jun 2022 18:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D683419FE;
	Tue, 21 Jun 2022 18:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D683419FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFC051BF3EE
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 18:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99DC640911
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 18:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99DC640911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7rDX55unrpkU for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 18:45:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E043404DA
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E043404DA
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 18:45:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id c21so20188702wrb.1
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 11:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yOMeaXEhgdyL9HT0bPiHSfNuC31K5fEsWKHzMSdExLE=;
 b=s/DFK465J3zpdwzpUWssVLMx/0xawxtkO8cWDnIN4WA1hwdfAMkXdrMBNY85C2nKoP
 KVL28Xo2Qw8Tht71fmCmffWBFtjvNfnKjyE2agRFb2brTrptXW2QGIXBIBYNYA4c3DNf
 eE2hnT9p2TPhJN2VpdXXSIiZunsxCKVIIuasN8mfSXsjQHAWLfINaaNcx1FO8RjpViSG
 9JZWmu2PpquFepq9LkzGbXheyl9Oije7iCtMg/TObENLBq+RAJ2KiuorygsTJ0iBoeAP
 rBYig+jqgjQ1MOsZV2P+rM6OPR2Ifrx7fGPTLV25t8BaDD1oO2gChdeTghYBjai7dWI1
 1gig==
X-Gm-Message-State: AJIora+66QNUbU6HFXL71lq7DgAJXlwRLVn9jn5DM7CXWvRIiJOfIc6n
 VDDel4vA88tYcxXnxJpaLQyvgbKuOG4=
X-Google-Smtp-Source: AGRyM1t12x+EhHm040FZd39S2P6s1XX3yw1EtAsc4k9XoFLYT0DfapIu+pBxr0BN37yo52nrKzWKsQ==
X-Received: by 2002:a05:6000:1869:b0:21b:933c:7e2 with SMTP id
 d9-20020a056000186900b0021b933c07e2mr8643375wri.252.1655837106438; 
 Tue, 21 Jun 2022 11:45:06 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a05600c354900b003975c7058bfsm19468248wmq.12.2022.06.21.11.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 11:45:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 20:42:23 +0200
Message-Id: <20220621184223.1396167-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yOMeaXEhgdyL9HT0bPiHSfNuC31K5fEsWKHzMSdExLE=;
 b=I6/Dh3h/rhz/sjgGcy+c0BfzTlzn3rvi+nFo9Wj1x7S+BV+4A6pRDitd4LBX9eHupm
 77hK4Xn8a+9u59W4CCFt6CeRnAiNwwJXX/ZXQf0gUHm6NNboRGJaykWTQbxOzySlel5y
 TNASDPS3tLqNs2bGOrYpMvAhK5fPRazMmjAaeSF8Lfe3yVqD16o+pk50Imu9M740QX32
 Je2zi7WLEwQVaRDQZPTVv4m5NrASWnmEfagMvAG6IXTWubxly39d6/Y7FadejX56BgS3
 ri3ZMdVsoQMdhYlmSwcKLKuZDBV+6zRQj2JMeLRbEaOWovBIHzh5epEXaaybQOqzrjHr
 8XlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=I6/Dh3h/
Subject: [Buildroot] [PATCH 1/1] package/libstrophe disable examples
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
Cc: Denis Bodor <lefinnois@lefinnois.net>, Michael Vetter <jubalh@iodoru.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable examples to avoid the following build failure on sparc:

examples/perf.c: In function 'rdtsc':
examples/perf.c:110:5: warning: 'x' is used uninitialized in this function [-Wuninitialized]
  110 |     __asm__ __volatile__("rd %%tick, %0; clruw %0, %1; srlx %0, 32, %0"
      |     ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5881246c4e9f7560181d2e60185d3bb5cf4f5a5f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-add-disable-examples.patch           | 50 +++++++++++++++++++
 package/libstrophe/libstrophe.mk              |  3 ++
 2 files changed, 53 insertions(+)
 create mode 100644 package/libstrophe/0002-add-disable-examples.patch

diff --git a/package/libstrophe/0002-add-disable-examples.patch b/package/libstrophe/0002-add-disable-examples.patch
new file mode 100644
index 0000000000..53a9fc5c18
--- /dev/null
+++ b/package/libstrophe/0002-add-disable-examples.patch
@@ -0,0 +1,50 @@
+From 476dd4c4f7a6252e4faaf60aa14779fcd154a894 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 11 Jun 2022 23:31:08 +0200
+Subject: [PATCH] add --disable-examples
+
+Allow the user to disable build of examples
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/strophe/libstrophe/commit/476dd4c4f7a6252e4faaf60aa14779fcd154a894]
+---
+ Makefile.am  | 2 ++
+ configure.ac | 4 ++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 58c1d0f..8bccb28 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -122,6 +122,7 @@ EXTRA_DIST = \
+ 	tests/key_encrypted.pem \
+ 	tests/res_query_dump.c
+ 
++if EXAMPLES
+ ## Examples
+ noinst_PROGRAMS = \
+ 	examples/active \
+@@ -165,6 +166,7 @@ examples_uuid_LDADD = $(STROPHE_LIBS)
+ examples_vcard_SOURCES = examples/vcard.c
+ examples_vcard_CFLAGS = $(STROPHE_FLAGS)
+ examples_vcard_LDADD = $(STROPHE_LIBS)
++endif
+ 
+ 
+ ## Tests
+diff --git a/configure.ac b/configure.ac
+index 701e44c..ed52466 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -35,6 +35,10 @@ AS_CASE([$PLATFORM],
+     [haiku],   [],
+                [WARNING_FLAGS="$WARNING_FLAGS -Wextra"])
+ 
++AC_ARG_ENABLE([examples],
++    [AS_HELP_STRING([--disable-examples], [turn off examples])],
++    [case "${enableval}" in yes) examples=true ;; no)  examples=false ;; *) AC_MSG_ERROR([bad value ${enableval} for --disable-examples]) ;; esac],[examples=true])
++AM_CONDITIONAL([EXAMPLES], [test x$examples = xtrue])
+ AC_ARG_WITH([libxml2],
+     [AS_HELP_STRING([--with-libxml2], [use libxml2 for XML parsing, expat is the default])])
+ AC_ARG_WITH([gnutls],
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index f48d073770..9ce85aed07 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -11,6 +11,9 @@ LIBSTROPHE_DEPENDENCIES = host-pkgconf
 LIBSTROPHE_LICENSE = MIT or GPL-3.0
 LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
 LIBSTROPHE_INSTALL_STAGING = YES
+# We're patching configure.ac
+LIBSTROPHE_AUOTORECONF = YES
+LIBSTROPHE_CONF_OPTS = --disable-examples
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 LIBSTROPHE_CONF_OPTS += --without-libxml2
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
