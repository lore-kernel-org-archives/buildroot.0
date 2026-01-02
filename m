Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C5CFA3752
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6179C8237C;
	Fri,  2 Jan 2026 15:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClCq6k6r3XQD; Fri,  2 Jan 2026 15:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C268782521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767368519;
	bh=P2FyPl6jn+WnG9S2LM7TbCR6rJAU1leq7mDw6Ch7I3s=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GHymtTm+LGLenDNULnMw1/awM+hMNpiQia3rv6rHGX/u7IrTpq8ZplmcKAZe/hY3E
	 TCIpeyvPWc+jxJveMR1PNie8iW5VfvJ+1oMiKPqxtyt67eiW0dVtskZtYoYGc6WZyC
	 NiYyDeBurFBYkd8xMIcYQYUwsGCqnRdXxFKpaUhvSd5W58Xq6iMYc79fIjeYMKRLDi
	 g7utR73Cjq55Mq/OPgiGjyzszSWUYRHkQxciAUt9UeMLZ0MzJNeGnZgH78phwtcLSK
	 jyTFUCe4l9adjJk14L1XbRpIYyFc8oVKaaZauGGx4qnrcVXBfEOGDAiaTCgT7QrHx8
	 xbbwSwkeXLRTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C268782521;
	Fri,  2 Jan 2026 15:41:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 100EDD7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E349840B66
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrbrmPAm--QJ for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:41:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD35B40881
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD35B40881
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD35B40881
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:41:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 203ACC1C3B6
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:41:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D2373606C7;
 Fri,  2 Jan 2026 15:41:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D343E113B071B; Fri,  2 Jan 2026 16:41:50 +0100 (CET)
Date: Fri, 2 Jan 2026 16:41:49 +0100
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Buildroot Development <buildroot@buildroot.org>, Peter Seiderer
 <ps.report@gmx.net>
Message-ID: <20260102164149.5702b9de@windsurf>
In-Reply-To: <20250920074707.584930-5-bagasdotme@gmail.com>
References: <20250920074707.584930-4-bagasdotme@gmail.com>
 <20250920074707.584930-5-bagasdotme@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767368511; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LhIsWB0OQ4Nebr1UIqvLVyzlFu9w/0n5AXyI8k0VkDU=;
 b=t4sNb8e14MKfyuLv5e9jxTacsKAlLn1LIK7b7PkAllB/KnI4wUvEFY5KDriq8uixnNBqB1
 7IqQfwvPqCVqoAFGc/OidaPbCor6RbGH8bbHvH4zXbhnl3TjJSVca6IZEWaS0R4S57Qd4Y
 /pUUs4S+ktIujA3rfaQcTwbGgSSk6sihjCd0u31MZeEpdDm1MCyiupVuP9FWTmQi3y6r/a
 URwrJNGxacyg9xRzXvd4Telb4ac0a27dfFXzO0oZSQ+P/0HNjbbvrYQg1j+KHPb1ePpa6X
 W/1897t8f4EQKBgUQEmpruVmFqZ9uZvemGAKKWmL6d9nLPCTSnZIO+oaqXC+AA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=t4sNb8e1
