Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835F6C79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 16:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33B0D605D7;
	Mon,  7 Sep 2026 16:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55w5olf9iiUU; Mon,  7 Sep 2026 16:03:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BE7016066C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788796999;
	b=dioasZeswO/xhTzyD/FQ0NgJhXbF4wcjCfZt+PnBWJN8S4IHQ6wDPxl4KZVWfxLAd9Bw
	 i2nFvMiA38wTbJGNMSpb+PfHiCCmfGQDyuxFRDwS52UqYCMRFOvS/RhDRvgLKEJWIw+z7
	 VBomcPd0sIeyXRHhdQx4P36J01KViwKeNOSkORs0LIiswkxtgV37QS/GSEdaflLVMHEVF
	 xLvlJjJPTNV/N1gryAfNaV+g2yyWQkn8AUdVFxFP6sTTezk0xvaRQyqgI6Xdf5VH7hIwO
	 NVfAoSJ1GhVs+YnWLiu6RaI186tf5QswGPDKNJraC/O2ucvhhL0mxZpeLHtDjC0h3Ag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788796999;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nGADO+9JkrRSXITOava4/ZY2Q/fqF9PvBmROvnPijCw=;
	b=bJHnY/A2M/ojFPBzLRdKDsgQLHFGTZ0jXwm+RI3VqKGaHPPXYGxoJ0TWkrt+cZn8kXC+
	 btlBUAkKLzT0wgT3Ex9ZUQ8oiEioMX/DdUgDE3h9ZPN6bEni33wMpBXqJ6I+xwIZ4Xwq+
	 wDID7qUzOk7O7+AAOsU39jtCOuGyIpd2oQ/P/Togu0+8sqsVWQHxadOzYZztdFlgtL8t/
	 cb5fZgwpLv7ERnTyR4L9fRH5qvmsc7wqIgh5GY1kd5GHtFSi+6nz94bdWy0fhcHoWZJoG
	 WrOpAhz71zneZfMKhdOSpaFZp/Ilkq2isq/fv/WQcakK36JSvL+qfyaxYH5tvXVizBQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788796999;
	bh=nGADO+9JkrRSXITOava4/ZY2Q/fqF9PvBmROvnPijCw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qBl0/hl++tlIohdDXX1fx07T7VrtYZM8NoLJcIdoTXPjbqvLwARSHd0wnFYp16w6n
	 AzfgqrI9J9VVximh8KX0CflZfrVojkBd7j+OxiSRsO9S8NYEjSfUKecDsLaJF1PfSr
	 sxCWxQrMgxvJwNPARSgJNMdFTqWhuxoGKSC+pJO3stLOnnr0M2924/dnJMNytefGPA
	 +U36hL6AgRJCNPrjrOefoRTs+uX8R7e75LwJm8UWFsBRaR6mMH/GDcdNKwUx2YrW14
	 B4yz3I4/SpUI6EPMpbymY/bo816kCIiSi7tPtQbAgpkYRDt8edYORby+bT4ThTayHI
	 rJVXYLouBo7xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE7016066C;
	Mon,  7 Sep 2026 16:03:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38CAAAEB
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 16:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EBAC605D7
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 16:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLdKSEldNXRi for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 16:03:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 915CF600C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788796996;
 b=W73rl0HnedZwH5fSlO3870+mtRIgkm8dQxR+z2basz+Cmrg0C5A1H5g3IeoABQvge97d
 tZGojq+FPyobVBYLGUz5/EFNEX3fTDNRZzHaecc6g6jShcdF+8iFdkPdJ+Ekf2aIquHLG
 Q1TkEpZOuZ9qkwYwVHM2WavQm3mQ1Og/PkPAyPTOn1mIuwtYxxnzKCSHpIKYIihXpSwr6
 SUOSTgL6ZRjRCkeqq8hTRUDxF+CtrEYvw+c88U8zlkRFTH6nF6s/g1lsrz220xZU+gazr
 gNbiJJgujYyXQq81rr8VQzJgJXHKiI3Yl9Hjn1Ch8OEH6KRO0zEk8jMghYlswIwzkiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788796996;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=xwMSt6vOFFjXtmJdsnsUL9GpkBS/qUdTv34O32nhNsA=;
 b=BEnpv7thcKfexUwL8H2oB5p4hawm5sVAM1u6dGFcDufxDCLUkzNDc1Hctwp8GRnaoyUZ
 mjcfER+0dVDKZyOOFXuW+ONzwCHjayHP5OPMNHmZaM8888uNQqNYZiGCzR5Dg4um1zhLy
 biUJyFBvSPDJQXM3H0JbrWhaozZfWh857o93Ze5SW3q/7QrONAIdRaLIEr0FY+HDl3X8o
 pVA17m6vj4ynK3zyY2GnxsHkuBoEto/AQpbiwDEykDqI9rLLL0k6TM5d3hWBwhIMKmq1y
 y2PRoiym7ovXllWG5GWdlKRZeMoIgAN+kX4Buqaz/UwDKJ2p2WPNWwt/3IZqy5XBRrw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eWV7xDYD; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 915CF600C4
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 16:03:14 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-49ccfae359fso33151825e9.3
 for <buildroot@buildroot.org>; Mon, 07 Sep 2026 09:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788796993; x=1789401793;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xwMSt6vOFFjXtmJdsnsUL9GpkBS/qUdTv34O32nhNsA=;
 b=DKQXf3PlTH3EvqhUNKj+j7Er0YR2VfzHCxuJrLe+yYg9iSkuEzS0mjYzledT75VFiC
 JCnR5VCzsE7dJMJ5D7BMEXIyHtCbHTy5TWvZHUHbZDNrutBq4/mW1I/kSxRR3aCmFaOf
 8osNK8lbu3Hwc00dwrzEnilewX10rKiNF/6XT7aSQD3jP0BrhBwjC+p+LbeXYzj2j4pw
 Hg2chgoIik4fzL+U8682jn4Tod/WIVuza7MZjmzAHaOQOQB+dqspOyVGge4uNGyT9Na7
 Ta8+wPa7S2pjwqz7+a+NkSIOEJ9+DA8fnmONB4CCvyZTqOBrXm/hCEo/I4R0e8bRPsqx
 jBdQ==
