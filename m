Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E78C369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 17:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A0F80ACD;
	Mon, 14 Apr 2025 17:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Tu0jr5CPu9R; Mon, 14 Apr 2025 17:14:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F60680D5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F60680D5D;
	Mon, 14 Apr 2025 17:14:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21FEC205
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 133C980D5D
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNAyoCuD8Is0 for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 17:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2386A80567
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2386A80567
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2386A80567
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 17:14:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso23800225e9.0
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 10:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744650877; x=1745255677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pcnule7IUIzJ/Ycjau4P6Yrza+KxOx6KQ9VO+XwVL8E=;
 b=OJfSHXTrET1tZ9ybLKBkorNK6DIzevJIHzHGBc0gT9yJleBkaN1O4WpcdDasNvE8Gf
 ubbWlSfGWr8P63/OTwK0OBXYddf8OcZOCp60USWeBewg0aE3Z9cow4NX+nrK0K9vA9yZ
 JzEA1Hw/f1xyhHEJRejPJRUlG+62TT3O5EboTlsPXqJeBNNT9QqbaUwObPpozzxmI9EK
 26zKT/ddLoQFNx3LyG3jeXyEG66YNkwChjxFagDaVAECLc/J60fbpBm7QtxB7EqEqVE2
 1ueKHTlyYJtupppmdoQv/BMQXr9SIxE40Lld7nKXibjvfSJgjhunfAFyaIT6QBB1F19T
 ciEA==
X-Gm-Message-State: AOJu0YxZrw6KCxGbQU2i/cRD55Je0RoITHYBLwXqE7zx0q+JdjvH/1xQ
 tFAJc0Yauma079bIcxzbGP7g1IMCYYBvWnzeBAh3r7rTV8NF17QA8gXjdClao7b4XodRmjQnxG1
 LA/dyAQ==
X-Gm-Gg: ASbGncvtuQptmOgHyNiLnDVyhVWfROca3vPHpcdTwHvt5h1ILYTpYJOTb+78ej63pQ9
 PRhc4B1dpRFKrrWUSQQNrayWwwKjr8/X4mQVd4FoffGSD6rAc744UsVzXmN1T1DlatXtt/uR9hA
 DogOUoKyvwbqEkwonFPbt6cXRjKfSe2zr3mmpeDQWIYNUMn72SZ0tMa6dhREFDY7EnTABikuz5F
 t/Z2XDY2QCPRV8XWnGk8v4mIR7R0UVHMWciluPSKqdEzyR36Ggqv8YEDE3zJgX3Vj79Tflj+U+U
 42SuKwuagANoMiqfh0y0s7bf+h/tnqzZIx1Txc5NIHM1bVuT15/afuu8ieYJ
X-Google-Smtp-Source: AGHT+IG4+Lm/Bm9y2bmJpSeSrH0txw03xixGjCpCRY7vjVbThjfqwZwoA9FryQhlP8N5jhlerItKjQ==
X-Received: by 2002:a05:6000:40dd:b0:391:13ef:1b1b with SMTP id
 ffacd0b85a97d-39eaaea8457mr9188729f8f.30.1744650877111; 
 Mon, 14 Apr 2025 10:14:37 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf4457a6sm11687239f8f.98.2025.04.14.10.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 10:14:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 19:14:31 +0200
Message-ID: <20250414171433.1233576-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414171433.1233576-1-raphael.melotte@mind.be>
References: <20250414170922.1230348-1-raphael.melotte@mind.be>
 <20250414171433.1233576-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1744650877; x=1745255677; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pcnule7IUIzJ/Ycjau4P6Yrza+KxOx6KQ9VO+XwVL8E=;
 b=AEDBc7cVsMnm1qwPU7aFgziVfFzZ/6oXi+sRUymudNSChwDseOF5tQcQLXl2C0gSYl
 Q1SsmuOQD7g+LcqgAUscIhWJ9MUngLrdh3w9M2HQC2oqkJPmXJPz2J9gdXGJCsuZIA3K
 44V9zNv8OauDZkEP45fSKQGgHVCq6lhcJHl1ixLBzPVWmzNSqPFFToz5MJm1PFmVKbOv
 +fjQaULdlWV7Y5b4qhXEX7BS0eYoNmySTDOtywhbmZj0OxUJoDpMh1e4wEBuONSESu6Q
 J6CU/Wq1YFGpHbpoRt2WRlqXO/PKfFFk8fqZnvmvUsUDS1PNbXLhcUVOy/IiYrB/KG2X
 wxzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AEDBc7cV
Subject: [Buildroot] [PATCH v2 2/2] package/python-urllib3: bump to version
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
