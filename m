Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11DEC54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 08:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C60E60F24;
	Mon, 30 Jan 2023 08:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C60E60F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4YdO403PDIa; Mon, 30 Jan 2023 08:58:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C22060F1C;
	Mon, 30 Jan 2023 08:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C22060F1C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C46801BF5A5
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 08:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB49C41603
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 08:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB49C41603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6cYVbx8bRbo5 for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 08:58:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A0D341548
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A0D341548
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 08:58:55 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id q9so7118950pgq.5
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 00:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZUGZ8CwRfg/q/bS3892emKBe61pdb9sjYEpgdYwx2Mc=;
 b=Ghu/YrFhXkU/fkTcEFvX0OoPyNTSzvEFxIvD+QxZhjSJFm6xvkdnMNjG8wW+TJU62z
 JPGE1z00RuUfKz7qP6gCt6cEbSlrthTv0X5OZ2fVovi1Spd8sPvhNj3IqF9QQbPY5oK3
 cBJXgFnL572xt/SgMT3uJcydbSC4w4LWbBToGDqdfGdrAGd8P0/nBaEWYOfgAIGqVhva
 I5uLBVvU3desLnPtDE/BpNd4MLZbJW4bItQEQr3YZNtlj7zBwXggjRkYGL7Hcmz+QNOr
 BU0b4dQr/OqYLSbEqZ/rR1W1fSg511OBYj+30ae77nt1HiWRfLhqrep/cTGUnUBOWvSt
 kXpA==
X-Gm-Message-State: AFqh2kow55JReemqsHBZcD0tDmjqBUz9iOWPMB9BjBoljhq+yuJV/7s/
 dk0At0ViGzILRW5H4TFQIK/1zD79xQXaJLnxQnTASpnM
X-Google-Smtp-Source: AMrXdXuw+PADAsjzMvTTIykhpD2mWB1e/1cca5ORiMaZ+OG4ORw3xb5my1ShRzjYLw+9rqrxAnMqEvUC+vVmlxtFySQ=
X-Received: by 2002:a63:f047:0:b0:470:2c91:9579 with SMTP id
 s7-20020a63f047000000b004702c919579mr5111157pgj.22.1675069134820; Mon, 30 Jan
 2023 00:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20230117110440.3405234-1-carrier.nicolas0@gmail.com>
 <20230129153145.GE2632@scaer>
 <CANp9F6inGf6BCXrUcdAS7ymyOTJ5ha08yFwuterxT57P_5bFxA@mail.gmail.com>
In-Reply-To: <CANp9F6inGf6BCXrUcdAS7ymyOTJ5ha08yFwuterxT57P_5bFxA@mail.gmail.com>
From: Nicolas CARRIER <carrier.nicolas0@gmail.com>
Date: Mon, 30 Jan 2023 09:58:43 +0100
Message-ID: <CANp9F6gHUtvDNr6zoOyaAMmNKaHSLaG=fnYT-1QKgATe2Dvehg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZUGZ8CwRfg/q/bS3892emKBe61pdb9sjYEpgdYwx2Mc=;
 b=EN254hMVG6XiMsYhDgNmPGh15nRPJFBVLzZRoth/SA0PSc3us8ahLjMSuawb32teJi
 /1XE4Inzb5zKge0EjX46ru73xeyc2g/6bHuh09Uw0htkgwBGTKcPovFtlMETsjr1LGbQ
 FRf/kgnSqpksliE8bB81qLTHSylvsgTXyTLhaPo2bHwxoMfFomfg+yvUARINtqrkXiFZ
 acmIFvnJBx082Jr2k3UNfvlE9pRYaX0uE3ORn8IYQn3k24iFS/B+lcff8i5Rqd9TWXA6
 wpAPrZQHFy9k2lL9rOn3GDgQVm5Im+SmNpJzfxgzkmtDkMk4tTLeayg8PX555xhCNgth
 fxgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EN254hMV
