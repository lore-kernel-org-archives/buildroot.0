Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF48FCA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89F6C4030B;
	Mon,  2 Sep 2024 20:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXa0j2BAzMe8; Mon,  2 Sep 2024 20:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ADC840321
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ADC840321;
	Mon,  2 Sep 2024 20:35:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 286251BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 142F2405F1
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyvuSdzG7wCS for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:35:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 646BE40254
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 646BE40254
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 646BE40254
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 20:35:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42bbaf45044so5078095e9.1
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 13:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725309351; x=1725914151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lLqckxROyFMR4b9TYd5lxiveFEwQfABU3tuq88OnphA=;
 b=IMeGRx0Kd63s/SE3ZYJcd6avM/u9W9btdJu51+yaAj/pyps8Gx0MkbIXjDfKWP76xH
 F4SP0onRfpgS706YFA/Qs8cgUxVWmu1T1tQeHMCU4ULXVrc95UrjbIj3SeBph73wdW5L
 2T+/23NfmqxUKoAbk6ghcNmZOkF3TTWNe1xfOcTXbm/d1RQ4RyBfGIEEMhLaEgD8YaIQ
 KbOwQRhcwYlVJ3nzKmB0Gf1ppqJm8BlfPgfvzH0hwCW21MCijYjjRaKZlk6Z6jBcWTYQ
 wW0KIaJBVrrIc7UkSrYgPXTbPjTu59LO4vXgVprK9yzcX9yAd0JrGLBTKVfyZCj55S7a
 xtCg==
X-Gm-Message-State: AOJu0YwgMCtZZ8pRF2hU9R03Hx66/n5R2o25o3dzaKAW/jQzb7zLObZl
 RNVSTMgDrr4IofDYiJWWyWXJeZPTPrBi5nireFYh/QLjfcyo+ATaO7IEkSZrmC4=
X-Google-Smtp-Source: AGHT+IGqt9Tu/hy5rCtxzgoIMg2qQj7b5keMqH0lspb2ZMNmeo4oLMaR0tI/6hXAP1yEgjCNVVVFuw==
X-Received: by 2002:a5d:6c6f:0:b0:374:cd3e:7d86 with SMTP id
 ffacd0b85a97d-374cd3e80d0mr1213712f8f.3.1725309351168; 
 Mon, 02 Sep 2024 13:35:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbc8de253sm96609475e9.0.2024.09.02.13.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 13:35:50 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 22:35:31 +0200
Message-ID: <20240902203533.3961108-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725309351; x=1725914151; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lLqckxROyFMR4b9TYd5lxiveFEwQfABU3tuq88OnphA=;
 b=QNRCFRvhzEbc4/DNNiCaA8IUIfg3EmY0zgFYohtnDjLmFgaY33ZvSRKhEuFgkx13Y9
 8jLb2sqWA00VZmCKX3HOB+SCk56MFLxpntUkqQSROP9gO1v1RrucUR1UeeTFlvUGitVZ
 CJXSD77fBmJ6zYsizMqZKU/ZEtyzlpb98D+7RG7lHHznFXNGjZzWvSQjKACV2CqmO4SF
 iT5SajcJmhwwNNYme5yU8PBPVR+SeGcKzYVnXRR5nQiy/fgMMZJYniYdHpEpSOnyvXP4
 SkSs6JCAsXXlINmT/jP5uCKjF07I8FlppVpwlulDW1snUVuXshZtQyQYZqq7mVaalVJH
 BR7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QNRCFRvh
Subject: [Buildroot] [PATCH 0/2] linux: install in-tree device-tree blob
 overlays
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Fiona Klute <fiona.klute@gmx.de>, Michael Walle <michael@walle.cc>,
 Christian Stewart <christian@aperture.us>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgotLS0gPjggLS0tClRoaXMgZHVwbGljYXRlcyB0aGUgZm9sbG93aW5nIGFuZCBleGlz
