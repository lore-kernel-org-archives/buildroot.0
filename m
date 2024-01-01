Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC24AC47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 22:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 621F64090D;
	Mon,  1 Jan 2024 22:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 621F64090D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9tKlHo9ROCg9; Mon,  1 Jan 2024 22:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C37C040A50;
	Mon,  1 Jan 2024 22:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C37C040A50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5C151BF3BE
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B55342155
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 22:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B55342155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Twk0qeyGJ_FQ for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 22:06:07 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 971E94215B
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 22:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 971E94215B
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-336c9acec03so5027099f8f.2
 for <buildroot@buildroot.org>; Mon, 01 Jan 2024 14:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704146764; x=1704751564;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r8K3qZs2jkAQbDvqzpr/cpB9Y70Gmf0NdLsIEJhYfbU=;
 b=qd6jHvyUCw7ZRpY9KPbCjab0rO0iAQ0EkKWp45XXuCuRNx22Ie6Ecof8anN6wAkMRd
 aFnQAO8A+/MsFVIGBv3bg9PgSNJKvPSH5eijpwxcjwlDcqeQzNyRKqieRsBtkqfZiYq1
 u34CKgy/PO3Po6OsxRLmEL+1QtLS/2Awcdskp3nsXgPPVvvtmcrn+mXIRGdDCdli3Umo
 OiBSXk+uazJY1GtkegvMaUGvnkFXW0Slt8CY+hAyF6/7SDtcUQNB7YLnLk3ReRZ4jqfy
 ajU5R36F2BQky7WMbNau3bJbbQF8UyilTvQB/XVyjOyFZBT9TypLre+fv3m2U+S/biEi
 cKxg==
X-Gm-Message-State: AOJu0Yw9D3Cq7EcEPBuV6dkqkddAS/+EUQXl9PLrs2EzaDjmgG/o+RB9
 LI8G0+kDr1sSsJN6iVsifxEcKQjOLzE=
X-Google-Smtp-Source: AGHT+IEn4cEyezMRzDu5itRf1KQi5/zvbP8rgEDh1BmfudgwQymj2u97nZQzxo/SmWODwe+9wx/mHw==
X-Received: by 2002:adf:f64a:0:b0:336:ba58:dade with SMTP id
 x10-20020adff64a000000b00336ba58dademr5898133wrp.62.1704146763494; 
 Mon, 01 Jan 2024 14:06:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 dr15-20020a5d5f8f000000b003373ece28efsm4266109wrb.29.2024.01.01.14.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 14:06:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jan 2024 23:06:01 +0100
Message-ID: <20240101220601.8779-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704146764; x=1704751564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r8K3qZs2jkAQbDvqzpr/cpB9Y70Gmf0NdLsIEJhYfbU=;
 b=FCmY5hjHM2iaY9vqE1LD1Pav8Oooz+IdvHkUDdVLtVvkG0O8hZmREa3QDBOBhQ/12z
 /uAhy3XmHluiC9d416wyjtIkHxdQfEL/5IX9OL924y10+y2LRAiaDTjrMSiVMAidlgWK
 O4phW9nC6rblEkuAJPydOWLPsvAjNxr5/KWX/KQzSVZxBhDWi+hRCmcIRkF8jbs1qZS1
 lDJUVj+/7V4onppASCvckg+tpgB7jRRhPSnXBGZlBWD56wfPbCR8Dp0RNA4c5/rseR4x
 ikRJ7pYKSFX6UUtz53l2HtYz3fcxJSkdB8RtTq41HclbkWI3hIUJMuKPS1U27p02FMQO
 rn+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FCmY5hjH
Subject: [Buildroot] [PATCH 1/1] package/libssh2: fix CVE-2023-48795
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/advisories/GHSA-45x7-px36-x8w8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...o-fix-CVE-2023-48795-Terrapin-Attack.patch | 462 ++++++++++++++++++
 package/libssh2/libssh2.mk                    |   3 +
 2 files changed, 465 insertions(+)
 create mode 100644 package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch

