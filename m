Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C793CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20BEE60B1E;
	Fri, 16 Oct 2026 13:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kn7rNcxgScr7; Fri, 16 Oct 2026 13:08:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C1E9C60B73
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156137;
	b=LrYEzI35RpIPvpa6j/Iv20Gy5x7Q5BFzv/6dvJraRnW+/TPucJM9pENko1jrwfTcna4p
	 zmFqedTQW5aQBPKUqjaFA+nzhUEdSzCX29a1bR2wpb/1/aWBEFou34Jl7lOADKda5c2SE
	 pyaSMgFl1TGU5kSFs673nGGOG/C3ZsXdcU2TtcK/hZ70G9Hiiuu1BdvnSdSSSmrelVn80
	 tQd7y/eS9MJ0TNbkbcZhovk5YBB1TKB2Z2dbV65skY8GZYLAKmJlfQVcUhLYe2Kv1saL1
	 JSJ6OokQnomTp7GDt9SRSAjhjRahgXw4D7HEJm6sAnzNAQe+vuoxuqnku/k4QCtW0kQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156137;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=IAwJMGjGarXnBz3ABkxEo86Xg7O2BW5t7u9/uBmmxlE=;
	b=g6it9mmzncGfQG41YW013HkAvE85X6Mlc/2U+bHmNnVzwtklTqCAZFbxVZM7TUhbeCNC
	 ss2z4VC97LgYHWt794biHrWgFdZnH514aThkZeqh6wg+1jBQkRqcAndghSwNupU4WlxNu
	 xA2E7l6ea3R6YePcq5lqyjjk63kuLbFJ73n3Z008SG7+efpqI9Lg2H++bpBEGV7syKT+I
	 0f2+BDwarSDcLGci/VL863o4Mie8Mz+JHenS11wSqds3J6RmmZtwa1R+YVZQCvyajhK1w
	 H3ogw8e2RmGSb3OvBHr/9lGdKCi1POGzGlXpmhtRyBue5JBV4+CiSVGA8UGj2A7iBhw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156137;
	bh=IAwJMGjGarXnBz3ABkxEo86Xg7O2BW5t7u9/uBmmxlE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YsM8i4Ir/ufzFOUlVYL1u5J/tq+iSKgCN1DDPxo56IQXbNWCXDOctymULOdJB3gv0
	 Oe38uSrtWZk4vli1EKDPvPXjNHXmEg0Hi9R4Ib3GaGTNbOcxMIW8IsRxcDQ9LuNWCt
	 8B5uRvsyP11W8fVra5RrTY90VCeWgfzlaNrr6Ys7p0PZ32D3Hge9ocQ2XmIY+ykk5D
	 NDSCBCMbmoR8byEjm65EHT++y+j/37ISXHIY3vOZfjbT2T4nIqHZJGnWnwWJ2cROwn
	 2WqW2WlWskHvC83QWOv/4em1PZQua4gF9l2eVltgIOiF7sgW9atsLYfTRq+x4bGWQf
	 XyMXpfXROaZIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1E9C60B73;
	Fri, 16 Oct 2026 13:08:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97BA7255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89BAF8150C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXpU_a5vTZTT for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0EEC9814BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=XSlwa2HApZ3p0dXyisVSxLlvOBZVK2XXLk7+f9f0MHKujxltE0AIqSly4AiOcS02ZLd7
 S5HjIMRGGO1F+sq6RsgmwRYSAT99WPVuVbZzvl+jFwr5svCWv5dJNJjcnKVMjZ1qr+fUD
 PP9fKiq6BYntld881borNYIW4r9Aj5rxhp7b/Vsld8fE0EC+uBV+DM1BFXvse9+WoKkGe
 JvGdq1eIncAoOwtIvb8UmOzlN/X9cOzi4gZJ90glCsFhN2uSQmk+KJxllbJDq/ZXDu/cV
 9CnWxhbRmPZ+PBeQNMa4xi4VawNJvMwc9AFpr+19uPC5NzJuBpz+RNUsCbC6rCoai1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Skboz6n/w+YB7mV2svwKYTqIu3A99HKGucRJSFJBQRg=;
 b=WgR5mLPFzGP4qpdRUXJIY++29956moDoahWc+gwzBcKNC2RnZqhhVkHsw9ETU0QKnWlG
 iBs7pode56dY4Mj4iQaMVNilaUxLwApKnG8Klu89FmkLcxIAB3QT2TxJcjsBp++YksnMF
 E10uyLhRDLmeEItm1prhEwOkKkaQxWezxlRXWQHr3dRNMBQ8mXtsWDVQnjy7Q4Wki2g59
 IBKuGZRoo6jXVKXq8LakswejRcneQzt6OHPmESbNl75kfhX1xHOi3GQakR/0AyLlv+wzE
 G2fl38CvZFj3hMFt2cKvVHUq5QXz9a3SWEatM7pu2fEnmkyWZ1Lb75e42/NPA8P3ggg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EEC9814BC
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3C5B960D7; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2b72a86f15ef3d9b34f5e4c18c14c7eefcb576bc
X-Git-Newrev: 8a1a335df106add2b18e7cf0fe7a4e964fa7d663
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.F3C5B960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openvpn: security
 bump to v2.6.23
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5147590368111297434=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5147590368111297434==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8a1a335df106add2b18e7cf0fe7a4e964fa7d663
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerabilities:
- OpenVPN/openvpn-private-issues#181
- CVE-2026-84732
- CVE-2026-84471

Also remove patches for CVE-2026-84732 which are now included in OpenVPN 2.6

See the release notes:
https://community.openvpn.net/ReleaseHistory#openvpn-2623-released-23-september-2026

(alternative to commit 43d55a6d9ccd9cbf62b0aca9fb179bd07758b99b)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[raphael: remove OPENVPN_IGNORE_CVES and its comments]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...0001-avoid-unbounded-reliable-tls-timeout.patch | 162 ----------------
 ...ks-for-packets-that-cannot-be-outstanding.patch | 214 ---------------------
 package/openvpn/openvpn.hash                       |   4 +-
 package/openvpn/openvpn.mk                         |   6 +-
 4 files changed, 3 insertions(+), 383 deletions(-)

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
index e6c36ef904..4114d30d96 100644
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
@@ -16,10 +16,6 @@ OPENVPN_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = NETSTAT=/bin/netstat
 
-# 0001-avoid-unbounded-reliable-tls-timeout.patch
-# 0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch
-OPENVPN_IGNORE_CVES += CVE-2026-84732
-
 ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16),yy)
 OPENVPN_CONF_OPTS += --enable-dco
 OPENVPN_DEPENDENCIES += libnl

--===============5147590368111297434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5147590368111297434==--
