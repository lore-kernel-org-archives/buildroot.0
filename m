Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B19C5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 14:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9037A80E9D;
	Mon, 17 Aug 2026 14:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id slXSacBWqu_N; Mon, 17 Aug 2026 14:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 962FA80EEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786975290;
	bh=3jWVGNVdQ7mM2x4ZVAOFuIv15SVXpZ/QijgPXyHzIAQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G7MVlq//FuWBCvmgxwzWmFycJ30e07MyCs4aFGW1HMaKadZtCB1/AoyV3t2eXAHca
	 3onRgQPwlJZSqikgEJPfOIje/gIBEQcz3HWXAnMdNHGv278gz9JMUU9/xZDruGGFvi
	 Ac45NPYXI+Ly0YuKMXsJnQCVymzAwUthmhp1An69/f4+WS/aRDtYBS+n8MsApeY9f2
	 a3TOIWw60JfAvN99/zMvku0zgLoy6GeNUEnuTGjxsPTouDpjFmwcLw7M0QtCURfRHj
	 lVBO7G5eepb9mWYQ3IfDZDsWg5WeuUoCC7KGph3dh/JNJFtWZqbFkxKVC9jSiqDvJ7
	 fJOXthUnfNxLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 962FA80EEF;
	Mon, 17 Aug 2026 14:01:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7CEC2B2
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DCE980ED5
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngpgl9iBYRki for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 14:01:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 576F080C3B
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 576F080C3B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=MWkpfCwC
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 576F080C3B
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:01:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-47362928f65so3332947f8f.2
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 07:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786975285; x=1787580085; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qmchDH5K5IejzmdQqTPueGWHL9XKLlWH8g8PeO1zU0s=;
 b=MWkpfCwCUIYysK6IRyaGbZyTgZ5uwiQ0wGLQKM1U2kzALP4Zi2ItW6a8bl/CuIKY6I
 w2GN189tTn/Iq+VhvBBjmHA7f1drGU6xnIpfA7xdx0BdA0yVJo7ZsWtUjTrQVc6UGnb6
 PEGxblSlyuADhplAxRVc14/kAskYUv6Dyb2y8tFxrbmBiQeMhwswVijrs2CXd5Rg3IKq
 cX7SBoggBlLaoFUyLF9cYG912wE2/ua7r/DG0DlUMuhhbOfj75zs+V/lg1GxpaCrfGYo
 GTyvbX5AeCemEDwqL0+EPQI3uLhwbYtw8uBcPWLaSUgaLvmfLbxF/rEU6zyjSCRvm2JM
 ISug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786975285; x=1787580085;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qmchDH5K5IejzmdQqTPueGWHL9XKLlWH8g8PeO1zU0s=;
 b=AlbOxuu20r4C59pHfw4hUF/uNiGKxb+iCgxjIokPsHuhH7jxdJsrYyZfUypiwQGUOj
 6g4VmpJF9YnPG8rg02mE4Pj2Q4ukSS6ALeklohEC0UdA09L2EOSg8oBS03aUJbp+4AqE
 a/8VUGf1yj66yPSlAN24dnoyIR+wTmksV1Mi/TYHn9qmPeragFwPdiye8MReYlWUCX+4
 EHyaMR6ExCKCt1147xwGJefzkrBfxteOqfLMWUwkfKkxhNTSx4jzltAMyxMLJLcu4l0D
 +UW1a62UNWUilAj4vaMJknRLKQLiD+ELcpEMhoYKxrgJbIpb57R+IWH8greH4OOEYxkX
 3a0w==
X-Gm-Message-State: AOJu0YwOdmn+sO6oHEMSUSHCjnBGOILG1uF6Xw9w/OrjGYIQmlhBTZ9P
 2tTeplAE64wFPatkXyaW1r9C8j6s2EVBRO0Z+VDyLSjDN5gG4AVNWuy7qNBPFg==