diff --git a/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch b/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch
new file mode 100644
index 0000000000..2ccedee19e
--- /dev/null
+++ b/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch
@@ -0,0 +1,462 @@
+From d34d9258b8420b19ec3f97b4cc5bf7aa7d98e35a Mon Sep 17 00:00:00 2001
+From: Michael Buckley <michael@buckleyisms.com>
+Date: Thu, 30 Nov 2023 15:08:02 -0800
+Subject: [PATCH] src: add 'strict KEX' to fix CVE-2023-48795 "Terrapin Attack"
+
+Refs:
+https://terrapin-attack.com/
+https://seclists.org/oss-sec/2023/q4/292
+https://osv.dev/list?ecosystem=&q=CVE-2023-48795
+https://github.com/advisories/GHSA-45x7-px36-x8w8
+https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-48795
+
+Fixes #1290
+Closes #1291
+
+Upstream: https://github.com/libssh2/libssh2/commit/d34d9258b8420b19ec3f97b4cc5bf7aa7d98e35a
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/kex.c          | 63 +++++++++++++++++++++++------------
+ src/libssh2_priv.h | 18 +++++++---
+ src/packet.c       | 83 +++++++++++++++++++++++++++++++++++++++++++---
+ src/packet.h       |  2 +-
+ src/session.c      |  3 ++
+ src/transport.c    | 12 ++++++-
+ 6 files changed, 149 insertions(+), 32 deletions(-)
+
+diff --git a/src/kex.c b/src/kex.c
+index 8e7b7f0af3..a7b301e157 100644
+--- a/src/kex.c
++++ b/src/kex.c
+@@ -3032,6 +3032,13 @@ kex_method_extension_negotiation = {
+     0,
+ };
+ 
++static const LIBSSH2_KEX_METHOD
++kex_method_strict_client_extension = {
++    "kex-strict-c-v00@openssh.com",
++    NULL,
++    0,
++};
++
+ static const LIBSSH2_KEX_METHOD *libssh2_kex_methods[] = {
+ #if LIBSSH2_ED25519
+     &kex_method_ssh_curve25519_sha256,
+@@ -3050,6 +3057,7 @@ static const LIBSSH2_KEX_METHOD *libssh2_kex_methods[] = {
+     &kex_method_diffie_helman_group1_sha1,
+     &kex_method_diffie_helman_group_exchange_sha1,
+     &kex_method_extension_negotiation,
++    &kex_method_strict_client_extension,
+     NULL
+ };
+ 
+@@ -3302,13 +3310,13 @@ static int kexinit(LIBSSH2_SESSION * session)
+     return 0;
+ }
+ 
+-/* kex_agree_instr
++/* _libssh2_kex_agree_instr
+  * Kex specific variant of strstr()
+  * Needle must be preceded by BOL or ',', and followed by ',' or EOL
+  */
+-static unsigned char *
+-kex_agree_instr(unsigned char *haystack, size_t haystack_len,
+-                const unsigned char *needle, size_t needle_len)
++unsigned char *
++_libssh2_kex_agree_instr(unsigned char *haystack, size_t haystack_len,
++                         const unsigned char *needle, size_t needle_len)
+ {
+     unsigned char *s;
+     unsigned char *end_haystack;
+@@ -3393,7 +3401,7 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * session,
+         while(s && *s) {
+             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
+             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
+-            if(kex_agree_instr(hostkey, hostkey_len, s, method_len)) {
++            if(_libssh2_kex_agree_instr(hostkey, hostkey_len, s, method_len)) {
+                 const LIBSSH2_HOSTKEY_METHOD *method =
+                     (const LIBSSH2_HOSTKEY_METHOD *)
+                     kex_get_method_by_name((char *) s, method_len,
+@@ -3427,9 +3435,9 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * session,
+     }
+ 
+     while(hostkeyp && (*hostkeyp) && (*hostkeyp)->name) {
+-        s = kex_agree_instr(hostkey, hostkey_len,
+-                            (unsigned char *) (*hostkeyp)->name,
+-                            strlen((*hostkeyp)->name));
++        s = _libssh2_kex_agree_instr(hostkey, hostkey_len,
++                                     (unsigned char *) (*hostkeyp)->name,
++                                     strlen((*hostkeyp)->name));
+         if(s) {
+             /* So far so good, but does it suit our purposes? (Encrypting vs
+                Signing) */
+@@ -3463,6 +3471,12 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
+ {
+     const LIBSSH2_KEX_METHOD **kexp = libssh2_kex_methods;
+     unsigned char *s;
++    const unsigned char *strict =
++        (unsigned char *)"kex-strict-s-v00@openssh.com";
++
++    if(_libssh2_kex_agree_instr(kex, kex_len, strict, 28)) {
++        session->kex_strict = 1;
++    }
+ 
+     if(session->kex_prefs) {
+         s = (unsigned char *) session->kex_prefs;
+@@ -3470,7 +3484,7 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
+         while(s && *s) {
+             unsigned char *q, *p = (unsigned char *) strchr((char *) s, ',');
+             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
+-            q = kex_agree_instr(kex, kex_len, s, method_len);
++            q = _libssh2_kex_agree_instr(kex, kex_len, s, method_len);
+             if(q) {
+                 const LIBSSH2_KEX_METHOD *method = (const LIBSSH2_KEX_METHOD *)
+                     kex_get_method_by_name((char *) s, method_len,
+@@ -3504,9 +3518,9 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
+     }
+ 
+     while(*kexp && (*kexp)->name) {
+-        s = kex_agree_instr(kex, kex_len,
+-                            (unsigned char *) (*kexp)->name,
+-                            strlen((*kexp)->name));
++        s = _libssh2_kex_agree_instr(kex, kex_len,
++                                     (unsigned char *) (*kexp)->name,
++                                     strlen((*kexp)->name));
+         if(s) {
+             /* We've agreed on a key exchange method,
+              * Can we agree on a hostkey that works with this kex?
+@@ -3550,7 +3564,7 @@ static int kex_agree_crypt(LIBSSH2_SESSION * session,
+             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
+             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
+ 
+-            if(kex_agree_instr(crypt, crypt_len, s, method_len)) {
++            if(_libssh2_kex_agree_instr(crypt, crypt_len, s, method_len)) {
+                 const LIBSSH2_CRYPT_METHOD *method =
+                     (const LIBSSH2_CRYPT_METHOD *)
+                     kex_get_method_by_name((char *) s, method_len,
+@@ -3572,9 +3586,9 @@ static int kex_agree_crypt(LIBSSH2_SESSION * session,
+     }
+ 
+     while(*cryptp && (*cryptp)->name) {
+-        s = kex_agree_instr(crypt, crypt_len,
+-                            (unsigned char *) (*cryptp)->name,
+-                            strlen((*cryptp)->name));
++        s = _libssh2_kex_agree_instr(crypt, crypt_len,
++                                     (unsigned char *) (*cryptp)->name,
++                                     strlen((*cryptp)->name));
+         if(s) {
+             endpoint->crypt = *cryptp;
+             return 0;
+@@ -3614,7 +3628,7 @@ static int kex_agree_mac(LIBSSH2_SESSION * session,
+             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
+             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
+ 
+-            if(kex_agree_instr(mac, mac_len, s, method_len)) {
++            if(_libssh2_kex_agree_instr(mac, mac_len, s, method_len)) {
+                 const LIBSSH2_MAC_METHOD *method = (const LIBSSH2_MAC_METHOD *)
+                     kex_get_method_by_name((char *) s, method_len,
+                                            (const LIBSSH2_COMMON_METHOD **)
+@@ -3635,8 +3649,9 @@ static int kex_agree_mac(LIBSSH2_SESSION * session,
+     }
+ 
+     while(*macp && (*macp)->name) {
+-        s = kex_agree_instr(mac, mac_len, (unsigned char *) (*macp)->name,
+-                            strlen((*macp)->name));
++        s = _libssh2_kex_agree_instr(mac, mac_len,
++                                     (unsigned char *) (*macp)->name,
++                                     strlen((*macp)->name));
+         if(s) {
+             endpoint->mac = *macp;
+             return 0;
+@@ -3667,7 +3682,7 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
+             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
+             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
+ 
+-            if(kex_agree_instr(comp, comp_len, s, method_len)) {
++            if(_libssh2_kex_agree_instr(comp, comp_len, s, method_len)) {
+                 const LIBSSH2_COMP_METHOD *method =
+                     (const LIBSSH2_COMP_METHOD *)
+                     kex_get_method_by_name((char *) s, method_len,
+@@ -3689,8 +3704,9 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
+     }
+ 
+     while(*compp && (*compp)->name) {
+-        s = kex_agree_instr(comp, comp_len, (unsigned char *) (*compp)->name,
+-                            strlen((*compp)->name));
++        s = _libssh2_kex_agree_instr(comp, comp_len,
++                                     (unsigned char *) (*compp)->name,
++                                     strlen((*compp)->name));
+         if(s) {
+             endpoint->comp = *compp;
+             return 0;
+@@ -3871,6 +3887,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
+                 session->local.kexinit = key_state->oldlocal;
+                 session->local.kexinit_len = key_state->oldlocal_len;
+                 key_state->state = libssh2_NB_state_idle;
++                session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
+                 session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
+                 session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
+                 return -1;
+@@ -3896,6 +3913,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
+                 session->local.kexinit = key_state->oldlocal;
+                 session->local.kexinit_len = key_state->oldlocal_len;
+                 key_state->state = libssh2_NB_state_idle;
++                session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
+                 session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
+                 session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
+                 return -1;
+@@ -3944,6 +3962,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
+         session->remote.kexinit = NULL;
+     }
+ 
++    session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
+     session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
+     session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
+ 
+diff --git a/src/libssh2_priv.h b/src/libssh2_priv.h
+index 7660366954..18d9ab2130 100644
+--- a/src/libssh2_priv.h
++++ b/src/libssh2_priv.h
+@@ -736,6 +736,9 @@ struct _LIBSSH2_SESSION
+     /* key signing algorithm preferences -- NULL yields server order */
+     char *sign_algo_prefs;
+ 
++    /* Whether to use the OpenSSH Strict KEX extension */
++    int kex_strict;
++
+     /* (remote as source of data -- packet_read ) */
+     libssh2_endpoint_data remote;
+ 
+@@ -908,6 +911,7 @@ struct _LIBSSH2_SESSION
+     int fullpacket_macstate;
+     size_t fullpacket_payload_len;
+     int fullpacket_packet_type;
++    uint32_t fullpacket_required_type;
+ 
+     /* State variables used in libssh2_sftp_init() */
+     libssh2_nonblocking_states sftpInit_state;
+@@ -948,10 +952,11 @@ struct _LIBSSH2_SESSION
+ };
+ 
+ /* session.state bits */
+-#define LIBSSH2_STATE_EXCHANGING_KEYS   0x00000001
+-#define LIBSSH2_STATE_NEWKEYS           0x00000002
+-#define LIBSSH2_STATE_AUTHENTICATED     0x00000004
+-#define LIBSSH2_STATE_KEX_ACTIVE        0x00000008
++#define LIBSSH2_STATE_INITIAL_KEX       0x00000001
++#define LIBSSH2_STATE_EXCHANGING_KEYS   0x00000002
++#define LIBSSH2_STATE_NEWKEYS           0x00000004
++#define LIBSSH2_STATE_AUTHENTICATED     0x00000008
++#define LIBSSH2_STATE_KEX_ACTIVE        0x00000010
+ 
+ /* session.flag helpers */
+ #ifdef MSG_NOSIGNAL
+@@ -1182,6 +1187,11 @@ ssize_t _libssh2_send(libssh2_socket_t socket, const void *buffer,
+ int _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
+                           key_exchange_state_t * state);
+ 
++unsigned char *_libssh2_kex_agree_instr(unsigned char *haystack,
++                                        size_t haystack_len,
++                                        const unsigned char *needle,
++                                        size_t needle_len);
++
+ /* Let crypt.c/hostkey.c expose their method structs */
+ const LIBSSH2_CRYPT_METHOD **libssh2_crypt_methods(void);
+ const LIBSSH2_HOSTKEY_METHOD **libssh2_hostkey_methods(void);
+diff --git a/src/packet.c b/src/packet.c
+index eccb8c56a8..6da14e9fa1 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -624,14 +624,13 @@ packet_authagent_open(LIBSSH2_SESSION * session,
+  * layer when it has received a packet.
+  *
+  * The input pointer 'data' is pointing to allocated data that this function
+- * is asked to deal with so on failure OR success, it must be freed fine.
+- * The only exception is when the return code is LIBSSH2_ERROR_EAGAIN.
++ * will be freed unless return the code is LIBSSH2_ERROR_EAGAIN.
+  *
+  * This function will always be called with 'datalen' greater than zero.
+  */
+ int
+ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+-                    size_t datalen, int macstate)
++                    size_t datalen, int macstate, uint32_t seq)
+ {
+     int rc = 0;
+     unsigned char *message = NULL;
+@@ -676,6 +675,70 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+         break;
+     }
+ 
++    if(session->state & LIBSSH2_STATE_INITIAL_KEX) {
++        if(msg == SSH_MSG_KEXINIT) {
++            if(!session->kex_strict) {
++                if(datalen < 17) {
++                    LIBSSH2_FREE(session, data);
++                    session->packAdd_state = libssh2_NB_state_idle;
++                    return _libssh2_error(session,
++                                          LIBSSH2_ERROR_BUFFER_TOO_SMALL,
++                                          "Data too short extracting kex");
++                }
++                else {
++                    const unsigned char *strict =
++                    (unsigned char *)"kex-strict-s-v00@openssh.com";
++                    struct string_buf buf;
++                    unsigned char *algs = NULL;
++                    size_t algs_len = 0;
++
++                    buf.data = (unsigned char *)data;
++                    buf.dataptr = buf.data;
++                    buf.len = datalen;
++                    buf.dataptr += 17; /* advance past type and cookie */
++
++                    if(_libssh2_get_string(&buf, &algs, &algs_len)) {
++                        LIBSSH2_FREE(session, data);
++                        session->packAdd_state = libssh2_NB_state_idle;
++                        return _libssh2_error(session,
++                                              LIBSSH2_ERROR_BUFFER_TOO_SMALL,
++                                              "Algs too short");
++                    }
++
++                    if(algs_len == 0 ||
++                       _libssh2_kex_agree_instr(algs, algs_len, strict, 28)) {
++                        session->kex_strict = 1;
++                    }
++                }
++            }
++
++            if(session->kex_strict && seq) {
++                LIBSSH2_FREE(session, data);
++                session->socket_state = LIBSSH2_SOCKET_DISCONNECTED;
++                session->packAdd_state = libssh2_NB_state_idle;
++                libssh2_session_disconnect(session, "strict KEX violation: "
++                                           "KEXINIT was not the first packet");
++
++                return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONNECT,
++                                      "strict KEX violation: "
++                                      "KEXINIT was not the first packet");
++            }
++        }
++
++        if(session->kex_strict && session->fullpacket_required_type &&
++            session->fullpacket_required_type != msg) {
++            LIBSSH2_FREE(session, data);
++            session->socket_state = LIBSSH2_SOCKET_DISCONNECTED;
++            session->packAdd_state = libssh2_NB_state_idle;
++            libssh2_session_disconnect(session, "strict KEX violation: "
++                                       "unexpected packet type");
++
++            return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONNECT,
++                                  "strict KEX violation: "
++                                  "unexpected packet type");
++        }
++    }
++
+     if(session->packAdd_state == libssh2_NB_state_allocated) {
+         /* A couple exceptions to the packet adding rule: */
+         switch(msg) {
+@@ -1364,6 +1427,15 @@ _libssh2_packet_ask(LIBSSH2_SESSION * session, unsigned char packet_type,
+ 
+             return 0;
+         }
++        else if(session->kex_strict &&
++                (session->state & LIBSSH2_STATE_INITIAL_KEX)) {
++            libssh2_session_disconnect(session, "strict KEX violation: "
++                                       "unexpected packet type");
++
++            return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONNECT,
++                                  "strict KEX violation: "
++                                  "unexpected packet type");
++        }
+         packet = _libssh2_list_next(&packet->node);
+     }
+     return -1;
+@@ -1425,7 +1497,10 @@ _libssh2_packet_require(LIBSSH2_SESSION * session, unsigned char packet_type,
+     }
+ 
+     while(session->socket_state == LIBSSH2_SOCKET_CONNECTED) {
+-        int ret = _libssh2_transport_read(session);
++        int ret;
++        session->fullpacket_required_type = packet_type;
++        ret = _libssh2_transport_read(session);
++        session->fullpacket_required_type = 0;
+         if(ret == LIBSSH2_ERROR_EAGAIN)
+             return ret;
+         else if(ret < 0) {
+diff --git a/src/packet.h b/src/packet.h
+index 1d90b8af12..955351e5f6 100644
+--- a/src/packet.h
++++ b/src/packet.h
+@@ -72,6 +72,6 @@ int _libssh2_packet_burn(LIBSSH2_SESSION * session,
+ int _libssh2_packet_write(LIBSSH2_SESSION * session, unsigned char *data,
+                           unsigned long data_len);
+ int _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+-                        size_t datalen, int macstate);
++                        size_t datalen, int macstate, uint32_t seq);
+ 
+ #endif /* LIBSSH2_PACKET_H */
+diff --git a/src/session.c b/src/session.c
+index 35e7929fe7..9d89ade8ec 100644
+--- a/src/session.c
++++ b/src/session.c
+@@ -469,6 +469,8 @@ libssh2_session_init_ex(LIBSSH2_ALLOC_FUNC((*my_alloc)),
+         session->abstract = abstract;
+         session->api_timeout = 0; /* timeout-free API by default */
+         session->api_block_mode = 1; /* blocking API by default */
++        session->state = LIBSSH2_STATE_INITIAL_KEX;
++        session->fullpacket_required_type = 0;
+         session->packet_read_timeout = LIBSSH2_DEFAULT_READ_TIMEOUT;
+         session->flag.quote_paths = 1; /* default behavior is to quote paths
+                                           for the scp subsystem */
+@@ -1223,6 +1225,7 @@ libssh2_session_disconnect_ex(LIBSSH2_SESSION *session, int reason,
+                               const char *desc, const char *lang)
+ {
+     int rc;
++    session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
+     session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
+     BLOCK_ADJUST(rc, session,
+                  session_disconnect(session, reason, desc, lang));
+diff --git a/src/transport.c b/src/transport.c
+index 21be9d2b80..a8bb588a4b 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -186,6 +186,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
+     struct transportpacket *p = &session->packet;
+     int rc;
+     int compressed;
++    uint32_t seq = session->remote.seqno;
+ 
+     if(session->fullpacket_state == libssh2_NB_state_idle) {
+         session->fullpacket_macstate = LIBSSH2_MAC_CONFIRMED;
+@@ -317,7 +318,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
+     if(session->fullpacket_state == libssh2_NB_state_created) {
+         rc = _libssh2_packet_add(session, p->payload,
+                                  session->fullpacket_payload_len,
+-                                 session->fullpacket_macstate);
++                                 session->fullpacket_macstate, seq);
+         if(rc == LIBSSH2_ERROR_EAGAIN)
+             return rc;
+         if(rc) {
+@@ -328,6 +329,11 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
+ 
+     session->fullpacket_state = libssh2_NB_state_idle;
+ 
++    if(session->kex_strict &&
++        session->fullpacket_packet_type == SSH_MSG_NEWKEYS) {
++        session->remote.seqno = 0;
++    }
++
+     return session->fullpacket_packet_type;
+ }
+ 
+@@ -1093,6 +1099,10 @@ int _libssh2_transport_send(LIBSSH2_SESSION *session,
+ 
+     session->local.seqno++;
+ 
++    if(session->kex_strict && data[0] == SSH_MSG_NEWKEYS) {
++        session->local.seqno = 0;
++    }
++
+     ret = LIBSSH2_SEND(session, p->outbuf, total_length,
+                        LIBSSH2_SOCKET_SEND_FLAGS(session));
+     if(ret < 0)
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index a42be46a7a..b2c07cbf30 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -13,6 +13,9 @@ LIBSSH2_CPE_ID_VENDOR = libssh2
 LIBSSH2_INSTALL_STAGING = YES
 LIBSSH2_CONF_OPTS = --disable-examples-build --disable-rpath
 
+# 0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch
+LIBSSH2_IGNORE_CVES += CVE-2023-48795
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
