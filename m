Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18160C87FDA
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 13:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B10D5409D8;
	Fri,  8 Aug 2025 13:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jImwLkyHBO-r; Fri,  8 Aug 2025 13:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A88DB40AAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A88DB40AAA;
	Fri,  8 Aug 2025 13:31:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD1F99CF
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B395C81EA4
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLmeTOk9BWo7 for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 13:31:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBFCA811F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBFCA811F8
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBFCA811F8
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-459ddb41539so7702625e9.2
 for <buildroot@buildroot.org>; Fri, 08 Aug 2025 06:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754659889; x=1755264689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ZU2/0nhZrVQ5mayLSceODNnYUC6kpNlMPjLhLUbWNs=;
 b=FHcOuamzkRPdro06G9vEqgzDaPmP6RmaELyMSfu63KPMZvqT5+TNAnkCAbhpSuisbO
 a16tICO0IR/6Iuslyo296iBZhR8qIko4RXWhfCu+kQiyabsJjcA1OOyccnzkvbeMuGE8
 F/w/llfWWR6imDykIT7g4aV2kbt3GSzR50OElqDbhdnv7AiWmG5bLHpHqww6X59hWnM4
 QiGOkTzspBmjKq8VlCfYT/GB2F3L7lohKRpZxrcASuTmhhQ1MyxT45BWWTQWCJpoM0lP
 wT2M6uUoqAycEZLp21EJ14hLO252ZuiSNAe3mAocHazT/F6/pBCBnxQTd0qVeZckFszZ
 Q0DA==
X-Gm-Message-State: AOJu0YyRpmSTP6FznDIOp1wbr+D3y1q8x4Dznma/PFTtf8MUcfM8fIuW
 9CBWWmq1/XptlCbhmzTCaoljhk7oEgVRaXnHmOitBFTXyDIH+MQOInjhD4exDRa9f3NjA75dy96
 JXqp/
X-Gm-Gg: ASbGnct8L97hDQF0yKvJtAjR0SqSVGDj5wkpVVYJQIN9lcQDrXhfmlqg1HG8l1yqPMA
 0mfWuG54+oXGah0G3GkrMcLoWLwpMq4iNduRIHVmxDX993nqvSszplTa+g81rT3+QFc8tF3Ak7M
 gp/rYb8ZtlTNY+WhlrwRAW2Yt02gnQizAojDqmOxea0DlYUdO3r7+DSFHVRFvq1kPaWKVTeX9D3
 lDbRBKdJr5942pAyVeHePsdkMPVMKtTuhkWi6vbhuXrjsaeA2jEm5hSDkRf0+CTR4rK9u3QiPN2
 t04nHDr+C5wP5VXKOaugGoe7Qs4ODNupIdNjauYVAdE4wngY5NGxJ93nAuGHUi1Y+jUGFaZhONH
 etl3Wk8TgbsLZR0g0v0p493ZkRDIrssB+XQEyTpuRUzixpiy/7AXAwaNYIQPi2MASOgDhF/4LOS
 xRp/hmB29eDw5/RHA6
X-Google-Smtp-Source: AGHT+IEYMiso2SHQt+dJKSn3DqUUX8G97iT4kZ9FNztHi7hIjCT50K1IdE/Rfym/eB/IKqrfabOI+Q==
X-Received: by 2002:a05:600c:3b86:b0:458:affe:a5c1 with SMTP id
 5b1f17b1804b1-459f4eaa107mr25544595e9.5.1754659889471; 
 Fri, 08 Aug 2025 06:31:29 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5873c43sm149053965e9.22.2025.08.08.06.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 06:31:28 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri,  8 Aug 2025 15:31:11 +0200
