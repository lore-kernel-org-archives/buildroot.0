Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B85CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:47:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDC9A61026
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 18:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDC9A61026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62D074012B;
	Sun, 12 Sep 2021 18:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0i9o2fJPSb2o; Sun, 12 Sep 2021 18:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFFA940155;
	Sun, 12 Sep 2021 18:47:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC2741BF40E
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A557380F57
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 18:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRdyKIMjmahh for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 18:47:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BBE580D4C
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 18:47:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso5037771wmi.5
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 11:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=80E56nMDtxb7BsgVTGsBe3m24EtFNGslJvQgVuSUinw=;
 b=IVL6AFw+IgzlUnXQhxWDpymRfvpUpNS1wP8Sb4J7VGfl22XM9054jucJaj3KSWkwlp
 d0f7LxV/+30z3tLp6aHtE0WO34SqeaIsfouN9gGBI+VGFlpuG6yjcrLNWPVu2fIBFoWq
 2aZjQjWn1yHwfXda30x9qKNaEYfj1T2kwkYf9dzZ6cgonJXzQBrIy8ZD6DWxtX05wbBq
 bL0VoY64GqHIVD/J4xMfSZ4PBWfHTJIVCEesTZDgmzLucTmYWmJez0t4bAV+v1ZloZ8d
 LZ1143Cv/vlroGCLMW2qD9qS+ACZ0QqfCaVAU6mrtGfBU3S7p9sD1cRrTLWeqeQNyheO
 0aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=80E56nMDtxb7BsgVTGsBe3m24EtFNGslJvQgVuSUinw=;
 b=oTq69pmJ/VB2fmord/KjeHvL7RZKtAi++btkXxENf4xhD3SVkHk5OaiXnM9PpcEVGh
 wR9LRlw/UgZjdhBAUGwDW4arjW6Bri02x64mE/Ftfz7Fpzq0dmoX6qBrJ/0Em0cD2260
 0NQ5JwacpQoEtLhztu8CssK7/3KVrIqLoPE6KSQi88qQ6QaXQrswoLOm0MkpEwtQDKpY
 2v2P1XKz6fK4wza5UVneGUyKUlFzXQV6Ts3JwHMUMNC11RWytXxrpknbjakhMw96CHHN
 Z7qgxKxO+lPxnR3W9fiDk+faSdYsuu8I8e23wllIisi5/dr7kFOgJaGUhWu4iL5G74FB
 7vCw==
X-Gm-Message-State: AOAM533HbhVe6aAhkKNcX84/IpSX2xyVE1gryFXYuahYUkBnS3Rmo14I
 jhEI4afj3oLAwfFKJkmcZ5kTgjbpHbU=
X-Google-Smtp-Source: ABdhPJwGQdFO+F/x8T5icYheNcuth68zPnddGtpnJWKiLpGxFEXDwCXkviZ01tUFdsEObWexLuYBGw==
X-Received: by 2002:a05:600c:19ca:: with SMTP id
 u10mr7623922wmq.178.1631472465816; 
 Sun, 12 Sep 2021 11:47:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id t6sm4686900wmj.12.2021.09.12.11.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 11:47:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 20:47:24 +0200
Message-Id: <20210912184724.2186494-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libssh2: bump to version 1.10.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Drop patches (already in version) and so autoreconf
- Update hash of COPYING due to updates in year and authors with
  https://github.com/libssh2/libssh2/commit/53ff2e6da450ac1801704b35b3360c9488161342
  https://github.com/libssh2/libssh2/commit/c998f79384116e9f6633cb69c2731c60d3a442bb
  https://github.com/libssh2/libssh2/commit/635caa90787220ac3773c1d5ba11f1236c22eae8
- Update indentation in hash file (two spaces)

https://www.libssh2.org/changes.html#1.10.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-drop-custom-buildconf-script.patch   |  97 -------------
 ...002-acinclude.m4-add-mbedtls-to-LIBS.patch |  35 -----
 ...003-packet-c-improve-message-parsing.patch | 127 ------------------
 package/libssh2/libssh2.hash                  |   4 +-
 package/libssh2/libssh2.mk                    |   8 +-
 5 files changed, 3 insertions(+), 268 deletions(-)
 delete mode 100644 package/libssh2/0001-drop-custom-buildconf-script.patch
 delete mode 100644 package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch
 delete mode 100644 package/libssh2/0003-packet-c-improve-message-parsing.patch

