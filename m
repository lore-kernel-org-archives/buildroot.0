Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF017C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 17:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1673781518;
	Mon, 14 Apr 2025 17:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUs5T6eTwhlD; Mon, 14 Apr 2025 17:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7CB080CE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7CB080CE1;
	Mon, 14 Apr 2025 17:09:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18917205
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09A7780BEE
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZb8mj87knvr for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 17:09:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0211A810CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0211A810CA
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0211A810CA
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:09:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso5981209f8f.0
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 10:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744650567; x=1745255367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pcnule7IUIzJ/Ycjau4P6Yrza+KxOx6KQ9VO+XwVL8E=;
 b=a/Hc9MbgUJilmL4ySFgy51pBl1ReaiqAJMkzyaCfy/xzOCs1lLbV38alj2ksIuAfiD
 93qhkAnshDC4I/Y9Ffz68GoIO6BT4ebivabKnk4PHH6QPdBcbb6cQgOu5JfXqpR+XoiJ
 dhlSebkbd9NXmCpwCK0DPt032H4l53jyfMdZkZ+X/FzcDSePricsHVAJ+0C2ljLR1B8x
 POCc4w8oGWztcQ7YRxtTA2Ful5KswFeiQwBYrGphko3H6EhtMBCQNG7RWYSdR0WGu4Sl
 VI7OQKD93N3aEjhyHVH+INqG2D9WZus7BXUfaoLA0wv555Y6UcsLVjJ/4bVjNZZyoLrc
 mu+Q==
X-Gm-Message-State: AOJu0YwxJpj9DZOvNsPmcpcluVkltI2op6O+fxcDkwiYxBWTduwlkiBI
 ZD3VXHZp8hcNKLP4uoy2Q2RN8yFHVaQgMdukbaS3Vw48k44rUkcT/309pmwocDp9GBk6N5xMD43
 xFIjWCw==
X-Gm-Gg: ASbGncvoovrGUEUxeJKMD7c+BVrdPLjk8tltxXlUUbr8LNm8MK1Ox7HjdG23odi5ZwP
 1mXfg0HasAI0PPMNg9+Ez+bITZ4AAt+o9EA5V0IsB+WlPq4KCEc/QsRNaRmmBHpdwB4uB6yXJwz
 qFIebFOPmEcADR+gx6Y9bEruspaRNMHKXrobsUAdSC9wb+D4UByz7Nw1fIIj50hqstjDK8xVPsB
 ndc/4HsUOGzBF3hy44QJY5EVv5OEKLAEOsCH2tFIIaYwIHgc04dgJGzH/iPyFmDi45ZnfPqE+wP
 NEb8KTuyRH7G/Y2OY8HxUvm9sNTbGSvmiuswGe0eKAUZyZEzyn/re35SZwWQnO8ToefxLPc=
X-Google-Smtp-Source: AGHT+IEAryS9X/M/hKWNX0dUJ61idNlVIQ01Hl1xyZqch+IGJaZw+yFkYlAhDjxDg4HZ5EHUOGE6sA==
X-Received: by 2002:a5d:648d:0:b0:39c:dfa:c92a with SMTP id
 ffacd0b85a97d-39eaaebab02mr10242761f8f.36.1744650566754; 
 Mon, 14 Apr 2025 10:09:26 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae978023sm11608529f8f.47.2025.04.14.10.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 10:09:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 19:09:19 +0200
Message-ID: <20250414170922.1230348-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414170922.1230348-1-raphael.melotte@mind.be>
References: <20250414170922.1230348-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744650567; x=1745255367; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pcnule7IUIzJ/Ycjau4P6Yrza+KxOx6KQ9VO+XwVL8E=;
 b=TKgZMf6DOSX7mpm2qn1DOs2NVqIYqMI6k+GY6qSnCKmvqbQY9bjCV3L0tJ1116zUTQ
 E5YpDY/+2Psugc08j4eiD5oBpYtpwWqm7rUMvSGV1oGpGfrLbbzJRf6Vf3Wf8DTa/+85
 F/vpN0uHrtteJv6nq6FfUZLpxsY2JSQGzhAf6fh325ounWWGQ6r/b4D5DjI6buGB+Bjz
 FIcuXgnKH2GIDsp+sGCQrhBhxQZQOQ0mj+1wd0SuFoNLVhNppsgfAgiP/7PJRn7fIpsQ
 C/HBeo37rz/HEysYQY5/mvEl3SUQ0KUAtQAxDh0n+f0yqCzXyygUgwfFd4XGf+8sQO//
 8P0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TKgZMf6D