X-Gm-Gg: AR+sD128QBgaal4DzFG2LnAGl1kaPuv/iYdMc86zZeVMXAQV1kkM79U9qsmm6dnT+Ta
 UZikVIyHiJeuDDucYlkwyDMq5x9bkMrec7hAjhGjnujDHVItbHycUKIprrxB2h5cwDNuIeJjLMP
 mk+LZmmhcYAbY39o+z1+NR7VXTNdiSQUlRPt2mGn7dGDgda7H22VsxHyyNz7Zkm65dL0KaX7IYo
 /FdGSwdwkBY4IQGDzB+3TBgtWq1+yH7jjWgmRZ8P+cHWjACZ+J9UkWWT+bDHoHdpGKR5TuC6NRk
 HjrPN2L5Y2JA7MxsFMqcG7aMVgCNPuWaRLpzhpEsqSmMCD8MMfmds0QCZdqpN2OJjQ11nZnv3BE
 lyKzQq49xJ6edsZDMbU6EiqkthG5UI3AuCe/DKvizzebcugW50dfeo0tqXnGhZ/Y6i8ZfgWoGmF
 ZkGvfmIZNrVGE5FiYjgaqVUf3TQpCseEItpxKe2kIgNoii6t46hDOpXjH8zqeNgxSUR8YhIZ+du
 w==
X-Received: by 2002:a05:6000:3106:b0:481:4761:45dc with SMTP id
 ffacd0b85a97d-482a9090e1emr522416f8f.13.1786975285088; 
 Mon, 17 Aug 2026 07:01:25 -0700 (PDT)
