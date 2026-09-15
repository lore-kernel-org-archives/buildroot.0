Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBDCC982C3
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 12:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C0B4809F6;
	Tue, 15 Sep 2026 12:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdmPnSVfG7EX; Tue, 15 Sep 2026 12:23:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1A3F980A66
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789475014;
	b=AFXrbVwtn2i2CxWLNQzuL6FpAXXhzl0NeLJdj8+kAfEa4D9tpAM9s3B0o6daOvQ5bWwT
	 qZXmK0cJGYNnIj6tCnMxa/ZgkuuNdJqHaOr3axAqzRup9Yle3w8iTwnhjLSE//BaTt7ID
	 HBMWzWE0Fzhi10eF4aUNl2epdDYys+FKhxLCosnCkEFc8k6UBB1RVEPIiLP/DkwfpvIc0
	 9i+zfpeBaW1WO04CXS7gIIcH8ZFCJ/S+MPx4Uw3FewJYi7JCb4grM46bi/5LLDYFQ22y+
	 HmzpmulLRqjq8lPlgML+jld4xJUK0rRsI6uB1QxnwuTcIQsnZg5zUjACVk4oHs5owGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789475014;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=d6IuCwOrHEQNCByRpdzIb61sHEQOnJB2+z44972QzyI=;
	b=PtvYo2qVxF5NACko5AubOExwS+kRBOKRxstmZm1+0pPFANgZaCTo8dRJI3JJ7N7HEdY3
	 Vkcl8P+vZOZtWmy2oRrHDa/sNbcFH7nRg9lGG7gMa8WiQxYknb41OYSuhgF121bM/oi0H
	 1tVN1EOv22McHeLmWb+PFWlP6uEZzWRQ2IeIIp7VBbqLvjNbq9di10yCUEBd0I4C9jVZG
	 fF0kZuNPdeVI8nA1LkFVZxzZ9hndPe+oyMFL+HeNlmDkUS6T2VCBk0/S4TJ/tRW8kczy8
	 SG9tWxYWJTb/cM0fBosbLGJSvB2pQzfFkTKP5SCWpV+rHukHiU5SNj/StJWDsNJnXgA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789475014;
	bh=d6IuCwOrHEQNCByRpdzIb61sHEQOnJB2+z44972QzyI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cUM2XvlVH6+D8JNl1+Y/J/bISsJ20DDEfAflxU4zBSjp3mMQTo6Q7DWDVpNplmyjE
	 o1prsNBv9U6Sges1yGU5aQRbOFvwTPMZajQGf4ig+u2wtYKnck9woK23C0ECVwvJWX
	 yNQY+++AMZgzmVbEGWjQVP7xZ1lE6NXhcBfvjoF+TEo9Pq5vdpZxYXUiA/D4qGRxfR
	 GOOHdcdhm+77r2zjUS7npSC10m1lm4lsQSTmHU0C/wFDozCrWwk/IIbhkAIw6tDB5W
	 EZNo/+HUn+b572hgwDudflJlxKusHMzqeqmY9BAy+8nobImy+LwmO35yEThp6rXWYC
	 ofJJ/IDEnligg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A3F980A66;
	Tue, 15 Sep 2026 12:23:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A32C224
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED69B40560
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kns1sKibEaPa for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 12:23:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4FF0E40558
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789475011;
 b=HPrTM+irFPvS6PDo+ZVGEQklLXCu1iquLVkBz2XvS21qqtV1W7kLyzCwPuQSt+dTNZYI
 T0GRzt/e9AGqtWe2yQfZq5Ta35NhWQYTANM/FWwiNU4wY5bdi+E06ty3J+332b17JQzbj
 NlsZyVd7x5dpwFtS+WwRVCYLzQ+UlBaiVlSQKND7tHB0X/bzjKRfqjvXMpo6aOW68Tjey
 Jy93NE4GZWmmcoNLaTgTK0wUwEBtm+l+72hfkqO7UrC37sh3QDunVnkEAzZ1AXNVK2LvI
 1D+g/D5r+xTrk1nsY/dhgqU9oT641MVs/qlME3l6IhwQ767682LY2DX+F3aGGzFxLvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789475011;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0VWqNqDqOPvYVaMptN+N6TLpOy1gTETIKTK14mboljM=;
 b=A3nAdirD7jvBDnZSb4PTF871AQe2fhabta6Ee6jZnGO2DzRU0CKM4x22TMryqIYcWZhJ
 vyMm+dMzcunD0Ok9CQVVYRBqtgpmhmxC8IsHrSMHa2BGhLcGsUYRU7OEre08RlKQBr9tt
 7sPLXrm0+zJWkpRAYFeDsnXKGRfjrJ6OJ0wIzYXitF05ztXUJZi1I+ZKikVQM2PsuXJ6j
 IGsCI4Z0kXc10WeQPNVZYOqyaHEnjL1cZgGH01JDGTaP+O6IJiGJSS/SPrpfTUxb4+Ol+
 r/rSmlby31FpqkhEDuyMiJ4kJlZEFJiypjY/sjQweeFkOmcn9VSRlNKJykpMmtx0Tlg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FF0E40558
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:23:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78E7495CBB; Tue, 15 Sep 2026 12:22:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 14:22:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d030e36bbc9669230c015be971b14b6e062cfdde
X-Git-Newrev: 9deebc2273d30ca9a72a9a708352ceaa114bdb1f
X-Patchwork-Hint: ignore
Message-Id: <20260915122225.78E7495CBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Revert "package/openvpn:
 add patches for CVE-2026-84732"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9deebc2273d30ca9a72a9a708352ceaa114bdb1f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit 1afe223d4c4ed592cecb0a49631b1f156103a78d was wrongly applied.