Subject: [Buildroot] [PATCH 2/2] package/python-urllib3: bump to version
 2.4.0
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVsZWFzZSBub3RlczogaHR0cHM6Ly9naXRodWIuY29tL3VybGxpYjMvdXJsbGliMy9yZWxlYXNl
cy90YWcvMi40LjAKClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1l
bG90dGVAbWluZC5iZT4KLS0tCiBwYWNrYWdlL3B5dGhvbi11cmxsaWIzL3B5dGhvbi11cmxsaWIz
Lmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvcHl0aG9uLXVybGxpYjMvcHl0aG9uLXVybGxpYjMubWsg
ICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tdXJsbGliMy9weXRob24tdXJsbGliMy5o
YXNoIGIvcGFja2FnZS9weXRob24tdXJsbGliMy9weXRob24tdXJsbGliMy5oYXNoCmluZGV4IGY4
MGVkNmVhZmMuLjIzOTExMDhlMjYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXVybGxpYjMv
cHl0aG9uLXVybGxpYjMuaGFzaAorKysgYi9wYWNrYWdlL3B5dGhvbi11cmxsaWIzL3B5dGhvbi11
cmxsaWIzLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9w
eXBpLm9yZy9weXBpL3VybGxpYjMvanNvbgotbWQ1ICA2Mzg4YWZkMDYyY2YyZTFlZjI3ODQzNzM4
NjI5ZGJjMSAgdXJsbGliMy0yLjMuMC50YXIuZ3oKLXNoYTI1NiAgZjhjNTQ0OWIzY2YwODYxNjc5
Y2U3ZTA1MDNjN2I0NGI1ZWM5ODFiZWMwZDFkMzc5NWEwN2YxYmE5NmYwMjA0ZCAgdXJsbGliMy0y
LjMuMC50YXIuZ3oKK21kNSAgNzg3MTA0Y2RlY2Q3MGU2Njg4NzEzZjhhMDc5ZmZkM2YgIHVybGxp
YjMtMi40LjAudGFyLmd6CitzaGEyNTYgIDQxNGJjNjUzNWI3ODdmZWJkNzU2NzgwNGNjMDE1ZmVl
MzlkYWFiOGFkODYyNjhmMTMxMGE5MjUwNjk3ZGU0NjYgIHVybGxpYjMtMi40LjAudGFyLmd6CiAj
IExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2ICAxMzBlM2E2NGQ1ZmRk
NWQwOTZhNzUyNjk0NjM0YTdkOWRmMjg0NDY5ZGU4NmU1NzMyMTAwMjY4MDQxZTNkNjg2ICBMSUNF
TlNFLnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tdXJsbGliMy9weXRob24tdXJsbGli
My5tayBiL3BhY2thZ2UvcHl0aG9uLXVybGxpYjMvcHl0aG9uLXVybGxpYjMubWsKaW5kZXggOTEx
Y2NhYjQ0NS4uNzI5NDc0MjkwOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tdXJsbGliMy9w
eXRob24tdXJsbGliMy5taworKysgYi9wYWNrYWdlL3B5dGhvbi11cmxsaWIzL3B5dGhvbi11cmxs
aWIzLm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlU
SE9OX1VSTExJQjNfVkVSU0lPTiA9IDIuMy4wCitQWVRIT05fVVJMTElCM19WRVJTSU9OID0gMi40
LjAKIFBZVEhPTl9VUkxMSUIzX1NPVVJDRSA9IHVybGxpYjMtJChQWVRIT05fVVJMTElCM19WRVJT
SU9OKS50YXIuZ3oKLVBZVEhPTl9VUkxMSUIzX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhv
c3RlZC5vcmcvcGFja2FnZXMvYWEvNjMvZTUzZGE4NDUzMjBiNzU3YmYyOWVmNmE5MDYyZjVjNjY5
ZmU5OTc5NzNmOTY2MDQ1Y2IwMTljM2Y0YjY2CitQWVRIT05fVVJMTElCM19TSVRFID0gaHR0cHM6
Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzhhLzc4LzE2NDkzZDljMzg2ZDhlNjBl
NDQyYTM1ZmVhYzVlMDBmMDkxM2MwZjRiN2MyMTdjMTFlOGVjMmZmNTNlMAogUFlUSE9OX1VSTExJ
QjNfTElDRU5TRSA9IE1JVAogUFlUSE9OX1VSTExJQjNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0Uu
dHh0CiBQWVRIT05fVVJMTElCM19DUEVfSURfVkVORE9SID0gcHl0aG9uCi0tIAoyLjQ5LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
