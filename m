Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964E0C83F10
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 06:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05B2B60FF9;
	Sun, 27 Aug 2023 06:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05B2B60FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCjQE0GIk3H8; Sun, 27 Aug 2023 06:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4008C60FC8;
	Sun, 27 Aug 2023 06:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4008C60FC8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7E91BF616
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 06:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10D2960FC8
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 06:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10D2960FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kaAWpSit-XH for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 06:37:29 +0000 (UTC)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E328C60A92
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 06:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E328C60A92
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-41095b84d8eso14701231cf.2
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 23:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693118247; x=1693723047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lzVWnqEltMliDvR68v5NZbinLfhVQcXWCTCpSc8sNnc=;
 b=U7nzgIPJdG8rzKers3ioborFceUbN3JvRMQVIEs9uGJOieJSjJxDvNEtyS8xp9AmJJ
 maCJ9r8c80KJR/Vcjjq3qrTj0hdfOTpBhCfvGy7HW5LaoDLDlELaaOCyxxbhsNyxtuXt
 0Hr1qgEJx+6Y1+beSWW0OGW14oaGLhlAfCQlihYZpYdBOC0xhDKLAui9fLd4GzpIwUGX
 l0tiDWOc11f2fR+bhhh/45OmMZo8iicnVtAj5YdsK7YsMgX+LOmikhFAlFvEbG4qu049
 W3cI704VvDMT77gbsRNxkLUlA7c6k08aeQd5P40WwVjQQwSPD6iluNV+55QjGL18k5ex
 ONaQ==
X-Gm-Message-State: AOJu0Yyji4oHdSOr9IKl3dmwwyRKqFuBp8svnzVaeCDlFXc9WIkzRrNT
 fR5EuxPtjtQ9Xko8e0iNgsrZyn+J+0NknSb/uDpa885b
X-Google-Smtp-Source: AGHT+IHEOe/JmUnhlik8Io4t5JmVP2owH6/I4/IoR7X7dUXCUO3CooKpZP+LnwoAJHtc//5In1eRULIssziSqxMAg2s=
X-Received: by 2002:ac8:5f8f:0:b0:3f9:b8a9:6494 with SMTP id
 j15-20020ac85f8f000000b003f9b8a96494mr30397890qta.48.1693118247644; Sat, 26
 Aug 2023 23:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230626181531.2312002-1-james.hilliard1@gmail.com>
 <20230626181531.2312002-5-james.hilliard1@gmail.com>
 <20230827001103.555c79a7@windsurf>
In-Reply-To: <20230827001103.555c79a7@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Aug 2023 02:37:15 -0400
Message-ID: <CADvTj4rrm+4PJC_GgywgbeY9QXeMT7-eCydXT0+4-R_5p3RgLw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693118247; x=1693723047;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lzVWnqEltMliDvR68v5NZbinLfhVQcXWCTCpSc8sNnc=;
 b=RESd7HQNDmBX2H+V/TgWwZGPpThHkGya7sNrrLEieqy3C1/bRB3fHdWdyt3KBqFimY
 23xIPXnDYhAeBR+7p9ks++jC48FNsG9k++rfqu5BiVP1XThRMJpa5H7B+yMKjghkCT3A
 2BQMDMPcanod8DPiWtrfgEh6mFgSKGCydI8RWYcqcAQTVysXggNZgHG7SnclhkeMEozu
 LvKPfAwqovveZ0MTPquHAVA8HepMCa0wl/vBSMhS9prCBYrlCdm/AOmAdxFuGfxdw7uv
 92JBIG5jZNPt6abmI3R2kc/AyrcxeWECv6+5idkLR8HiktP71Ytg4j5xCa6xkSm+WOdN
 +eCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=RESd7HQN
Subject: Re: [Buildroot] [PATCH 5/5] package/pkg-python.mk: migrate
 setuptools to pep517
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>, Michael Rommel <rommel@layer-7.net>,
 Samuel Martin <s.martin49@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBBdWcgMjYsIDIwMjMgYXQgNjoxMeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyNiBKdW4gMjAyMyAx
MjoxNTozMSAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gTm93IHRoYXQgc2V0dXB0b29scyBhbmQgaXRzIGRlcGVuZGVuY2llcyBh
cmUgdXNpbmcgcGVwNTE3IHdlIGNhbgo+ID4gbWlncmF0ZSB0aGUgc2V0dXB0b29scyBpbmZyYXN0
cnVjdHVyZSBpdHNlbGYgdG8gdXNlIHRoZSBwZXA1MTcKPiA+IGJ1aWxkIGZyb250ZW5kLgo+ID4K
PiA+IEFzIHBhcnQgb2YgdGhpcyB3ZSBuZWVkIHRvIG1pZ3JhdGUgdGhlIGFsbCBweXRob24gcGFj
a2FnZXMgdXNpbmcKPiA+IF9CVUlMRF9PUFRTIHRvIHRoZSBuZXcgY29uZmlnIHNldHRpbmdzIGZv
cm1hdCB1c2VkIGJ5IHRoZSBwZXA1MTcKPiA+IGJ1aWxkIGZyb250ZW5kLgo+ID4KPiA+IFdlIGFs
c28gbmVlZCB0byBhZGQgYSBwYXRjaCBmaXhpbmcgYSBidWcgaW4gcHl0aG9uLXB5cGEtYnVpbGQg
d2hpY2gKPiA+IHdhcyBwcmV2ZW50aW5nIHRoZSBjb25maWcgc2V0dGluZ3MgZnJvbSBiZWluZyBw
YXNzZWQgdG8gc29tZSBvZiB0aGUKPiA+IHBlcDUxNyBidWlsZCBob29rcy4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPgo+
IEkgbG9va2VkIGF0IHRoaXMgcGF0Y2ggYWdhaW4sIGFuZCBvbmUgdGhpbmcgSSBiZWxpZXZlIEkg
ZG9uJ3QgcmVhbGx5Cj4gbGlrZSBpcyB0aGF0IGl0IHJlcXVpcmVzIGEgImZsYWciIGRheSwgYXQg
d2hpY2ggIjxwa2c+X1NFVFVQX1RZUEUgPQo+IHNldHVwdG9vbHMiIHdpbGwgY2hhbmdlIGl0cyBz
ZW1hbnRpYyBmcm9tIHRoZSBsZWdhY3kgc2V0dXB0b29scyB0byB0aGUKPiBQRVA1MTctYmFzZWQg
c2V0dXB0b29scy4gV2UgZ2VuZXJhbGx5IHRyeSB0byBhdm9pZCB0aGlzIHNvcnQgb2YgImZsYWci
Cj4gZGF5IGFzIGl0J3MgYSBwYWluLi4uIGJ1dCBhbHNvIHlvdXIgcHJvcG9zYWwgY2hhbmdlcyB0
aGUKPiBzZW1hbnRpYy9iZWhhdmlvciBvZiAiPHBrZz5fU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMi
LCB3aGljaCBjYW4gYnJlYWsKPiBleHRlcm5hbCBwYWNrYWdlcyAoUHl0aG9uIHBhY2thZ2VzIHBl
b3BsZSBoYXZlIGluIHRoZWlyIEJSMl9FWFRFUk5BTCwKPiBvciBCdWlsZHJvb3QgZm9ya3MpLgoK
VGhlIGJlaGF2aW9yIGRpZmZlcmVuY2UgaXMgZmFpcmx5IG1pbm9yIGFuZCBhbnkgYnJlYWthZ2Ug
aW4gQlIyX0VYVEVSTkFMCnBhY2thZ2VzIHNob3VsZCBiZSB0cml2aWFsIHRvIGZpeC4gTWFpbnRh
aW5pbmcgbGVnYWN5IHNldHVwdG9vbHMgYnVpbGRzIGF0IHRoZQpzYW1lIHRpbWUgYXMgcGVwNTE3
IGJ1aWxkcyB3b3VsZCBhZGQgc2lnbmlmaWNhbnQgY29tcGxleGl0eSBJTU8gYW5kIGluY3JlYXNl
CnRoZSBsaWtlbGlob29kIG9mIHN1YnRsZSBidWdzLgoKPgo+IE9uZSBvcHRpb24gaXMgdG8gYWRk
IGNyZWF0ZSBhIG5ldyBwZXA1MTctc2V0dXB0b29scyA8cGtnPl9TRVRVUF9UWVBFLAo+IGFuZCBn
cmFkdWFsbHkgY29udmVydCBwYWNrYWdlcyBvdmVyLiBUaGlzIHdheSB3ZSBhbGxvdyB0aGUgY28t
ZXhpc3RlbmNlCj4gb2YgIlNFVFVQX1RZUEUgPSBzZXR1cHRvb2xzIiBwYWNrYWdlcyB3aXRoICJT
RVRVUF9UWVBFID0KPiBwZXA1MTctc2V0dXB0b29scyIgcGFja2FnZS4gVGhlIG9idmlvdXMgZHJh
d2JhY2sgaXMgdGhhdCB3ZSBoYXZlIDQ0OQo+IHBhY2thZ2VzIHdpdGggPHBrZz5fU0VUVVBfVFlQ
RSA9IHNldHVwdG9vbHMsIGFuZCBJIHN1cHBvc2UgdGhhdCA5NSUgb2YKPiB0aGVtIHdvcmsganVz
dCBmaW5lIHdpdGggdGhlIFBFUDUxNy1iYXNlZCBzZXR1cHRvb2xzLgoKSU1PIHRoZXJlJ3MgbGl0
dGxlIHBvaW50IGluIGtlZXBpbmcgdGhlIGxlZ2FjeSBub24tcGVwNTE3IHNldHVwdG9vbHMKaW5m
cmFzdHJ1Y3R1cmUKYXJvdW5kIGFzIGludm9raW5nIHNldHVwLnB5IGRpcmVjdGx5IGlzIGJlaW5n
IGRlcHJlY2F0ZWQgdXBzdHJlYW0uIFRoZQpkaWZmZXJlbmNlcwpiZXR3ZWVuIHBlcDUxNyBzZXR1
cHRvb2xzIGFuZCBub24tcGVwNTE3IHNldHVwdG9vbHMgYnVpbGRzIGlzIG92ZXJhbGwKcmF0aGVy
IHNtYWxsLgoKSSBzaG91bGQgYmUgYWJsZSB0byBxdWlja2x5IGZpeCBhbnkgYnJlYWthZ2UgcmVz
dWx0aW5nIGZyb20gdGhpcwpjb252ZXJzaW9uIG9uY2UgSSdtCmF3YXJlIG9mIGl0KEkgc3VzcGVj
dCB0aGUgYXV0b2J1aWxkZXJzIHdpbGwgaWRlbnRpZnkgYW55dGhpbmcgSSBtaXNzZWQKcmF0aGVy
IHF1aWNrbHkpLgoKPgo+IEknbSBub3QgcmVhbGx5IHN1cmUgaG93IHRvIHByb2NlZWQgaGVyZS4K
Pgo+IEJlc3QgcmVnYXJkcywKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