X-Gm-Message-State: AFuF++m0jabxGcdwKdo8oEFG6RTheLdcOXtuLJGqg62bWAaXouMr0Cxv
 4n4zK3PQWmYs+XZ15QpYp74SjCccmP1lslxvwfgJEDLoc8h1r48rYCESv0YnkbYt3LSEJYT//5+
 GdFWAJQI=
X-Gm-Gg: AYBFou21LBRwz5puwbIX5baA6XxytiJ7N7h+KiTQSSwTcaX7hfY3DgnQvbePpYFP34u
 +FHIakG7nBwve1MREoLdsXR2LYouxqRKWWqnjgoHKUpZV59Fvlv9Ubs3d5xtxhacif3NGvWP2dn
 TLwvyhL7i0Ut7FNGcalVXCv7hze3yXHDPBbcI93C7DgLOR0xqN3bjJ5D3GC/F06ACDB4YfmYWwP
 w4aVlnp64mg3MzdS2gcEB8PecIbGLe1ifQnmn30YRei7c4Ef6fiBL8F56S2QlqBjGNc9GtebP9K
 7kt3kSrem0Hl9HU9/RE5T9EJdwfu75ecpILsxBFKPb83X+QL9f1AO87tsQfkJVNNJeJLT0P0xJk
 kRqxdjNaIwR1LBK5n9ZL3+XZPLGtUGL5JokRF6V4VA/L7O+9Js4/a7a0is6IoCWE2m7+k5bn4Uq
 I9vW+29D4f0cf40TYhfG7KOzb+MA2du+4m9p8SJyo6sgaPyZjMxA7u+WFv72Frfbg7UTGjL/HDA
 WKHRU3ABHYm8JVoeSoUgJ9311eHuHcc9QftILg64nMc2Cg4ZDEn
X-Received: by 2002:a05:600c:198d:b0:49d:34:420d with SMTP id
 5b1f17b1804b1-49d00344222mr172107025e9.20.1788796992600; 
 Mon, 07 Sep 2026 09:03:12 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d08144037sm223853585e9.7.2026.09.07.09.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:03:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be
Date: Mon,  7 Sep 2026 18:03:00 +0200
Message-ID: <20260907160300.134667-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/openvpn: add patches for
 CVE-2026-84732
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

This fix has been released in OpenVPN 2.7.7, but is not available yet for
OpenVPN 2.6 series (which is included in Buildroot 2025.02.x)

(alternative to commit 25b8142ef7b9e09ed7d273571ca61aa92888a39c)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...avoid-unbounded-reliable-tls-timeout.patch | 129 +++++++++++
 ...r-packets-that-cannot-be-outstanding.patch | 206 ++++++++++++++++++
 package/openvpn/openvpn.mk                    |   4 +
 3 files changed, 339 insertions(+)
 create mode 100644 package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch
 create mode 100644 package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch

