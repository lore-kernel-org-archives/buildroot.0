Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626BBC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 20:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D4BF81285;
	Tue,  7 May 2024 20:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mirl3t33vghl; Tue,  7 May 2024 20:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F32181298
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F32181298;
	Tue,  7 May 2024 20:10:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 911591BF281
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 883DE81285
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22v4V9Kl0Rsb for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 20:10:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5339D81298
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5339D81298
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5339D81298
 for <buildroot@buildroot.org>; Tue,  7 May 2024 20:10:40 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-61b2218ab6fso28097677b3.1
 for <buildroot@buildroot.org>; Tue, 07 May 2024 13:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715112639; x=1715717439;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZZoWrO2D2F3URY1Y5j97aBEsN+jU5/1yBFzdxTQhaQ=;
 b=GI2Pq7OQaGMRcM8dSo5O4JrP1IHjZ/TRaj/nGm0phLQjKlxZYbBNkCm/yk6xafTfL9
 Z5aFA1I+xkpnsUkwr2wDA8UQKoVyVdaS2kMZvvDxTssaLguHt0Hysm1tZCsIvVbEaU9r
 CrJ3wyKFq1JUnajA6me6OIQ1wuk76I8hpRRYi82/PexsDH1Lzr0po46t6Tyz2AdwwrCR
 iQKbn7ralATNxTIDiV9B80lANHkho7mnnIzQ7RgWDXBz1TdcG4s/GA5uJuSGZclg2DgE
 nwTAhIVUen8iP0tINOBHzx8TUOjPPdi21zUXR4Z6mVPMWVjwwPWVa/ZxxAasOJF5i0ee
 g/Qw==
X-Gm-Message-State: AOJu0YxKzC6jKwVjGnmZduDPN8H7P1AJeu0l6q10betKyKx7qKMw+IAe
 cuy1opxdjbt+qHO80f4jpetw9oHIUheaTM7WlovDmUKmhivhOQ/8aOtZkrLhilhgPXtR1QEGkD/
 ybn8A/gRP7oXEQ66pq5QnLHLvh7UTU+uqWzviiw==
X-Google-Smtp-Source: AGHT+IFJep4+S1v443aGT2+cMZhpTbNgCjZrxJDfDs7uh+FkkhviJvfV6GJareomXT+dg6ZQdBnzSNj/MG9uYQOnjJI=
X-Received: by 2002:a81:8316:0:b0:61b:3346:a8ab with SMTP id
 00721157ae682-62085a332a8mr10388337b3.4.1715112639149; Tue, 07 May 2024
 13:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240414130520.3647875-1-dario.binacchi@amarulasolutions.com>
 <87msp1wqqo.fsf@dell.be.48ers.dk>
 <CABGWkvq4K64XFUdck+v171DMad+QGzufq_TEWwv51NjE5hrhNg@mail.gmail.com>
 <871q6dwgvw.fsf@dell.be.48ers.dk>
In-Reply-To: <871q6dwgvw.fsf@dell.be.48ers.dk>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 7 May 2024 22:10:28 +0200
Message-ID: <CABGWkvrNG00oAH0mL7Qb5BoQ3WpCtbK=ywmJAMNPtJ+msvieHA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1715112639; x=1715717439;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZZoWrO2D2F3URY1Y5j97aBEsN+jU5/1yBFzdxTQhaQ=;
 b=kODifzZ3ih0ph8+UDoSrdaFt9tuIVMJW5wGowQ3DjmPWqB+e7h9qLZ9jUZeJSgKkpU
 uJ8xTlMUXQx5Fns4Pzk2dVNTaSmh69egw6PGyvgwlbxdUwJjzW3vRheoJbrpI7Pg/5h4
 bL1xBtJu3TzHU2tGy2Re1MM5AYEFPJC895/QI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=kODifzZ3