Received: from WL2200093.evs.tv ([2a02:2788:814:e8:75df:d58f:5583:8eb3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a3b660sm4335526f8f.15.2026.08.17.07.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 07:01:24 -0700 (PDT)
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
To: buildroot@buildroot.org
Cc: Fred Lefranc <fred.lefranc.evs@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 17 Aug 2026 16:01:22 +0200
Message-ID: <20260817140122.27796-1-fred.lefranc.evs@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] packages/haproxy: security bump to version
 2.6.32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release with large number of (security) fixes.

HAProxy 2.6.32 was released on 2026/07/29. It added 33 new commits
after version 2.6.31.

As for the 2.8.27, the announce is an expurgated copy-paste of the 3.4.3
announce:

* stats: Two issues about the stats page, reported by Red Hat/AISLE
  Research, were fixed.

  Proxies updated through the stats page while in "stats admin" mode were
  not subject to the "stats scope" filtering, meaning a scope meant to
  restrict which proxies are visible/actionable could be silently bypassed
  on POST requests.
  Separately, POST requests to the stats interface did not validate that the
  Origin (or Referer) header matched the Host, which is now checked to
  mitigate CSRF attacks.

* ssl-gencert: A memory leak on every certificate generation was fixed.

  Two temporary buffers were not freed after generating a certificate on the
  fly, leaking memory each time a new SNI triggered certificate
  generation. This issue was reported by Red Hat/AISLE Research.

* sample/protobuf: buffer overflows after pointer-shift converters, reported
  by Red Hat/AISLE Research and Charles Vosburgh, were fixed.

  Several converters (protobuf/ungrpc field extraction, ltrim())
  move the sample's data pointer forward on success but did not shrink the
  sample's recorded buffer capacity accordingly. A converter chained
  afterwards that relies on that capacity (e.g. padding via memset()) could
  then write past the end of the buffer, leading to heap corruption or a
  worker crash. All the affected converters now adjust the capacity
  together with the pointer.

* protobuf: A nested-path validation bypass reported by Red Hat/AISLE
  Research was fixed.

  The protobuf field lookup used for the protobuf()/ungrpc() converters did
  not strictly enforce hierarchical boundaries, so a flat sibling field
  could incorrectly satisfy a nested-path lookup (e.g. matching a root-level
  field as if it were nested under a parent). The lookup was rewritten as a
  strict, non-recursive path walker that correctly bounds each nesting
  level.
  Separately, a crash because of deprecated protobuf group wire types was
  fixed. These wire types are now explicitly rejected.

* http-fetch: Two crashes reachable from health-check configurations were
  fixed.

  "res.body"/"res.hdr"/... and similar response fetches assumed the
  health-check receive buffer always held an HTX message, which is only true
  for actual HTTP checks; on a plain TCP check, a hostile/misbehaving server
  could craft the first bytes of its reply to be misinterpreted as HTX
  internal fields, causing a wild read and worker crash (or leaking
  arbitrary process memory).
  Separately, "capture.req.hdr"/"capture.res.hdr" only validated the upper
  bound of their index argument, so a negative capture id was accepted at
  boot and dereferenced an out-of-bounds array entry at runtime, crashing
  the worker on the very first request.

* slz: Several issues were fixed in the SLZ library.

  A stream alternating many literals in the 144-255 range with cheap
  back-references could keep inflating indefinitely instead of falling
  back to a stored block, exceeding the library's documented worst-case
  output size by several percent. A new accounting mechanism now bounds
  this overhead. Practical impact on haproxy requires tune.bufsize above
  ~43 kB with the default reserve.
  Five small correctness fixes inherited from upstream libslz were also
  backported: Avoid reading up to a few bytes past the end of very short
  inputs on architectures without fast unaligned access; stop appending an
  extra, misplaced block to an already-finished deflate/gzip/zlib stream
  (which could corrupt the trailing checksum in ~2% of fuzzed streams); fix
  the Adler32 checksum accumulator sign handling on 32-bit systems
  (affecting the zlib format only); avoid an undefined-behaviour signed left
  shift when assembling input words byte by byte; and use the exact bit cost
  when deciding whether to emit the last literals of a block as a stored
  block, avoiding compressed output slightly larger than the documented
  worst case.

* peers: A heap overflow when replicating large stick-table dictionary
  entries was fixed.

  peer_prepare_updatemsg() never verified that a stick-table entry's
  dictionary value (e.g. server_key, up to ~16 kB) actually fit in the
  update message being built. Since the peers protocol is plain-text and
  unauthenticated, a rogue or compromised peer could plant an oversized
  entry that overflows the 16 kB trash buffer as soon as the victim
  replicates ("teaches") it, confirmed as a heap-buffer-overflow write. The
  function now checks the available room before encoding and fails cleanly
  if it doesn't fit. This was reported and fixes by Matt Suiche from Tolmo
  Inc.

And, as usual, the bunch of minor fixes here and there, mainly raised during
AI-assisted code reviews. Most were never noticed:

* HTX API: Some bugs about how the HTX API was used were fixed here and
  there.

* http-act: Double-frees and a couple of state bugs on parsing errors were
  fixed.

* http-fetch/http-ana/http-htx: Few out-of-bounds reads were fixed.

* http-conv: The last input character could be lost when calling url-dec
  converter, when the input buffer was full. This was fixed by failing the
  converter in that case.

* mux-h1: An extra 200ms delay was observed on some H2-to-H1 messages
  because the end of the message was not always properly detected. This
  case is now properly handled.

* sample: An edge case in be2hex() was fixed.

For more details, see the announcement:
https://www.mail-archive.com/haproxy@formilux.org/msg47353.html

Signed-off-by: Fred Lefranc <fred.lefranc.evs@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 6bb5dda804..2575c408d7 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.27.tar.gz.sha256
-sha256  ccdaf08e8653f9651992212b51af0b5513c2e2cf0cd822ca67c94cffe10386a6  haproxy-2.6.27.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.32.tar.gz.sha256
+sha256  8791585ee3bd24cde652d1d840ac7b1f73f086d5e9ec41c5e079592703ea52a4  haproxy-2.6.32.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index cf1484243c..970347d3ed 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).27
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).32
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
