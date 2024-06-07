Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EFCC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 16:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5299E427E2;
	Fri,  7 Jun 2024 16:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVXNmmcAGsWC; Fri,  7 Jun 2024 16:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7F71427DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7F71427DB;
	Fri,  7 Jun 2024 16:32:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 466DD1BF47A
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 16:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F5C960825
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 16:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id can_Z1Z81sxF for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 16:32:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C648F606A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C648F606A0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C648F606A0
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 16:32:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-35dceef429bso1305619f8f.1
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 09:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717777957; x=1718382757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eArKGzguE16zhSmBNJJd/+ebhOAkzBqcOyn3GNntJKc=;
 b=juxphXMO5j0tuYWqoafret3ZaUVUMCehuJvV5HyF0CUVd/uPLXqAWUTh/0eVPUq/mp
 amXB4jwSHO2DW73tnBPltLmWkw+thSN55I2Fg3xVozRQwfoSRY4+p3L8LLco03ZQfI0J
 VoysrFYLTuDAs4xs0RMBmgggDD0vyZuYf5zRYUIMp6b1MpVtojKfRWl+xN7jPkb8xDl8
 63acDtNzaPEXKBj/Q1EXyMA+R/IhM0qm93Ab2mwLeDR+rUrkcmT/eWO/yfZyrEN0Qjzm
 gTAswP6xktshzj7Mo3ySRQFd5GrIoYixkpg6m3+AfiBYnsGmk9e7moSlONeVw3Tl7/rf
 csRQ==
X-Gm-Message-State: AOJu0Yxn3iIgWWIlgL2JRF4emiwgIZDee0hkx+SWLiVoTEmBAl1ltQPO
 pTI1jOJPhhjObFgCvAhbdpfzSGpm6lwOlpTDVGFgF3wgpqBABO85zhRvYH39Sw/eF8PUIymgA6H
 gIOU=
X-Google-Smtp-Source: AGHT+IHevmQw4l6Xu+aAeTjbWu1IJATTLs/X0XWVfILtBxpI4UPfuCCMrH52dPahOgijifoMYsNNdw==
X-Received: by 2002:a5d:458c:0:b0:35f:ddb:70e2 with SMTP id
 ffacd0b85a97d-35f0ddb72f9mr995483f8f.1.1717777956243; 
 Fri, 07 Jun 2024 09:32:36 -0700 (PDT)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2cd7e7sm55804205e9.46.2024.06.07.09.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 09:32:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 18:32:05 +0200
Message-Id: <20240607163208.1445715-4-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240607163208.1445715-1-raphael.melotte@mind.be>
References: <20240216211344.1807353-2-raphael.melotte@mind.be>
 <20240607163208.1445715-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717777957; x=1718382757; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eArKGzguE16zhSmBNJJd/+ebhOAkzBqcOyn3GNntJKc=;
 b=ZbX29LeZoIPsFIdio/CvBlumiNtd9ca4nHAASEBrwIXkCkdxC0JJUfP8TtJwKSYMkj
 nE+QiZyEy2kHoyfEG9nJAHSYvhZbsVRdjwcimv8i+pEUgT8uZ5yN1ziPb6GG/J3y00LC
 QSWF4MUaYCoGrP3qv1+Es0M3n3DDFT57tCjDNUDkXNu2FbSvHye+rKVFxE8+2T/zwujU
 dTYwnfNsxo/p7RISPPctq0Qu6e2hcq1hjjPBh5KPabKv8HK0TzEc+JiOQ33SHOYz5/Mp
 ytTgrMrdQqbOYFs4dg7i5M5ia1/wXBa077OW6X8OtZjZ6icdB9tTwjq5plOZ3VmWRFSg
 hxKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZbX29LeZ
