Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70392CA9ED0
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 11:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 271934055E;
	Mon, 12 Oct 2026 11:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nR-5gEMyNTJl; Mon, 12 Oct 2026 11:24:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8FA1340565
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791804242;
	b=XYZ1YEyHhWViRZsdqDKgnNcLPF2hr0q8b0C0dVxS1E3IgJrcpRd8CtMv3hR2SlKPUM/b
	 CbEw+rtXtud/z36opgFu+iKJYcaGUGG04BnP7Cdjk371Arc02Zji2DIQnFOGZc+k1uSbP
	 4hpDw0AZNwqgs6Nf3AovkEZUIDNNzdzYrU3YLhwpLG5NKmsyW2moYIBYhjIzq/LMHm0eS
	 YLSXxWXCz+/kZVDTMux+NqRo2ItWXftzfTyd3YwOAN/H2fU6xvWY3X40ddDYdAmsH+v9q
	 hIKu8/80PYFwcg+L9rJY1ycvMbClh+BrmMrdpKMI+dWsreMFX+CQ7XjxMNsnIICHCIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791804242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=188Sksl67ypzYOU3X+PjfUuSF/l14jY0QWso5Se0hpI=;
	b=QVpdB9ToyEzzp/GJhcp6zIwowRr3rodLx+iDBL5bXvVgxXANj843Bbz9aDYqnk9IGhVn
	 7rjBdQQCGP/3S+TfCuSE8VVsPjui5TIKu5vvQHbs2ePlfyZ//MdDaQ978MH48mxrAPBRk
	 w4NnPN2/U9twPA+spVkkBrygmkpgLsPhK2SlqZikUps07bN2IUn7aJVIr6AlDyP0euwfc
	 kFDN2bv7ZDZeWIG5s+W6ydRh2n7fQgpYK86iE8YMhCLerd7czcfeHj4RL+L45eRGpdSLU
	 Y/EGnXOYhaEdllwnJMXPjNVyTR5uVviOCIkn2lv4h8h69VbvJPQnPBsYSGd/XKlISDg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791804242;
	bh=188Sksl67ypzYOU3X+PjfUuSF/l14jY0QWso5Se0hpI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ovApbH1/YyxQesYTXgLgTBMetl6StPRnCBaC8fy5PbvCMN7IUp6zbqj2OfJNXIExM
	 1bHfV9eI2TLdWw27YmDS1vCSI1EMKoHGRWP6144hPjL2q8JKn3S8XqWNJZ8Coci7zq
	 g11ci01vaoGts6+iLcAGbiJEGYZkuBmUZpGc8CqSFIhka7i5UrCfgfEJvlUuxl+1IO
	 +zWR5+pRglnYvvoXj7bNrY6WI3IVvPXisdC35uKdcZZztJ6QpI1ZY+QOGSlcUgNFBp
	 gwnWSkWlUlb9Vznza6yqzDB1nStAFZ1xzVabglmNDMqzuwbpMP6pGaSYbMjjvZCdmQ
	 yiBgF/TrUcIMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FA1340565;
	Mon, 12 Oct 2026 11:24:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E018C179
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 11:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6BC940182
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 11:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GifY8dbWyIy2 for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 11:24:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2C86840076
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791804240;
 b=JB5RdYHSWrOzEFLTaLH705Xan+UdMyewt8GKGWiaSREeV4ntf12J1nUkQ2tKXgSz634a
 TwmjPMiDnGRV8XCHXdnvnYpalVyekLNz9TPgDCV0KCBsiISVMzMmwcRblKr5tL3vKteix
 3SWgy182rK9CBPsq2yV8oMbnRL7Es7qcZmAZO6eCglvOL4M5G2hqliBL30d22l28ZjsgX
 eJd2EiSq1r9HCZOqj38EBaDF2R6Nut/T5KXQii8PNxO8PQt40yw0a/65STWs6jJpsLPU1
 gPXmfP9wEq2DGMB5yBSNHqExctVmgTg66Arx/h/eEfE7kp3pdxX/pH1cIumuVIR2b2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791804240;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=xtiK2fet2OE3zbQ4NtPHbgM/x/HJnHb4v/DuBic0uSY=;
 b=nsQ0S5yU1SLThPqUS6f08oODUsxnT63eKpEEFVzlT8H1IJkOpeD6PgVCs4JdmNAR8Dxw
 nMNowfJ2WTO2Ns6oN1S/kyXIxdp/VoAlhCKxRuVahBhR1wl58C/VlkU2kZc7nbq0PMo9z
 KQifd828AbCK8t5W3hbhGRICX9JtaDflhCqXf4bxY7/nm/fCV8aTj7Iqy2Zqf1GG0I0R2
 N/mAUNXt1kk4ZpV2AjZUqFZD4k4uslX1drrKsqxVsUzmMuyz1QY02JsxP6kBEeSDaqBWf
 TpAF4HFGR4CpJmodk/XW9Htgdg4k/ziiiO+q+E0u+o9pA+n9i7ShphM6gUS6sNMwnnw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=J53BL52B; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C86840076
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 11:23:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a02753c04fso9182825e9.3
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 04:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791804236; x=1792409036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xtiK2fet2OE3zbQ4NtPHbgM/x/HJnHb4v/DuBic0uSY=;
 b=AdQA9dwszWnMRsyak36O7buOVl7ToxFqoF2l1NczSyGmUBbHHPOcvBUiLGrlMH9K6r
 2fly7rVj8JyadV+er24YXhaUreRQIYSEACiDh53H8HdveB2u0+LTjj0KXCvBjZrCqELI
 kGROyxsFOk2t1rkPHqFstfOQeQtwt132waHACs8HA6QndhguzyoLGr7Q+ldiEpts695R
 mfrLftUN/qMemdI7sCfcy9/lL6dMQmgz2AFcLKcQYnDYA0Y3Ycpp3ko/cyucpPuvehlm
 KvcQ2dzXsneg9lRr+HasN564nkCob9Wo7UYPS5wGFKz0W//s4HREkQ1bA/8y+Tym/9UF
 E9Ew==
