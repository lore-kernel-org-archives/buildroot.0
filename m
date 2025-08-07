Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1A2C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 09:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9271884D39;
	Thu,  7 Aug 2025 09:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfsL0ltQ68Fe; Thu,  7 Aug 2025 09:42:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A24FF84D3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A24FF84D3E;
	Thu,  7 Aug 2025 09:42:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B391BD79
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 09:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A532241E7D
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 09:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwD5-gCCQ5tK for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 09:42:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73BFF42841
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73BFF42841
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73BFF42841
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 09:42:10 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b7823559a5so357634f8f.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 02:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754559728; x=1755164528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PMvmtiiYd1qZnJoxe6ihM/zL2fMT18VfNOr5VvWsZuQ=;
 b=uq3UCUpsEA3zJHPUAOlyxdT2MCRlYZU04NERTFfm+ej0F4jt5bdOyj/hwwxkPqFGD/
 JL5YzeHxYvQopLjK18yAALuZRWJBsI1rrizv5i5bsprsPIJ7Sqh9/LOo0JgDT5MEFndV
 /0vDMsG50Y4a/lsIv2Z6/r9PoG8yOk7VqEO4HVRk+G+VPa3PpwDw/Xme5pCD6qDs/e1l
 cUQtGrznOFTL1KRq8VYjCYh35sgmYR9hlOy/Wxh8LbYrHTldN5VIt9SH9h2V2RKbXWMs
 VgjXjmdXO8LmVhNFIxEQ+zZ4rTine3jNOIUwke08lup2WkWB07zlCMfWMIX6v1//pwfI
 k3CA==
X-Gm-Message-State: AOJu0YyzIuwRGhABFrAJy9okWbpKvpK3h0OJviQV027xeHksKPykEWU2
 ICQLbFE9IsPHjmdSO0k3Qyl4ksoI+L4BYqT0Lvraaz6zxkee4khhw51Ud8mUBAQNTqW84Dp0eNI
 ywFdq
X-Gm-Gg: ASbGncsErge2XS7EMsU0kxoEST9HhcnXnrCui0OqKchtExVsneux/cQttfvfDXF0hU/
 kjGMual+2bVCCjEpGEopApuTS4fFh6JuI6EX2SWWsHoxgaTXr+emIb18ScElnyHMXGiJSqYF+0p
 Iq43DSg1Z7mkLbrZxBNsQrLjppAhaC0AJdHkf6+g5fMBGcxjeKX/qUohkxYEqKcLp1lMtw9s+kf
 sAGy7nGbfhvm7C15YyaOeV7Qlu+UNgiNXF4cmtNJvaAPm+lbAn1VQ/4FoWuhvPaTx6f5Wh337dp
 etnHOMssIgtAUq8l40n8HfueTNN6164slG+iHqXaB/faLkoGGsE7gCXJ43G9StbHespCDsGAETr
 JvL52tg699iDZtIO197vokm61TNw/QijBrOQqfUK+jdyvK7jB0KEoKnDVr30xLE/Jjt2TbBrckS
 /zSLGCWSZbNGnV+nEBgw==
X-Google-Smtp-Source: AGHT+IH3QSO8ebumbrFD2U+ZI6alNtea/p2JFvPEqVJX4ZVPcOaSEghhkpRge3S+/giza9YyKITSug==
X-Received: by 2002:a5d:5f44:0:b0:3b8:d15f:1d4a with SMTP id
 ffacd0b85a97d-3b8f9f702femr1870580f8f.41.1754559728249; 
 Thu, 07 Aug 2025 02:42:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:e33c:e0db:a232:b36a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c338c7dsm26248073f8f.0.2025.08.07.02.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 02:42:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu,  7 Aug 2025 11:42:04 +0200
Message-ID: <20250807094204.3505777-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1754559728; x=1755164528;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PMvmtiiYd1qZnJoxe6ihM/zL2fMT18VfNOr5VvWsZuQ=;
 b=DE0SiQ0+YGfxWnWOT6V6Hb4cVOr/8ygyctySs+pcnPsqC/OTsAEIDbJdQs5gGJNGBE
 DTtOes5DotVlSGhHhby7Hi6FiWFHZqAsQLUaJbIF0DytOhHGOaaCfvEnVAVkJ4Rmpet9
 rqxtFStAHO0AOPRLXsPJmw6+UCWmxXnVlUylM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DE0SiQ0+
