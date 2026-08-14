Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41409C5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 12:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7F3A60626;
	Fri, 14 Aug 2026 12:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVtqsqiRQ9VU; Fri, 14 Aug 2026 12:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1513060703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786709191;
	bh=liP+p8EkRvm4dpVTm1WFwWpo8yksYZBsYymEaCOaeKQ=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=QoHYogesKZHxSBvKhD3TmwjSVf5HI/Bg2tKq/kqZD2coQy8rsifXEX21iJwKahGHj
	 mWzbk2g1YKGufQXBabb7CKs4nBiOZ2UwVnIbiQOjqiZQaN/jaycIyllnWit/d10kYi
	 cEQeS6qn90bqMySS9dXovaLSuXOsEh43FDa2cbdE39Ukf3BFp4N+P8AkfbaWi6xAq1
	 rw9ojOV8gcn89vWUW7uFL4IDWHF+EkRaKfie0eY++KIplQZ4MP8S8r47F1CZCCWKO0
	 JO9QrH5nx3FUUHFR+GqIB9aoF83I5bi/X2H7Jj7CIxmh7ydns/r3Rwiv5wNmwlzVJF
	 peN7yrBOiyEhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1513060703;
	Fri, 14 Aug 2026 12:06:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6F3433B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 12:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CDDF60703
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 12:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdYb6VcqkzMx for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 12:06:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 497CF60626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 497CF60626
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 497CF60626
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 12:06:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 186A24E41215
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 12:06:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BFA036046D
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 12:06:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C6C3211C4EC27; 
 Fri, 14 Aug 2026 14:06:19 +0200 (CEST)
Date: Fri, 14 Aug 2026 14:06:13 +0200
MIME-Version: 1.0
Message-Id: <20260814-openscap_musl_dbus-v1-1-cd42c1c3e0e2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4auQWdMEKsjPVYgh0zLKEChNxxoTw
 t2tuvwW7x0gFJgE+uyAQC8W3l1CmWdgZ3QPUjwlgy70tWjLSu2enFj04xZlHScTRV00mhbrpsa
 qgxT6QHd+/6bD7W+JZiH7/J7gPD+wPRgjdgAAAA==