X-Gm-Message-State: AFq9FYKQH8LTiYml4Z7/CeE4Vf1NYRKbr+qzA2QMbH11G7mPKHorq1z0
 FwbFaWOUdfc+CpzHS4Vku037CBLEwb+2LdCYJQmfrfvDmCSG3x/PFgcGL1zm91XYWU9N5wMBzaQ
 mhaAW5t4=
X-Gm-Gg: AYBFou1QGbWof2eNdg1dQwLkTH/bQjXv4EFQ1h2Bh5reyXC36YIOFjSHEL5gcYxBp8A
 Atl58ObKJudm2cksCv4CgQLBoEUBqTgeGh8RZwmR2H9MYjC4bSDEkN5uPnu9sUKVl8Y8AipgNlu
 lHpJ1R40UvtZcgCRwkp1L+pUxn4OBDFshrBMW80cFUUs7DricqFR3oBVfaWy1mWU7yRH8eqhwEi
 KXQHHgXBpEnmXAyZcYbtq9vm8Figw8RLWpJYH6Lp6xUNxcwlSruoGaOwa0hnxlQz4Rzzz+fbE/U
 cf2RTiDrc1azMOlbiX88o8UVznvpoPItAUt2Yfg3Dc82HBhK8agYBemXX4QdwM/TzLZIOSBdgLl
 qIQie/Wevcq5Fo+yM1hvh6DJdmQ+5w93WTQlusM/B5WGvU95suYc2O2JljwlM3anlGdKnU7hVJY
 JduF+ZYWJYkDfb/hrU7JiQ6Vn6pbx3d08TMNk5AmYKH0B7MBIuhK/Oq1KycgteAtVixRrdLGh3j
 5Mm+Yb62ERtAs9KCeDu8uPEyPxB7ZNx
X-Received: by 2002:a05:600c:524d:b0:4a1:80d8:aeb3 with SMTP id
 5b1f17b1804b1-4a18e4a95c2mr171970525e9.12.1791804235794; 
 Mon, 12 Oct 2026 04:23:55 -0700 (PDT)
Received: from dragon (ptr-94-109-87-164.dyn.orange.be. [94.109.87.164])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2caf4sm309857135e9.10.2026.10.12.04.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 04:23:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 12 Oct 2026 13:23:52 +0200
Message-ID: <20261012112352.1634190-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/openvpn: security bump to
 v2.6.23
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerabilities:
- OpenVPN/openvpn-private-issues#181
- CVE-2026-84732
- CVE-2026-84471

Also remove patches for CVE-2026-84732 which are now included in OpenVPN 2.6

See the release notes:
https://community.openvpn.net/ReleaseHistory#openvpn-2623-released-23-september-2026