Message-ID: <20250808133112.3212687-5-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754659889; x=1755264689; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ZU2/0nhZrVQ5mayLSceODNnYUC6kpNlMPjLhLUbWNs=;
 b=E1J/B6aqZi45UlyJC1ey4ighS4uZ+vWJUaDPCj9AoRa7w/K+4y+0jlbN2AL8AuwinK
 2OC/9D5/Yllz3SIn+/VF6FGI6Ee4z9vKT94ZOhP9SjHJdxI3l6bTINdlHpNnG7fC3dLq
 O3XSXpYgX/byGErjw5Ij8ICPYn+EkpLXbMWrc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=E1J/B6aq
Subject: [Buildroot] [RFC PATCH 4/5] linux: split HOSTCC from flags
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UnVzdC1mb3ItTGludXggaW52b2tlcyBydXN0YyBsaWtlOgogICQoUlVTVENfT1JfQ0xJUFBZKSAk
KHJ1c3RfY29tbW9uX2ZsYWdzKSAkKHJ1c3RjX3RhcmdldF9mbGFncykgXAogICAgLUNsaW5rZXIt
Zmxhdm9yPWdjYyAtQ2xpbmtlcj0kKEhPU1RDQykgKHNlZToKCWh0dHBzOi8vZ2l0aHViLmNvbS90
b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9ydXN0L01ha2VmaWxlI0w0MDcpLgoKV2hlbiBCdWls
ZHJvb3QgZW1iZWRzIGZsYWdzIGludG8gSE9TVENDIChlLmcuIEhPU1RDQz0iZ2NjIDxjZmxhZ3M+
IDxsZGZsYWdzPiIpLApydXN0YyB0cmVhdHMgdGhlIGVudGlyZSB2YWx1ZSBhcyB0aGUgbGlua2Vy
IHByb2dyYW0gbmFtZTsgYW5kIGl0IGZhaWxzLgoKVGhpcyBwYXRjaCBwYXNzZXMgYSBjbGVhbiBI
T1NUQ0MgYW5kIG1vdmVzIGZsYWdzIHRvIHRoZSBkZWRpY2F0ZWQgaG9zdC1zaWRlCnZhcmlhYmxl
cyBhY2NlcHRlZCBieSBLYnVpbGQ6CiAgLSBIT1NUQ0MgICAgICA6PSAkKEhPU1RDQykKICAtIEhP
U1RDRkxBR1MgIDo9ICQoc3Vic3QgLUkvLC1pc3lzdGVtIC8sJChzdWJzdCAtSSAvLC1pc3lzdGVt
IC8sJChIT1NUX0NGTEFHUykpKQogIC0gSE9TVExERkxBR1MgOj0gJChIT1NUX0xERkxBR1MpCgpT
aW5jZSBMaW51eCB2NC4xOSwgS2J1aWxkIHByb3ZpZGVzIGV4cGxpY2l0IHZhcmlhYmxlcyBmb3Ig
aG9zdCBmbGFncywgc28gc3BsaXR0aW5nCmNvbXBpbGVyIHZzIGZsYWdzIGlzIHN1cHBvcnRlZCB1
cHN0cmVhbSAoc2VlOgogIGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQv
OTZmMTRmZTczOGI2OWRkOTdhMzNlZmUzY2M4YWIzMzBhZjVmZDFmMQogIGh0dHBzOi8vZ2l0aHVi
LmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvYjkwYTM2ODAwMGFiZTVlMDE1ZTBiMDQ1Y2EyZmY3
YzIxNzNiOTRjMAogIGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21taXQvZjky
ZDE5ZTBlZjliYmJiMjk4NDg0NTY4MmU3NDA5MzRhZDQ1NDczYikuCgpCdXQgd2l0aCB0aGlzIGNo
YW5nZSB3ZSBjYW4gaGF2ZSBwcm9ibGVtcyB3aXRoIG9sZGVyIGtlcm5lbCB2ZXJzaW9ucwooPCA0
LjE5KSwgYXMgdGhlIEJ1aWxkcm9vdCBjb21taXQgYmVsb3cgd2FybmVkIHdoZW4gYXZvaWRpbmcg
SE9TVENGTEFHUwp0byBub3Qgb3ZlcnJpZGUgaW50ZXJuYWwga2VybmVsIGZsYWdzOgogIGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9kZGUwOTBjMjk5
YjAzNTdmZGIxYTRlYzQ0YWQ4ZDMzMmFjNTdmNjVlCgpTaWduZWQtb2ZmLWJ5OiBFbCBNZWhkaSBZ
T1VORVMgPGVsbWVoZGkueW91bmVzQHNtaWxlLmZyPgotLS0KSeKAmW0gYXdhcmUgdGhpcyBzcGxp
dCBpcyBjdXJyZW50bHkgbmVlZGVkIG9ubHkgZm9yIFJ1c3QtZm9yLUxpbnV4ICh3aGljaCB0YXJn
ZXRzCj49IDYuMSkuIEkgY29uc2lkZXJlZCBhZGRpbmcgYSB2ZXJzaW9uLWJhc2VkIGNvbmRpdGlv
biwgYnV0IEnigJltIG5vdCBzdXJlIGFib3V0CnRoZSBiZXN0IHdheSB0byBleHByZXNzIHRoYXQg
aW4gQnVpbGRyb290LCBvciBpZiB0aGVyZeKAmXMgYSBiZXR0ZXIgYXBwcm9hY2ggdG8KYXZvaWQg
cmVncmVzc2lvbnMgb24gcHJlLTQuMTkga2VybmVscy4gSeKAmW0gcmVxdWVzdGluZyBpZGVhcy9n
dWlkYW5jZQpvbiBob3cgeW914oCZZCBsaWtlIHRoaXMgdG8gYmUgZ2F0ZWQuCgpTaWduZWQtb2Zm
LWJ5OiBFbCBNZWhkaSBZT1VORVMgPGVsbWVoZGkueW91bmVzQHNtaWxlLmZyPgotLS0KIGxpbnV4
L2xpbnV4Lm1rIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGludXgvbGludXgubWsgYi9saW51eC9saW51eC5tawpp
bmRleCAwNTIwMzk0OTMxLi5mNWFjNjRmZGQyIDEwMDY0NAotLS0gYS9saW51eC9saW51eC5tawor
KysgYi9saW51eC9saW51eC5tawpAQCAtMTYxLDcgKzE2MSw5IEBAIGVuZGlmCiAjIERpc2FibGUg
YnVpbGRpbmcgaG9zdCB0b29scyB3aXRoIC1XZXJyb3I6IG5ld2VyIGdjYyB2ZXJzaW9ucyBjYW4g
YmUKICMgZXh0cmEgcGlja3kgYWJvdXQgc29tZSBjb2RlIChodHRwczovL2J1Z3MuYnVzeWJveC5u
ZXQvc2hvd19idWcuY2dpP2lkPTE0ODI2KQogTElOVVhfTUFLRV9GTEFHUyA9IFwKLQlIT1NUQ0M9
IiQoSE9TVENDKSAkKHN1YnN0IC1JLywtaXN5c3RlbSAvLCQoc3Vic3QgLUkgLywtaXN5c3RlbSAv
LCQoSE9TVF9DRkxBR1MpKSkgJChIT1NUX0xERkxBR1MpIiBcCisJSE9TVENDPSIkKEhPU1RDQyki
IFwKKwlIT1NUQ0ZMQUdTPSIkKHN1YnN0IC1JLywtaXN5c3RlbSAvLCQoc3Vic3QgLUkgLywtaXN5
c3RlbSAvLCQoSE9TVF9DRkxBR1MpKSkiIFwKKwlIT1NUTERGTEFHUz0iJChIT1NUX0xERkxBR1Mp
IiBcCiAJQVJDSD0kKEtFUk5FTF9BUkNIKSBcCiAJS0NGTEFHUz0iJChMSU5VWF9DRkxBR1MpIiBc
CiAJSU5TVEFMTF9NT0RfUEFUSD0kKFRBUkdFVF9ESVIpIFwKLS0gCjIuNDMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