Subject: Re: [Buildroot] [PATCH v2 1/3] package/bmap-tools: update GitHub URL
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
Cc: linux-amarula@amarulasolutions.com,
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBUdWUsIE1heSA3LCAyMDI0IGF0IDk6MznigK9QTSBQZXRlciBLb3JzZ2Fh
cmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+Cj4gPj4+Pj4gIkRhcmlvIiA9PSBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyaXRlczoK
Pgo+IEhpLAo+Cj4gID4gSSBzZWUgeW91ciBlcnJvciBtZXNzYWdlLCBidXQgYWxzbwo+ICA+ICdi
bWFwLXRvb2xzLTMuNi50YXIuZ3o6IE9LIChzaGEyNTY6Cj4gID4gMDY1OGFmYjk3MmU3MjIxYWEx
NmZlY2UzZjg0ZTI5ZTUxMDJlOTAxYzkyOTI1M2Q3ZmI2MDQwYmRlMjgyNDNmNykiCj4gID4gYW5k
IHRoZSBjb21waWxhdGlvbiBwcm9jZXNzIGRvZXMgbm90IHN0b3AuCj4KPiBXaGljaCBpcyBiZWNh
dXNlIGl0IGZhbGxzIGJhY2sgdG8gZmV0Y2ggdGhlIChvbGQpIHRhcmJhbGwgY29weSBvbgo+IHNv
dXJjZXMuYnVpbGRyb290Lm9yZy4KPgo+Cj4gID4gSXMgaXQgZXhhY3RseSB0aGUgc2FtZSBpc3N1
ZSB5b3UncmUgZXhwZXJpZW5jaW5nLCBvciBpcyBpdCBzb21ldGhpbmcKPiAgPiBkaWZmZXJlbnQ/
IERvZXMgeW91ciBjb21waWxhdGlvbiBwcm9jZXNzIGhhbHQgd2l0aCB0aGUgZXJyb3I/Cj4KPiBZ
ZXMsIGV4YWN0bHkgdGhlIHNhbWUuIFRoZSBuZXcgbG9jYXRpb24gZG9lcyBub3QgcHJvdmlkZSB0
aGUgc2FtZQo+IHRhcmJhbGwgY29udGVudCwgc28gdGhlIHRhcmJhbGwgaXMgcmVqZWN0ZWQgYW5k
IGl0IGZhbGxzIGJhY2sgdG8gdGhlIG9sZAo+IGNvcHkgd2UgaGF2ZSBvbiBzb3VyY2VzLmJ1aWxk
cm9vdC5vcmcuCgpJJ20gc29ycnksIGJ1dCBJIGRpZG4ndCBub3RpY2UgaXQgd2hlbiBJIHRlc3Rl
ZCBpdDoKU286Cmh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9ibWFwLXRvb2xzIC0+CjA2NThhZmI5
NzJlNzIyMWFhMTZmZWNlM2Y4NGUyOWU1MTAyZTkwMWM5MjkyNTNkN2ZiNjA0MGJkZTI4MjQzZjcK
Ym1hcC10b29scy0zLjYudGFyLmd6Cmh0dHBzOi8vZ2l0aHViLmNvbS95b2N0b3Byb2plY3QvYm1h
cHRvb2wgLT4KN2EyZTEzMDViZjdlMDZiYzRhNTgwY2M3MTlmMGZhY2Y5ZDk5YWY4ZDQxNjU5YjU3
YzBhY2FlNGFkOTNmZjQ1YQpibWFwdG9vbC0zLjYudGFyLmd6IC0+IGJtYXAtdG9vbHMtMy42LnRh
ci5negoKU28gdGhlIGNvbW1pdCA0NzAyN2ZlZmE0YTBjICgicGFja2FnZS9ibWFwLXRvb2xzOiB1
cGRhdGUgR2l0SHViIFVSTCIpCndhcyBhbHNvIHN1cHBvc2VkIHRvIGNoYW5nZSB0aGUgaGFzaCB2
YWx1ZSB0bwo3YTJlMTMwNWJmN2UwNmJjNGE1ODBjYzcxOWYwZmFjZjlkOTlhZjhkNDE2NTliNTdj
MGFjYWU0YWQ5M2ZmNDVhLgoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYm1hcC10b29scy9ibWFwLXRv
b2xzLmhhc2gKYi9wYWNrYWdlL2JtYXAtdG9vbHMvYm1hcC10b29scy5oYXNoCmluZGV4IDgyYTU3
MGVjYWNkYi4uMDVhODE0ZGZmMmJjIDEwMDY0NAotLS0gYS9wYWNrYWdlL2JtYXAtdG9vbHMvYm1h
cC10b29scy5oYXNoCisrKyBiL3BhY2thZ2UvYm1hcC10b29scy9ibWFwLXRvb2xzLmhhc2gKQEAg
LTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICAwNjU4YWZiOTcyZTcy
MjFhYTE2ZmVjZTNmODRlMjllNTEwMmU5MDFjOTI5MjUzZDdmYjYwNDBiZGUyODI0M2Y3CiBibWFw
LXRvb2xzLTMuNi50YXIuZ3oKK3NoYTI1NiAgN2EyZTEzMDViZjdlMDZiYzRhNTgwY2M3MTlmMGZh
Y2Y5ZDk5YWY4ZDQxNjU5YjU3YzBhY2FlNGFkOTNmZjQ1YQogYm1hcC10b29scy0zLjYudGFyLmd6
CiBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4
YTQwNDAxMDUyMWI4ODA2NDMKIENPUFlJTkcKCnJtIC1yZiAgb3V0cHV0L2J1aWxkL2hvc3QtYm1h
cC10b29scy0zLjYvCnJtIC1yZiBkbC9ibWFwLXRvb2xzCm1ha2UgaG9zdC1ibWFwLXRvb2xzCgo+
Pj4gaG9zdC1ibWFwLXRvb2xzIDMuNiBEb3dubG9hZGluZwp3Z2V0IC0tcGFzc2l2ZS1mdHAgLW5k
IC10IDMgLU8KJy9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvLmJt
YXAtdG9vbHMtMy42LnRhci5nei5OUmNOSngvb3V0cHV0JwonaHR0cHM6Ly9naXRodWIuY29tL3lv
Y3RvcHJvamVjdC9ibWFwdG9vbC9hcmNoaXZlL3YzLjYvYm1hcC10b29scy0zLjYudGFyLmd6Jwot
LTIwMjQtMDUtMDcgMjI6MDQ6MDItLQpodHRwczovL2dpdGh1Yi5jb20veW9jdG9wcm9qZWN0L2Jt
YXB0b29sL2FyY2hpdmUvdjMuNi9ibWFwLXRvb2xzLTMuNi50YXIuZ3oKd2dldDogL2hvbWUvZGFy
aW8vLm5ldHJjOjE6IHVua25vd24gdG9rZW4gIlRwdHRrbDk5MSEiClJlc29sdmluZyBnaXRodWIu
Y29tIChnaXRodWIuY29tKS4uLiAxNDAuODIuMTIxLjQKQ29ubmVjdGluZyB0byBnaXRodWIuY29t
IChnaXRodWIuY29tKXwxNDAuODIuMTIxLjR8OjQ0My4uLiBjb25uZWN0ZWQuCkhUVFAgcmVxdWVz
dCBzZW50LCBhd2FpdGluZyByZXNwb25zZS4uLiAzMDIgRm91bmQKTG9jYXRpb246IGh0dHBzOi8v
Y29kZWxvYWQuZ2l0aHViLmNvbS95b2N0b3Byb2plY3QvYm1hcHRvb2wvdGFyLmd6L3JlZnMvdGFn
cy92My42Cltmb2xsb3dpbmddCi0tMjAyNC0wNS0wNyAyMjowNDowMy0tCmh0dHBzOi8vY29kZWxv
YWQuZ2l0aHViLmNvbS95b2N0b3Byb2plY3QvYm1hcHRvb2wvdGFyLmd6L3JlZnMvdGFncy92My42
ClJlc29sdmluZyBjb2RlbG9hZC5naXRodWIuY29tIChjb2RlbG9hZC5naXRodWIuY29tKS4uLiAx
NDAuODIuMTIxLjEwCkNvbm5lY3RpbmcgdG8gY29kZWxvYWQuZ2l0aHViLmNvbQooY29kZWxvYWQu
Z2l0aHViLmNvbSl8MTQwLjgyLjEyMS4xMHw6NDQzLi4uIGNvbm5lY3RlZC4KSFRUUCByZXF1ZXN0
IHNlbnQsIGF3YWl0aW5nIHJlc3BvbnNlLi4uIDIwMCBPSwpMZW5ndGg6IHVuc3BlY2lmaWVkIFth
cHBsaWNhdGlvbi94LWd6aXBdClNhdmluZyB0bzog4oCYL2hvbWUvZGFyaW8vcHJvamVjdHMvYnVp
bGRyb290L291dHB1dC9idWlsZC8uYm1hcC10b29scy0zLjYudGFyLmd6Lk5SY05KeC9vdXRwdXTi
gJkKCi9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxkcm9vdC9vdXRwdXQvYnVpICAgICBbICA8PT4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXSAgOTUsNTJLCiA0MjNLQi9zICAgIGluIDAsMnMKCjIwMjQtMDUtMDcgMjI6MDQ6MDMgKDQy
MyBLQi9zKSAtCuKAmC9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQv
LmJtYXAtdG9vbHMtMy42LnRhci5nei5OUmNOSngvb3V0cHV04oCZCnNhdmVkIFs5NzgxMl0KCmJt
YXAtdG9vbHMtMy42LnRhci5nejogT0sgKHNoYTI1NjoKN2EyZTEzMDViZjdlMDZiYzRhNTgwY2M3
MTlmMGZhY2Y5ZDk5YWY4ZDQxNjU5YjU3YzBhY2FlNGFkOTNmZjQ1YSkKCgpTaW5jZSB0aGlzIHBh
dGNoIGlzIHRoZSBmaXJzdCBpbiBhIHNlcmllcyBvZiAzLCB3aGVyZSB0aGUgZmluYWwgcGF0Y2gK
YnVtcHMgdGhlIHZlcnNpb24gdG8gMy44LjAsIHdoYXQgYXJlIHlvdXIKdGhvdWdodHMgb24gdGhl
IDIwMjQuMDIueCB2ZXJzaW9uPwpJcyB0aGVyZSBhbnl0aGluZyBJIG5lZWQgdG8gZG8/CgpUaGFu
a3MgYW5kIHJlZ2FyZHMsCkRhcmlvCgo+Cj4gLS0KPiBCeWUsIFBldGVyIEtvcnNnYWFyZAoKCgot
LSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJp
by5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAz
MTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVs
YXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