Subject: [Buildroot] [PATCH v2 4/5] package/mupdf: bump to version 1.23.9
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpEcm9wIHBh
dGNoIHdoaWNoIGlzIG5vdyB1cHN0cmVhbS4KClNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJk
IDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgpbYnVtcCB0byAxLjIzLjldClNpZ25lZC1vZmYt
Ynk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiAuLi5p
c3NpbmctbGltaXRzLmgtaW5jbHVkZS1mb3ItVUlOVF9NQVgucGF0Y2ggfCA3MCAtLS0tLS0tLS0t
LS0tLS0tLS0tCiBwYWNrYWdlL211cGRmL211cGRmLmhhc2ggICAgICAgICAgICAgICAgICAgICAg
fCAgNCArLQogcGFja2FnZS9tdXBkZi9tdXBkZi5tayAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3MyBkZWxldGlvbnMoLSkK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL211cGRmLzAwMDEtQWRkLW1pc3NpbmctbGltaXRz
LmgtaW5jbHVkZS1mb3ItVUlOVF9NQVgucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL211cGRm
LzAwMDEtQWRkLW1pc3NpbmctbGltaXRzLmgtaW5jbHVkZS1mb3ItVUlOVF9NQVgucGF0Y2ggYi9w
YWNrYWdlL211cGRmLzAwMDEtQWRkLW1pc3NpbmctbGltaXRzLmgtaW5jbHVkZS1mb3ItVUlOVF9N
QVgucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDk1ZjJmODY2NjYuLjAwMDAw
MDAwMDAKLS0tIGEvcGFja2FnZS9tdXBkZi8wMDAxLUFkZC1taXNzaW5nLWxpbWl0cy5oLWluY2x1
ZGUtZm9yLVVJTlRfTUFYLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNzAgKzAsMCBAQAotRnJv
bSBlYmNlOWYxYjEyOWViYzhmMmIxN2FmYTAyYTRmZmNiOTQ1M2MxMWQ5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQotRnJvbTogPT9VVEYtOD9xP1JhcGhhPUMzPUFCbD0yME09QzM9QTlsb3R0ZT89
IDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLURhdGU6IE1vbiwgMjQgQXByIDIwMjMgMTc6Mjc6
MzUgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gQWRkIG1pc3NpbmcgbGltaXRzLmggaW5jbHVkZSBm
b3IgVUlOVF9NQVgKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47
IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotZW5jb2Rl
LWJhc2ljLmMgdXNlcyAnVUlOVF9NQVgnLCB3aGljaCBpcyBhdmFpbGFibGUgaW4gdGhlICdsaW1p
dHMuaCcKLWhlYWRlci4KLQotSW4gc29tZSBjb25maWd1cmF0aW9ucyB0aGF0IGJ1aWxkIHdpdGgg
emxpYiBmcm9tIFsxXSwgYnkgY2hhbmNlCi1saW1pdHMuaCBnZXRzIGluZGlyZWN0bHkgaW5jbHVk
ZWQgd2hlbiBpbmNsdWRpbmcgJ3otaW1wLmgnICh0aGUKLWluY2x1ZGVzIGFyZTogJ3otaW1wLmgn
IC0+ICd6bGliLmgnIC0+ICd6Y29uZi5oJyAtPiAnbGltaXRzLmgnKSwgc28KLXRoZSBidWlsZCBz
dWNjZWVkcy4KLQotV2hlbiB1c2luZyBvdGhlciB6bGliIGltcGxlbWVudGF0aW9ucyBob3dldmVy
IChmb3IgZXhhbXBsZSBmcm9tIFsyXSksCi1saW1pdHMuaCBpcyBub3QgbmVjZXNzYXJpbHkgaW5j
bHVkZWQgaW5kaXJlY3RseSwgd2hpY2ggbGVhZHMgdG8gdGhlCi1idWlsZCBmYWlsaW5nIGluIHRo
ZSBmb2xsb3dpbmcgd2F5OgotCi1zb3VyY2UvZml0ei9lbmNvZGUtYmFzaWMuYzogSW4gZnVuY3Rp
b24gJ2RlZmxhdGVfd3JpdGUnOgotc291cmNlL2ZpdHovZW5jb2RlLWJhc2ljLmM6MzQzOjI3OiBl
cnJvcjogJ1VJTlRfTUFYJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikK
LSAgMzQzIHwgICAgICAgICBuZXdidWZzaXplID0gbiA+PSBVSU5UX01BWCA/IFVJTlRfTUFYIDog
ZGVmbGF0ZUJvdW5kKCZzdGF0ZS0+eiwgbik7Ci0gICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn4KLXNvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jOjI2OjE6IG5vdGU6ICdV
SU5UX01BWCcgaXMgZGVmaW5lZCBpbiBoZWFkZXIgJzxsaW1pdHMuaD4nOyBkaWQgeW91IGZvcmdl
dCB0byAnI2luY2x1ZGUgPGxpbWl0cy5oPic/Ci0KLUFkZCB0aGUgbWlzc2luZyBpbmNsdWRlLCBz
byB0aGF0IHRoZSBidWlsZCBzdWNjZWVkcyBubyBtYXR0ZXIgaWYgemxpYgotaW5kaXJlY3RseSBp
bmNsdWRlcyAnbGltaXQuaCcgb3Igbm90LgotCi1TaW1pbGFybHksIGFsc28gYWRkIGl0IGluIG91
dHB1dC1wcy5jIHdoZXJlIGl0J3MgYWxzbyBtaXNzaW5nLgotCi1bMV06IGh0dHBzOi8vemxpYi5u
ZXQvCi1bMl06IGh0dHBzOi8vZ2l0aHViLmNvbS96bGliLW5nL3psaWItbmcKLQotU2lnbmVkLW9m
Zi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotVXBzdHJl
YW06IGh0dHBzOi8vYnVncy5naG9zdHNjcmlwdC5jb20vc2hvd19idWcuY2dpP2lkPTcwNjY2Nwot
LS0tCi0gc291cmNlL2ZpdHovZW5jb2RlLWJhc2ljLmMgfCAyICsrCi0gc291cmNlL2ZpdHovb3V0
cHV0LXBzLmMgICAgfCAyICsrCi0gMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKLQot
ZGlmZiAtLWdpdCBhL3NvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5jIGIvc291cmNlL2ZpdHovZW5j
b2RlLWJhc2ljLmMKLWluZGV4IDAzYTRmZjc2Yi4uODRmMGMzNWU2IDEwMDY0NAotLS0tIGEvc291
cmNlL2ZpdHovZW5jb2RlLWJhc2ljLmMKLSsrKyBiL3NvdXJjZS9maXR6L2VuY29kZS1iYXNpYy5j
Ci1AQCAtMjQsNiArMjQsOCBAQAotIAotICNpbmNsdWRlICJ6LWltcC5oIgotIAotKyNpbmNsdWRl
IDxsaW1pdHMuaD4KLSsKLSBzdHJ1Y3QgYWh4Ci0gewotIAlmel9vdXRwdXQgKmNoYWluOwotZGlm
ZiAtLWdpdCBhL3NvdXJjZS9maXR6L291dHB1dC1wcy5jIGIvc291cmNlL2ZpdHovb3V0cHV0LXBz
LmMKLWluZGV4IGVmMjJjM2NkNi4uM2RjOGVhMTdkIDEwMDY0NAotLS0tIGEvc291cmNlL2ZpdHov
b3V0cHV0LXBzLmMKLSsrKyBiL3NvdXJjZS9maXR6L291dHB1dC1wcy5jCi1AQCAtMjQsNiArMjQs
OCBAQAotIAotICNpbmNsdWRlICJ6LWltcC5oIgotIAotKyNpbmNsdWRlIDxsaW1pdHMuaD4KLSsK
LSB0eXBlZGVmIHN0cnVjdCBwc19iYW5kX3dyaXRlcl9zCi0gewotIAlmel9iYW5kX3dyaXRlciBz
dXBlcjsKLS0tIAotMi4zOS4xCi0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvbXVwZGYvbXVwZGYuaGFz
aCBiL3BhY2thZ2UvbXVwZGYvbXVwZGYuaGFzaAppbmRleCAxZjYzNjA5N2VkLi41ODAyMzVlZWNh
IDEwMDY0NAotLS0gYS9wYWNrYWdlL211cGRmL211cGRmLmhhc2gKKysrIGIvcGFja2FnZS9tdXBk
Zi9tdXBkZi5oYXNoCkBAIC0xLDggKzEsOCBAQAogIyBGcm9tIGh0dHBzOi8vbXVwZGYuY29tL2Rv
d25sb2Fkcy9pbmRleC5odG1sOgotc2hhMSAgYjk5MDc3MjlkNjA0ZjBiZjM4NDZiNDVjZDU4OTFl
MTBkN2E2NmUyNCAgbXVwZGYtMS4yMi4wLXNvdXJjZS50YXIubHoKK3NoYTEgIGQ3OTYwMGJjY2Q3
MGFiOWQwZThlZTE5ZGFlNGUyNzVmMmFmOTVjZWQgIG11cGRmLTEuMjMuOS1zb3VyY2UudGFyLmx6
CiAKICMgTG9jYWxseSBjb21wdXRlZDoKLXNoYTI1NiAgYmVkNzhhMGFiZjg0OTZiMzBjNTIzNDk3
MjkyZGU5NzlkYjYzM2VjYTU3ZTAyZjZjZDBmM2M3YzA0MjU1MWMzZSAgbXVwZGYtMS4yMi4wLXNv
dXJjZS50YXIubHoKK3NoYTI1NiAgMmMyZjg5ZGViOWY0MjViYTYzN2RhYzIyNjE5MWQ1NDdmMmI0
MDk3NWM0ZDIxYTM0MDk2NWY1MmMwMDFlMTVjNSAgbXVwZGYtMS4yMy45LXNvdXJjZS50YXIubHoK
IAogIyBIYXNoIGZvciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICA1N2M4ZmYzM2M5YzBjZmMzZWYw
MGU2NTBhMWNjOTEwZDdlZTQ3OWE4YmM1MDlmNmM5MjA5YTdjMmExMTM5OWQ2ICBDT1BZSU5HCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL211cGRmL211cGRmLm1rIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5t
awppbmRleCA0NjczYjg4MjkxLi40MDk5NzJkM2I2IDEwMDY0NAotLS0gYS9wYWNrYWdlL211cGRm
L211cGRmLm1rCisrKyBiL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKQEAgLTUsNyArNSw3IEBACiAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiAjIHB5dGhvbi1weW11cGRmJ3MgdmVyc2lvbiBtdXN0
IG1hdGNoIG11cGRmJ3MgdmVyc2lvbgotTVVQREZfVkVSU0lPTiA9IDEuMjIuMAorTVVQREZfVkVS
U0lPTiA9IDEuMjMuOQogTVVQREZfU09VUkNFID0gbXVwZGYtJChNVVBERl9WRVJTSU9OKS1zb3Vy
Y2UudGFyLmx6CiBNVVBERl9TSVRFID0gaHR0cHM6Ly9tdXBkZi5jb20vZG93bmxvYWRzL2FyY2hp
dmUKIE1VUERGX0xJQ0VOU0UgPSBBR1BMLTMuMCsKLS0gCjIuMzcuMwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