dGluZyBwYXRjaCBzZXJpZXM6CgogLSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L3BhdGNoLzIwMjMwNTE3MDIxNTEwLjMwMTYzOTQtMS1jaHJpc3RpYW5AYXBl
cnR1cmUudXMvIGZyb20gQ2hyaXN0aWFuIFN0ZXdhcnQgKDIwMjMhKQogLSBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMjEzMTU0ODQ3Ljkx
NDA2OC0xLW1pY2hhZWxAd2FsbGUuY2MvIGZyb20gTWljaGFlbCBXYWxsZSAodjEpCiAtIGh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDA5MDIx
MTI3MzUuNzI4NTc0LTEtbWljaGFlbEB3YWxsZS5jYy8gZnJvbSBNaWNoYWVsIFdhbGxlICh2MikK
CkkgYW0gKipzb3JyeSoqIGZvciB0aGUgbm9pc2U7IGZlZWwgZnJlZSB0byBkaXNjYXJkIG1pbmUh
CgpUaGUgbWFpbiBkaWZmZXJlbmNlIGlzIG1pbmUgaXMgYnVpbGRpbmcgYW5kIGluc3RhbGxpbmcg
ZHRzL2R0YiBhbmQKZHRzby9kdGJvICJkaWZmZXJlbnRseSIgKHRoZSBzYW1lIHdheSBidXQgaW4g
ZGlmZmVyZW50IG1hY3JvL2RlZmluZSkuCgpJdCBpcyBwcmV0dHkgbXVjaCB1c2VmdWwgZm9yIHRo
ZSBSYXNwYmVycnkgUGkncyB0aGF0IG5lZWQgdG8gaW5zdGFsbCB0aGUKKi5kdGJvIHRvIC9ib290
L292ZXJsYXlzIChhcmNoLyRBUkNIL2R0cy9ib290L292ZXJsYXlzLyouZHRibykgYW5kIHRoZQoq
LmR0YiB0byAvYm9vdCAoYXJjaC8kQVJDSC9kdHMvYm9vdC9icm9hZGNvbS8qLmR0Yik7IGkuZS4g
a2VlcGluZyB0aGUKZGlyZWN0b3J5IG92ZXJsYXlzIGZvciB0aGUgZHRibyBpbiBvbmUgaGFuZCwg
YW5kIHJlbW92aW5nIHRoZSBkaXJlY3RvcnkKYnJvYWRjb20gZm9yIHRoZSBkdGIgaW4gdGhlIG90
aGVyIGhhbmQuCgpCdXQgSSBhbSBub3Qgc3VyZSBpdCBkZXNlcnZlcyBpdCA6RAotLS0gPjggLS0t
CgpUaGUgZGV2aWNlLXRyZWUgYmxvYiBvdmVybGF5IGlzIGFuIHVwc3RyZWFtIGZlYXR1cmU7IG9u
ZSBjYW4gYnVpbGQgYQouZHRibyBmcm9tIC5kdHNvIHRoYW5rcyB0byBjb21taXQgMzYzNTQ3ZDIx
OTFjIChrYnVpbGQ6IEFsbG93IERUQgpvdmVybGF5cyB0byBidWlsdCBmcm9tIC5kdHNvIG5hbWVk
IHNvdXJjZSBmaWxlcylbMV0gKGxpbnV4LTYuMS1yYzIpLgoKVGhpcyBwYXRjaCBzZXJpZSBpbnRl
bmRzIHRvIGFkZHJlc3MgYSBwb3NzaWJsZSBvdXQtb2Ytc3luYyBmb3IgdGhlCmRldmljZS10cmVl
IGJsb2IgYW5kIG92ZXJsYXlzIHdpdGggdGhlIFJhc3BiZXJyeSBQaSdzLiBUaGlzIGZvbGxvd3MK
dXBbMl0uCgpUaGUgZGV2aWNlLXRyZWUgYmxvYiBvdmVybGF5cyBhcmUgYXV0b21hdGljYWxseSBi
dWlsdCBmcm9tIHRoZSBjdXN0b20KcmFzcGJlcnJ5cGkgbGludXggdHJlZSAoZm9yIGJvdGggYXJj
aGl0ZWN0dXJlcyBhcm0gYW5kIGFybTY0KS4KClRoZSBrZXJuZWwgaW1hZ2UgYW5kIHRoZSBkZXZp
Y2UtdHJlZSBibG9icyBmb3IgdGhlIHJhc3BiZXJyeXBpIGJvYXJkcwphcmUgYnVpbHQgZnJvbSB0
aGUgZG93bnN0cmVhbSBsaW51eCBwYWNrYWdlLCBhbmQgdGhlIGRldmljZS10cmVlIGJsb2IKb3Zl
cmxheXMgYXJlIHRha2VuIGZyb20gdGhlIHBhY2thZ2UgcnBpLWZpcm13YXJlLiBCb3RoIHBhY2th
Z2VzIGxpbnV4CmFuZCBycGktZmlybXdhcmUgaGF2ZSB0byBiZSBjbG9zZWx5IHN5bmNlZC4KClRo
ZSBidWlsZHJvb3QgdHJlZSBtYWludGFpbnMgdGhlIHBhY2thZ2VzIGFuZCB0aGUgYm9hcmQgY29u
ZmlndXJhdGlvbnMsCmFuZCBpdCBrZWVwcyB0aGluZ3Mgc3luY2VkLgoKVGhlIGRvd25zdHJlYW0g
Y29uZmlndXJhdGlvbnMgaW4gYnIyLWV4dGVybmFsIHRyZWVzIHJlcXVpcmUgdG8gcGF5CmF0dGVu
dGlvbiB0byB0aGF0IHN5bmNocm9uaXphdGlvbiBhcyB3ZWxsLiBJZiB0aGUgZmlsZXMgYXJlIG91
dC1vZi1zeW5jLAooaS5lLiB0aGUgZHRibydzIGluIHRoZSBycGktZmlybXdhcmUgcGFja2FnZSBm
cm9tIHRoZSBidWlsZHJvb3QgdHJlZSBkbwpub3QgbWF0Y2ggdGhlIGxpbnV4IGNvbW1pdCBpbiB0
aGUgYnIyLWV4dGVybmFsIHRyZWUpLCB0aGVuIHRoZSBib290IG1heQpmYWlsLgoKU2luY2UgdGhl
IFJhc3BiZXJyeSBQaSdzIHdpdGggQmx1ZXRvb3RoIGhhdmUgbm8gZGVkaWNhdGVkIGRlYnVnZ2lu
ZwpVQVJULCB0aGV5IHJlcXVpcmUgdG8gbWVyZ2UgdGhlIGJ0LW1pbml1YXJ0LmR0Ym8gdG8gcmVz
dG9yZSB0aGUgVUFSVDAgdG8KdGhlIGFjY2Vzc2libGUgR1BJT3Mgb2YgNDAtcGluIEdQSU8gaGVh
ZGVyIChpLmUuIFBpIDMsIFplcm8gVywgWmVybyAyIFcsCjQpLgoKVGhlIGludmVzdGlnYXRpb24g
b2YgdGhlIGJvb3QgZmFpbHVyZSBpcyBjb21wbGljYXRlZCBpZiB0aGUgcm9vdCBjYXVzZQppcyBk
dWUgdG8gdGhlIG91dC1vZi1zeW5jIG1lcmdlIG9mIHRoZSBkZWJ1Z2dpbmcgdWFydCdzIGR0Ym8g
dG8gdGhlIGR0YgphbmQgaWYgZmlybXdhcmUgYm9vdGxvYWRlciBkb2VzIG5vdCBvdXRwdXQgdGhl
IGRlYnVnIHRyYWNlcy4KCglNRVNTOjAwOjAwOjA1LjM4OTg4NTowOiBicmZzOiBGaWxlIHJlYWQ6
IC9tZnMvc2Qvb3ZlcmxheXMvbWluaXVhcnQtYnQuZHRibwoJTUVTUzowMDowMDowNS40MDg4ODE6
MDogZHRlcnJvcjogY2FuJ3QgZmluZCBzeW1ib2wgJ3VhcnQxX2J0X3BpbnMnCglNRVNTOjAwOjAw
OjA1LjQxMTk0MjowOiBGYWlsZWQgdG8gcmVzb2x2ZSBvdmVybGF5ICdtaW5pdWFydC1idCcKCkFs
bCB0aGlzIGxvbmcgc3RvcnkgdG8gaW50cm9kdWNlIHRoZSB0aHJlZSBuZXcgZHRibyBjb25maWdz
IHRvIGluc3RhbGwKaW4tdHJlZSBhbmQgYnVpbGQgb3V0LW9mLXRyZWUgZHRibydzLCBhbmQgdG8g
a2VlcCB0aGUgZGlyZWN0b3J5IG5hbWUuCgpUaGUgdGhyZWUgY29uZmlncyBhcmUgdGhlIGVxdWl2
YWxlbnQgdG8gZXhpc3RpbmcgZHRzIGNvbmZpZ3M6CiAtIEJSMl9MSU5VWF9LRVJORUxfSU5UUkVF
X0RUU19PVkVSTEFZX05BTUVTIGlzIGVxdWl2YWxlbnQgdG8KICAgQlIyX0xJTlVYX0tFUk5FTF9J
TlRSRUVfRFRTX05BTUUgKGl0IHRha2VzIGluLXRyZWUgZmlsZXMgcmVsYXRpdmUgdG8KICAgZHRz
IGRpcmVjdG9yeSwgd2l0aG91dCBmaWxlIGV4dGVudGlvbjogaS5lLiB3aXRob3V0IC5kdHMpCiAt
IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19PVkVSTEFZX1BBVEggaXMgZXF1aXZhbGVudCB0
bwogICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSCAoaXQgdGFrZXMgb3V0LW9mLXRy
ZWUgZmlsZXMgcmVsYXRpdmUKICAgdG8gYnVpbGRyb290IGRpcmVjdG9yeSwgd2l0aCBmaWxlIGV4
dGVudGlvbiAuZHRzbykKIC0gQlIyX0xJTlVYX0tFUk5FTF9EVEJPX0tFRVBfRElSTkFNRSBpcyBl
cXVpdmFsZW50IHRvCiAgIEJSMl9MSU5VWF9LRVJORUxfRFRCX0tFRVBfRElSTkFNRQoKVGhlIGZp
cnN0IHBhdGNoIGFkZHMgdGhlIHRocmVlIGNvbmZpZ3VyYXRpb25zIHRvIGluc3RhbGwgdGhlIGR0
Ym8nczsKdGhlc2UgY29uZmlndXJhdGlvbnMgYXJlIGNvcGllcyBvZiB0aGUgb3JpZ2luYWwgZHRi
J3MgY29uZmlndXJhdGlvbnMuCgpUaGUgc2Vjb25kIHBhdGNoIGFwcGxpZXMgdGhlc2UgY29uZmln
dXJhdGlvbnMgdG8gdGhlIFJhc3BiZXJyeSBQaSdzLgoKQ2hhbmdlcyBzaW5jZSBSRkM6CiAtIEZp
eCBidWlsZGluZyBvdXQtb2YtdHJlZSBkdGJvIGJ5IGFkZGluZyB0aGUgbWlzc2luZyBkZWZpbmUK
ICAgTElOVVhfQlVJTERfRFRCTyBhbmQgaW5zdGFsbGluZyB0aGUgZHRzbwogLSBSZXBsYWNlIHRo
ZSBwaSBkb3duc3RyZWFtIHN1ZmZpeCAtb3ZlcmxheS5kdHMgYnkgdXBzdHJlYW0gLmR0c28KIC0g
SW5zdGFsbCB0aGUgZHRibyB0byB0aGUgdGFyZ2V0IGRpcmVjdG9yeSAvYm9vdCBpbnN0ZWFkIG9m
CiAgIC9ib290L292ZXJsYXlzCiAtIEFkZCBtaXNzaW5nIGRlcGVuZHMgb24gQlIyX0xJTlVYX0tF
Uk5FTF9EVEJfT1ZFUkxBWV9TVVBQT1JUIHRvIGNvbmZpZwogICBCUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9EVFNfT1ZFUkxBWV9QQVRIIGFuZCB0byBjb25maWcKICAgQlIyX0xJTlVYX0tFUk5FTF9E
VEJPX0tFRVBfRElSTkFNRQoKWzFdOiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgv
Y29tbWl0LzM2MzU0N2QyMTkxY2JjMzJjYTk1NGJhNzVkNzI5MDg3MTIzOThmZjIKWzJdOiBodHRw
czovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2NvdmVyLzIwMjMxMTIx
MTkzNDQ4LjExNTE5MzYtMS1nYWVsLnBvcnRheUBydG9uZS5mci8KCktpbmQgUmVnYXJkcywKR2HD
q2wgUE9SVEFZICgyKToKICBsaW51eDogYWRkIGRldmljZS10cmVlIGJsb2Igb3ZlcmxheXMgc3Vw
cG9ydAogIGJvYXJkL3Jhc3BiZXJyeXBpOiBpbnN0YWxsIGluLXRyZWUgZGV2aWNlLXRyZWUgYmxv
YiBvdmVybGF5cwoKIGJvYXJkL3Jhc3BiZXJyeXBpL3Bvc3QtaW1hZ2Uuc2ggICAgICAgfCAgMiAr
LQogY29uZmlncy9yYXNwYmVycnlwaTB3X2RlZmNvbmZpZyAgICAgICB8ICA0ICsrKysKIGNvbmZp
Z3MvcmFzcGJlcnJ5cGkzXzY0X2RlZmNvbmZpZyAgICAgfCAgNCArKysrCiBjb25maWdzL3Jhc3Bi
ZXJyeXBpM19kZWZjb25maWcgICAgICAgIHwgIDQgKysrKwogY29uZmlncy9yYXNwYmVycnlwaTNf
cXQ1d2VfZGVmY29uZmlnICB8ICA0ICsrKysKIGNvbmZpZ3MvcmFzcGJlcnJ5cGk0XzY0X2RlZmNv
bmZpZyAgICAgfCAgNCArKysrCiBjb25maWdzL3Jhc3BiZXJyeXBpNF9kZWZjb25maWcgICAgICAg
IHwgIDQgKysrKwogY29uZmlncy9yYXNwYmVycnlwaWNtNGlvXzY0X2RlZmNvbmZpZyB8ICA0ICsr
KysKIGNvbmZpZ3MvcmFzcGJlcnJ5cGljbTRpb19kZWZjb25maWcgICAgfCAgNCArKysrCiBjb25m
aWdzL3Jhc3BiZXJyeXBpemVybzJ3X2RlZmNvbmZpZyAgIHwgIDQgKysrKwogbGludXgvQ29uZmln
LmluICAgICAgICAgICAgICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysKIGxpbnV4
L2xpbnV4Lm1rICAgICAgICAgICAgICAgICAgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDEyIGZpbGVzIGNoYW5nZWQsIDk1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCi0tIAoyLjQ2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
