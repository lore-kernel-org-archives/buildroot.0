Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0697C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 18:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39A9F60F08;
	Wed,  3 Jul 2024 18:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uE-8LIDr_L6; Wed,  3 Jul 2024 18:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7985160FA9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7985160FA9;
	Wed,  3 Jul 2024 18:50:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC4711BF2C7
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 18:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9BCA40223
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 18:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id de5fcd9GLayn for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 18:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 780A2401ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 780A2401ED
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 780A2401ED
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 18:50:55 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-58b0dddab63so4375274a12.3
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 11:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720032653; x=1720637453;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eQ8ifquc3hqoaDzIwIe7nYdqy0C+2nGEVZ0gwawPV30=;
 b=jJkDTBOf7MlU/MixmWN6mgGeAFHBXUV8fkXifSXjUxNdqyZ/2wXHBX8ppfjavQtydw
 U/MfhhAW+SWuP5DhVHWVGjOBUveBL6RyDvDPSokvJ2af6lWdQkhylgP7obyJYIt3WYm5
 1StqQCc+n8+gm+N3a3qGZlfhd+hQLf10u8tQ4rnlSum991ZXBBxJHrvPdMok0DYQMSX7
 bY/RANE5tE6c1CTBTJePQ1x4ZEkBsQeDQwMNYGkV0L4pOXm00+pjQ5Y483YITppNJbwu
 6Ch/CqdVKGJHvCRFIqRlE7wr4GnsCJMPgg7oxhl1kb7iad19GYByqIbRHPOACDj1GRST
 NVUA==
X-Gm-Message-State: AOJu0YxGiP/ENVpzw5hR+aJ80iBI1BB1a6+iOgXbFd3LK5hj3LgVFi08
 2RYWd30uFZdsm/TXxKX9SqXgLFmC9uurrQH0QulddweIpQ85CUlAeWwUoBqS99EgYLx/mPuGRu1
 G8KQ=
X-Google-Smtp-Source: AGHT+IEA5RGv7mVcoshDnK27xYaQNaNZBTiGw5fNsuUekAR8ZQ014ybIQKr5hdyEiPznTBVi3Lwn6g==
X-Received: by 2002:a05:6402:1941:b0:58b:abc6:9cec with SMTP id
 4fb4d7f45d1cf-58babc69debmr2545370a12.40.1720032653013; 
 Wed, 03 Jul 2024 11:50:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861381604asm7409445a12.45.2024.07.03.11.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 11:50:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 20:50:48 +0200
Message-ID: <20240703185048.2787036-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720032653; x=1720637453;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eQ8ifquc3hqoaDzIwIe7nYdqy0C+2nGEVZ0gwawPV30=;
 b=dHDQ/DVhBwZAATdUJTU+aLInctAmDa8Ekj+9tfg9ohTNmnKlNKXpOF0pCyo4TndogF
 xXEMWWwC1Rz8p8SWkHPNktdAbLRyLpojOvGLoNHYGY3UOVAuVVZubFje6JU+XdNYcOEo
 8+uARCLMu9aytqcecZ//pBbYGL6cEmAPR+E2s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=dHDQ/DVh
Subject: [Buildroot] [PATCH v2] package/libssh2: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libssh2 fails to build with output:

    Applying 0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch using patch:
    patching file src/kex.c
    Hunk #1 succeeded at 3037 (offset 5 lines).
    Hunk #2 succeeded at 3062 (offset 5 lines).
    Hunk #3 succeeded at 3315 (offset 5 lines).
    Hunk #4 succeeded at 3406 (offset 5 lines).
    Hunk #5 succeeded at 3440 (offset 5 lines).
    Hunk #6 succeeded at 3476 (offset 5 lines).
    Hunk #7 succeeded at 3489 (offset 5 lines).
    Hunk #8 succeeded at 3523 (offset 5 lines).
    Hunk #9 succeeded at 3569 (offset 5 lines).
    Hunk #10 succeeded at 3591 (offset 5 lines).
    Hunk #11 succeeded at 3633 (offset 5 lines).
    Hunk #12 succeeded at 3654 (offset 5 lines).
    Hunk #13 succeeded at 3687 (offset 5 lines).
    Hunk #14 succeeded at 3709 (offset 5 lines).
    Hunk #15 succeeded at 3892 (offset 5 lines).
    Hunk #16 succeeded at 3918 (offset 5 lines).
    Hunk #17 succeeded at 3967 (offset 5 lines).
    patching file src/libssh2_priv.h
    Hunk #1 succeeded at 699 (offset -37 lines).
    Hunk #2 succeeded at 873 (offset -38 lines).
    Hunk #3 succeeded at 914 (offset -38 lines).
    Hunk #4 succeeded at 1149 (offset -38 lines).
    patching file src/packet.c
    Hunk #1 succeeded at 605 (offset -19 lines).
    Hunk #2 succeeded at 656 (offset -19 lines).
    Hunk #3 succeeded at 1404 (offset -23 lines).
    Hunk #4 succeeded at 1474 (offset -23 lines).
    patching file src/packet.h
    Hunk #1 FAILED at 72.
    1 out of 1 hunk FAILED -- saving rejects to file src/packet.h.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Rework the patch to remove all the Hunks

 ...o-fix-CVE-2023-48795-Terrapin-Attack.patch | 85 ++++++++++---------
 1 file changed, 45 insertions(+), 40 deletions(-)