Subject: Re: [Buildroot] [PATCH 1/2] package/readline: Fix sdk rootfs
 tarball generation
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBTYXQsIDIwIFNlcCAyMDI1IDE0OjQ3OjA5ICswNzAwCkJhZ2FzIFNhbmpheWEg
PGJhZ2FzZG90bWVAZ21haWwuY29tPiB3cm90ZToKCj4g4pCbWzdtPj4+ICAgR2VuZXJhdGluZyBm
aWxlc3lzdGVtIGltYWdlIHJvb3Rmcy50YXLikJtbMjdtICAKPiBta2RpciAtcCAvaG9tZS9iYWdh
cy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvaW1hZ2VzCj4gcm0gLXJmIC9ob21lL2JhZ2FzL3JlcG8v
YnVpbGRyb290L291dHB1dC9idWlsZC9idWlsZHJvb3QtZnMvdGFyCj4gbWtkaXIgLXAgL2hvbWUv
YmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1mcy90YXIKPiByc3lu
YyAtYXVIIC0tZXhjbHVkZT0vVEhJU19JU19OT1RfWU9VUl9ST09UX0ZJTEVTWVNURU0gL2hvbWUv
YmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L3RhcmdldC8gL2hvbWUvYmFnYXMvcmVwby9idWls
ZHJvb3Qvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1mcy90YXIvdGFyZ2V0Cj4gZWNobyAnIyEvYmlu
L3NoJyA+IC9ob21lL2JhZ2FzL3JlcG8vYnVpbGRyb290L291dHB1dC9idWlsZC9idWlsZHJvb3Qt
ZnMvdGFyL2Zha2Vyb290Cj4gZWNobyAic2V0IC1lIiA+PiAvaG9tZS9iYWdhcy9yZXBvL2J1aWxk
cm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL3Rhci9mYWtlcm9vdAo+IGVjaG8gImNob3du
IC1oIC1SIDA6MCAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRy
b290LWZzL3Rhci90YXJnZXQiID4+IC9ob21lL2JhZ2FzL3JlcG8vYnVpbGRyb290L291dHB1dC9i
dWlsZC9idWlsZHJvb3QtZnMvdGFyL2Zha2Vyb290Cj4gUEFUSD0iL2hvbWUvYmFnYXMvcmVwby9i
dWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluOi9ob21lL2JhZ2FzL3JlcG8vYnVpbGRyb290L291dHB1
dC9ob3N0L3NiaW46L2hvbWUvYmFnYXMvLmxvY2FsL2JpbjovaG9tZS9iYWdhcy9nby9iaW46L2hv
bWUvYmFnYXMvLmxvY2FsL2JpbjovaG9tZS9iYWdhcy8uY2FyZ28vYmluOi9ob21lL2JhZ2FzLy5u
dm0vdmVyc2lvbnMvbm9kZS92MjIuMTkuMC9iaW46L2hvbWUvYmFnYXMvZ28vYmluOi91c3IvbG9j
YWwvYmluOi91c3IvYmluOi91c3IvbG9jYWwvc2JpbjovdXNyL2Jpbi9zaXRlX3Blcmw6L3Vzci9i
aW4vdmVuZG9yX3Blcmw6L3Vzci9iaW4vY29yZV9wZXJsIiAvaG9tZS9iYWdhcy9yZXBvL2J1aWxk
cm9vdC9zdXBwb3J0L3NjcmlwdHMvbWt1c2VycyAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9v
dXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL2Z1bGxfdXNlcnNfdGFibGUudHh0IC9ob21lL2JhZ2Fz
L3JlcG8vYnVpbGRyb290L291dHB1dC9idWlsZC9idWlsZHJvb3QtZnMvdGFyL3RhcmdldCA+PiAv
aG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL3Rhci9m
YWtlcm9vdAo+IGVjaG8gIi9ob21lL2JhZ2FzL3JlcG8vYnVpbGRyb290L291dHB1dC9ob3N0L2Jp
bi9tYWtlZGV2cyAtZCAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVp
bGRyb290LWZzL2Z1bGxfZGV2aWNlc190YWJsZS50eHQgL2hvbWUvYmFnYXMvcmVwby9idWlsZHJv
b3Qvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1mcy90YXIvdGFyZ2V0IiA+PiAvaG9tZS9iYWdhcy9y
ZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL3Rhci9mYWtlcm9vdAo+IHBy
aW50ZiAnICAgCXJtIC1yZiAvaG9tZS9iYWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQv
YnVpbGRyb290LWZzL3Rhci90YXJnZXQvdXNyL2xpYi91ZGV2L2h3ZGIuZC8gL2hvbWUvYmFnYXMv
cmVwby9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1mcy90YXIvdGFyZ2V0L2V0Yy91
ZGV2L2h3ZGIuZC9cbicgPj4gL2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2J1aWxk
L2J1aWxkcm9vdC1mcy90YXIvZmFrZXJvb3QKPiBlY2hvICJmaW5kIC9ob21lL2JhZ2FzL3JlcG8v
YnVpbGRyb290L291dHB1dC9idWlsZC9idWlsZHJvb3QtZnMvdGFyL3RhcmdldC9ydW4vIC1taW5k
ZXB0aCAxIC1wcnVuZSAtcHJpbnQwIHwgeGFyZ3MgLTByIHJtIC1yZiAtLSIgPj4gL2hvbWUvYmFn
YXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1mcy90YXIvZmFrZXJvb3QK
PiBlY2hvICJmaW5kIC9ob21lL2JhZ2FzL3JlcG8vYnVpbGRyb290L291dHB1dC9idWlsZC9idWls
ZHJvb3QtZnMvdGFyL3RhcmdldC90bXAvIC1taW5kZXB0aCAxIC1wcnVuZSAtcHJpbnQwIHwgeGFy
Z3MgLTByIHJtIC1yZiAtLSIgPj4gL2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2J1
aWxkL2J1aWxkcm9vdC1mcy90YXIvZmFrZXJvb3QKPiBwcmludGYgJyAgIFxuJyA+PiAvaG9tZS9i
YWdhcy9yZXBvL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvYnVpbGRyb290LWZzL3Rhci9mYWtlcm9v
dAo+IHByaW50ZiAnICAgXG4nID4+IC9ob21lL2JhZ2FzL3JlcG8vYnVpbGRyb290L291dHB1dC9i
dWlsZC9idWlsZHJvb3QtZnMvdGFyL2Zha2Vyb290Cj4gcHJpbnRmICcgICAJKGNkIC9ob21lL2Jh
Z2FzL3JlcG8vYnVpbGRyb290L291dHB1dC9idWlsZC9idWlsZHJvb3QtZnMvdGFyL3RhcmdldDsg
ZmluZCAtcHJpbnQwIHwgTENfQUxMPUMgc29ydCAteiB8IHRhciAgLS1wYXgtb3B0aW9uPWV4dGhk
ci5uYW1lPSUlZC9QYXhIZWFkZXJzLyUlZixhdGltZTo9MCxjdGltZTo9MCAtY2YgL2hvbWUvYmFn
YXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2ltYWdlcy9yb290ZnMudGFyIC0tbnVsbCAtLXhhdHRy
cy1pbmNsdWRlPSdcJycqJ1wnJyAtLW5vLXJlY3Vyc2lvbiAtVCAtIC0tbnVtZXJpYy1vd25lcilc
bicgPj4gL2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1m
cy90YXIvZmFrZXJvb3QKPiBjaG1vZCBhK3ggL2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0
cHV0L2J1aWxkL2J1aWxkcm9vdC1mcy90YXIvZmFrZXJvb3QKPiBQQVRIPSIvaG9tZS9iYWdhcy9y
ZXBvL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW46L2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qv
b3V0cHV0L2hvc3Qvc2JpbjovaG9tZS9iYWdhcy8ubG9jYWwvYmluOi9ob21lL2JhZ2FzL2dvL2Jp
bjovaG9tZS9iYWdhcy8ubG9jYWwvYmluOi9ob21lL2JhZ2FzLy5jYXJnby9iaW46L2hvbWUvYmFn
YXMvLm52bS92ZXJzaW9ucy9ub2RlL3YyMi4xOS4wL2JpbjovaG9tZS9iYWdhcy9nby9iaW46L3Vz
ci9sb2NhbC9iaW46L3Vzci9iaW46L3Vzci9sb2NhbC9zYmluOi91c3IvYmluL3NpdGVfcGVybDov
dXNyL2Jpbi92ZW5kb3JfcGVybDovdXNyL2Jpbi9jb3JlX3BlcmwiIEZBS0VST09URE9OVFRSWUNI
T1dOPTEgL2hvbWUvYmFnYXMvcmVwby9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL2Zha2Vyb290
IC0tIC9ob21lL2JhZ2FzL3JlcG8vYnVpbGRyb290L291dHB1dC9idWlsZC9idWlsZHJvb3QtZnMv
dGFyL2Zha2Vyb290Cj4gL2Jpbi9zaDogc3ltYm9sIGxvb2t1cCBlcnJvcjogL2hvbWUvYmFnYXMv
cmVwby9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvbGliL2xpYnJlYWRsaW5lLnNvLjg6IHVuZGVmaW5l
ZCBzeW1ib2w6IFVQCj4gbWFrZTogKioqIFtmcy90YXIvdGFyLm1rOjM4OiAvaG9tZS9iYWdhcy9y
ZXBvL2J1aWxkcm9vdC9vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy50YXJdIEVycm9yIDEyNwoKVGhpcyBp
cyBub3QgdGhlICJzZGsgcm9vdGZzIHRhcmJhbGwgZ2VuZXJhdGlvbiIsIGp1c3QgdGhlICJyb290
ZnMKdGFyYmFsbCBnZW5lcmF0aW9uIi4gU0RLIGFuZCByb290ZnMgZ2VuZXJhdGlvbiBhcmUgdHdv
IHNlcGFyYXRlIHRoaW5ncy4KCkhvd2V2ZXIsIHdoYXQgZXhhY3RseSBpcyB1c2luZyBsaWJyZWFk
bGluZSBoZXJlPyBJcyBpdCBmYWtlcm9vdD8KU29tZXRoaW5nIGVsc2U/CgpXZSBuZWVkIGEgYml0
IG1vcmUgY29udmluY2luZyBleHBsYW5hdGlvbiB0aGFuICJhZGRpbmcgdGhvc2UgbGluZXMgaW4K
cmVhZGxpbmUubWsgZml4ZWQgdGhlIHByb2JsZW0gZm9yIG1lIi4KCldoaWNoIHRvb2wgaXMgbGlu
a2VkIHdpdGggcmVhZGxpbmU/IElzIGl0IHdvcmtpbmcgYXQgbGluayB0aW1lIGJlY2F1c2UKaG9z
dC1yZWFkbGluZSBpcyBub3QgYWxyZWFkeSBidWlsdCwgdGhlbiBsYXRlciBvbiwgc29tZSBvdGhl
ciBwYWNrYWdlCmJ1aWxkcy9pbnN0YWxscyBob3N0LXJlYWRsaW5lLCBhbmQgdGhlIHRvb2wgZW5k
cyB1cCB1c2luZyBvdXIKaG9zdC1yZWFkbGluZSBpbnN0ZWFkIG9mIHRoZSBzeXN0ZW0tcHJvdmlk
ZWQgcmVhZGxpbmU/CgpUaGlzIGRlZmluaXRlbHkgbmVlZCBtb3JlIGludmVzdGlnYXRpb24vZXhw
bGFuYXRpb24gYmVmb3JlIHdlIGNhbiBhcHBseQp0aGUgcGF0Y2guCgpUaGFua3MhCgpUaG9tYXMK
LS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQg
TGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