diff --git a/package/libssh2/0001-drop-custom-buildconf-script.patch b/package/libssh2/0001-drop-custom-buildconf-script.patch
deleted file mode 100644
index bf187b26a8..0000000000
--- a/package/libssh2/0001-drop-custom-buildconf-script.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 39a2a444a32896bd2dab37c9b247ccfd11ff4693 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Mon, 30 Oct 2017 19:29:12 +0100
-Subject: [PATCH] buildsystem: drop custom buildconf script, rely on autoreconf
-
-The buildconf script is currently required, because we need to copy a
-header around, because it is used both from the library and the examples
-sources.
-
-However, having a custom 'buildconf'-like script is not needed if we can
-ensure that the header / exists by the time it is needed. For That, we
-can just append the src/ directory to the headers search path for the
-examples.
-
-And then it means we no longer need to generate the same header twice,
-so we remove the second one from configure.ac.
-
-Now, we can just call "autoreconf -fi" to generate the autotools files,
-instead of relying on the canned sequence in "buildconf", since
-autoreconf has now long known what to do at the correct moment (future
-versions of autotools, automake, autopoint, autoheader etc... may
-require an other ordering, or other intermediate steps, etc...).
-
-Eventually, get rid of buildconf now it is no longer needed. In fact, we
-really keep it for legacy, but have it just call autoreconf (and print a
-nice user-friendly warning).
-
-Update gitignore accordingly, too.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Sam Voss <sam.voss@rockwellcollins.com>
-[Fabrice: Remove .gitignore so patch applies on 1.9.0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- .gitignore          |  2 ++
- buildconf           | 24 +++++-------------------
- configure.ac        |  2 +-
- example/.gitignore  |  2 --
- example/Makefile.am |  2 +-
- 5 files changed, 9 insertions(+), 23 deletions(-)
-
-diff --git a/buildconf b/buildconf
-index 558dcb66..728b3397 100755
---- a/buildconf
-+++ b/buildconf
-@@ -1,22 +1,8 @@
- #!/bin/sh
- 
--LIBTOOLIZE="libtoolize"
-+echo "***" >&2
-+echo "*** Do not use buildconf. Instead, just use: autoreconf -fi" >&2
-+echo "*** Doing it for you now, but buildconf may disapear in the future." >&2
-+echo "***" >&2
- 
--if [ "x`which $LIBTOOLIZE`" = "x" ]; then
--    LIBTOOLIZE="glibtoolize"
--fi
--
--if [ "x`which $LIBTOOLIZE`" = "x" ]; then
--    echo "Neither libtoolize nor glibtoolize could be found!"
--    exit 1
--fi
--
--${LIBTOOLIZE} --copy --automake --force
--${ACLOCAL:-aclocal} -I m4 $ACLOCAL_FLAGS
--${AUTOHEADER:-autoheader}
--# copy the private libssh2_config.h.in to the examples dir so that
--# it can be included without pointing the include path to the private
--# source dir
--cp src/libssh2_config.h.in example/libssh2_config.h.in
--${AUTOCONF:-autoconf}
--${AUTOMAKE:-automake} --add-missing --copy
-+${AUTORECONF:-autoreconf} -fi "${@}"
-diff --git a/configure.ac b/configure.ac
-index c6ff7535..6939d0d6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2,7 +2,7 @@
- AC_INIT(libssh2, [-], libssh2-devel@cool.haxx.se)
- AC_CONFIG_MACRO_DIR([m4])
- AC_CONFIG_SRCDIR([src])
--AC_CONFIG_HEADERS([src/libssh2_config.h example/libssh2_config.h])
-+AC_CONFIG_HEADERS([src/libssh2_config.h])
- AM_MAINTAINER_MODE
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
-diff --git a/example/Makefile.am b/example/Makefile.am
-index 5cf5f071..41f65b12 100644
---- a/example/Makefile.am
-+++ b/example/Makefile.am
-@@ -13,5 +13,5 @@ if HAVE_SYS_UN_H
- noinst_PROGRAMS += x11
- endif
- 
--AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_builddir)/example
-+AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_builddir)/example -I../src
- LDADD = $(top_builddir)/src/libssh2.la
diff --git a/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch b/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch
deleted file mode 100644
index a70b1fe84f..0000000000
--- a/package/libssh2/0002-acinclude.m4-add-mbedtls-to-LIBS.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f4846473f0f0ec313f8ed7ff4cd9f59c1741465d Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 20 Mar 2018 20:21:53 +0200
-Subject: [PATCH] acinclude.m4: add mbedtls to LIBS
-
-This is useful for static builds so that the Libs.private field in
-libssh2.pc contains correct info for the benefit of pkg-config users.
-Static link with libssh2 requires this information.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-[Fabrice: Replace $LIBMBEDCRYTO by -lmdedcrypto to avoid adding a full
-library path to libssh2.pc as it raises build failures on some packages
-such as xerces]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
-Upstream status: https://github.com/libssh2/libssh2/pull/242
-
- acinclude.m4 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index c0e89a1a0c98..02c70845d27c 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -441,6 +441,7 @@ m4_case([$1],
- [mbedtls], [
-   LIBSSH2_LIB_HAVE_LINKFLAGS([mbedcrypto], [], [#include <mbedtls/version.h>], [
-     AC_DEFINE(LIBSSH2_MBEDTLS, 1, [Use $1])
-+    LIBS="$LIBS -lmbedcrypto"
-     found_crypto="$1"
-     support_clear_memory=yes
-   ])
--- 
-2.16.2
-
diff --git a/package/libssh2/0003-packet-c-improve-message-parsing.patch b/package/libssh2/0003-packet-c-improve-message-parsing.patch
deleted file mode 100644
index 2b73520021..0000000000
--- a/package/libssh2/0003-packet-c-improve-message-parsing.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From dedcbd106f8e52d5586b0205bc7677e4c9868f9c Mon Sep 17 00:00:00 2001
-From: Will Cosgrove <will@panic.com>
-Date: Fri, 30 Aug 2019 09:57:38 -0700
-Subject: [PATCH] packet.c: improve message parsing (#402)
-
-* packet.c: improve parsing of packets
-
-file: packet.c
-
-notes:
-Use _libssh2_get_string API in SSH_MSG_DEBUG/SSH_MSG_DISCONNECT. Additional uint32 bounds check in SSH_MSG_GLOBAL_REQUEST.
-[Retrieved from:
-https://github.com/libssh2/libssh2/commit/dedcbd106f8e52d5586b0205bc7677e4c9868f9c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/packet.c | 68 ++++++++++++++++++++++------------------------------
- 1 file changed, 29 insertions(+), 39 deletions(-)
-
-diff --git a/src/packet.c b/src/packet.c
-index 38ab6294..2e01bfc5 100644
---- a/src/packet.c
-+++ b/src/packet.c
-@@ -419,8 +419,8 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
-                     size_t datalen, int macstate)
- {
-     int rc = 0;
--    char *message = NULL;
--    char *language = NULL;
-+    unsigned char *message = NULL;
-+    unsigned char *language = NULL;
-     size_t message_len = 0;
-     size_t language_len = 0;
-     LIBSSH2_CHANNEL *channelp = NULL;
-@@ -472,33 +472,23 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
- 
-         case SSH_MSG_DISCONNECT:
-             if(datalen >= 5) {
--                size_t reason = _libssh2_ntohu32(data + 1);
-+                uint32_t reason = 0;
-+                struct string_buf buf;
-+                buf.data = (unsigned char *)data;
-+                buf.dataptr = buf.data;
-+                buf.len = datalen;
-+                buf.dataptr++; /* advance past type */
- 
--                if(datalen >= 9) {
--                    message_len = _libssh2_ntohu32(data + 5);
-+                _libssh2_get_u32(&buf, &reason);
-+                _libssh2_get_string(&buf, &message, &message_len);
-+                _libssh2_get_string(&buf, &language, &language_len);
- 
--                    if(message_len < datalen-13) {
--                        /* 9 = packet_type(1) + reason(4) + message_len(4) */
--                        message = (char *) data + 9;
--
--                        language_len =
--                            _libssh2_ntohu32(data + 9 + message_len);
--                        language = (char *) data + 9 + message_len + 4;
--
--                        if(language_len > (datalen-13-message_len)) {
--                            /* bad input, clear info */
--                            language = message = NULL;
--                            language_len = message_len = 0;
--                        }
--                    }
--                    else
--                        /* bad size, clear it */
--                        message_len = 0;
--                }
-                 if(session->ssh_msg_disconnect) {
--                    LIBSSH2_DISCONNECT(session, reason, message,
--                                       message_len, language, language_len);
-+                    LIBSSH2_DISCONNECT(session, reason, (const char *)message,
-+                                       message_len, (const char *)language,
-+                                       language_len);
-                 }
-+
-                 _libssh2_debug(session, LIBSSH2_TRACE_TRANS,
-                                "Disconnect(%d): %s(%s)", reason,
-                                message, language);
-@@ -539,24 +529,24 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
-                 int always_display = data[1];
- 
-                 if(datalen >= 6) {
--                    message_len = _libssh2_ntohu32(data + 2);
--
--                    if(message_len <= (datalen - 10)) {
--                        /* 6 = packet_type(1) + display(1) + message_len(4) */
--                        message = (char *) data + 6;
--                        language_len = _libssh2_ntohu32(data + 6 +
--                                                        message_len);
--
--                        if(language_len <= (datalen - 10 - message_len))
--                            language = (char *) data + 10 + message_len;
--                    }
-+                    struct string_buf buf;
-+                    buf.data = (unsigned char *)data;
-+                    buf.dataptr = buf.data;
-+                    buf.len = datalen;
-+                    buf.dataptr += 2; /* advance past type & always display */
-+
-+                    _libssh2_get_string(&buf, &message, &message_len);
-+                    _libssh2_get_string(&buf, &language, &language_len);
-                 }
- 
-                 if(session->ssh_msg_debug) {
--                    LIBSSH2_DEBUG(session, always_display, message,
--                                  message_len, language, language_len);
-+                    LIBSSH2_DEBUG(session, always_display,
-+                                  (const char *)message,
-+                                  message_len, (const char *)language,
-+                                  language_len);
-                 }
-             }
-+
-             /*
-              * _libssh2_debug will actually truncate this for us so
-              * that it's not an inordinate about of data
-@@ -579,7 +569,7 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
-                 uint32_t len = 0;
-                 unsigned char want_reply = 0;
-                 len = _libssh2_ntohu32(data + 1);
--                if(datalen >= (6 + len)) {
-+                if((len <= (UINT_MAX - 6)) && (datalen >= (6 + len))) {
-                     want_reply = data[5 + len];
-                     _libssh2_debug(session,
-                                    LIBSSH2_TRACE_CONN,
diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index 8e048ff508..7267e85987 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd  libssh2-1.9.0.tar.gz
-sha256 e15ed284a15e80115467d6d7f030f0d89d8fabbecd78fb6e0f861f0cfc128fd9  COPYING
+sha256  2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51  libssh2-1.10.0.tar.gz
+sha256  859e60d760a3446ecaf777339f1eef98c527aea40714384d24b882a83ffdd23a  COPYING
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 6147583a9e..cd74784d82 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 1.9.0
+LIBSSH2_VERSION = 1.10.0
 LIBSSH2_SITE = https://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
@@ -12,12 +12,6 @@ LIBSSH2_CPE_ID_VENDOR = libssh2
 LIBSSH2_INSTALL_STAGING = YES
 LIBSSH2_CONF_OPTS = --disable-examples-build
 
-# 0003-packet-c-improve-message-parsing.patch
-LIBSSH2_IGNORE_CVES += CVE-2019-17498
-
-# patch touching configure.ac and acinclude.m4
-LIBSSH2_AUTORECONF = YES
-
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