diff --git a/package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch b/package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch
new file mode 100644
index 0000000000..c559ffcb4d
--- /dev/null
+++ b/package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch
@@ -0,0 +1,129 @@
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
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/openvpn/options.c  |  9 ++++++++-
+ src/openvpn/reliable.c | 13 ++++++++++++-
+ src/openvpn/reliable.h | 41 ++++++++++++++++++++++++++---------------
+ 3 files changed, 46 insertions(+), 17 deletions(-)
+
+diff --git a/src/openvpn/options.c b/src/openvpn/options.c
+index 5f3f4e96028..7a649de8822 100644
+--- a/src/openvpn/options.c
++++ b/src/openvpn/options.c
+@@ -7548,7 +7548,14 @@ add_option(struct options *options, char *p[], bool is_inline, const char *file,
+     else if (streq(p[0], "tls-timeout") && p[1] && !p[2])
+     {
+         VERIFY_PERMISSION(OPT_P_TLS_PARMS);
+-        options->tls_timeout = positive_atoi(p[1], msglevel);
++        /* Constrain the timeout to not have problems with
++         * RELIABLE_MAX_TIMEOUT_SHIFT creating an overflow. 65k seconds
++         * timeout is already way too much anyway */
++        if (!atoi_constrained(p[1], &options->tls_timeout, "tls-timeout", 1,
++                              RELIABLE_MAX_INITIAL_TIMEOUT, msglevel))
++        {
++            goto err;
++        }
+     }
+     else if (streq(p[0], "reneg-bytes") && p[1] && !p[2])
+     {
+diff --git a/src/openvpn/reliable.c b/src/openvpn/reliable.c
+index 690e50d6d95..230d6aca47e 100644
+--- a/src/openvpn/reliable.c
++++ b/src/openvpn/reliable.c
+@@ -655,11 +655,22 @@ reliable_send(struct reliable *rel, int *opcode)
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
+index a5ed75cf0d0..af95bbc17a1 100644
+--- a/src/openvpn/reliable.h
++++ b/src/openvpn/reliable.h
+@@ -40,21 +40,32 @@
+  *  @{ */
+ 
+ 
+-#define RELIABLE_ACK_SIZE                       \
+-    8 /**< The maximum number of packet IDs     \
+-       *   waiting to be acknowledged which can \
+-       *   be stored in one \c reliable_ack     \
+-       *   structure. */
+-
+-#define RELIABLE_CAPACITY                      \
+-    12 /**< The maximum number of packets that \
+-        *   the reliability layer for one VPN  \
+-        *   tunnel in one direction can store. */
+-
+-#define N_ACK_RETRANSMIT                      \
+-    3 /**< We retry sending a packet early if \
+-       *   this many later packets have been  \
+-       *   ACKed. */
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
diff --git a/package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch b/package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch
new file mode 100644
index 0000000000..0b97582965
--- /dev/null
+++ b/package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch
@@ -0,0 +1,206 @@
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
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/openvpn/reliable.c                    | 37 ++++++++++++++++-
+ src/openvpn/reliable.h                    | 17 ++++++--
+ tests/unit_tests/openvpn/test_packet_id.c | 50 ++++++++++++++++++++++-
+ 3 files changed, 98 insertions(+), 6 deletions(-)
+
+diff --git a/src/openvpn/reliable.c b/src/openvpn/reliable.c
+index 230d6aca47e..ced438e481d 100644
+--- a/src/openvpn/reliable.c
++++ b/src/openvpn/reliable.c
+@@ -390,13 +390,35 @@ reliable_empty(const struct reliable *rel)
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
++    unsigned int out_of_window = 0;
++    packet_id_type first_out_of_window = 0;
++
+     for (int i = 0; i < ack->len; ++i)
+     {
+         packet_id_type pid = ack->packet_id[i];
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
+         for (int j = 0; j < rel->size; ++j)
+         {
+             struct reliable_entry *e = &rel->array[j];
+@@ -417,16 +439,27 @@ reliable_send_purge(struct reliable *rel, const struct reliable_ack *ack)
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
+index af95bbc17a1..a85f2e97807 100644
+--- a/src/openvpn/reliable.h
++++ b/src/openvpn/reliable.h
+@@ -105,9 +105,9 @@ struct reliable
+ {
+     int size;
+     interval_t initial_timeout;
+-    packet_id_type packet_id;
+-    int offset; /**< Offset of the bufs in the reliable_entry array */
+-    bool hold;  /* don't xmit until reliable_schedule_now is called */
++    packet_id_type packet_id; /**< Packet ID for the next packet to be sent out. */
++    int offset;               /**< Offset of the bufs in the reliable_entry array */
++    bool hold;                /* don't xmit until reliable_schedule_now is called */
+     struct reliable_entry array[RELIABLE_CAPACITY];
+ };
+ 
+@@ -189,6 +189,17 @@ reliable_ack_empty(struct reliable_ack *ack)
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
+index 5dfd319ab9a..a5d50de4ae7 100644
+--- a/tests/unit_tests/openvpn/test_packet_id.c
++++ b/tests/unit_tests/openvpn/test_packet_id.c
+@@ -325,6 +325,53 @@ test_copy_acks_to_lru(void **state)
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
+@@ -346,7 +393,8 @@ main(void)
+                                         test_packet_id_write_teardown),
+ 
+         cmocka_unit_test(test_get_num_output_sequenced_available),
+-        cmocka_unit_test(test_copy_acks_to_lru)
++        cmocka_unit_test(test_copy_acks_to_lru),
++        cmocka_unit_test(test_packet_id_window)
+ 
+     };
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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
