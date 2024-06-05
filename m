Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEB3C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 15:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80FA484360;
	Wed,  5 Jun 2024 15:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7MxJxUXbySV; Wed,  5 Jun 2024 15:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70641843AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70641843AD;
	Wed,  5 Jun 2024 15:49:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F416E1BF5D7
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 15:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0922843AD
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 15:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuHCLFf6wUKS for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 15:49:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC38284360
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC38284360
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC38284360
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 15:49:36 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7eb324a9dceso76463739f.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 08:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717602575; x=1718207375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NDi+Y8F8bk6va9ryjcInZFAhsCYd7Dq/F21zmZH3ZPs=;
 b=AEsV5jwrYNJX2X9WjgQKbP4ZsCLA4DK3pMQF6B8GkWbyAnlM51naDyuPO4rs6zASyb
 olQmNCA7E3YbTcDdXQNBygSC/31VfbgCFaDxjLe0iIZc0FIzo8CbspoUjicttutoHJMB
 //EHqGPnI2fuh/5zd8z6IQgSUC4CmLrZRG1np8WRXY+kWbMnPltyWrAIdlX/ovIpEGio
 AfRhbu0bgZPYZSZh5yJwnNnrX2wGO7be6qOb/SGGYhaIe8GFBLCBCH/i8q80fC437q6g
 xdI17oJeGNWguGLLH8kwIE9eRbOjZpv3WlhCterqXq5CE2RSSp0oXt/yFGrerJ4/yL8s
 fEqQ==
X-Gm-Message-State: AOJu0YzNL81NZr3plwi1lkOtd8Wcrg986ni2MjksiFq+ofbxMN/t0fDw
 Nq6LXqx8KuKItfEbLfZPGn2Fa1WYVRhVGHAqSQOgTzo79pVeUywgnK+Qq2xW
X-Google-Smtp-Source: AGHT+IHekv2RvyicPQCgivMTWx6Cxsj5jfbGKaCdln4IDkPnzj/1uOi3lqRbb0MbMZBElWEURWTI5w==
X-Received: by 2002:a05:6602:158b:b0:7e1:acdd:962e with SMTP id
 ca18e2360f4ac-7eb3c7b7901mr325479339f.12.1717602575270; 
 Wed, 05 Jun 2024 08:49:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4b664e3440esm186515173.15.2024.06.05.08.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 08:49:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 09:49:31 -0600