Subject: [Buildroot] Fwd: [PATCH 1/1] package/pkg-generic.mk: local and
 override support in legal-info
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yZ290IHRvIHJlcGx5IGFsbC4gU29ycnkgYWJvdXQgdGhhdCBeXicKCi0tLQoKWWFubiwgQWxs
LAoKPiBOaWNvbGFzLCBBbGwsCj4KPiBTb3JyeSBmb3IgcmVwbHlpbmcgbXVjaCBsYXRlciB0aGFu
IEkgcHJvbWlzZWQgSSB3b3VsZCBkby4uLgoKCk5vIHByb2JsZW0sIHRoYW5rIHlvdSBmb3IgdGFr
aW5nIHRoZSB0aW1lIHRvIGFuc3dlci4KCj4gPiBUaGlzIGlzIHByb2JsZW1hdGljIHNpbmNlIHRo
b3NlIHBhY2thZ2VzIGFyZSB0aGUgbW9zdCBsaWtlbHkgdG8KPiA+IHJlcXVpcmUgYmVpbmcgcHVi
bGlzaGVkLCBiZWNhdXNlIGl0J3MgaGlnaGx5IHByb2JhYmxlIHRoYXQgdGhlaXIKPiA+IHNvdXJj
ZXMgaGF2ZSBiZWVuIG1vZGlmaWVkLgo+Cj4gVGhpcyBpcyB0b3RhbGx5IGlycmVsZXZhbnQ6IHdo
ZXRoZXIgdGhlIHNvdXJjZXMgYXJlIGNoYW5nZWQgb3Igbm90IGRvZXMKPiBub3QgZHJpdmUgd2hl
dGhlciBhIHBhY2thZ2Ugc291cmNlcyBzaG91bGQgYmUgcHVibGlzaGVkLiBCZWxpZXZpbmcgc28K
PiB3b3VsZCBiZSBhIGdyb3NzIG1pc2NvbmNlcHRpb24gb24gaG93IGxpY2Vuc2VzIHN1Y2ggYXMg
dGhlIEdQTCB3b3JrLgo+IEluZGVlZCwgdGhlIEdQTCByZXF1aXJlcyB0aGF0IHRoZSBDJkNTIGJl
IHB1Ymxpc2hlZCBmb3IgYW55IGNvdmVyZWQKPiB3b3JrOyBpdCBkb2VzIG5vdCBjb25kaXRpb24g
dGhhdCBwdWJsaWNhdGlvbiB0byBpdCBoYXZpbmcgYmVlbiBsb2NhbGx5Cj4gbW9kaWZpZWQsIG9y
IG5vdCwgZnJvbSB3aGVyZXZlciB5b3UgZ290IGl0IGZyb20uCgpNeSBwb2ludCB3YXMganVzdCB0
byBlbXBoYXNpemUgdGhhdCwgYW1vbmcgYWxsIHRoZSBwYWNrYWdlcyB3ZSBhcmUKcmVkaXN0cmli
dXRpbmcsIHRoZSBtb3N0IGltcG9ydGFudCBvbmVzIGFyZSB0aG9zZSB3aGljaCBhcmUgbW9kaWZp
ZWQsCmJlY2F1c2UgaXQncyB0aGVtIHdobyBwcm92aWRlIHRoZSBtb3N0IGFkZGVkIHZhbHVlIHRv
IHRoZSBGTE9TUwplY29zeXN0ZW0gKGlmIHRoZSBwYXRjaGVzIGFyZSBnb29kLCB0aGF0IGlzIF5e
KS4gT1RITywgbm9uLW1vZGlmaWVkCnBhY2thZ2VzIGRvbid0IHByb3ZpZGUgYSBsb3Qgb2YgdmFs
dWUsIGJlaW5nIGFscmVhZHkgYXZhaWxhYmxlCmVsc2V3aGVyZS4KQnV0IGFnYWluLCBiZSBhc3N1
cmVkIHRoYXQgbXkgYWltIGlzIHRvIGJlIGZ1bGx5IGNvbXBsaWFudCBhbmQKcmVkaXN0cmlidXRl
IGFsbCA6KQoKPiBEdXJpbmcgZGV2ZWxvcG1lbnQsIHN1Y2ggcGFja2FnZXMgYXJlIG1vc3Qgb2Z0
ZW4gc3RvcmVkIGluIGEgbG9jYWwKPiBkaXJlY3RvcnkgdGhhdCBpcyBub3QgdHJhY2tlZCBieSB0
aGUgVkNTIChnaXQsIHN2biwgZXRjLi4uKSBhbmQgc28KPiBhcmUgbm90IHJlcHJvZHVjaWJsZSwg
YW5kIHRodXMgc3VjaCBhIGJ1aWxkIGNhbid0IGJlIG1lYW5pbmdmdWwgYXMKPiBhIHByb2R1Y3Rp
b24gYnVpbGQgWy4uLl0KClRoYXQgaXMgbm90IHRydWUgaW4gZ2VuZXJhbCBhbmQgaW4gb3VyIHNp
dHVhdGlvbiBpbiBwYXJ0aWN1bGFyLCB3aGVyZQp3ZSdyZSB1c2luZyByZXBvLgpUaGlzIHRvb2wg
YWxsb3dzIHVzIHRvIGhhbmRsZSAyIHNpdHVhdGlvbnMgaW4gcGFyYWxsZWw6CiogaW50ZWdyYXRl
IHRoZSBtb3N0IHJlY2VudCBjaGFuZ2VzIHVzaW5nIG1hbmlmZXN0cyB0cmFja2luZyBicmFuY2hl
cywKaW4gdGhlb3J5IG5vdCByZXByb2R1Y2libGUsIChidXQgc2VlIGxhdGVyKQoqIGludGVncmF0
ZSBvbmx5IGZpeGVkIHJldmlzaW9ucyAoc2hhMSwgdGFnKSBmb3IgcHJvZHVjdGlvbiAoYW5kCnJl
cHJvZHVjaWJsZSkgYnVpbGRzCgpBbmQgZXZlbiBpbiB0aGUgZmlyc3Qgc2l0dWF0aW9uLCBzaW5j
ZSB3ZSBrZWVwIHRyYWNrIG9mIHRoZSByZXZpc2lvbnMKdXNlZCBmb3IgZWFjaCBidWlsZCBieSBl
eHBvcnRpbmcgdGhlIHJlcG8gbWFuaWZlc3QsIHRob3NlIGJ1aWxkcwpiZWNvbWUgcmVwcm9kdWNp
YmxlIHRvbywgZXZlbiBpZiBmb3IgZGV2ZWxvcG1lbnQgcHVycG9zZSBvbmx5LgoKPiBbLi4uXSBD
aGFuZ2luZyB0aGUgYmVoYXZpb3VyIGFzIHlvdSBzdWdnZXN0Cj4gd291bGQgYnJlYWsgZm9yIHRo
b3NlIHVzZXJzLgoKSSBkb24ndCB0aGluayB0aGF0J3MgcmVhbGx5IGFuIGlzc3VlLCBJJ2xsIGp1
c3QgbWFrZSB0aGlzIGJlaGF2aW9yIGFuCm9wdGlvbiwgd2hvc2UgZGVmYXVsdCB3aWxsIGJlIHRo
ZSBwcmV2aW91cyBiZWhhdmlvci4KCj4gTm93LCBJIGRvIHVuZGVyc3RhbmQgdGhhdCB5b3UgYXJl
IChhYil1c2luZyBvdmVycmlkZS1zcmNkaXIgdG8gdXNlCj4gbG9jYWxseSBtb2RpZmllZCB2ZXJz
aW9ucyBvZiBwYWNrYWdlcyB0aGF0IEJ1aWxkcm9vdCB3b3VsZCBvdGhlcndpc2UKPiBmZXRjaCBm
cm9tIHRoZWlyIHJlbW90ZSBsb2NhdGlvbnMuCgpBZ2FpbiwgSSdtIG9rIHRvIHN0b3AgYWJ1c2lu
ZyBvdmVycmlkZS1zcmNkaXIsIGJ1dCB0aGUgcGF0Y2hlcyB0byBhZGQKYSBjb25maWcgb3B0aW9u
IHRvIHVzZSBhIGxvY2FsIGtlcm5lbCBvciB1Ym9vdCB0cmVlIGdvdCByZWplY3RlZCBhCndoaWxl
IGFnbyAoYW5kIGl0IGRvZXNuJ3Qgc29sdmUgdGhlIG92ZXJyaWRlIHByb2JsZW0gZm9yIGFsbCB0
aGUKcGFja2FnZXMgYW55d2F5KSBhbmQgdGhlIHNvbHV0aW9uIHlvdSdyZSBwcm9wb3NpbmcgbWUg
KHdoaWNoIEknbGwKc3VtbWFyaXplIGFmdGVyKSBkb2Vzbid0IHdvcmsgaW4gb3VyIHNpdHVhdGlv
bi4KCj4gSW4gdGhhdCBjYXNlLCBJIHdvdWxkIGFkdmlzZSB0aGF0IHlvdSBjYXJyeSB0aGUgbmVj
ZXNzYXJ5IGNoYW5nZXMgb24KPiB5b3VyIEJ1aWxkcm9vdCB0cmVlLCBbLi4uXSBpbiB3aGljaCBj
YXNlIHlvdSBzaG91bGQganVzdCBuZWVkIHRvIHByb3ZpZGUKPiB0aGUgY2hlY2tvdXQgb2YgdGhh
dCB0cmVlIHRoYXQgd2FzIHVzZWQgdG8gZG8gdGhlIGJ1aWxkLCBhbmQgYmUgaW4KPiBjb21wbGlh
bmNlIGZvciB0aG9zZSBwYWNrYWdlcy4KCkhlcmUsIEknbGwgdHJ5IHRvIHN1bW1hcml6ZSB5b3Vy
IHJlYXNvbmluZyBpbiB0aGlzIHNlY3Rpb246CgoqIEkgc2hvdWxkIHBhdGNoIGJ1aWxkcm9vdCB0
byBoYXZlIHRoZSBzb3VyY2VzIGluIGl0IGFuZCB1c2UgbG9jYWwKaW5zdGVhZCBvZiBvdmVycmlk
ZQoqIEkgc2hvdWxkIHByb3ZpZGUgZXZlcnl0aGluZyAocGF0Y2hlcywgYnVpbGRyb290LCBjb25m
aWdzLi4uKSB0bwpjb21wbHkgdG8gRkxPU1MgbGljZW5zZXMKKiBvbmNlIGFsbCBtZXRob2RzIGFy
ZSAibG9jYWwiLCBwcm92aWRpbmcgdGhlIG1vZGlmaWVkIGJ1aWxkcm9vdApzb3VyY2UgdHJlZSBz
aG91bGQgc3VmZmljZQoKSSdtIHBlcmZlY3RseSBvayB3aXRoIHRoZSBsYXN0IDIgcG9pbnRzLCBi
dXQgdGhlIGZpcnN0IGlzIHRoZSBibG9ja2luZwpvbmUsIGZvciB2YXJpb3VzIHJlYXNvbnM6Ci0g
cGFja2FnZXMnIHNvdXJjZSBjb2RlcyBvdXIgZGV2ZWxvcGVycyBoYXZlIHRvIG1vZGlmeSwgd291
bGQgYmUgc3BsaXQKaW50byAyIGxvY2F0aW9ucywgcHJvcHJpZXRhcnkgaW4gdGhlIGV4dGVybmFs
IGFuZCBmbG9zcyAoZXZlbiBpZiBpbgpob3VzZSkgaW4gdGhlIGJ1aWxkcm9vdC4gVGhhdCBpcyBu
b3QgYSBzaG93IHN0b3BwZXIgZm9yIHN1cmUsIGJ1dCBtb3JlCm9mIGFuIGV4dHJhIGFubm95YW5j
ZS4KCi0gdGhlbiwgaG93IHRvIGludGVncmF0ZSB0aGUgb3BlbiBzb3VyY2UgcGFja2FnZXMgaW5z
aWRlIHRoZSBidWlsZHJvb3QgdHJlZT8KSSBzZWUgdHdvIHdheXM6CiogY29weSB0aGUgc291cmNl
IHRyZWUgaW50byB0aGF0IG9mIGJ1aWxkcm9vdCwgbm90IGFuIG9wdGlvbiA6KQoqIHVzZSBhIHNv
bHV0aW9uIMOgIGxhIHN1Ym1vZHVsZXMgLyBzdWJ0cmVlcy4uLgpBbmQgaW4gZmFjdCwgd2Ugd29y
a2VkIGhhcmQgdG8gdHJhbnNpdGlvbiBmcm9tIGEgbWVyY3VyaWFsLWJhc2VkCndvcmtzcGFjZSB3
aXRoIHN1Ym1vZHVsZXMsIHRvIGEgcmVwby1iYXNlZCBvbmUgYW5kIHRoZSBiZW5lZml0cyBhcmUK
cmVhbGx5IGltcG9ydGFudCwgc28gd2UncmUgbm90IGdvaW5nIHRvIG1ha2UgdGhlIHN3aXRjaCBi
YWNrd2FyZHMuCgotIHdlIGFyZSB3b3JraW5nIGhhcmQsIChieSBvdXJzZWx2ZXMsIGJ1dCBhbHNv
IHdpdGggdGhlIGhlbHAgb2YKQm9vdGxpbiksIHRvIHVsdGltYXRlbHkgZ2V0IHJpZCBvZiBhbGwg
b2Ygb3VyIGJ1aWxkcm9vdCBwYXRjaGVzLiBUaGUKbWFpbiBhaW0gZm9yIHVzIGlzIHRvIGJlIGFi
bGUgdG8gdGVzdCB0aGUgaW50ZWdyYXRpb24gb2YgYnVpbGRyb290J3MKbWFzdGVyIGJyYW5jaCwg
c28gYXMgdG8gZml4IGludGVncmF0aW9uIGlzc3VlcyBhcyBzb29uIGFzIHRoZXkgaGFwcGVuLApp
bnN0ZWFkIG9mIGF0IGVhY2ggeWVhcidzIExUUy4gRm9yIHRoYXQsIHJlZHVjaW5nIG91ciBhbW91
bnQgb2YKcGF0Y2hlcyB0byB0aGUgbWluaW11bSwgaWRlYWxseSAwLCBpcyBjcnVjaWFsLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
