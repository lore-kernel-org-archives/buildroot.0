Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43155C982C4
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 12:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB2A40558;
	Tue, 15 Sep 2026 12:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1lUQJsql0j0; Tue, 15 Sep 2026 12:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 70D384055B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789475015;
	b=J+sWHYDgQeHWK0Mp1Ql6rN455hmiZO8WFcmnLvceWAuG00m29MhvXNZuwmcH1nYc5hhJ
	 JtCOVUt1muYwcYcby3MBrOVVVFHiDwlnaQTc7kV8KWs2xhlQT9cEAWEMEZcs49hNWdypf
	 0iE2+0i5Qw71YyvFjr1TVLj1Ev2imVIAbyIKvZUk+qD1CdZyVDclcd99E/sIBBO/lCsMh
	 g9SugKl2XQYJwnKmiu5BO+zBiZ5lBa9+NQ97k/cJBG84h+G6VRqFz+RU+mL74j4ymaz2Q
	 W+2KRmmP+/rQM/TJAGflNfMrcTfPS83ZNBIEu3eQ4wBhOsDHmdPMlNYrwZfhlOL64kg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789475015;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=s80IDwutD3sPhtxxGmdzrQPhzA8GmQK4yEddoq0hYy0=;
	b=B28yyxvmf6OV+AnHxdsgBkyoehbamWTqtWE6EnIqrMlkjDIGz2Eop9pXmE5EG6+Vycex
	 bhN/DKztJVJ7AQfSaFJhHZzTOoF5Wnma9Oc8ibNDwxODTSwFchV6slcLdWF2FLP0kREib
	 dd/Z6g0pTqSMfD5Y0cbJ02Vc94L9pBjOeiUSPnEaRRTC2jA54Xg41iqfD418ema6u6GXa
	 HkVDVynDU8THAOcRwwQW9iQf6hkhcNARRj1u4o7B41TU9zAiPwN8qqVt3TypZoxaxqwMy
	 w8pyB6aCX2LhJGfvLQqM5zwyv5oOcSzxtLQQDMjBTczkbnHYoyXevDOXWg9rA/GSDtQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789475015;
	bh=s80IDwutD3sPhtxxGmdzrQPhzA8GmQK4yEddoq0hYy0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O4phUiQqupfdJiZ2i3UCN0yQOu07+cRgyOJ7M5UyLjJ4xpjPvWqyVQFgLwuaNCyXK
	 QAqwfUk8z7UhRnEhfo91yFh6cBZ1sCKA2e3Bqyz/yMFROo20coryRgBmjH85kEQxVN
	 7S2k642cA6I2DySBf/lPGZ5kezZbmukJK+tgMTSDMiABVVeb+IxHelposp3oGbbDNW
	 xkur6OW3lo0lEDYm3onnIYuKrjVEkOTSTZO96i53K5pc0NXRTwV6fxlF7+hqUkR5QQ
	 ftbQ4jNtbaqbF2Kp2rAuvKtEJ9wrR3vE+nb1IquqNBaCaQ/XBeSrZI4lEVzo2XcTJI
	 NdUe6KBMKYZkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70D384055B;
	Tue, 15 Sep 2026 12:23:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1868DDCF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEA1E40564
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtQcDnyBbcmf for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 12:23:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 66B754055B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789475011;
 b=GU8tVgHc+aige1tfWowzLHofx+wJCLPORIySAdDPbbcBb2fFTiZ7hgjFe6PURrpHiyxA
 35aEH1rcLgf8hWXohBMnfPDoq5DXpszrPL/mA+TmU6G8Fz29Jf1WzsbBemRr3ETdHDDhZ
 cxfg4Uqfqk8vzsLzEHdGuCvxuCfn4pnWWBvNldvpkiEJkLd0Rzi98pjRZ/p2l2l5kuD2X
 AChQec0qL1i7G+MaDQp6l2qAfnQAeAVc3n1nJjKjXf/0HV7QKkN/bPSgm74FbA246hI2E
 X1BK91vr+UiAkzZfrb+hmlXLT6G3F2ZZCngu0n7PJw5yf5/A1rUJomYWRmAunVOSjNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789475011;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=o+wpx9s0Zd1mjUHrso8svK9gXknSMGPtKuuhIu8TXE8=;
 b=WiPU44JhWSqyd30MS69AEvxNUEnORA7L/LE5j4l9rq6XsRjLl1fqx292c5I+pvDa1CMj
 UCErgsc/NV6I+Rp7ztfFeEMEaQiQzbMNe8Vrqmx2AfZByuqKsFPd8POsjpaomzPv6dC0O
 XZKpi1uKquNKV9jSeke3ZtE6pQfyQv8ruaSmXM3CiROWNUnOugA9Ix/6UcucH6y/BZ2cZ
 M6RIWCE5ky5cNq2UEN673y8y1bNv/kgoboQIlS0j+DaRmwctViQQ+b+6jolYRDR8jl2wN
 pjPgs8KswsgyP6iUkCSLchxT6a8rKISg/Fvq/ARkUn5S1dcHprLsP/wNVyRmKcH/slA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66B754055B
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:23:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87C4095CBF; Tue, 15 Sep 2026 12:22:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 14:22:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9deebc2273d30ca9a72a9a708352ceaa114bdb1f
X-Git-Newrev: 9b7dbd68496e3ed7357ba51f2e709dee1194f22a
X-Patchwork-Hint: ignore
Message-Id: <20260915122225.87C4095CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openvpn: add
 patches for CVE-2026-84732
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b7dbd68496e3ed7357ba51f2e709dee1194f22a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fix has been released in OpenVPN 2.7.7, but is not available yet for
OpenVPN 2.6 series (which is included in Buildroot 2025.02.x)

