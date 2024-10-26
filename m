Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E12FD0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AC7E60617;
	Sat, 26 Oct 2024 21:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndE2uEMIILHb; Sat, 26 Oct 2024 21:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A32160776
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A32160776;
	Sat, 26 Oct 2024 21:17:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8E0F5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D648C60617
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJIkMRBuR_Mz for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:17:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a30; helo=mail-vk1-xa30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1BAD60776
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1BAD60776
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1BAD60776
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:17:02 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-50d399891d6so787645e0c.1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729977421; x=1730582221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5BKcyu+T41ksfeX18DGCxMFrhLva5X9fBIiGnobeOEQ=;
 b=B2zl4CmCRnYzeR3p4CdfLi3lkFPrkpKTRqnslXibjnT2yZtXTpId/IvoqPYp5OX1CK
 4Y01IkPSY4mhHRBDDIT7H19zbt/xPzyRYgXSiDBcMqDN+YUAS3us8D4urA3lJPCFXp4i
 GMb04CsgU8Hv56a06bBW1xaV25IVVIOuaAI4jTEZ1SUf77tgKv05RoV9ZNclOjNSZn9p
 7J/cKxzYh77jtb13giWM35H7InmeNjRgt7TRq1HsRD9eIdHjT3QeK/Y5SA3zqTeRQxnx
 PeUoEnLb/6i/1s8+en+G1rIgeJJWEcCVeTXxBxB8YnEn0fp7dEozGfyNNiE+y2KgNJje
 OotA==
X-Gm-Message-State: AOJu0Yzy3bq4ZUVXrfGuBsnlQuDcy5lH4X7oID9Qx/3zDtmhhiIqs5d2
 fHFeI+HRBrJcT08175QL3ur21EU7k50oPV0om8+Cqrc21HLemC1HI3YWwAOt0W7R27BpYg3qix2
 P23vKyusEoXTTm+y0L7CqG3Gk3tfwJA==
X-Google-Smtp-Source: AGHT+IGBGJLFKt+JrJ3ml3bAm82nYq5ss5YXcAcVcrqwROJ4FjqCxH//UF097ZBcpbSa97wmRrXRbV78Uzne+gs9uIQ=
X-Received: by 2002:a05:6122:250a:b0:507:9096:423a with SMTP id
 71dfb90a1353d-51015142b83mr1889540e0c.12.1729977421549; Sat, 26 Oct 2024
 14:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240917021332.3838579-1-james.hilliard1@gmail.com>
 <20240917021332.3838579-2-james.hilliard1@gmail.com>
 <20241026175554.0466d8c5@windsurf>
In-Reply-To: <20241026175554.0466d8c5@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Oct 2024 15:16:50 -0600
Message-ID: <CADvTj4oETKmP+AADukyHBAWDKFAxRNqcRQAmEs8wWLxy_g0zLQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, 
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729977421; x=1730582221; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5BKcyu+T41ksfeX18DGCxMFrhLva5X9fBIiGnobeOEQ=;
 b=V/cH7ktmwZKeqZ2m6ndJmaMWtHDohg4a7WcuV/1KbShhPpxRF0VPnCQx4S97r7J1rT
 97FM/UPHRNHBe05vh+9sOQR6tSiS2UupaY4u4SpweuVX+uXTEl4xVfVXXzATtEAGp5DL
 GzifgPnBdOM3vBL8Z7/jcthuczPOQUyCFvexxoS2phtvCqdDYUAk+hU12P1WesSoA1pK
 cQqR+8yGd1uNISD16mUEqjyu8KSypY7bNc2Kdorzw/j7fw8ujHtO5llSKUsjHFcNqg+e
 7wlash3LNh0BUZaqPqJetnoyNgWT5w0975BWgrbZF2qdCrmlbRJQi7G+D4rGLcE+kHeh
 NxBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V/cH7ktm
Subject: Re: [Buildroot] [PATCH v5 2/3] package/python-scipy: bump to
 version 1.12.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBPY3QgMjYsIDIwMjQgYXQgOTo1NeKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAxNiBTZXAgMjAyNCAy
MDoxMzozMSAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gTGljZW5zZSBoYXNoIGNoYW5nZWQgZHVlIHRvIGRhdGUgdXBkYXRlOgo+
ID4gaHR0cHM6Ly9naXRodWIuY29tL3NjaXB5L3NjaXB5L2NvbW1pdC8wYWNlNzI5NTMyMjE0OGQ3
NDkzMmJlZTMyYjA2NDdlMjljMzhmYzhhCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGls
bGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3B5
dGhvbi1zY2lweS9weXRob24tc2NpcHkuaGFzaCB8IDYgKysrLS0tCj4gPiAgcGFja2FnZS9weXRo
b24tc2NpcHkvcHl0aG9uLXNjaXB5Lm1rICAgfCA0ICsrLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IEkgd2FudGVkIHRvIGFwcGx5IHRo
aXMgb25lLCBpbmRlcGVuZGVudGx5IG9mIHRoZSBweXRob24tbnVtcHkgdXBkYXRlLgoKSSByZWNh
bGwgdGhlIG51bXB5IGJ1bXAgd2FzIG5lZWRlZCB0byBnZXQgdGhpcyB0byBidWlsZC4KCj4gV2hl
biB2ZXJpZnlpbmcgaWYgaXQgYnVpbHQgcHJvcGVybHksIHRoZSBmb2xsb3dpbmcgZGVmY29uZmln
Ogo+Cj4gQlIyX2FybT15Cj4gQlIyX2NvcnRleF9hOT15Cj4gQlIyX0FSTV9FTkFCTEVfVkZQPXkK
PiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RM
SU49eQo+IEJSMl9JTklUX05PTkU9eQo+IEJSMl9TWVNURU1fQklOX1NIX05PTkU9eQo+ICMgQlIy
X1BBQ0tBR0VfQlVTWUJPWCBpcyBub3Qgc2V0Cj4gQlIyX1BBQ0tBR0VfUFlUSE9OMz15Cj4gQlIy
X1BBQ0tBR0VfUFlUSE9OX1NDSVBZPXkKPiAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qg
c2V0Cj4KPiBmYWlsZWQgb24gYnVpbGRpbmcuLi4gcHl0aG9uLW51bXB5Ogo+Cj4gb3V0cHV0L2J1
aWxkL3B5dGhvbi1udW1weS0xLjI1LjAvbnVtcHkvbWVzb24uYnVpbGQ6MjAzOjQ5OiBFUlJPUjog
Q291bGQgbm90IGdldCBwa2ctY29uZmlnIHZhcmlhYmxlIGFuZCBubyBkZWZhdWx0IHByb3ZpZGVk
IGZvciA8UGtnQ29uZmlnRGVwZW5kZW5jeSBsYXBhY2s6IFRydWUgTm9uZT4KPgo+IChJIGRpZCBu
b3QgaW52ZXN0aWdhdGUpCj4KPiBCdXQgdGhlIHNhbWUgaXNzdWUgaXMgdmlzaWJsZSBoZXJlOgo+
Cj4gICBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8xNzkvMTc5MTY3Njc4
MDk1NTkwODE2YzhiNWM3MzMwZTNkNWYwMThkZTU1NC9idWlsZC1lbmQubG9nCj4KPiBUaG9tYXMK
PiAtLQo+IFRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
