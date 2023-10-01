Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39981E748F3
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 04:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3C5781E6C;
	Sun,  1 Oct 2023 04:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3C5781E6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9w2yN-r-55yR; Sun,  1 Oct 2023 04:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2FC281E4E;
	Sun,  1 Oct 2023 04:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2FC281E4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C148A1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 04:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A79D681E4E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 04:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A79D681E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jrlf-WeBS5Xe for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 04:05:40 +0000 (UTC)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44E8E81E36
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 04:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E8E81E36
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-4197fa36b6aso11880581cf.3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 21:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696133139; x=1696737939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FzG93EKKOYp2sH+CKc2A92f2Lx/F2sloWkAarA8J5K8=;
 b=X+oLn0lgIVP44Fu/0pr+HRWcxcpn3wq6wN4c7uMQ4jn5cjT9qYZxWiYXqPk+XUh4iE
 b6BnU2W11B5IUxfBODixAZ7IL2NcX6ELSJcY1beji5Y6RquVGN0pxFnOz1omRGbEij/d
 u9dvQFQI62o/RedyYQaMwhtvggG2R7Lm2Q0uUqRObLEO+pSEcaSFMB1I7pYSa2I3tBZa
 K6eRswarhRAqCjpa7jf4RjYI7CJCAKY+Obuw5w8la9UC/NRTIXyU6OznMK0fp4eImIho
 kJAkpUgM6sloT9x+E4KXs6LecXG6gSKuYzUBxgKE1aXGaXDlvP1D5VCeoJD4MwjO91zC
 ROFg==
X-Gm-Message-State: AOJu0Yx3Ryuming5ebBRHV1ZYVVrdaaclZfgCk5HbneQ5eX66d84/GsZ
 DnPPmJsdNjYRiE4FCgcDVfqG7DbRWjc9cpJLrEM=
X-Google-Smtp-Source: AGHT+IGUf5k+q2kbFRlbVQyq4Q+EOjOTtyjk1WE4KdWz3yzIbnHaYi1Td7Wdi7SlMzE2W0fNNL5b4Dtd5bvKVgbDSCk=
X-Received: by 2002:ac8:4e46:0:b0:419:544d:5886 with SMTP id
 e6-20020ac84e46000000b00419544d5886mr9105060qtw.19.1696133138813; Sat, 30 Sep
 2023 21:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230930221727.1458825-1-arnout@mind.be>
In-Reply-To: <20230930221727.1458825-1-arnout@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 30 Sep 2023 22:05:27 -0600
Message-ID: <CADvTj4qkFQXKXQp_brP2RJ-0KZCMd6U44xEuPY6pYLRtpaOFrA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696133139; x=1696737939; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FzG93EKKOYp2sH+CKc2A92f2Lx/F2sloWkAarA8J5K8=;
 b=ghqCPoL5Z5PgzbmvihucJgfFX+SWLwXnyF4P/zv839QAM4wcFmGxvBKkGRmHc0WCCz
 cdjH2mJlHAo/hUHLotMNKyw8ReHNC8/FlyLzSYJCQgB2fnUNSwgNKBmUQfjRU22E0qup
 R8qUaw4z7jQGLctROGyBpdvs7dqQNjXboByZDF71ghx5IICTPISa+TaByJeBlQVPwOqh
 AFVZVQfuPn5/X9ct4k4aStx+lgi3Ka7IPjOZVZsGpNKygHLvq2qXxg+A9KyY5Ji3kpVW
 FWzZGMCGXqYNAOauvgt7YMc6Qsk3yXcdkv0eNF65ZOfOlK0uHVtDpQFniTb4Bvsh8MBk
 rliw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ghqCPoL5