Message-Id: <20240605154931.2893480-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717602575; x=1718207375; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NDi+Y8F8bk6va9ryjcInZFAhsCYd7Dq/F21zmZH3ZPs=;
 b=TzEsg8LhO4c4GJR+gJ/r45VtwjPuM+aPU41eEZ5yeDSJ2t3qCvwucyCVOZtTTrAs7a
 vSHoV1AQz372IdwIhXxXorbk3gGxrILD25ucli4DfUOHPU2Bxqj5tmLY0eAQyVnuqR0n
 eUVSMtb7JlsA79Tr1YaEIgbsOpWrq1Vh1e1tIDscnySd69OsAOQBQFrTdGjewg5Oyzpc
 GdG/zBvb2KLNtQtraoiL/swmgE9QtA4WuXmVmFgX2nn5fSCRXWR70jyWWpZzBpOsN2et
 /ZI3Feig6CbW6Oe3m0NFKBjwyhGxgXC9dPYTpT9bQNpxgFcdk18LYD6/NJQFtLzZ9O2j
 peIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TzEsg8Lh
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 254.13
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RHJvcCBwYXRjaCB3aGljaCBpcyBub3cgdXBzdHJlYW0uCgpGaXhlcyBzb21lIGlzc3VlcyB3aXRo
IG5ld2VyIGtlcm5lbCB2ZXJzaW9ucyBzbyBzaG91bGQgcHJvYmFibHkgZ28gaW4KbWFzdGVyLgoK
aHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC1zdGFibGUvY29tbWl0L2E0Y2U0MDk1
Y2U3N2NhNWRmNjgyN2UyNGI0N2NiYWE2NzU1MTdkMzkKClNpZ25lZC1vZmYtYnk6IEphbWVzIEhp
bGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgotLS0KIC4uLnJuaW5nLWFib3V0LWVt
cHR5LWRpcmVjdGl2ZS1hcmd1bWVudC5wYXRjaCB8IDQ1IC0tLS0tLS0tLS0tLS0tLS0tLS0KIHBh
Y2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLmhhc2ggICAgICAgICAgICAgICAgICB8ICAyICstCiBwYWNr
YWdlL3N5c3RlbWQvc3lzdGVtZC5tayAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogMyBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2Uvc3lzdGVtZC8wMDAxLWluc3RhbGwtZml4LWNvbXBpbGVyLXdhcm5pbmct
YWJvdXQtZW1wdHktZGlyZWN0aXZlLWFyZ3VtZW50LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9zeXN0ZW1kLzAwMDEtaW5zdGFsbC1maXgtY29tcGlsZXItd2FybmluZy1hYm91dC1lbXB0eS1k
aXJlY3RpdmUtYXJndW1lbnQucGF0Y2ggYi9wYWNrYWdlL3N5c3RlbWQvMDAwMS1pbnN0YWxsLWZp
eC1jb21waWxlci13YXJuaW5nLWFib3V0LWVtcHR5LWRpcmVjdGl2ZS1hcmd1bWVudC5wYXRjaApk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggOTQwOGE2ZGEwZS4uMDAwMDAwMDAwMAotLS0g
YS9wYWNrYWdlL3N5c3RlbWQvMDAwMS1pbnN0YWxsLWZpeC1jb21waWxlci13YXJuaW5nLWFib3V0
LWVtcHR5LWRpcmVjdGl2ZS1hcmd1bWVudC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQ1ICsw
LDAgQEAKLUZyb20gODA0MGZhNTVhMWNiYzM0ZGVkZTMyMDVhOTAyMDk1ZWNkMjZjMjFlMyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEx1Y2EgQm9jY2Fzc2kgPGJsdWNhQGRlYmlhbi5v
cmc+Ci1EYXRlOiBTYXQsIDI0IEZlYiAyMDI0IDEyOjA1OjQ0ICswMDAwCi1TdWJqZWN0OiBbUEFU
Q0hdIGluc3RhbGw6IGZpeCBjb21waWxlciB3YXJuaW5nIGFib3V0IGVtcHR5IGRpcmVjdGl2ZSBh
cmd1bWVudAotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hh
cnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAotCi1PbiBwcGM2NGVs
IHdpdGggZ2NjIDEzLjIgb24gVWJ1bnR1IDI0LjA0OgotCi0zcyBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gLi4vc3JjL2Jhc2ljL21hY3JvLmg6Mzg2LAotNDgzcyAgICAgICAgICAgICAgICAgIGZyb20g
Li4vc3JjL2Jhc2ljL2FsbG9jLXV0aWwuaDoxMCwKLTQ4M3MgICAgICAgICAgICAgICAgICBmcm9t
IC4uL3NyYy9zaGFyZWQvaW5zdGFsbC5jOjEyOgotNDgzcyAuLi9zcmMvc2hhcmVkL2luc3RhbGwu
YzogSW4gZnVuY3Rpb24g4oCYaW5zdGFsbF9jaGFuZ2VzX2R1bXDigJk6Ci00ODNzIC4uL3NyYy9z
aGFyZWQvaW5zdGFsbC5jOjQzMjo2NDogZXJyb3I6IOKAmCVz4oCZIGRpcmVjdGl2ZSBhcmd1bWVu
dCBpcyBudWxsIFstV2Vycm9yPWZvcm1hdC1vdmVyZmxvdz1dCi00ODNzICAgNDMyIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgZXJyID0gbG9nX2Vycm9yX2Vycm5vKGNoYW5nZXNbaV0udHlwZSwg
IkZhaWxlZCB0byAlcyB1bml0LCB1bml0ICVzIGRvZXMgbm90IGV4aXN0LiIsCi00ODNzICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KLTQ4
M3MgLi4vc3JjL3NoYXJlZC9pbnN0YWxsLmM6NDMyOjc1OiBub3RlOiBmb3JtYXQgc3RyaW5nIGlz
IGRlZmluZWQgaGVyZQotNDgzcyAgIDQzMiB8ICAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9
IGxvZ19lcnJvcl9lcnJubyhjaGFuZ2VzW2ldLnR5cGUsICJGYWlsZWQgdG8gJXMgdW5pdCwgdW5p
dCAlcyBkb2VzIG5vdCBleGlzdC4iLAotCi1VcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3N5
c3RlbWQvc3lzdGVtZC9jb21taXQvODA0MGZhNTVhMWNiYzM0ZGVkZTMyMDVhOTAyMDk1ZWNkMjZj
MjFlMwotU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+Ci0tLS0KLSBzcmMvc2hhcmVkL2luc3RhbGwuYyB8IDcgKysrKystLQotIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQg
YS9zcmMvc2hhcmVkL2luc3RhbGwuYyBiL3NyYy9zaGFyZWQvaW5zdGFsbC5jCi1pbmRleCBmYWJm
NWRiN2VkMmUxLi5jM2E5NGQxOTEyMTY1IDEwMDY0NAotLS0tIGEvc3JjL3NoYXJlZC9pbnN0YWxs
LmMKLSsrKyBiL3NyYy9zaGFyZWQvaW5zdGFsbC5jCi1AQCAtMzQwLDkgKzM0MCwxMiBAQCB2b2lk
IGluc3RhbGxfY2hhbmdlc19kdW1wKGludCByLCBjb25zdCBjaGFyICp2ZXJiLCBjb25zdCBJbnN0
YWxsQ2hhbmdlICpjaGFuZ2VzLAotICAgICAgICAgYXNzZXJ0KHZlcmIgfHwgciA+PSAwKTsKLSAK
LSAgICAgICAgIGZvciAoc2l6ZV90IGkgPSAwOyBpIDwgbl9jaGFuZ2VzOyBpKyspIHsKLS0gICAg
ICAgICAgICAgICAgaWYgKGNoYW5nZXNbaV0udHlwZSA8IDApCi0tICAgICAgICAgICAgICAgICAg
ICAgICAgYXNzZXJ0KHZlcmIpOwotICAgICAgICAgICAgICAgICBhc3NlcnQoY2hhbmdlc1tpXS5w
YXRoKTsKLSsgICAgICAgICAgICAgICAgLyogVGhpcyB0cmllcyB0byB0ZWxsIHRoZSBjb21waWxl
ciB0aGF0IGl0J3Mgc2FmZSB0byB1c2UgJ3ZlcmInIGluIGEgc3RyaW5nIGZvcm1hdCBpZiB0aGVy
ZQotKyAgICAgICAgICAgICAgICAgKiB3YXMgYW4gZXJyb3IsIGJ1dCB0aGUgY29tcGlsZXIgZG9l
c24ndCBjYXJlIGFuZCBmYWlscyBhbnl3YXksIHNvIHN0cm5hKHZlcmIpIGlzIHVzZWQKLSsgICAg
ICAgICAgICAgICAgICogdG9vLiAqLwotKyAgICAgICAgICAgICAgICBhc3NlcnQodmVyYiB8fCBj
aGFuZ2VzW2ldLnR5cGUgPj0gMCk7Ci0rICAgICAgICAgICAgICAgIHZlcmIgPSBzdHJuYSh2ZXJi
KTsKLSAKLSAgICAgICAgICAgICAgICAgLyogV2hlbiBtYWtpbmcgY2hhbmdlcyBoZXJlLCBtYWtl
IHN1cmUgdG8gYWxzbyBjaGFuZ2UgaW5zdGFsbF9lcnJvcigpIGluIGRidXMtbWFuYWdlci5jLiAq
LwotIApkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQuaGFzaCBiL3BhY2thZ2Uv
c3lzdGVtZC9zeXN0ZW1kLmhhc2gKaW5kZXggZTU1ODhmMDZhMi4uZjk5OWQwZDM0ZSAxMDA2NDQK
LS0tIGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQuaGFzaAorKysgYi9wYWNrYWdlL3N5c3RlbWQv
c3lzdGVtZC5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBzaGEyNTYgbG9jYWxseSBjb21wdXRlZAot
c2hhMjU2ICAzZDIzMDAzZWE4ODZkYmZmYTViYzg0YWQ3MmM2ZWRjYmRlNjJkMzJkYmRlYzUwNmUz
MDg2MjRlMWRhNTA5Y2IwICBzeXN0ZW1kLTI1NC45LnRhci5negorc2hhMjU2ICAyNmFjNzNjMjEw
ODEzMmIxZDExZmY5MzllOGIxYmVjZTQyZjFjMWRhMDNmZGY0YTI0MmFmNWE3Y2YzYWMzNGYxICBz
eXN0ZW1kLTI1NC4xMy50YXIuZ3oKIHNoYTI1NiAgYWIxNWZkNTI2YmQ4ZGQxOGE5ZTc3ZWJjMTM5
NjU2YmY0ZDMzZTk3ZmM3MjM4Y2QxMWJmNjBlMmI5Yjg2NjZjNiAgTElDRU5TRS5HUEwyCiBzaGEy
NTYgIGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBlNTZjOTdhNjRmZTNhZGIwNjM3OTlk
OGFiMDMyZmU1NTEgIExJQ0VOU0UuTEdQTDIuMQogc2hhMjU2ICBlNWE4NjQ1YWQ5NGFhYjI0ZTMx
MmRkMGM2YmUyYWE1NDIzNmViOTM3NDQ4MGIxYjE0ZWE1YzYxNTk4ODc0ZmQ1ICBMSUNFTlNFUy9C
U0QtMi1DbGF1c2UudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tayBi
L3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCmluZGV4IDQ4M2IyZDI0YTUuLjZiMzU1MzcyM2Mg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCisrKyBiL3BhY2thZ2Uvc3lz
dGVtZC9zeXN0ZW1kLm1rCkBAIC0xOSw3ICsxOSw3IEBACiAjIC0gRGlmZiBzeXN1c2Vycy5kIHdp
dGggdGhlIHByZXZpb3VzIHZlcnNpb24KICMgLSBEaWZmIGZhY3RvcnkvZXRjL25zc3dpdGNoLmNv
bmYgd2l0aCB0aGUgcHJldmlvdXMgdmVyc2lvbgogIyAgIChkZXRhaWxzIGFyZSBvZnRlbiBzcHJp
bmtsZWQgYXJvdW5kIGluIFJFQURNRSBhbmQgbWFucGFnZXMpCi1TWVNURU1EX1ZFUlNJT04gPSAy
NTQuOQorU1lTVEVNRF9WRVJTSU9OID0gMjU0LjEzCiBTWVNURU1EX1NJVEUgPSAkKGNhbGwgZ2l0
aHViLHN5c3RlbWQsc3lzdGVtZC1zdGFibGUsdiQoU1lTVEVNRF9WRVJTSU9OKSkKIFNZU1RFTURf
TElDRU5TRSA9IFwKIAlMR1BMLTIuMSssIFwKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