This commit was the v1 of a series that as since been superseeded and
fixed.

Revert this commit to correctly apply the patch that fix
CVE-2026-84732.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...0001-avoid-unbounded-reliable-tls-timeout.patch | 129 -------------
 ...ks-for-packets-that-cannot-be-outstanding.patch | 206 ---------------------
 package/openvpn/openvpn.mk                         |   4 -
 3 files changed, 339 deletions(-)

diff --git a/package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch b/package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch
deleted file mode 100644
index c559ffcb4d..0000000000
--- a/package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch
+++ /dev/null
@@ -1,129 +0,0 @@
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
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- src/openvpn/options.c  |  9 ++++++++-
- src/openvpn/reliable.c | 13 ++++++++++++-
- src/openvpn/reliable.h | 41 ++++++++++++++++++++++++++---------------
- 3 files changed, 46 insertions(+), 17 deletions(-)
-
-diff --git a/src/openvpn/options.c b/src/openvpn/options.c
-index 5f3f4e96028..7a649de8822 100644
---- a/src/openvpn/options.c
-+++ b/src/openvpn/options.c
-@@ -7548,7 +7548,14 @@ add_option(struct options *options, char *p[], bool is_inline, const char *file,
-     else if (streq(p[0], "tls-timeout") && p[1] && !p[2])
-     {
-         VERIFY_PERMISSION(OPT_P_TLS_PARMS);
--        options->tls_timeout = positive_atoi(p[1], msglevel);
-+        /* Constrain the timeout to not have problems with
-+         * RELIABLE_MAX_TIMEOUT_SHIFT creating an overflow. 65k seconds
-+         * timeout is already way too much anyway */
-+        if (!atoi_constrained(p[1], &options->tls_timeout, "tls-timeout", 1,
-+                              RELIABLE_MAX_INITIAL_TIMEOUT, msglevel))
-+        {
-+            goto err;
-+        }
-     }
-     else if (streq(p[0], "reneg-bytes") && p[1] && !p[2])
-     {
-diff --git a/src/openvpn/reliable.c b/src/openvpn/reliable.c
-index 690e50d6d95..230d6aca47e 100644
---- a/src/openvpn/reliable.c
-+++ b/src/openvpn/reliable.c
-@@ -655,11 +655,22 @@ reliable_send(struct reliable *rel, int *opcode)
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
-index a5ed75cf0d0..af95bbc17a1 100644
---- a/src/openvpn/reliable.h
-+++ b/src/openvpn/reliable.h
-@@ -40,21 +40,32 @@
-  *  @{ */
- 
- 
--#define RELIABLE_ACK_SIZE                       \
--    8 /**< The maximum number of packet IDs     \
--       *   waiting to be acknowledged which can \
--       *   be stored in one \c reliable_ack     \
--       *   structure. */
--
--#define RELIABLE_CAPACITY                      \
--    12 /**< The maximum number of packets that \
--        *   the reliability layer for one VPN  \
--        *   tunnel in one direction can store. */
--
--#define N_ACK_RETRANSMIT                      \
--    3 /**< We retry sending a packet early if \
--       *   this many later packets have been  \
--       *   ACKed. */
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
diff --git a/package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch b/package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch
deleted file mode 100644
index 0b97582965..0000000000
--- a/package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch
+++ /dev/null
@@ -1,206 +0,0 @@
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
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- src/openvpn/reliable.c                    | 37 ++++++++++++++++-
- src/openvpn/reliable.h                    | 17 ++++++--
- tests/unit_tests/openvpn/test_packet_id.c | 50 ++++++++++++++++++++++-
- 3 files changed, 98 insertions(+), 6 deletions(-)
-
-diff --git a/src/openvpn/reliable.c b/src/openvpn/reliable.c
-index 230d6aca47e..ced438e481d 100644
---- a/src/openvpn/reliable.c
-+++ b/src/openvpn/reliable.c
-@@ -390,13 +390,35 @@ reliable_empty(const struct reliable *rel)
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
-+    unsigned int out_of_window = 0;
-+    packet_id_type first_out_of_window = 0;
-+
-     for (int i = 0; i < ack->len; ++i)
-     {
-         packet_id_type pid = ack->packet_id[i];
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
-         for (int j = 0; j < rel->size; ++j)
-         {
-             struct reliable_entry *e = &rel->array[j];
-@@ -417,16 +439,27 @@ reliable_send_purge(struct reliable *rel, const struct reliable_ack *ack)
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
-index af95bbc17a1..a85f2e97807 100644
---- a/src/openvpn/reliable.h
-+++ b/src/openvpn/reliable.h
-@@ -105,9 +105,9 @@ struct reliable
- {
-     int size;
-     interval_t initial_timeout;
--    packet_id_type packet_id;
--    int offset; /**< Offset of the bufs in the reliable_entry array */
--    bool hold;  /* don't xmit until reliable_schedule_now is called */
-+    packet_id_type packet_id; /**< Packet ID for the next packet to be sent out. */
-+    int offset;               /**< Offset of the bufs in the reliable_entry array */
-+    bool hold;                /* don't xmit until reliable_schedule_now is called */
-     struct reliable_entry array[RELIABLE_CAPACITY];
- };
- 
-@@ -189,6 +189,17 @@ reliable_ack_empty(struct reliable_ack *ack)
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
-index 5dfd319ab9a..a5d50de4ae7 100644
---- a/tests/unit_tests/openvpn/test_packet_id.c
-+++ b/tests/unit_tests/openvpn/test_packet_id.c
-@@ -325,6 +325,53 @@ test_copy_acks_to_lru(void **state)
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
-@@ -346,7 +393,8 @@ main(void)
-                                         test_packet_id_write_teardown),
- 
-         cmocka_unit_test(test_get_num_output_sequenced_available),
--        cmocka_unit_test(test_copy_acks_to_lru)
-+        cmocka_unit_test(test_copy_acks_to_lru),
-+        cmocka_unit_test(test_packet_id_window)
- 
-     };
- 
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index e6c36ef904..2b24c1524d 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
