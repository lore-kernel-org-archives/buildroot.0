Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621EEC5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 14:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C16D80F00;
	Mon, 17 Aug 2026 14:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKdfazB5dSFo; Mon, 17 Aug 2026 14:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1713680D7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786977513;
	bh=7+0/j5SC2Lz6re3LFG2pB0i7bdVoM/ufcoJXLz5gpBI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=efZuw/hh6Flxampje3QwFza4LogAqAWkjDpspyTUWvbTtlzQWrn5to9TXmNCoukMv
	 lzTFicVsY3mAELgen/q3PcbgaI87VGj3jxEMcoN6NnOd6Oyr3Xpp9Xk3eoYNxmXV2i
	 4WNv0D0wuWlgwKq1X16SJzdvSzaEMePqpC84lqby+9DL1a38ECFpwD6ge+JOJBf8Cd
	 KObyLWCStyglUzPVvwKBDEGs+IGtfSvvUssAKrVAig5IptSOrowNZ6opM+/OilQO3P
	 YuW6ON/rmDLSCd/lIWSQfcLqCjGxlvTU/ful0kwHXP1nBlXadq+4XJWX6Cj0quPWQS
	 gE7gS0UIo6oQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1713680D7F;
	Mon, 17 Aug 2026 14:38:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF99C2EF
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A204F401C7
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75v6AruuEsMY for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 14:38:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD050400FF
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD050400FF
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=XVGmUH4J
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD050400FF
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 14:38:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=XVGmUH4J+MtoTC0uLxZ0UcU1EadjtbLuOi7P3xmA3G3E748pj1D3ogn/lazsxrEfwKOhd0dQj/6xDTuGUUNF4AjcjnVCUnWa9xKlNRPSA5mMoZaYSRhaaLy9bRadfvwQGnHT1Cla8ShhCVLXGvQ7R81Q23RxghF+sc/MTnDQbrZg8C9DyaV19YtPnoWwiH1Jv5g3jOG/LppaPamZj/vptVQeTvCohUzkni0ls8d94qZa8FdyFR/OH7JyO4v2E8OprC9wbgxzaLNaX6EhX3CrGPYC7jhOn9A2/6hU3zgY6l0PV9eEdN7CeSjrK/dGQSmppjvVML0STeuSO9ZT8Y6qTw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=95PnntPhaEjdmh9ndxgtWfOFMmwyjUCg6FhlKkRElI8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 830000759; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Aug 2026 14:38:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wvyTq-00000002WnE-0zXO;
 Mon, 17 Aug 2026 16:38:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fred Lefranc <fred.lefranc.evs@gmail.com>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260817140122.27796-1-fred.lefranc.evs@gmail.com> (Fred
 Lefranc's message of "Mon, 17 Aug 2026 16:01:22 +0200")
References: <20260817140122.27796-1-fred.lefranc.evs@gmail.com>
Date: Mon, 17 Aug 2026 16:38:26 +0200
Message-ID: <87qzjw6cd9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] packages/haproxy: security bump to version
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