diff --git a/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch b/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch
index 2ccedee19e93..8187719477ed 100644
--- a/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch
+++ b/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch
@@ -1,4 +1,4 @@
-From d34d9258b8420b19ec3f97b4cc5bf7aa7d98e35a Mon Sep 17 00:00:00 2001
+From 3a80751dce7b7d98b9d9006fb37213a1e4af7ac5 Mon Sep 17 00:00:00 2001
 From: Michael Buckley <michael@buckleyisms.com>
 Date: Thu, 30 Nov 2023 15:08:02 -0800
 Subject: [PATCH] src: add 'strict KEX' to fix CVE-2023-48795 "Terrapin Attack"
@@ -15,6 +15,8 @@ Closes #1291
 
 Upstream: https://github.com/libssh2/libssh2/commit/d34d9258b8420b19ec3f97b4cc5bf7aa7d98e35a
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/kex.c          | 63 +++++++++++++++++++++++------------
  src/libssh2_priv.h | 18 +++++++---
@@ -25,10 +27,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  6 files changed, 149 insertions(+), 32 deletions(-)
 
 diff --git a/src/kex.c b/src/kex.c
-index 8e7b7f0af3..a7b301e157 100644
+index d4034a0a953e..b4b748cac4ee 100644
 --- a/src/kex.c
 +++ b/src/kex.c
