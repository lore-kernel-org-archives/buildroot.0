Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F7BC79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 21:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAB826069E;
	Mon,  7 Sep 2026 21:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_zFreCCmDzf; Mon,  7 Sep 2026 21:41:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CEC5060650
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788817285;
	b=p5wVhCB/zNQdi9Xwj8iZarR/8jzu3dygXOyzLJpQkkOZI3/sEmXzQxEW7g7kuzvG46Xa
	 mohAVU0anOzdNMHd1R/nwJjCoRH+zJem1GXZeIpA0WzqyuHsFwDG1xBtsGkXdWoMMxAto
	 fkdbwp0/OaEBI+8NToquIy0KHArvXFST58JI3KA1fWI0Bjm3tessjzLmu8UUnJAiecw10
	 psIS7Yif9b0QdEUg29x9W38laJ2djn/5xWowJDFnp1lBex/yXXrsIh3eb/uy/e41RnH4P
	 6CKZ46xWaddiO3o77aTyh/L83PdHDsxxs+n1d0IF2K4gAHKRtoEoHl7s4U0MUsf6tTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788817285;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=smdaP6iBm3W60sKiuUqxaoSy0A7pgWx1yPyprqLn3fU=;
	b=VNCVXA8Pue6zBFi528cVy0qni3Lr4qoh0JHPcdGaUaTrlyn8EZPhgdF/8ZHJyi7FmwgE
	 EQyvUZ0qdeFNO9/B4G+K06D/ETnU4DK3uMkFd6bok75CptT36HOgDTxfWdyjuVrVcyoT5
	 xuXe3IwjDu0+rSqb28sF0rfRgLBqrX7nfKVqS4vLMB83B+7sIyKI0pGAJO1gj2NNMidBS
	 wy/BZP7aFA4AutmEZhCPPJjNlUV+MjXKH8FTbcfgHuoEaDZklvCVBPOIjbAYyc7GsqQob
	 KJknkCfENDTHA0tcHF2/aWzaaNSgEgrbUl1i+vjyKroLD+Phlh0bFIRnYpGXPpI6R3w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788817285;
	bh=smdaP6iBm3W60sKiuUqxaoSy0A7pgWx1yPyprqLn3fU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KPzPwBByHeE3+FoRFLCGARoOsXGCJQ1tqKabkjKwOunDZKGFM3gcnsmoJLAIQT3mt
	 edXOa5jd2RYgY1eWNUG7EtTcRXea4STYr+kdwkS6IPXqWnFJa0ZCJeQKTmsUoWYvVF
	 kTmKJyrPWPXq83XfAGS7ynCCkYynChf0WA3CXThBx0JAygOHTAs6VnUFQ28eV0mWw8
	 JSrYY68RWzRAuGUUGdPll3sgZPlLpkiNQTCE7e4uI8LTh3M3C/UQiRoEzEbsOiEA0+
	 3JBiS1TQIssR9aFYDgYYgtMQNspkccZPkaSWVXAjJF5Qwe6GH0LgO2i7C2J/YjTodo
	 VcU7XMI927FVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEC5060650;
	Mon,  7 Sep 2026 21:41:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8150449D
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 21:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E8FE8083D
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 21:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A17u8ulh-ZTD for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 21:41:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A40B880827
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788817283;
 b=hBWLZrTuy/NTkueQW4pCXsbKM+uEOvdtGC7A+gdxcHhToTI6EqnqbYXCWuEe8T7V0bff
 qAX/YHqskGTDsFrWObSwVkd5uPHpsfZLCzowlDLoc8gSvQPKa410s0LL3IKwlYXFeHBu4
 IE5Scjr3rfbl5XJtzMHsClR7G3SzyCBFzbRr/z6+In86eGemicQej1YIaecOH/5Y4qhyW
 RhI20uIg8g7MwQUutfOmXKrjYXug/Iorr4l0rA9oY3h2R/LIIJMcY08MprSUaui3Jqfbw
 syem81cqPvtKxjisSbVO3uM5KFzFh4AE4AA/fO/PzBkTTdgQIJ9GkiDmYcNvx9/l5jw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788817283;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=KrouS+v3XFfoxA7jZe7vPuG5edVhfAqpuhctMFm5iyI=;
 b=hyIe7jREK4k83uIYVXd5btZi22iFMKXHj4fkN9YtuOc4f+gxKo/R1Soij5x5GgXqjzue
 cM8OQbYFQYxuwjJUzgX1pY/GS7HTt3y5avsT8FSW7BYCChXxPCvcJI74ZlDdtwNqNfpMy
 pS6hDoAvsgHayPa2chq18TbolM/Wap2SmgE0CZK/kr2xE623qZPeeGM6bLk43Epxe9zD7
 4KJVmH0IxIk8S6152DRFrVd5AfhycnOD8DdIV4UWth0DukGMeKijRYXhSD+reAevrKRYf
 ++ZniQuXCBmJPDkaw2sfc2MhYfqd5fykJv9Y41nC1YcsbGnlKqAS7D0b8h9+3+un60A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NDyVdTnI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A40B880827
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 21:41:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-495590dde14so56628155e9.0
 for <buildroot@buildroot.org>; Mon, 07 Sep 2026 14:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788817280; x=1789422080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KrouS+v3XFfoxA7jZe7vPuG5edVhfAqpuhctMFm5iyI=;
 b=EXGCD/nuei22kpR0hjSFOFTbgil5nRYWJkzfC3wHkeqQfPKPQC4xDwAZUP/JrHhWFk
 HctQ4tNzN2QrzCIUiKEAoIpNSH2OThCEwiSbrhquAcrrByEwK7tF27PCvXya/ibIs9dp
 2PuiyPnRRgW+dLvxHhAcMMG6d3aSKPs/dSnVPNFHd7qT28hzuBLjQupLFUTPPO1PGM5m
 cnSabYFnMezvWYX/WdJDPaZWUbagpLNpWEwUubFIxxI2/UeDNvqzFQgI8ymwoLB0Kev8
 V/bKGdBQ7Vfa96OrZSEZy+hVL2HaQez1v6Q6F/9/uSQzrKrZ0884o54ZoWVmgdm4/ziG
 CD3g==