>>>>> "Fred" == Fred Lefranc <fred.lefranc.evs@gmail.com> writes:

 > Bugfix release with large number of (security) fixes.
 > HAProxy 2.6.32 was released on 2026/07/29. It added 33 new commits
 > after version 2.6.31.

 > As for the 2.8.27, the announce is an expurgated copy-paste of the 3.4.3
 > announce:

 > * stats: Two issues about the stats page, reported by Red Hat/AISLE
 >   Research, were fixed.

 >   Proxies updated through the stats page while in "stats admin" mode were
 >   not subject to the "stats scope" filtering, meaning a scope meant to
 >   restrict which proxies are visible/actionable could be silently bypassed
 >   on POST requests.
 >   Separately, POST requests to the stats interface did not validate that the
 >   Origin (or Referer) header matched the Host, which is now checked to
 >   mitigate CSRF attacks.

 > * ssl-gencert: A memory leak on every certificate generation was fixed.

 >   Two temporary buffers were not freed after generating a certificate on the
 >   fly, leaking memory each time a new SNI triggered certificate
 >   generation. This issue was reported by Red Hat/AISLE Research.

 > * sample/protobuf: buffer overflows after pointer-shift converters, reported
 >   by Red Hat/AISLE Research and Charles Vosburgh, were fixed.

 >   Several converters (protobuf/ungrpc field extraction, ltrim())
 >   move the sample's data pointer forward on success but did not shrink the
 >   sample's recorded buffer capacity accordingly. A converter chained
 >   afterwards that relies on that capacity (e.g. padding via memset()) could
 >   then write past the end of the buffer, leading to heap corruption or a
 >   worker crash. All the affected converters now adjust the capacity
 >   together with the pointer.

 > * protobuf: A nested-path validation bypass reported by Red Hat/AISLE
 >   Research was fixed.

 >   The protobuf field lookup used for the protobuf()/ungrpc() converters did
 >   not strictly enforce hierarchical boundaries, so a flat sibling field
 >   could incorrectly satisfy a nested-path lookup (e.g. matching a root-level
 >   field as if it were nested under a parent). The lookup was rewritten as a
 >   strict, non-recursive path walker that correctly bounds each nesting
 >   level.
 >   Separately, a crash because of deprecated protobuf group wire types was
 >   fixed. These wire types are now explicitly rejected.

 > * http-fetch: Two crashes reachable from health-check configurations were
 >   fixed.

 >   "res.body"/"res.hdr"/... and similar response fetches assumed the
 >   health-check receive buffer always held an HTX message, which is only true
 >   for actual HTTP checks; on a plain TCP check, a hostile/misbehaving server
 >   could craft the first bytes of its reply to be misinterpreted as HTX
 >   internal fields, causing a wild read and worker crash (or leaking
 >   arbitrary process memory).
 >   Separately, "capture.req.hdr"/"capture.res.hdr" only validated the upper
 >   bound of their index argument, so a negative capture id was accepted at
 >   boot and dereferenced an out-of-bounds array entry at runtime, crashing
 >   the worker on the very first request.

 > * slz: Several issues were fixed in the SLZ library.

 >   A stream alternating many literals in the 144-255 range with cheap
 >   back-references could keep inflating indefinitely instead of falling
 >   back to a stored block, exceeding the library's documented worst-case
 >   output size by several percent. A new accounting mechanism now bounds
 >   this overhead. Practical impact on haproxy requires tune.bufsize above
 >   ~43 kB with the default reserve.
 >   Five small correctness fixes inherited from upstream libslz were also
 >   backported: Avoid reading up to a few bytes past the end of very short
 >   inputs on architectures without fast unaligned access; stop appending an
 >   extra, misplaced block to an already-finished deflate/gzip/zlib stream
 >   (which could corrupt the trailing checksum in ~2% of fuzzed streams); fix
 >   the Adler32 checksum accumulator sign handling on 32-bit systems
 >   (affecting the zlib format only); avoid an undefined-behaviour signed left
 >   shift when assembling input words byte by byte; and use the exact bit cost
 >   when deciding whether to emit the last literals of a block as a stored
 >   block, avoiding compressed output slightly larger than the documented
 >   worst case.

 > * peers: A heap overflow when replicating large stick-table dictionary
 >   entries was fixed.

 >   peer_prepare_updatemsg() never verified that a stick-table entry's
 >   dictionary value (e.g. server_key, up to ~16 kB) actually fit in the
 >   update message being built. Since the peers protocol is plain-text and
 >   unauthenticated, a rogue or compromised peer could plant an oversized
 >   entry that overflows the 16 kB trash buffer as soon as the victim
 >   replicates ("teaches") it, confirmed as a heap-buffer-overflow write. The
 >   function now checks the available room before encoding and fails cleanly
 >   if it doesn't fit. This was reported and fixes by Matt Suiche from Tolmo
 >   Inc.

 > And, as usual, the bunch of minor fixes here and there, mainly raised during
 > AI-assisted code reviews. Most were never noticed:

 > * HTX API: Some bugs about how the HTX API was used were fixed here and
 >   there.

 > * http-act: Double-frees and a couple of state bugs on parsing errors were
 >   fixed.

 > * http-fetch/http-ana/http-htx: Few out-of-bounds reads were fixed.

 > * http-conv: The last input character could be lost when calling url-dec
 >   converter, when the input buffer was full. This was fixed by failing the
 >   converter in that case.

 > * mux-h1: An extra 200ms delay was observed on some H2-to-H1 messages
 >   because the end of the message was not always properly detected. This
 >   case is now properly handled.

 > * sample: An edge case in be2hex() was fixed.

 > For more details, see the announcement:
 > https://www.mail-archive.com/haproxy@formilux.org/msg47353.html

 > Signed-off-by: Fred Lefranc <fred.lefranc.evs@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