-@@ -3032,6 +3032,13 @@ kex_method_extension_negotiation = {
+@@ -3037,6 +3037,13 @@ kex_method_extension_negotiation = {
      0,
  };
  
@@ -42,7 +44,7 @@ index 8e7b7f0af3..a7b301e157 100644
  static const LIBSSH2_KEX_METHOD *libssh2_kex_methods[] = {
  #if LIBSSH2_ED25519
      &kex_method_ssh_curve25519_sha256,
-@@ -3050,6 +3057,7 @@ static const LIBSSH2_KEX_METHOD *libssh2_kex_methods[] = {
+@@ -3055,6 +3062,7 @@ static const LIBSSH2_KEX_METHOD *libssh2_kex_methods[] = {
      &kex_method_diffie_helman_group1_sha1,
      &kex_method_diffie_helman_group_exchange_sha1,
      &kex_method_extension_negotiation,
@@ -50,7 +52,7 @@ index 8e7b7f0af3..a7b301e157 100644
      NULL
  };
  
-@@ -3302,13 +3310,13 @@ static int kexinit(LIBSSH2_SESSION * session)
+@@ -3307,13 +3315,13 @@ static int kexinit(LIBSSH2_SESSION * session)
      return 0;
  }
  
@@ -68,7 +70,7 @@ index 8e7b7f0af3..a7b301e157 100644
  {
      unsigned char *s;
      unsigned char *end_haystack;
-@@ -3393,7 +3401,7 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * session,
+@@ -3398,7 +3406,7 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * session,
          while(s && *s) {
              unsigned char *p = (unsigned char *) strchr((char *) s, ',');
              size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
@@ -77,7 +79,7 @@ index 8e7b7f0af3..a7b301e157 100644
                  const LIBSSH2_HOSTKEY_METHOD *method =
                      (const LIBSSH2_HOSTKEY_METHOD *)
                      kex_get_method_by_name((char *) s, method_len,
-@@ -3427,9 +3435,9 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * session,
+@@ -3432,9 +3440,9 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * session,
      }
  
      while(hostkeyp && (*hostkeyp) && (*hostkeyp)->name) {
@@ -90,7 +92,7 @@ index 8e7b7f0af3..a7b301e157 100644
          if(s) {
              /* So far so good, but does it suit our purposes? (Encrypting vs
                 Signing) */
-@@ -3463,6 +3471,12 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
+@@ -3468,6 +3476,12 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
  {
      const LIBSSH2_KEX_METHOD **kexp = libssh2_kex_methods;
      unsigned char *s;
@@ -103,7 +105,7 @@ index 8e7b7f0af3..a7b301e157 100644
  
      if(session->kex_prefs) {
          s = (unsigned char *) session->kex_prefs;
-@@ -3470,7 +3484,7 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
+@@ -3475,7 +3489,7 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
          while(s && *s) {
              unsigned char *q, *p = (unsigned char *) strchr((char *) s, ',');
              size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
@@ -112,7 +114,7 @@ index 8e7b7f0af3..a7b301e157 100644
              if(q) {
                  const LIBSSH2_KEX_METHOD *method = (const LIBSSH2_KEX_METHOD *)
                      kex_get_method_by_name((char *) s, method_len,
-@@ -3504,9 +3518,9 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
+@@ -3509,9 +3523,9 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
      }
  
      while(*kexp && (*kexp)->name) {
@@ -125,7 +127,7 @@ index 8e7b7f0af3..a7b301e157 100644
          if(s) {
              /* We've agreed on a key exchange method,
               * Can we agree on a hostkey that works with this kex?
-@@ -3550,7 +3564,7 @@ static int kex_agree_crypt(LIBSSH2_SESSION * session,
+@@ -3555,7 +3569,7 @@ static int kex_agree_crypt(LIBSSH2_SESSION * session,
              unsigned char *p = (unsigned char *) strchr((char *) s, ',');
              size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
  
@@ -134,7 +136,7 @@ index 8e7b7f0af3..a7b301e157 100644
                  const LIBSSH2_CRYPT_METHOD *method =
                      (const LIBSSH2_CRYPT_METHOD *)
                      kex_get_method_by_name((char *) s, method_len,
-@@ -3572,9 +3586,9 @@ static int kex_agree_crypt(LIBSSH2_SESSION * session,
+@@ -3577,9 +3591,9 @@ static int kex_agree_crypt(LIBSSH2_SESSION * session,
      }
  
      while(*cryptp && (*cryptp)->name) {
@@ -147,7 +149,7 @@ index 8e7b7f0af3..a7b301e157 100644
          if(s) {
              endpoint->crypt = *cryptp;
              return 0;
-@@ -3614,7 +3628,7 @@ static int kex_agree_mac(LIBSSH2_SESSION * session,
+@@ -3619,7 +3633,7 @@ static int kex_agree_mac(LIBSSH2_SESSION * session,
              unsigned char *p = (unsigned char *) strchr((char *) s, ',');
              size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
  
@@ -156,7 +158,7 @@ index 8e7b7f0af3..a7b301e157 100644
                  const LIBSSH2_MAC_METHOD *method = (const LIBSSH2_MAC_METHOD *)
                      kex_get_method_by_name((char *) s, method_len,
                                             (const LIBSSH2_COMMON_METHOD **)
-@@ -3635,8 +3649,9 @@ static int kex_agree_mac(LIBSSH2_SESSION * session,
+@@ -3640,8 +3654,9 @@ static int kex_agree_mac(LIBSSH2_SESSION * session,
      }
  
      while(*macp && (*macp)->name) {
@@ -168,7 +170,7 @@ index 8e7b7f0af3..a7b301e157 100644
          if(s) {
              endpoint->mac = *macp;
              return 0;
-@@ -3667,7 +3682,7 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
+@@ -3672,7 +3687,7 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
              unsigned char *p = (unsigned char *) strchr((char *) s, ',');
              size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
  
@@ -177,7 +179,7 @@ index 8e7b7f0af3..a7b301e157 100644
                  const LIBSSH2_COMP_METHOD *method =
                      (const LIBSSH2_COMP_METHOD *)
                      kex_get_method_by_name((char *) s, method_len,
-@@ -3689,8 +3704,9 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
+@@ -3694,8 +3709,9 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
      }
  
      while(*compp && (*compp)->name) {
@@ -189,7 +191,7 @@ index 8e7b7f0af3..a7b301e157 100644
          if(s) {
              endpoint->comp = *compp;
              return 0;
-@@ -3871,6 +3887,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
+@@ -3876,6 +3892,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
                  session->local.kexinit = key_state->oldlocal;
                  session->local.kexinit_len = key_state->oldlocal_len;
                  key_state->state = libssh2_NB_state_idle;
@@ -197,7 +199,7 @@ index 8e7b7f0af3..a7b301e157 100644
                  session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
                  session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
                  return -1;
-@@ -3896,6 +3913,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
+@@ -3901,6 +3918,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
                  session->local.kexinit = key_state->oldlocal;
                  session->local.kexinit_len = key_state->oldlocal_len;
                  key_state->state = libssh2_NB_state_idle;
@@ -205,7 +207,7 @@ index 8e7b7f0af3..a7b301e157 100644
                  session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
                  session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
                  return -1;
-@@ -3944,6 +3962,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
+@@ -3949,6 +3967,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
          session->remote.kexinit = NULL;
      }
  
@@ -214,10 +216,10 @@ index 8e7b7f0af3..a7b301e157 100644
      session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
  
 diff --git a/src/libssh2_priv.h b/src/libssh2_priv.h
-index 7660366954..18d9ab2130 100644
+index 82c3afe250b0..ee1d8b5c2b9b 100644
 --- a/src/libssh2_priv.h
 +++ b/src/libssh2_priv.h
-@@ -736,6 +736,9 @@ struct _LIBSSH2_SESSION
+@@ -699,6 +699,9 @@ struct _LIBSSH2_SESSION
      /* key signing algorithm preferences -- NULL yields server order */
      char *sign_algo_prefs;
  
@@ -227,7 +229,7 @@ index 7660366954..18d9ab2130 100644
      /* (remote as source of data -- packet_read ) */
      libssh2_endpoint_data remote;
  
-@@ -908,6 +911,7 @@ struct _LIBSSH2_SESSION
+@@ -870,6 +873,7 @@ struct _LIBSSH2_SESSION
      int fullpacket_macstate;
      size_t fullpacket_payload_len;
      int fullpacket_packet_type;
@@ -235,7 +237,7 @@ index 7660366954..18d9ab2130 100644
  
      /* State variables used in libssh2_sftp_init() */
      libssh2_nonblocking_states sftpInit_state;
-@@ -948,10 +952,11 @@ struct _LIBSSH2_SESSION
+@@ -910,10 +914,11 @@ struct _LIBSSH2_SESSION
  };
  
  /* session.state bits */
@@ -251,7 +253,7 @@ index 7660366954..18d9ab2130 100644
  
  /* session.flag helpers */
  #ifdef MSG_NOSIGNAL
-@@ -1182,6 +1187,11 @@ ssize_t _libssh2_send(libssh2_socket_t socket, const void *buffer,
+@@ -1144,6 +1149,11 @@ ssize_t _libssh2_send(libssh2_socket_t socket, const void *buffer,
  int _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
                            key_exchange_state_t * state);
  
@@ -264,10 +266,10 @@ index 7660366954..18d9ab2130 100644
  const LIBSSH2_CRYPT_METHOD **libssh2_crypt_methods(void);
  const LIBSSH2_HOSTKEY_METHOD **libssh2_hostkey_methods(void);
 diff --git a/src/packet.c b/src/packet.c
-index eccb8c56a8..6da14e9fa1 100644
+index b5b41981a108..35d4d39eff87 100644
 --- a/src/packet.c
 +++ b/src/packet.c
-@@ -624,14 +624,13 @@ packet_authagent_open(LIBSSH2_SESSION * session,
+@@ -605,14 +605,13 @@ authagent_exit:
   * layer when it has received a packet.
   *
   * The input pointer 'data' is pointing to allocated data that this function
@@ -284,7 +286,7 @@ index eccb8c56a8..6da14e9fa1 100644
  {
      int rc = 0;
      unsigned char *message = NULL;
-@@ -676,6 +675,70 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+@@ -657,6 +656,70 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
          break;
      }
  
@@ -355,7 +357,7 @@ index eccb8c56a8..6da14e9fa1 100644
      if(session->packAdd_state == libssh2_NB_state_allocated) {
          /* A couple exceptions to the packet adding rule: */
          switch(msg) {
-@@ -1364,6 +1427,15 @@ _libssh2_packet_ask(LIBSSH2_SESSION * session, unsigned char packet_type,
+@@ -1341,6 +1404,15 @@ _libssh2_packet_ask(LIBSSH2_SESSION * session, unsigned char packet_type,
  
              return 0;
          }
@@ -371,7 +373,7 @@ index eccb8c56a8..6da14e9fa1 100644
          packet = _libssh2_list_next(&packet->node);
      }
      return -1;
-@@ -1425,7 +1497,10 @@ _libssh2_packet_require(LIBSSH2_SESSION * session, unsigned char packet_type,
+@@ -1402,7 +1474,10 @@ _libssh2_packet_require(LIBSSH2_SESSION * session, unsigned char packet_type,
      }
  
      while(session->socket_state == LIBSSH2_SOCKET_CONNECTED) {
@@ -384,22 +386,22 @@ index eccb8c56a8..6da14e9fa1 100644
              return ret;
          else if(ret < 0) {
 diff --git a/src/packet.h b/src/packet.h
-index 1d90b8af12..955351e5f6 100644
+index 79018bcf1d55..6ea100a5cfb3 100644
 --- a/src/packet.h
 +++ b/src/packet.h
-@@ -72,6 +72,6 @@ int _libssh2_packet_burn(LIBSSH2_SESSION * session,
+@@ -71,6 +71,6 @@ int _libssh2_packet_burn(LIBSSH2_SESSION * session,
  int _libssh2_packet_write(LIBSSH2_SESSION * session, unsigned char *data,
                            unsigned long data_len);
  int _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
 -                        size_t datalen, int macstate);
 +                        size_t datalen, int macstate, uint32_t seq);
  
- #endif /* LIBSSH2_PACKET_H */
+ #endif /* __LIBSSH2_PACKET_H */
 diff --git a/src/session.c b/src/session.c
-index 35e7929fe7..9d89ade8ec 100644
+index a4d602bad002..f4bafb57b2a6 100644
 --- a/src/session.c
 +++ b/src/session.c
-@@ -469,6 +469,8 @@ libssh2_session_init_ex(LIBSSH2_ALLOC_FUNC((*my_alloc)),
+@@ -464,6 +464,8 @@ libssh2_session_init_ex(LIBSSH2_ALLOC_FUNC((*my_alloc)),
          session->abstract = abstract;
          session->api_timeout = 0; /* timeout-free API by default */
          session->api_block_mode = 1; /* blocking API by default */
@@ -408,7 +410,7 @@ index 35e7929fe7..9d89ade8ec 100644
          session->packet_read_timeout = LIBSSH2_DEFAULT_READ_TIMEOUT;
          session->flag.quote_paths = 1; /* default behavior is to quote paths
                                            for the scp subsystem */
-@@ -1223,6 +1225,7 @@ libssh2_session_disconnect_ex(LIBSSH2_SESSION *session, int reason,
+@@ -1186,6 +1188,7 @@ libssh2_session_disconnect_ex(LIBSSH2_SESSION *session, int reason,
                                const char *desc, const char *lang)
  {
      int rc;
@@ -417,10 +419,10 @@ index 35e7929fe7..9d89ade8ec 100644
      BLOCK_ADJUST(rc, session,
                   session_disconnect(session, reason, desc, lang));
 diff --git a/src/transport.c b/src/transport.c
-index 21be9d2b80..a8bb588a4b 100644
+index 6d902d3372b4..3b30ff848726 100644
 --- a/src/transport.c
 +++ b/src/transport.c
-@@ -186,6 +186,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
+@@ -187,6 +187,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
      struct transportpacket *p = &session->packet;
      int rc;
      int compressed;
@@ -428,7 +430,7 @@ index 21be9d2b80..a8bb588a4b 100644
  
      if(session->fullpacket_state == libssh2_NB_state_idle) {
          session->fullpacket_macstate = LIBSSH2_MAC_CONFIRMED;
-@@ -317,7 +318,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
+@@ -318,7 +319,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
      if(session->fullpacket_state == libssh2_NB_state_created) {
          rc = _libssh2_packet_add(session, p->payload,
                                   session->fullpacket_payload_len,
@@ -437,7 +439,7 @@ index 21be9d2b80..a8bb588a4b 100644
          if(rc == LIBSSH2_ERROR_EAGAIN)
              return rc;
          if(rc) {
-@@ -328,6 +329,11 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
+@@ -329,6 +330,11 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
  
      session->fullpacket_state = libssh2_NB_state_idle;
  
@@ -449,7 +451,7 @@ index 21be9d2b80..a8bb588a4b 100644
      return session->fullpacket_packet_type;
  }
  
-@@ -1093,6 +1099,10 @@ int _libssh2_transport_send(LIBSSH2_SESSION *session,
+@@ -1091,6 +1097,10 @@ int _libssh2_transport_send(LIBSSH2_SESSION *session,
  
      session->local.seqno++;
  
@@ -460,3 +462,6 @@ index 21be9d2b80..a8bb588a4b 100644
      ret = LIBSSH2_SEND(session, p->outbuf, total_length,
                         LIBSSH2_SOCKET_SEND_FLAGS(session));
      if(ret < 0)
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