X-Gm-Message-State: AFuF++lqfZrwAjGBqOnmxHwi5sv1TbkFAsz/duaLoXIJd8Vozvfh0kkC
 rlQGO/8AwR53vpo/q6cD1AtIzVpYPFJMPycXxZN1QSqY915shHZ9X/Shw7gBPLosLXojxOkvZ8v
 7/L/tVRQ=
X-Gm-Gg: AYBFou0IlsWovgd/LCHlfs/j6rr78amJq9IGty+TZNS1Retf0luFwYD+O/lmrOsaqIv
 OhTK8NVCQmMOfEOsXD2nKRIhtpXiWVfLxEuhTiJ5PjATM2r0dEpCbT4zItQ3BTlMiBIWclvHhvZ
 zsvMekKECJkNhyTOsw5yqHuMt7wsKxxQCcndbzQafZnQ3ojaGQBe+eSzYDP7Y/ezDeLAw7gK1oa
 00MfpkQ6gt26IhIKBZAUem36gvnLhXirsE5v2FnLsslnYhENjG/zx5gTl13ujyQ7thsaaT+vLwE
 5UkQcCaL0o1rruEZ+3m3mTaHljrqLDNDV6o6VoIOyd7GBkfRv/8G+0SJaJK9V2WuMZ8mtGbEgnA
 E7gR3CQxD2SNgvBiQyuEPwOWioFtw874pl5/cOtkgTk0kjcsQbf49PC81FHqbTwygks/c3z4LgG
 tkBkw5TfE4J0qw2K226JKLtZTpRjNPlWAQUbE+oPuF76tADMm/6XXX3PXe+DRwRcv5AtBzw6LOh
 VAo
X-Received: by 2002:a05:600c:a0a:b0:49c:e1f1:3dd5 with SMTP id
 5b1f17b1804b1-49cf81e6cebmr446069735e9.4.1788817279634; 
 Mon, 07 Sep 2026 14:41:19 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee7fec25sm494093975e9.13.2026.09.07.14.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 14:41:19 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Mon,  7 Sep 2026 23:41:17 +0200
Message-ID: <20260907214117.495541-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907160300.134667-1-titouan.christophe@mind.be>
References: <20260907160300.134667-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x] package/openvpn: add patches
 for CVE-2026-84732
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
Changes v1 -> v2:
- Fix patches that did not apply
---
 ...avoid-unbounded-reliable-tls-timeout.patch | 162 +++++++++++++
 ...r-packets-that-cannot-be-outstanding.patch | 214 ++++++++++++++++++
 package/openvpn/openvpn.mk                    |   4 +
 3 files changed, 380 insertions(+)
 create mode 100644 package/openvpn/0001-avoid-unbounded-reliable-tls-timeout.patch
 create mode 100644 package/openvpn/0002-ignore-acks-for-packets-that-cannot-be-outstanding.patch

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
index 0000000000..3c34c004ff
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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