X-Change-ID: 20260814-openscap_musl_dbus-32ab8a575a49
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/openscap: fix build failure with dbus
 and musl
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIG9wZW5zY2FwIGJ1aWxkIGNhbiBmYWlsIHdpdGggdGhlIGZvbGxvd2luZyBlcnJvcjoKCklu
IGZpbGUgaW5jbHVkZWQgZnJvbSBbLi4uXS9zcmMvT1ZBTC9wcm9iZXMvdW5peC9saW51eC9zeXN0
ZW1kdW5pdHByb3BlcnR5X3Byb2JlLmM6Mzg6ClsuLi5dL3NyYy9PVkFML3Byb2Jlcy91bml4L2xp
bnV4L3N5c3RlbWRzaGFyZWQuaDogSW4gZnVuY3Rpb24g4oCYZ2V0X2FsbF9zeXN0ZW1kX3VuaXRz
4oCZOgpbLi4uXS9zcmMvT1ZBTC9wcm9iZXMvdW5peC9saW51eC9zeXN0ZW1kc2hhcmVkLmg6MTg4
OjUwOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYYmFzZW5hbWXi
gJk7IGRpZCB5b3UgbWVhbiDigJhyZW5hbWXigJk/IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xh
cmF0aW9uXQogIDE4OCB8ICAgICAgICAgICAgICAgICBjaGFyICp1bml0X25hbWVfcyA9IG9zY2Fw
X3N0cmR1cChiYXNlbmFtZSh2YWx1ZS5zdHIpKTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVuYW1lCkluIGZpbGUgaW5j
bHVkZWQgZnJvbSBbLi4uXS9zcmMvT1ZBTC9wcm9iZXMvdW5peC9saW51eC9zeXN0ZW1kdW5pdGRl
cGVuZGVuY3lfcHJvYmUuYzozNzoKWy4uLl0vc3JjL09WQUwvcHJvYmVzL3VuaXgvbGludXgvc3lz
dGVtZHNoYXJlZC5oOiBJbiBmdW5jdGlvbiDigJhnZXRfYWxsX3N5c3RlbWRfdW5pdHPigJk6Clsu
Li5dL3NyYy9PVkFML3Byb2Jlcy91bml4L2xpbnV4L3N5c3RlbWRzaGFyZWQuaDoxODg6NTA6IGVy
cm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhiYXNlbmFtZeKAmTsgZGlk
IHlvdSBtZWFuIOKAmHJlbmFtZeKAmT8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25d
CiAgMTg4IHwgICAgICAgICAgICAgICAgIGNoYXIgKnVuaXRfbmFtZV9zID0gb3NjYXBfc3RyZHVw
KGJhc2VuYW1lKHZhbHVlLnN0cikpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fgogICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZW5hbWUKClRoaXMgZXJyb3IgaGFwcGVu
cyB3aGVuOgotIGRidXMgaXMgZW5hYmxlZCBpbiB0aGUgY29uZmlndXJhdGlvbiwgbWFraW5nIG9w
ZW5zY2FwIGJ1aWxkIHByb2JlcwogIGNvZGUKLSB0aGUgdG9vbGNoYWluIHVzZXMgbXVzbCwgd2hp
Y2ggZG9lcyBub3QgZGVjbGFyZSBiYXNlbmFtZSgpIGluIHN0cmluZy5oCiAgdGhlIHdheSBnbGli
YyBkb2VzCgpUaGUgYnVpbGQgZXJyb3IgY2FuIGJlIHJlcHJvZHVjZWQgd2l0aCB0aGUgZm9sbG93
aW5nIG1pbmltYWwgZGVmY29uZmlnOgoKICBCUjJfYXJtPXkKICBCUjJfY29ydGV4X2E5PXkKICBC
UjJfQVJNX0VOQUJMRV9ORU9OPXkKICBCUjJfQVJNX0VOQUJMRV9WRlA9eQogIEJSMl9UT09MQ0hB
SU5fRVhURVJOQUw9eQogIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15CiAgQlIyX1RP
T0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FSTVY3X0VBQklIRl9NVVNMX0JMRUVESU5HX0VER0U9
eQogIEJSMl9QQUNLQUdFX0RCVVM9eQogIEJSMl9QQUNLQUdFX09QRU5TQ0FQPXkKCkJhY2twb3J0
IHRoZSB1cHN0cmVhbSBmaXggdG8gYWxsb3cgb3BlbnNjYXAgdG8gYnVpbGQgd2l0aCBzdWNoCmNv
bmZpZ3VyYXRpb24uIFRoZSBjdXN0b20gcGF0Y2ggY2FuIGJlIHJlbW92ZWQgb25jZSBvcGVuc2Nh
cCBpcwpyZS1yZWxlYXNlZCBvbiBpdHMgYnJhbmNoIDEuMy54LgoKRml4ZXM6IGh0dHBzOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9hODc0ZDRmMzRkMzZmYTlmODU2NmJlOTBhZDJk
NWZhY2I5OWFlYzI0LwpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Ro
b3JlQGJvb3RsaW4uY29tPgotLS0KVGhlIGlzc3VlIGFmZmVjdHMgbWFzdGVyLCAyMDI2LjA1Lngg
YW5kIDIwMjUuMDIueAotLS0KIC4uLjAyLU9WQUwtcHJvYmVzLWFkZC1taXNzaW5nLWhlYWRlci1p
bmNsdWRlLnBhdGNoIHwgNDggKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQ4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zY2FwLzAwMDItT1ZB
TC1wcm9iZXMtYWRkLW1pc3NpbmctaGVhZGVyLWluY2x1ZGUucGF0Y2ggYi9wYWNrYWdlL29wZW5z
Y2FwLzAwMDItT1ZBTC1wcm9iZXMtYWRkLW1pc3NpbmctaGVhZGVyLWluY2x1ZGUucGF0Y2gKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4wYzc1OThiMmI1ZTEKLS0tIC9k
ZXYvbnVsbAorKysgYi9wYWNrYWdlL29wZW5zY2FwLzAwMDItT1ZBTC1wcm9iZXMtYWRkLW1pc3Np
bmctaGVhZGVyLWluY2x1ZGUucGF0Y2gKQEAgLTAsMCArMSw0OCBAQAorRnJvbSBhYjY5Yjc2Y2I0
MGQ2ZjM1ZDI1MjI0NmU5NjUyNDU4MDRiMTc1OTFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbTogPT9VVEYtOD9xP0FsZXhpcz0yMExvdGhvcj1DMz1BOT89IDxhbGV4aXMubG90aG9yZUBi
b290bGluLmNvbT4KK0RhdGU6IFRodSwgMTMgQXVnIDIwMjYgMTU6MTg6MTUgKzAyMDAKK1N1Ympl
Y3Q6IFtQQVRDSF0gT1ZBTC9wcm9iZXM6IGFkZCBtaXNzaW5nIGhlYWRlciBpbmNsdWRlCitNSU1F
LVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitD
b250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK09wZW5zY2FwIGJ1aWxkIGNhbiBmYWls
IHdpdGggdGhlIGZvbGxvd2luZyBsb2cgd2hlbgorLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJh
dGlvbiBpcyB0dXJuZWQgaW50byBhbiBlcnJvcjoKKworSW4gZmlsZSBpbmNsdWRlZCBmcm9tIFsu
Li5dL3NyYy9PVkFML3Byb2Jlcy91bml4L2xpbnV4L3N5c3RlbWR1bml0cHJvcGVydHlfcHJvYmUu
YzozODoKK1suLi5dL3NyYy9PVkFML3Byb2Jlcy91bml4L2xpbnV4L3N5c3RlbWRzaGFyZWQuaDog
SW4gZnVuY3Rpb24g4oCYZ2V0X2FsbF9zeXN0ZW1kX3VuaXRz4oCZOgorWy4uLl0vc3JjL09WQUwv
cHJvYmVzL3VuaXgvbGludXgvc3lzdGVtZHNoYXJlZC5oOjE4ODo1MDogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGJhc2VuYW1l4oCZOyBkaWQgeW91IG1lYW4g4oCY
cmVuYW1l4oCZPyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KKyAgMTg4IHwgICAg
ICAgICAgICAgICAgIGNoYXIgKnVuaXRfbmFtZV9zID0gb3NjYXBfc3RyZHVwKGJhc2VuYW1lKHZh
bHVlLnN0cikpOworICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn4KKyAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlbmFtZQorSW4gZmlsZSBpbmNsdWRlZCBmcm9tIFsuLi5d
L3NyYy9PVkFML3Byb2Jlcy91bml4L2xpbnV4L3N5c3RlbWR1bml0ZGVwZW5kZW5jeV9wcm9iZS5j
OjM3OgorWy4uLl0vc3JjL09WQUwvcHJvYmVzL3VuaXgvbGludXgvc3lzdGVtZHNoYXJlZC5oOiBJ
biBmdW5jdGlvbiDigJhnZXRfYWxsX3N5c3RlbWRfdW5pdHPigJk6CitbLi4uXS9zcmMvT1ZBTC9w
cm9iZXMvdW5peC9saW51eC9zeXN0ZW1kc2hhcmVkLmg6MTg4OjUwOiBlcnJvcjogaW1wbGljaXQg
ZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYYmFzZW5hbWXigJk7IGRpZCB5b3UgbWVhbiDigJhy
ZW5hbWXigJk/IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQorICAxODggfCAgICAg
ICAgICAgICAgICAgY2hhciAqdW5pdF9uYW1lX3MgPSBvc2NhcF9zdHJkdXAoYmFzZW5hbWUodmFs
dWUuc3RyKSk7CisgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fgorICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVuYW1lCisKK0FkZCB0aGUgbWlzc2luZyBoZWFkZXIgaW5j
bHVkZSBwb2ludGVkIGJ5IGBtYW4gMyBiYXNlbmFtZWAgdG8gZml4IHRoZQorZXJyb3IuCisKK1Vw
c3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vT3BlblNDQVAvb3BlbnNjYXAvY29tbWl0L2FiNjli
NzZjYjQwZDZmMzVkMjUyMjQ2ZTk2NTI0NTgwNGIxNzU5MWYKK1NpZ25lZC1vZmYtYnk6IEFsZXhp
cyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CistLS0KKyBzcmMvT1ZBTC9w
cm9iZXMvdW5peC9saW51eC9zeXN0ZW1kc2hhcmVkLmggfCAxICsKKyAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKKworZGlmZiAtLWdpdCBhL3NyYy9PVkFML3Byb2Jlcy91bml4L2xpbnV4
L3N5c3RlbWRzaGFyZWQuaCBiL3NyYy9PVkFML3Byb2Jlcy91bml4L2xpbnV4L3N5c3RlbWRzaGFy
ZWQuaAoraW5kZXggODc5YWU1YmU5ZDZjLi41N2U5NGNhNmY0OWUgMTAwNjQ0CistLS0gYS9zcmMv
T1ZBTC9wcm9iZXMvdW5peC9saW51eC9zeXN0ZW1kc2hhcmVkLmgKKysrKyBiL3NyYy9PVkFML3By
b2Jlcy91bml4L2xpbnV4L3N5c3RlbWRzaGFyZWQuaAorQEAgLTM1LDYgKzM1LDcgQEAKKyAjaW5j
bHVkZSA8Y29uZmlnLmg+CisgI2VuZGlmCisgCisrI2luY2x1ZGUgPGxpYmdlbi5oPgorICNpbmNs
dWRlIDxsaW1pdHMuaD4KKyAjaW5jbHVkZSA8c3RkaW8uaD4KKyAjaW5jbHVkZSAiY29tbW9uL2Rl
YnVnX3ByaXYuaCIKKy0tIAorMi41NS4wCisKCi0tLQpiYXNlLWNvbW1pdDogNjc5YjllYWQ3NjIw
YmJmMTkzNjIwZDFlYmY1NmY1M2MxNzY0ZDM3YQpjaGFuZ2UtaWQ6IDIwMjYwODE0LW9wZW5zY2Fw
X211c2xfZGJ1cy0zMmFiOGE1NzVhNDkKCkJlc3QgcmVnYXJkcywKLS0gIApBbGV4aXMgTG90aG9y
w6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