(alternative to commit 43d55a6d9ccd9cbf62b0aca9fb179bd07758b99b)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...avoid-unbounded-reliable-tls-timeout.patch | 162 -------------
 ...r-packets-that-cannot-be-outstanding.patch | 214 ------------------
 package/openvpn/openvpn.hash                  |   4 +-
 package/openvpn/openvpn.mk                    |   2 +-
 4 files changed, 3 insertions(+), 379 deletions(-)
 delete mode 100644 package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch
 delete mode 100644 package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch

diff --git a/package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch b/package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch
deleted file mode 100644
index c0d77c4bf5..0000000000
--- a/package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From: Arne Schwabe <arne@rfc2549.org>
-Date: Tue, 1 Sep 2026 13:35:09 +0200
-Subject: Avoid unbounded reliable TLS timeout
-
-Avoid an unbounded TLS retransmit timeout, which could potentially
-trigger an integer overflow.
-
-The maximum initial timeout is defined in reliable.h and used to
-constrain --tls-timeout, so that the relation between the option range
-and RELIABLE_MAX_TIMEOUT_SHIFT is explicit and checked at compile time.
-
-Github: OpenVPN/openvpn-private-issues#161
-Reported-By: Mark Bregman (Fox-IT) <mark.bregman@fox-it.com>
-CVE: 2026-84732
-Change-Id: Id8ac9c48a8f751b0df95c6436ad3fbff3c4ae4a6
-Signed-off-by: Arne Schwabe <arne@rfc2549.org>
-Signed-off-by: Razvan Cojocaru <razvanc@mailbox.org>
-Acked-by: MaxF <max@max-fillinger.net>
-
----
-Upstream: https://github.com/OpenVPN/openvpn/commit/207ac5f47e46565881dcec385020ebdcb682caa4
-CVE: CVE-2026-84732
-[Titouan:
-     - Fix merge conflicts with openvpn release/2.6 branch
-     - Add atoi_constrained() without logging, copied from
-       https://github.com/OpenVPN/openvpn/blob/57b1f870a76dbe94dbf8dc6a4d22d1a225a42578/src/openvpn/options_util.c#L166-L195
-]
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- src/openvpn/options.c  | 29 ++++++++++++++++++++++++++++-
- src/openvpn/reliable.c | 13 ++++++++++++-
- src/openvpn/reliable.h | 39 ++++++++++++++++++++++++++-------------
- 3 files changed, 66 insertions(+), 15 deletions(-)
-
-diff --git a/src/openvpn/options.c b/src/openvpn/options.c
-index 9344f996..e11f1ad2 100644
---- a/src/openvpn/options.c
-+++ b/src/openvpn/options.c
-@@ -4966,6 +4966,26 @@ positive_atoi(const char *str)
-     return i < 0 ? 0 : i;
- }
- 
-+static bool
-+atoi_constrained(const char *str, int *value, int min, int max)
-+{
-+    ASSERT(min < max);
-+
-+    char *endptr;
-+    long long i = strtoll(str, &endptr, 10);
-+    if (i < INT_MIN || *endptr != '\0' || i > INT_MAX)
-+    {
-+        return false;
-+    }
-+    if (i < min || i > max)
-+    {
-+        return false;
-+    }
-+
-+    *value = (int)i;
-+    return true;
-+}
-+
- #ifdef _WIN32  /* This function is only used when compiling on Windows */
- static unsigned int
- atou(const char *str)
-@@ -9179,7 +9199,14 @@ add_option(struct options *options,
-     else if (streq(p[0], "tls-timeout") && p[1] && !p[2])
-     {
-         VERIFY_PERMISSION(OPT_P_TLS_PARMS);
--        options->tls_timeout = positive_atoi(p[1]);
-+        /* Constrain the timeout to not have problems with
-+         * RELIABLE_MAX_TIMEOUT_SHIFT creating an overflow. 65k seconds
-+         * timeout is already way too much anyway */
-+        if (!atoi_constrained(p[1], &options->tls_timeout,
-+                              1, RELIABLE_MAX_INITIAL_TIMEOUT))
-+        {
-+            goto err;
-+        }
-     }
-     else if (streq(p[0], "reneg-bytes") && p[1] && !p[2])
-     {
-diff --git a/src/openvpn/reliable.c b/src/openvpn/reliable.c
-index c2b94390..babe4c84 100644
---- a/src/openvpn/reliable.c
-+++ b/src/openvpn/reliable.c
-@@ -683,11 +683,22 @@ reliable_send(struct reliable *rel, int *opcode)
-             }
-         }
-     }
-+
-     if (best)
-     {
-+        /* The initial timeout is bounded by RELIABLE_MAX_INITIAL_TIMEOUT, so
-+         * shifting it cannot overflow. */
-+        static_assert(RELIABLE_MAX_INITIAL_TIMEOUT <= (INT_MAX >> RELIABLE_MAX_TIMEOUT_SHIFT),
-+                      "initial reliable timeout overflows when shifted");
-+        const interval_t max_timeout = rel->initial_timeout << RELIABLE_MAX_TIMEOUT_SHIFT;
-+
-         /* exponential backoff */
-         best->next_try = local_now + best->timeout;
--        best->timeout *= 2;
-+        if (best->timeout < max_timeout)
-+        {
-+            best->timeout *= 2;
-+        }
-+
-         best->n_acks = 0;
-         *opcode = best->opcode;
-         dmsg(D_REL_DEBUG, "ACK reliable_send ID " packet_id_format " (size=%d to=%d)",
-diff --git a/src/openvpn/reliable.h b/src/openvpn/reliable.h
-index 766c07d7..08e0fd75 100644
---- a/src/openvpn/reliable.h
-+++ b/src/openvpn/reliable.h
-@@ -40,19 +40,32 @@
- /** @addtogroup reliable
-  *  @{ */
- 
--
--#define RELIABLE_ACK_SIZE 8     /**< The maximum number of packet IDs
--                                 *   waiting to be acknowledged which can
--                                 *   be stored in one \c reliable_ack
--                                 *   structure. */
--
--#define RELIABLE_CAPACITY 12    /**< The maximum number of packets that
--                                 *   the reliability layer for one VPN
--                                 *   tunnel in one direction can store. */
--
--#define N_ACK_RETRANSMIT 3      /**< We retry sending a packet early if
--                                 *   this many later packets have been
--                                 *   ACKed. */
-+#define RELIABLE_ACK_SIZE 8
-+/**< The maximum number of packet IDs
-+ *   waiting to be acknowledged which can
-+ *   be stored in one \c reliable_ack
-+ *   structure. */
-+
-+#define RELIABLE_CAPACITY 12
-+/**< The maximum number of packets that
-+ *   the reliability layer for one VPN
-+ *   tunnel in one direction can store. */
-+
-+#define N_ACK_RETRANSMIT 3
-+/**< We retry sending a packet early if
-+ *   this many later packets have been
-+ *   ACKed. */
-+
-+#define RELIABLE_MAX_TIMEOUT_SHIFT 6
-+/**< Maximum shift or doubling in exponential backoff
-+ * we allow. This is a safeguard against an unbounded
-+ * exponential backoff. With the default timeout of 2s this
-+ * equals 128s */
-+
-+#define RELIABLE_MAX_INITIAL_TIMEOUT (1 << 16)
-+/**< Maximum initial timeout (--tls-timeout) we accept.
-+ * Bounded so that shifting it by RELIABLE_MAX_TIMEOUT_SHIFT
-+ * cannot overflow an int. */
- 
- /**
-  * The acknowledgment structure in which packet IDs are stored for later
--- 
-2.55.0
-
diff --git a/package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch b/package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch
deleted file mode 100644
index ad03ee6547..0000000000
--- a/package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch
+++ /dev/null
@@ -1,214 +0,0 @@
-From: Arne Schwabe <arne@rfc2549.org>
-Date: Tue, 1 Sep 2026 13:35:09 +0200
-Subject: Ignore acks for packets that cannot be outstanding
-
-This ignores acks for pids outside the send window, i.e. for packets
-that have either not been sent out yet or already left the window.
-Nothing outside that window can be outstanding, so such acks can only
-be used to manipulate the state of the send buffer.
-
-Comparing the pid of an outstanding packet against the acked pid needs
-to be wraparound aware as well. Otherwise a peer can ack a pid from the
-lower half of the id space, which passes the window check above, and
-still increment n_acks on every outstanding packet, forcing an early
-retransmit after N_ACK_RETRANSMIT such acks.
-
-Github: OpenVPN/openvpn-private-issues#161
-Reported-By: Mark Bregman (Fox-IT) <mark.bregman@fox-it.com>
-CVE: 2026-84732
-Change-Id: I944478767b52a1b9bf6a65373ce0544c69cb1012
-Signed-off-by: Arne Schwabe <arne@rfc2549.org>
-Signed-off-by: Razvan Cojocaru <razvanc@mailbox.org>
-Acked-by: MaxF <max@max-fillinger.net>
-
----
-Upstream: https://github.com/OpenVPN/openvpn/commit/d988ef4508e63b28c8e3efcb9f62eb8c836907fe
-CVE: CVE-2026-84732
-[Titouan: fix merge conflicts with openvpn release/2.6 branch]
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- src/openvpn/reliable.c                    | 42 ++++++++++++++++---
- src/openvpn/reliable.h                    | 17 ++++++--
- tests/unit_tests/openvpn/test_packet_id.c | 50 ++++++++++++++++++++++-
- 3 files changed, 100 insertions(+), 9 deletions(-)
-
-diff --git a/src/openvpn/reliable.c b/src/openvpn/reliable.c
-index babe4c84..1ecabb1a 100644
---- a/src/openvpn/reliable.c
-+++ b/src/openvpn/reliable.c
-@@ -404,15 +404,36 @@ reliable_empty(const struct reliable *rel)
-     return true;
- }
- 
-+int
-+validate_packet_id_window(struct reliable *rel, packet_id_type pid)
-+{
-+    return reliable_pid_min(pid, rel->packet_id)
-+           && reliable_pid_min(subtract_pid(rel->packet_id, RELIABLE_CAPACITY), pid);
-+}
-+
- /* del acknowledged items from send buf */
- void
- reliable_send_purge(struct reliable *rel, const struct reliable_ack *ack)
- {
--    int i, j;
--    for (i = 0; i < ack->len; ++i)
-+    unsigned int out_of_window = 0;
-+    packet_id_type first_out_of_window = 0;
-+
-+    for (int i = 0; i < ack->len; ++i)
-     {
-         packet_id_type pid = ack->packet_id[i];
--        for (j = 0; j < rel->size; ++j)
-+
-+
-+        if (!validate_packet_id_window(rel, pid))
-+        {
-+            if (out_of_window == 0)
-+            {
-+                first_out_of_window = pid;
-+            }
-+            out_of_window++;
-+            continue;
-+        }
-+
-+        for (int j = 0; j < rel->size; ++j)
-         {
-             struct reliable_entry *e = &rel->array[j];
-             if (e->active && e->packet_id == pid)
-@@ -432,16 +453,27 @@ reliable_send_purge(struct reliable *rel, const struct reliable_ack *ack)
- #endif
-                 e->active = false;
-             }
--            else if (e->active && e->packet_id < pid)
-+
-+            if (e->active && reliable_pid_min(e->packet_id, pid))
-             {
-                 /* We have received an ACK for a packet with a higher PID. Either
-                  * we have received ACKs out of or order or the packet has been
-                  * lost. We count the number of ACKs to determine if we should
--                 * resend it early. */
-+                 * resend it early. The comparison needs to be wraparound aware,
-+                 * otherwise a peer can inflate n_acks with an ACK for a pid from
-+                 * the lower half of the id space and force a retransmit. */
-                 e->n_acks++;
-             }
-         }
-     }
-+
-+    if (out_of_window > 0)
-+    {
-+        (void)first_out_of_window; /* dmsg might not generate code */
-+        dmsg(D_REL_LOW, "ACK contained %u ids outside the send window, "
-+                        "first was " packet_id_format,
-+             out_of_window, (packet_id_print_type)first_out_of_window);
-+    }
- }
- 
- #ifdef ENABLE_DEBUG
-diff --git a/src/openvpn/reliable.h b/src/openvpn/reliable.h
-index 08e0fd75..a76e75ea 100644
---- a/src/openvpn/reliable.h
-+++ b/src/openvpn/reliable.h
-@@ -105,9 +105,9 @@ struct reliable
- {
-     int size;
-     interval_t initial_timeout;
--    packet_id_type packet_id;
--    int offset; /**< Offset of the bufs in the reliable_entry array */
--    bool hold; /* don't xmit until reliable_schedule_now is called */
-+    packet_id_type packet_id; /**< Packet ID for the next packet to be sent out. */
-+    int offset;               /**< Offset of the bufs in the reliable_entry array */
-+    bool hold;                /* don't xmit until reliable_schedule_now is called */
-     struct reliable_entry array[RELIABLE_CAPACITY];
- };
- 
-@@ -191,6 +191,17 @@ reliable_ack_empty(struct reliable_ack *ack)
-     return !ack->len;
- }
- 
-+/**
-+ * check that pid is inside the window of possible outstanding packets
-+ * of size RELIABLE_CAPACITY, ie inside the range
-+ * [rel->packet_id - RELIABLE_CAPACITY, rel->packet_id).
-+ *
-+ * rel->packet is the *next* packet id to be sent out, so it is not
-+ * included in the valid range.
-+ */
-+int
-+validate_packet_id_window(struct reliable *rel, packet_id_type pid);
-+
- /**
-  * Returns the number of packets that need to be acked.
-  *
-diff --git a/tests/unit_tests/openvpn/test_packet_id.c b/tests/unit_tests/openvpn/test_packet_id.c
-index ff3f7886..a27bd6d4 100644
---- a/tests/unit_tests/openvpn/test_packet_id.c
-+++ b/tests/unit_tests/openvpn/test_packet_id.c
-@@ -271,6 +271,53 @@ test_copy_acks_to_lru(void **state)
-     assert_memory_equal(mru_ack.packet_id, expected_ack.packet_id, sizeof(expected_ack.packet_id));
- }
- 
-+static void
-+test_packet_id_window(void **state)
-+{
-+    struct reliable rel = { 0 };
-+    rel.packet_id = 1;
-+
-+    assert_true(validate_packet_id_window(&rel, 0));
-+
-+    /* packet id 1 is outside the window as it is the *next* packet id */
-+    assert_false(validate_packet_id_window(&rel, 1));
-+
-+    /* wrapped around packet id, "-2" */
-+    assert_true(validate_packet_id_window(&rel, 0xFFFFFFFD));
-+
-+    /* wrapped around packet id, "-10" */
-+    assert_true(validate_packet_id_window(&rel, 0xFFFFFFF6));
-+
-+    /* wrapped around packet id, "-11" */
-+    assert_false(validate_packet_id_window(&rel, 0xFFFFFFF5));
-+    assert_false(validate_packet_id_window(&rel, 0x80000000));
-+
-+    rel.packet_id = 0x80000000;
-+
-+    /* near the signed/usigned integer area */
-+    assert_false(validate_packet_id_window(&rel, 0x80000001));
-+    assert_true(validate_packet_id_window(&rel, 0x7fffffff));
-+    assert_true(validate_packet_id_window(&rel, 0x7ffffff5));
-+    assert_false(validate_packet_id_window(&rel, 0x7ffffff4));
-+
-+    rel.packet_id = 0xFFFFFFFD;
-+    assert_false(validate_packet_id_window(&rel, 0xFFFFFFFD));
-+    assert_false(validate_packet_id_window(&rel, 0));
-+    assert_false(validate_packet_id_window(&rel, 1));
-+    assert_false(validate_packet_id_window(&rel, 0xFFFFFFFE));
-+    assert_false(validate_packet_id_window(&rel, 0xFFFFFFFF));
-+    assert_true(validate_packet_id_window(&rel, 0xFFFFFFF3));
-+    assert_true(validate_packet_id_window(&rel, 0xFFFFFFF2));
-+    assert_false(validate_packet_id_window(&rel, 0xFFFFFFF1));
-+
-+    rel.packet_id = 500;
-+    assert_false(validate_packet_id_window(&rel, 501));
-+    assert_true(validate_packet_id_window(&rel, 497));
-+    assert_true(validate_packet_id_window(&rel, 500 - (RELIABLE_CAPACITY - 1)));
-+    assert_false(validate_packet_id_window(&rel, 500 - RELIABLE_CAPACITY));
-+}
-+
-+
- int
- main(void)
- {
-@@ -295,7 +342,8 @@ main(void)
-                                         test_packet_id_write_setup,
-                                         test_packet_id_write_teardown),
-         cmocka_unit_test(test_get_num_output_sequenced_available),
--        cmocka_unit_test(test_copy_acks_to_lru)
-+        cmocka_unit_test(test_copy_acks_to_lru),
-+        cmocka_unit_test(test_packet_id_window)
- 
-     };
- 
--- 
-2.55.0
-
diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 5300dfe981..e57c3d5106 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature from
-# https://build.openvpn.net/downloads/releases/openvpn-2.6.22.tar.gz.asc
-sha256  f46df740f05f86020137a41cfc8814352391cf861ed57f57b4e815cb97c1d2cf  openvpn-2.6.22.tar.gz
+# https://build.openvpn.net/downloads/releases/openvpn-2.6.23.tar.gz.asc
+sha256  4041c709162bec1325abf5aa8cf27a255cc477c634b15ee310411c701fc40a96  openvpn-2.6.23.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index e6c36ef904..98c289be9e 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.22
+OPENVPN_VERSION = 2.6.23
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