Subject: Re: [Buildroot] package/pkg-python.mk: refactor setup-type variables
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
Cc: "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgNDoxN+KAr1BNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxh
cm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPiBNb3N0IG9mIHRoZSBweXRob24tcGFja2FnZSBpbmZy
YXN0cnVjdHVyZSBjb25zaXN0cyBvZiBhIGJpZyBjb25kaXRpb25hbAo+IHRyZWUgdGhhdCBzZXRz
IHZhcmlvdXMgdmFyaWFibGVzIGJhc2VkIG9uIHRoZSBwYWNrYWdlJ3Mgc2V0dXAgdHlwZS4KPiBJ
bml0aWFsbHksIHRoaXMgd2FzIHF1aXRlIE9LLCBidXQgc2luY2Ugd2UgaGF2ZSA3IGRpZmZlcmVu
dCBzZXR1cCB0eXBlcwo+IG5vdywgc29tZSBvZiB3aGljaCBzaGFyZSBzb21lIHZhcmlhYmxlcyB3
aXRoIG90aGVycywgaXQncyBiZWNvbWluZyBxdWl0ZQo+IGNvbXBsaWNhdGVkIGFuZCBoYXJkIHRv
IHJlYWQuCgpJdCBtaWdodCBiZSBhIGdvb2QgaWRlYSB0byBhcHBseSBteSBzZXR1cHRvb2xzIHBl
cDUxNyBwYXRjaCBmaXJzdCB3aGljaApzaW1wbGlmaWVzIHRoaW5ncyBhIGJpdCBieSBsYXJnZWx5
IGNvbWJpbmluZyB0aGUgc2V0dXB0b29scyBzZXR1cCB0eXBlIHdpdGgKcGVwNTE3IGJ1aWxkcy4K
Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAy
MzA5MzAxNTI1MTcuMTA3NzU3Ni0zLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCgpXZSBjYW4g
cHJvYmFibHkgZHJvcCBkaXN0dXRpbHMgc2V0dXAgdHlwZSBhcyB3ZWxsIGFzIHdlIHNob3VsZCBi
ZSBhYmxlIHRvCmluc3RlYWQganVzdCB1c2Ugc2V0dXB0b29scyBmb3IgYW55IHBhY2thZ2VzIHVz
aW5nIHRoYXQuCgo+Cj4gVGhpcyBwYXRjaCBzZXJpZXMgcmVmYWN0b3JzIGl0IHNvIHRoYXQgdGhl
IGlubmVyLXB5dGhvbi1wYWNrYWdlIGRvZXNuJ3QKPiBkaXNwYXRjaCB0aGUgc2V0dXAgdHlwZSB0
aHJvdWdoIGEgY29uZGl0aW9uYWwgdHJlZSwgYnV0IGluc3RlYWQgZG9lcyBpdAo+IHdpdGggdmFy
aWFibGUgaW5kaXJlY3Rpb24sIGkuZS4gYnkgdXNpbmcgdmFyaWFibGVzIGxpa2UKPiAgJChQS0df
UFlUSE9OXyQoJChQS0cpX1NFVFVQX1RZUEVfVVBQRVIpX0VOVikKPgo+IFRoZSByaXN0IHR3byBw
YXRjaGVzIGFyZSBzaW1wbGUgY2xlYW51cHMsIHJlbW92aW5nIHZhcmlhYmxlcyB0aGF0IGFyZQo+
IG5vdCByZWFsbHkgbmVlZGVkLgo+Cj4gVGhlIHRoaXJkIHBhdGNoIGlzIGEgcHJlcGFyYXRvcnkg
b25lIHRoYXQgc3BsaXRzIHRoZSBidWlsZCBjb21tYW5kcyBmb3IKPiB0YXJnZXQgYW5kIGhvc3Qg
YnVpbGRzLiBUaGlzIGlzIG5lY2Vzc2FyeSBiZWNhdXNlIHdlIG5lZWQgdG8gdXNlCj4gZGlmZmVy
ZW50IHZhcmlhYmxlcyBmb3IgdGhlIHR3bywgaS5lLiBIT1NUX1BLR19QWVRIT05fKiBmb3IgaG9z
dCBidWlsZC4KPgo+IFRoZSBmb3VydGggYW5kIGZpZnRoIHBhdGNoIGVhY2ggcmVwbGFjZSBvbmUg
dmFyaWFibGUgZnJvbSB0aGUKPiBjb25kaXRpb25hbCB0cmVlIHdpdGggYW4gaW5kaXJlY3RseSBh
ZGRyZXNzZWQgb25lLgo+Cj4gVGhlIGZvbGxvd2luZyB0aHJlZSBwYXRjaGVzIGFyZSBuZWVkZWQg
YmVjYXVzZSB0aGUgbmludGggcGF0Y2ggcmVtb3Zlcwo+IHRoZSBQS0dfUFlUSE9OXypfT1BUUyB2
YXJpYWJsZXMsIHdoaWNoIHdlcmUgdXNlZCBpbiAzIHBhY2thZ2VzLiBJdCBpcyBpbgo+IGZhY3Qg
bm90IHN0cmljdGx5IG5lZWRlZCB0byByZW1vdmUgdGhvc2UgdmFyaWFibGVzLCBidXQgSU1ITyB0
aGV5IGRvbid0Cj4gYWRkIHN1ZmZpY2llbnQgdmFsdWUgdG8ga2VlcCB0aGVtLiBJIHRoaW5rIGl0
J3MgYmV0dGVyIHRvIGhhbmRsZSB0aGUgZmV3Cj4gc3BlY2lhbCBjYXNlcyBleHBsaWNpdGx5Lgo+
Cj4gVGhlIG5pbnRoIHBhdGNoIHJlcGxhY2VzIHRoZSByZW1haW5pbmcgdmFyaWFibGVzIGZyb20g
dGhlIGNvbmRpdGlvbmFsCj4gdHJlZSB3aXRoIGluZGlyZWN0bHkgYWRkcmVzc2VkIG9uZXMuIFRo
ZSBjb25kaXRpb25hbCB0cmVlIGlzIG5vdyBlbXB0eSwKPiBhbmQgdGhlIGVycm9yIGhhbmRsaW5n
IHRoYXQgd2FzIGluIHRoZXJlIGlzIG1hZGUgbW9yZSBleHBsaWNpdC4KPgo+IFRoZSB0ZW50aCBw
YXRjaCBlZGl0cyB0aGUgZG9jdW1lbnRhdGlvbiB0byByZW1vdmUgdGhlIHJlZmVyZW5jZXMgdG8g
dGhlCj4gUEtHX1BZVEhPTl8qX09QVFMgdmFyaWFibGVzIHRoYXQgd2VyZSByZW1vdmVkIGluIHRo
ZSBwcmV2aW91cyBwYXRjaC4KPgo+IFRoaXMgc2VyaWVzIGFkZHMgbGluZXMgcmF0aGVyIHRoYW4g
cmVtb3ZpbmcgbGluZXMuIFRoYXQgaXMgYmVjYXVzZQo+IHRoaW5ncyBhcmUgbWFkZSBtb3JlIGV4
cGxpY2l0LCBpbnRyb2R1Y2luZyBwZXItc2V0dXAtdHlwZSB2YXJpYWJsZXMKPiB3aGVyZSBwcmV2
aW91c2x5IHNldmVyYWwgc2V0dXAgdHlwZXMgd2VyZSAocGFydGlhbGx5KSByZXVzaW5nIHRoZSBw
ZXA1MTcKPiB2YXJpYWJsZXMuIFRoZXJlIGFyZSBhbHNvIHNvbWUgYWRkaXRpb25hbCBsaW5lcyBi
ZWNhdXNlIG9mIG1vcmUgbGluZQo+IHNwbGl0dGluZy4KPgo+IFRvIHRlc3QgdGhpcyBzZXJpZXMs
IEkgYnVpbHQgYWxsIHRoZSBweXRob24gcGFja2FnZXMgd2l0aCBvbmUgc3BlY2lmaWMKPiB0b29s
Y2hhaW4gY29uZmlndXJhdGlvbiwgYW5kIEkgcmFuIGFsbCBydW50aW1lIHRlc3RzIGZvciBweXRo
b24gcGFja2FnZXMuCj4gT25lIHBhY2thZ2UgZmFpbGVkIHRvIGJ1aWxkOiBob3N0LXB5dGhvbi1z
aXAuIEl0IGFsc28gZmFpbHMgb24gbWFzdGVyLgo+IEZvciB0aGUgcnVudGltZSB0ZXN0cywgMTQg
b2YgdGhlbSBmYWlsZWQsIGFsbCBvZiB0aGVtIGFsc28gZmFpbCBvbgo+IG1hc3Rlci4KPgo+Cj4g
VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3OTA2MjcyYzM5NzQ0ZTI2ZWQ3MzAy
ODcyNTc4N2FhM2E0NDQxYzU0Ogo+Cj4gICBwYWNrYWdlL3B5dGhvbi1ydG9tbDogbWlncmF0ZSB0
byBzZXR1cHRvb2xzLXJ1c3QgaW5mcmFzdHJ1Y3R1cmUgKDIwMjMtMDktMjkgMjI6MDI6MzEgKzAy
MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgZ2l0
QGdpdGxhYi5jb206YXJub3V0L2J1aWxkcm9vdC5naXQgcGtnLXB5dGhvbi1yZWZhY3Rvci12YXJp
YWJsZXMKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA4OWIzM2UwMDRmYzEzZTIy
YTljMGJkY2FmY2VlMjQ1YTk3ZDJkZDUxOgo+Cj4gICBkb2NzL21hbnVhbDogcmVtb3ZlIHJlZmVy
ZW5jZXMgdG8gUEtHX1BZVEhPTl8qX09QVFMgKDIwMjMtMDktMzAgMTU6MTg6NDggKzAyMDApCj4K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKSAoMTApOgo+
ICAgICAgIHBhY2thZ2UvcGtnLXB5dGhvbi5tazogcmVtb3ZlICQoMilfUFlUSE9OX0lOVEVSUFJF
VEVSIHZhcmlhYmxlCj4gICAgICAgcGFja2FnZS9wa2ctcHl0aG9uLm1rOiByZW1vdmUgX0JBU0Vf
QlVJTERfT1BUUyB2YXJpYWJsZQo+ICAgICAgIHBhY2thZ2UvcGtnLXB5dGhvbi5tazogc3BsaXQg
dGhlIGNvbW1hbmRzIGluIGEgdGFyZ2V0IGFuZCBob3N0IHNlY3Rpb24KPiAgICAgICBwYWNrYWdl
L3BrZy1weXRob24ubWs6IHJlcGxhY2UgJChfQkFTRV9FTlYpIHdpdGggJCgkKFNFVFVQX1RZUEUp
X0VOVikKPiAgICAgICBwYWNrYWdlL3BrZy1weXRob24ubWs6IHJlcGxhY2UgJChfQkFTRV9CVUlM
RF9DTUQpIHdpdGggJCgkKFNFVFVQX1RZUEUpX0JVSUxEX0NNRCkKPiAgICAgICBwYWNrYWdlL3B5
dGhvbi1mbGl0LWNvcmU6IGluc3RhbnRpYXRlIF9JTlNUQUxMX0NNRFMKPiAgICAgICBwYWNrYWdl
L2phaWxob3VzZTogZXhwYW5kIFBLR19QWVRIT05fU0VUVVBUT09MU19JTlNUQUxMX1RBUkdFVF9P
UFRTCj4gICAgICAgcGFja2FnZS9pMmMtdG9vbHM6IGV4cGFuZCBQS0dfUFlUSE9OX1NFVFVQVE9P
TFNfSU5TVEFMTF9UQVJHRVRfT1BUUwo+ICAgICAgIHBhY2thZ2UvcGtnLXB5dGhvbi5tazogcmVw
bGFjZSAkKF9CQVNFX0lOU1RBTEwqX0NNRCkgd2l0aCAkKCQoU0VUVVBfVFlQRSlfSU5TVEFMTCpf
Q01EKQo+ICAgICAgIGRvY3MvbWFudWFsOiByZW1vdmUgcmVmZXJlbmNlcyB0byBQS0dfUFlUSE9O
XypfT1BUUwo+Cj4gIGRvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1weXRob24udHh0ICAgICAg
IHwgIDE0ICstLS0tLS0tCj4gIHBhY2thZ2UvaTJjLXRvb2xzL2kyYy10b29scy5tayAgICAgICAg
ICAgICAgIHwgICA2ICsrLS0KPiAgcGFja2FnZS9qYWlsaG91c2UvamFpbGhvdXNlLm1rICAgICAg
ICAgICAgICAgfCAgIDcgKysrLQo+ICBwYWNrYWdlL3BrZy1weXRob24ubWsgICAgICAgICAgICAg
ICAgICAgICAgICB8IDI1NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHBhY2thZ2UvcHl0aG9uLWZsaXQt
Y29yZS9weXRob24tZmxpdC1jb3JlLm1rIHwgICA5ICsrKy0tCj4gIDUgZmlsZXMgY2hhbmdlZCwg
MTczIGluc2VydGlvbnMoKyksIDExOSBkZWxldGlvbnMoLSkKPgo+Cj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