Subject: [Buildroot] [PATCH 1/1] package/ufs-utils: fix hash file
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

SSB0aGluayB0aGUgaXNzdWUgaXMgY2F1c2VkIGJ5IFBSIFsxXSBiZWluZyBtZXJnZWQgd2l0aG91
dCBhIHJlYmFzZSwKd2hpY2ggbWF5IGhhdmUgdHJpZ2dlcmVkIGFuIGF1dG9tYXRpYyByZS1nZW5l
cmF0aW9uIG9mIHRoZSB0YXIuZ3oKYXJjaGl2ZS4gVGVzdHMgc2hvdyB0aGF0IHRoZSB0YXJiYWxs
IHN0b3JlZCBpbiBCdWlsZHJvb3QgbWlycm9ycyBoYXMgYQpTSEExIG1hdGNoaW5nIHRoZSBvbmUg
aW4gdGhlIGhhc2ggZmlsZSwgd2hpbGUgdGhlIG9uZSBkb3dubG9hZGVkIGZyb20KdGhlIFNhbkRp
c2sgcmVwb3NpdG9yeSBoYXMgYSBkaWZmZXJlbnQgU0hBMToKCndnZXQgLW5kIC10IDMgLS1jb25u
ZWN0LXRpbWVvdXQ9MTAgLU8gJy9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxkcm9vdC9vdXRwdXQv
YnVpbGQvLnVmcy11dGlscy03LjE0LjEyLnRhci5nei42OEoxV0ovb3V0cHV0JyAnaHR0cHM6Ly9n
aXRodWIuY29tL1NhbkRpc2stT3Blbi1Tb3VyY2UvdWZzLXV0aWxzL2FyY2hpdmUvdjcuMTQuMTIv
dWZzLXV0aWxzLTcuMTQuMTIudGFyLmd6JwotLTIwMjUtMDgtMDcgMTE6MDc6MzItLSAgaHR0cHM6
Ly9naXRodWIuY29tL1NhbkRpc2stT3Blbi1Tb3VyY2UvdWZzLXV0aWxzL2FyY2hpdmUvdjcuMTQu
MTIvdWZzLXV0aWxzLTcuMTQuMTIudGFyLmd6ClJlc29sdmluZyBnaXRodWIuY29tIChnaXRodWIu
Y29tKS4uLiAxNDAuODIuMTIxLjQKQ29ubmVjdGluZyB0byBnaXRodWIuY29tIChnaXRodWIuY29t
KXwxNDAuODIuMTIxLjR8OjQ0My4uLiBjb25uZWN0ZWQuCkhUVFAgcmVxdWVzdCBzZW50LCBhd2Fp
dGluZyByZXNwb25zZS4uLiAzMDIgRm91bmQKTG9jYXRpb246IGh0dHBzOi8vY29kZWxvYWQuZ2l0
aHViLmNvbS9TYW5EaXNrLU9wZW4tU291cmNlL3Vmcy11dGlscy90YXIuZ3ovcmVmcy90YWdzL3Y3
LjE0LjEyIFtmb2xsb3dpbmddCi0tMjAyNS0wOC0wNyAxMTowNzozMi0tICBodHRwczovL2NvZGVs
b2FkLmdpdGh1Yi5jb20vU2FuRGlzay1PcGVuLVNvdXJjZS91ZnMtdXRpbHMvdGFyLmd6L3JlZnMv
dGFncy92Ny4xNC4xMgpSZXNvbHZpbmcgY29kZWxvYWQuZ2l0aHViLmNvbSAoY29kZWxvYWQuZ2l0
aHViLmNvbSkuLi4gMTQwLjgyLjEyMS4xMApDb25uZWN0aW5nIHRvIGNvZGVsb2FkLmdpdGh1Yi5j
b20gKGNvZGVsb2FkLmdpdGh1Yi5jb20pfDE0MC44Mi4xMjEuMTB8OjQ0My4uLiBjb25uZWN0ZWQu
CkhUVFAgcmVxdWVzdCBzZW50LCBhd2FpdGluZyByZXNwb25zZS4uLiAyMDAgT0sKTGVuZ3RoOiB1
bnNwZWNpZmllZCBbYXBwbGljYXRpb24veC1nemlwXQpTYXZpbmcgdG86IOKAmC9ob21lL2Rhcmlv
L3Byb2plY3RzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvLnVmcy11dGlscy03LjE0LjEyLnRhci5n
ei42OEoxV0ovb3V0cHV04oCZCgovaG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJvb3Qvb3V0cHV0
L2IgICAgIFsgPD0+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBdICA3Ny43NksgIC0tLi1LQi9zICAg
IGluIDAuMDZzCgoyMDI1LTA4LTA3IDExOjA3OjMyICgxLjMyIE1CL3MpIC0g4oCYL2hvbWUvZGFy
aW8vcHJvamVjdHMvYnVpbGRyb290L291dHB1dC9idWlsZC8udWZzLXV0aWxzLTcuMTQuMTIudGFy
Lmd6LjY4SjFXSi9vdXRwdXTigJkgc2F2ZWQgWzc5NjIzXQoKRVJST1I6IHdoaWxlIGNoZWNraW5n
IGhhc2hlcyBmcm9tIHBhY2thZ2UvdWZzLXV0aWxzL3Vmcy11dGlscy5oYXNoCkVSUk9SOiB1ZnMt
dXRpbHMtNy4xNC4xMi50YXIuZ3ogaGFzIHdyb25nIHNoYTI1NiBoYXNoOgpFUlJPUjogZXhwZWN0
ZWQ6IDk2Y2Q1Nzg3MjI4MzBiYzdkOGE0MThkNTI4YTMwNjdjMGI4MGFkNDM3ZjY2YzMzMzNlYmMy
MzhmZTUyNDM2YTIKRVJST1I6IGdvdCAgICAgOiA5NmQxNWNlNGIwOTkwMDQ5ZDgxMmQyNGFmYzJh
NjIyNDBjMWE0YWE1MzRlYTZhZWJiNWFlYmQzNGRjY2IyZGFjCkVSUk9SOiBJbmNvbXBsZXRlIGRv
d25sb2FkLCBvciBtYW4taW4tdGhlLW1pZGRsZSAoTUlUTSkgYXR0YWNrCndnZXQgLW5kIC10IDMg
LS1jb25uZWN0LXRpbWVvdXQ9MTAgLU8gJy9ob21lL2RhcmlvL3Byb2plY3RzL2J1aWxkcm9vdC9v
dXRwdXQvYnVpbGQvLnVmcy11dGlscy03LjE0LjEyLnRhci5nei5IWXBxS20vb3V0cHV0JyAnaHR0
cHM6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQvdWZzLXV0aWxzL3Vmcy11dGlscy03LjE0LjEyLnRh
ci5neicKLS0yMDI1LTA4LTA3IDExOjA3OjMyLS0gIGh0dHBzOi8vc291cmNlcy5idWlsZHJvb3Qu
bmV0L3Vmcy11dGlscy91ZnMtdXRpbHMtNy4xNC4xMi50YXIuZ3oKUmVzb2x2aW5nIHNvdXJjZXMu
YnVpbGRyb290Lm5ldCAoc291cmNlcy5idWlsZHJvb3QubmV0KS4uLiAyNjA2OjQ3MDA6MjA6OjY4
MWE6MjUsIDI2MDY6NDcwMDoyMDo6YWM0Mzo0ODM4LCAyNjA2OjQ3MDA6MjA6OjY4MWE6MTI1LCAu
Li4KQ29ubmVjdGluZyB0byBzb3VyY2VzLmJ1aWxkcm9vdC5uZXQgKHNvdXJjZXMuYnVpbGRyb290
Lm5ldCl8MjYwNjo0NzAwOjIwOjo2ODFhOjI1fDo0NDMuLi4gY29ubmVjdGVkLgpIVFRQIHJlcXVl
c3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMjAwIE9LCkxlbmd0aDogNzk2MTkgKDc4Sykg
W2FwcGxpY2F0aW9uL3gtZ3Rhci1jb21wcmVzc2VkXQpTYXZpbmcgdG86IOKAmC9ob21lL2Rhcmlv
L3Byb2plY3RzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvLnVmcy11dGlscy03LjE0LjEyLnRhci5n
ei5IWXBxS20vb3V0cHV04oCZCgovaG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJvb3Qvb3V0cHV0
L2IgMTAwJVs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT5dICA3Ny43NUsgIC0tLi1LQi9zICAg
IGluIDAuMDJzCgoyMDI1LTA4LTA3IDExOjA3OjMzICg0Ljk2IE1CL3MpIC0g4oCYL2hvbWUvZGFy
aW8vcHJvamVjdHMvYnVpbGRyb290L291dHB1dC9idWlsZC8udWZzLXV0aWxzLTcuMTQuMTIudGFy
Lmd6LkhZcHFLbS9vdXRwdXTigJkgc2F2ZWQgWzc5NjE5Lzc5NjE5XQoKdWZzLXV0aWxzLTcuMTQu
MTIudGFyLmd6OiBPSyAoc2hhMjU2OiA5NmNkNTc4NzIyODMwYmM3ZDhhNDE4ZDUyOGEzMDY3YzBi
ODBhZDQzN2Y2NmMzMzMzZWJjMjM4ZmU1MjQzNmEyKQoKRml4ZXM6Cmh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9iNjkvYjY5NDcyZDJlYWYyN2RmY2M5N2MzMDBiOTY4Njhj
YWI1MjA2OGNlOQpodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNDI5LzQy
OWEyODY2OWQ5OGM2ZjQyNGYzM2EyMTFlYjBlYmI0OGM2ZjQ1NTMKaHR0cHM6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm9yZy9yZXN1bHRzLzAxYi8wMWI5MGJkN2Q3OGEzNGFlNzMyMTkxYjc1MGVmYzY5
ZjE5NWM3OGVjCmh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9hMDkvYTA5
N2U0ODMxNGJlMmY1MjIyMzg4ODBlOWFiNDUyOWNlYmVmZjQ3YgoKWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9TYW5EaXNrLU9wZW4tU291cmNlL3Vmcy11dGlscy9wdWxsLzcwClNpZ25lZC1vZmYtYnk6
IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0t
CiBwYWNrYWdlL3Vmcy11dGlscy91ZnMtdXRpbHMuaGFzaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdWZz
LXV0aWxzL3Vmcy11dGlscy5oYXNoIGIvcGFja2FnZS91ZnMtdXRpbHMvdWZzLXV0aWxzLmhhc2gK
aW5kZXggODkwNTM5OTZhYjNiLi5lMzIyNzU5NTAyMjkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdWZz
LXV0aWxzL3Vmcy11dGlscy5oYXNoCisrKyBiL3BhY2thZ2UvdWZzLXV0aWxzL3Vmcy11dGlscy5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIDk2Y2Q1Nzg3
MjI4MzBiYzdkOGE0MThkNTI4YTMwNjdjMGI4MGFkNDM3ZjY2YzMzMzNlYmMyMzhmZTUyNDM2YTIg
IHVmcy11dGlscy03LjE0LjEyLnRhci5negorc2hhMjU2ICA5NmQxNWNlNGIwOTkwMDQ5ZDgxMmQy
NGFmYzJhNjIyNDBjMWE0YWE1MzRlYTZhZWJiNWFlYmQzNGRjY2IyZGFjICB1ZnMtdXRpbHMtNy4x
NC4xMi50YXIuZ3oKIHNoYTI1NiAgMjMxZjdlZGNjNzM1MmQ3NzM0YTk2ZWVmMGI4MDMwZjc3OTgy
Njc4YzUxNjg3NmZjYjgxZTI1YjMyZDY4NTY0YyAgQ09QWUlORwotLSAKMi40My4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