(alternative to commit 25b8142ef7b9e09ed7d273571ca61aa92888a39c)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...0001-avoid-unbounded-reliable-tls-timeout.patch | 162 ++++++++++++++++
 ...ks-for-packets-that-cannot-be-outstanding.patch | 214 +++++++++++++++++++++
 package/openvpn/openvpn.mk                         |   4 +
 3 files changed, 380 insertions(+)

diff --git a/package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch b/package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch
new file mode 100644
index 0000000000..c0d77c4bf5
--- /dev/null
+++ b/package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch
@@ -0,0 +1,162 @@
+From: Arne Schwabe <arne@rfc2549.org>
+Date: Tue, 1 Sep 2026 13:35:09 +0200
+Subject: Avoid unbounded reliable TLS timeout
+
+Avoid an unbounded TLS retransmit timeout, which could potentially
+trigger an integer overflow.
+
+The maximum initial timeout is defined in reliable.h and used to
+constrain --tls-timeout, so that the relation between the option range
+and RELIABLE_MAX_TIMEOUT_SHIFT is explicit and checked at compile time.
+
+Github: OpenVPN/openvpn-private-issues#161
+Reported-By: Mark Bregman (Fox-IT) <mark.bregman@fox-it.com>
+CVE: 2026-84732
+Change-Id: Id8ac9c48a8f751b0df95c6436ad3fbff3c4ae4a6
+Signed-off-by: Arne Schwabe <arne@rfc2549.org>
+Signed-off-by: Razvan Cojocaru <razvanc@mailbox.org>
+Acked-by: MaxF <max@max-fillinger.net>
+
+---
+Upstream: https://github.com/OpenVPN/openvpn/commit/207ac5f47e46565881dcec385020ebdcb682caa4
+CVE: CVE-2026-84732
+[Titouan:
+     - Fix merge conflicts with openvpn release/2.6 branch
+     - Add atoi_constrained() without logging, copied from
+       https://github.com/OpenVPN/openvpn/blob/57b1f870a76dbe94dbf8dc6a4d22d1a225a42578/src/openvpn/options_util.c#L166-L195
+]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/openvpn/options.c  | 29 ++++++++++++++++++++++++++++-
+ src/openvpn/reliable.c | 13 ++++++++++++-
+ src/openvpn/reliable.h | 39 ++++++++++++++++++++++++++-------------
+ 3 files changed, 66 insertions(+), 15 deletions(-)
+
+diff --git a/src/openvpn/options.c b/src/openvpn/options.c
+index 9344f996..e11f1ad2 100644
+--- a/src/openvpn/options.c
++++ b/src/openvpn/options.c
+@@ -4966,6 +4966,26 @@ positive_atoi(const char *str)
+     return i < 0 ? 0 : i;
+ }
+ 
++static bool
++atoi_constrained(const char *str, int *value, int min, int max)
++{
++    ASSERT(min < max);
++
++    char *endptr;
++    long long i = strtoll(str, &endptr, 10);
++    if (i < INT_MIN || *endptr != '\0' || i > INT_MAX)
++    {
++        return false;
++    }
++    if (i < min || i > max)
++    {
++        return false;
++    }
++
++    *value = (int)i;
++    return true;
++}
++
+ #ifdef _WIN32  /* This function is only used when compiling on Windows */
+ static unsigned int
+ atou(const char *str)
+@@ -9179,7 +9199,14 @@ add_option(struct options *options,
+     else if (streq(p[0], "tls-timeout") && p[1] && !p[2])
+     {
+         VERIFY_PERMISSION(OPT_P_TLS_PARMS);
+-        options->tls_timeout = positive_atoi(p[1]);
++        /* Constrain the timeout to not have problems with
++         * RELIABLE_MAX_TIMEOUT_SHIFT creating an overflow. 65k seconds
++         * timeout is already way too much anyway */
++        if (!atoi_constrained(p[1], &options->tls_timeout,
++                              1, RELIABLE_MAX_INITIAL_TIMEOUT))
++        {
++            goto err;
++        }
+     }
+     else if (streq(p[0], "reneg-bytes") && p[1] && !p[2])
+     {
+diff --git a/src/openvpn/reliable.c b/src/openvpn/reliable.c
+index c2b94390..babe4c84 100644
+--- a/src/openvpn/reliable.c
++++ b/src/openvpn/reliable.c
+@@ -683,11 +683,22 @@ reliable_send(struct reliable *rel, int *opcode)
+             }
+         }
+     }
++
+     if (best)
+     {
++        /* The initial timeout is bounded by RELIABLE_MAX_INITIAL_TIMEOUT, so
++         * shifting it cannot overflow. */
++        static_assert(RELIABLE_MAX_INITIAL_TIMEOUT <= (INT_MAX >> RELIABLE_MAX_TIMEOUT_SHIFT),
++                      "initial reliable timeout overflows when shifted");
++        const interval_t max_timeout = rel->initial_timeout << RELIABLE_MAX_TIMEOUT_SHIFT;
++
+         /* exponential backoff */
+         best->next_try = local_now + best->timeout;
+-        best->timeout *= 2;
++        if (best->timeout < max_timeout)
++        {
++            best->timeout *= 2;
++        }
++
+         best->n_acks = 0;
+         *opcode = best->opcode;
+         dmsg(D_REL_DEBUG, "ACK reliable_send ID " packet_id_format " (size=%d to=%d)",
+diff --git a/src/openvpn/reliable.h b/src/openvpn/reliable.h
+index 766c07d7..08e0fd75 100644
+--- a/src/openvpn/reliable.h
++++ b/src/openvpn/reliable.h
+@@ -40,19 +40,32 @@
+ /** @addtogroup reliable
+  *  @{ */
+ 
+-
+-#define RELIABLE_ACK_SIZE 8     /**< The maximum number of packet IDs
+-                                 *   waiting to be acknowledged which can
+-                                 *   be stored in one \c reliable_ack
+-                                 *   structure. */
+-
+-#define RELIABLE_CAPACITY 12    /**< The maximum number of packets that
+-                                 *   the reliability layer for one VPN
+-                                 *   tunnel in one direction can store. */
+-
+-#define N_ACK_RETRANSMIT 3      /**< We retry sending a packet early if
+-                                 *   this many later packets have been
+-                                 *   ACKed. */
++#define RELIABLE_ACK_SIZE 8
++/**< The maximum number of packet IDs
++ *   waiting to be acknowledged which can
++ *   be stored in one \c reliable_ack
++ *   structure. */
++
++#define RELIABLE_CAPACITY 12
++/**< The maximum number of packets that
++ *   the reliability layer for one VPN
++ *   tunnel in one direction can store. */
++
++#define N_ACK_RETRANSMIT 3
++/**< We retry sending a packet early if
++ *   this many later packets have been
++ *   ACKed. */
++
++#define RELIABLE_MAX_TIMEOUT_SHIFT 6
++/**< Maximum shift or doubling in exponential backoff
++ * we allow. This is a safeguard against an unbounded
++ * exponential backoff. With the default timeout of 2s this
++ * equals 128s */
++
++#define RELIABLE_MAX_INITIAL_TIMEOUT (1 << 16)
++/**< Maximum initial timeout (--tls-timeout) we accept.
++ * Bounded so that shifting it by RELIABLE_MAX_TIMEOUT_SHIFT
++ * cannot overflow an int. */
+ 
+ /**
+  * The acknowledgment structure in which packet IDs are stored for later
+-- 
+2.55.0
+
diff --git a/package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch b/package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch
new file mode 100644
index 0000000000..ad03ee6547
--- /dev/null
+++ b/package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch
@@ -0,0 +1,214 @@
+From: Arne Schwabe <arne@rfc2549.org>
+Date: Tue, 1 Sep 2026 13:35:09 +0200
+Subject: Ignore acks for packets that cannot be outstanding
+
+This ignores acks for pids outside the send window, i.e. for packets
+that have either not been sent out yet or already left the window.
+Nothing outside that window can be outstanding, so such acks can only
+be used to manipulate the state of the send buffer.
+
+Comparing the pid of an outstanding packet against the acked pid needs
+to be wraparound aware as well. Otherwise a peer can ack a pid from the
+lower half of the id space, which passes the window check above, and
+still increment n_acks on every outstanding packet, forcing an early
+retransmit after N_ACK_RETRANSMIT such acks.
+
+Github: OpenVPN/openvpn-private-issues#161
+Reported-By: Mark Bregman (Fox-IT) <mark.bregman@fox-it.com>
+CVE: 2026-84732
+Change-Id: I944478767b52a1b9bf6a65373ce0544c69cb1012
+Signed-off-by: Arne Schwabe <arne@rfc2549.org>
+Signed-off-by: Razvan Cojocaru <razvanc@mailbox.org>
+Acked-by: MaxF <max@max-fillinger.net>
+
+---
+Upstream: https://github.com/OpenVPN/openvpn/commit/d988ef4508e63b28c8e3efcb9f62eb8c836907fe
+CVE: CVE-2026-84732
+[Titouan: fix merge conflicts with openvpn release/2.6 branch]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/openvpn/reliable.c                    | 42 ++++++++++++++++---
+ src/openvpn/reliable.h                    | 17 ++++++--
+ tests/unit_tests/openvpn/test_packet_id.c | 50 ++++++++++++++++++++++-
+ 3 files changed, 100 insertions(+), 9 deletions(-)
+
+diff --git a/src/openvpn/reliable.c b/src/openvpn/reliable.c
+index babe4c84..1ecabb1a 100644
+--- a/src/openvpn/reliable.c
++++ b/src/openvpn/reliable.c
+@@ -404,15 +404,36 @@ reliable_empty(const struct reliable *rel)
+     return true;
+ }
+ 
++int
++validate_packet_id_window(struct reliable *rel, packet_id_type pid)
++{
++    return reliable_pid_min(pid, rel->packet_id)
++           && reliable_pid_min(subtract_pid(rel->packet_id, RELIABLE_CAPACITY), pid);
++}
++
+ /* del acknowledged items from send buf */
+ void
+ reliable_send_purge(struct reliable *rel, const struct reliable_ack *ack)
+ {
+-    int i, j;
+-    for (i = 0; i < ack->len; ++i)
++    unsigned int out_of_window = 0;
++    packet_id_type first_out_of_window = 0;
++
++    for (int i = 0; i < ack->len; ++i)
+     {
+         packet_id_type pid = ack->packet_id[i];
+-        for (j = 0; j < rel->size; ++j)
++
++
++        if (!validate_packet_id_window(rel, pid))
++        {
++            if (out_of_window == 0)
++            {
++                first_out_of_window = pid;
++            }
++            out_of_window++;
++            continue;
++        }
++
++        for (int j = 0; j < rel->size; ++j)
+         {
+             struct reliable_entry *e = &rel->array[j];
+             if (e->active && e->packet_id == pid)
+@@ -432,16 +453,27 @@ reliable_send_purge(struct reliable *rel, const struct reliable_ack *ack)
+ #endif
+                 e->active = false;
+             }
+-            else if (e->active && e->packet_id < pid)
++
++            if (e->active && reliable_pid_min(e->packet_id, pid))
+             {
+                 /* We have received an ACK for a packet with a higher PID. Either
+                  * we have received ACKs out of or order or the packet has been
+                  * lost. We count the number of ACKs to determine if we should
+-                 * resend it early. */
++                 * resend it early. The comparison needs to be wraparound aware,
++                 * otherwise a peer can inflate n_acks with an ACK for a pid from
++                 * the lower half of the id space and force a retransmit. */
+                 e->n_acks++;
+             }
+         }
+     }
++
++    if (out_of_window > 0)
++    {
++        (void)first_out_of_window; /* dmsg might not generate code */
++        dmsg(D_REL_LOW, "ACK contained %u ids outside the send window, "
++                        "first was " packet_id_format,
++             out_of_window, (packet_id_print_type)first_out_of_window);
++    }
+ }
+ 
+ #ifdef ENABLE_DEBUG
+diff --git a/src/openvpn/reliable.h b/src/openvpn/reliable.h
+index 08e0fd75..a76e75ea 100644
+--- a/src/openvpn/reliable.h
++++ b/src/openvpn/reliable.h
+@@ -105,9 +105,9 @@ struct reliable
+ {
+     int size;
+     interval_t initial_timeout;
+-    packet_id_type packet_id;
+-    int offset; /**< Offset of the bufs in the reliable_entry array */
+-    bool hold; /* don't xmit until reliable_schedule_now is called */
++    packet_id_type packet_id; /**< Packet ID for the next packet to be sent out. */
++    int offset;               /**< Offset of the bufs in the reliable_entry array */
++    bool hold;                /* don't xmit until reliable_schedule_now is called */
+     struct reliable_entry array[RELIABLE_CAPACITY];
+ };
+ 
+@@ -191,6 +191,17 @@ reliable_ack_empty(struct reliable_ack *ack)
+     return !ack->len;
+ }
+ 
++/**
++ * check that pid is inside the window of possible outstanding packets
++ * of size RELIABLE_CAPACITY, ie inside the range
++ * [rel->packet_id - RELIABLE_CAPACITY, rel->packet_id).
++ *
++ * rel->packet is the *next* packet id to be sent out, so it is not
++ * included in the valid range.
++ */
++int
++validate_packet_id_window(struct reliable *rel, packet_id_type pid);
++
+ /**
+  * Returns the number of packets that need to be acked.
+  *
+diff --git a/tests/unit_tests/openvpn/test_packet_id.c b/tests/unit_tests/openvpn/test_packet_id.c
+index ff3f7886..a27bd6d4 100644
+--- a/tests/unit_tests/openvpn/test_packet_id.c
++++ b/tests/unit_tests/openvpn/test_packet_id.c
+@@ -271,6 +271,53 @@ test_copy_acks_to_lru(void **state)
+     assert_memory_equal(mru_ack.packet_id, expected_ack.packet_id, sizeof(expected_ack.packet_id));
+ }
+ 
++static void
++test_packet_id_window(void **state)
++{
++    struct reliable rel = { 0 };
++    rel.packet_id = 1;
++
++    assert_true(validate_packet_id_window(&rel, 0));
++
++    /* packet id 1 is outside the window as it is the *next* packet id */
++    assert_false(validate_packet_id_window(&rel, 1));
++
++    /* wrapped around packet id, "-2" */
++    assert_true(validate_packet_id_window(&rel, 0xFFFFFFFD));
++
++    /* wrapped around packet id, "-10" */
++    assert_true(validate_packet_id_window(&rel, 0xFFFFFFF6));
++
++    /* wrapped around packet id, "-11" */
++    assert_false(validate_packet_id_window(&rel, 0xFFFFFFF5));
++    assert_false(validate_packet_id_window(&rel, 0x80000000));
++
++    rel.packet_id = 0x80000000;
++
++    /* near the signed/usigned integer area */
++    assert_false(validate_packet_id_window(&rel, 0x80000001));
++    assert_true(validate_packet_id_window(&rel, 0x7fffffff));
++    assert_true(validate_packet_id_window(&rel, 0x7ffffff5));
++    assert_false(validate_packet_id_window(&rel, 0x7ffffff4));
++
++    rel.packet_id = 0xFFFFFFFD;
++    assert_false(validate_packet_id_window(&rel, 0xFFFFFFFD));
++    assert_false(validate_packet_id_window(&rel, 0));
++    assert_false(validate_packet_id_window(&rel, 1));
++    assert_false(validate_packet_id_window(&rel, 0xFFFFFFFE));
++    assert_false(validate_packet_id_window(&rel, 0xFFFFFFFF));
++    assert_true(validate_packet_id_window(&rel, 0xFFFFFFF3));
++    assert_true(validate_packet_id_window(&rel, 0xFFFFFFF2));
++    assert_false(validate_packet_id_window(&rel, 0xFFFFFFF1));
++
++    rel.packet_id = 500;
++    assert_false(validate_packet_id_window(&rel, 501));
++    assert_true(validate_packet_id_window(&rel, 497));
++    assert_true(validate_packet_id_window(&rel, 500 - (RELIABLE_CAPACITY - 1)));
++    assert_false(validate_packet_id_window(&rel, 500 - RELIABLE_CAPACITY));
++}
++
++
+ int
+ main(void)
+ {
+@@ -295,7 +342,8 @@ main(void)
+                                         test_packet_id_write_setup,
+                                         test_packet_id_write_teardown),
+         cmocka_unit_test(test_get_num_output_sequenced_available),
+-        cmocka_unit_test(test_copy_acks_to_lru)
++        cmocka_unit_test(test_copy_acks_to_lru),
++        cmocka_unit_test(test_packet_id_window)
+ 
+     };
+ 
+-- 
+2.55.0
+
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 2b24c1524d..e6c36ef904 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -16,6 +16,10 @@ OPENVPN_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = NETSTAT=/bin/netstat
 
+# 0001-avoid-unbounded-reliable-tls-timeout.patch
+# 0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch
+OPENVPN_IGNORE_CVES += CVE-2026-84732
+
 ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16),yy)
 OPENVPN_CONF_OPTS += --enable-dco
 OPENVPN_DEPENDENCIES += libnl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
