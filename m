Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7EDCA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FAEC60865;
	Fri,  2 Oct 2026 10:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-mZbQ0u22Ro; Fri,  2 Oct 2026 10:32:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0C2E460828
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937126;
	b=RwAkluvvStEBLiNVMjLREDLjYgnrtYtcF2O1zBKk1/eFTvILf2tysEwYYHi+ReyvzG4j
	 n2hfGEPJDXtqt3EEaRQM2M7TwQGPUGj1aTvjWoH7W/ROxSJyD40d9bHktTHdJLjMUIS+7
	 MI/iB9Fzb5os7ww82X6abQADfnQpXs8qvenDb8NvmzCp1E6rdJxRakEaLwMdPnTmDN/sr
	 br3x7rm54WOZMfRtxQ8oRPKiEgh079W0uztYgPHr5oZJf+NRybyGRLcq3TEpYC9/x8VJO
	 LSHZ9PAUTQayGph6GZPtymXj0lbYvrV+R5jpMmNrHetJ45RFaN04SI0Md4JNeO1Tsww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937126;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Kl1qM77s+XqaYfh5aPEiW32vO+LpJGnq++IurysqM/U=;
	b=ZB0Bwf/tKXle/Qmb8AC2+r6tEvbSLFYlvG74bz9vxjA6ODV9W/fuo/LKt4r3pQScskJn
	 hdRR1rvtlCyhwLaRDFIhKyyVqX1lBo7MaYpmYT/HR/wW78Ip+nLk0ymm7iaS+XtgUcloA
	 AVd2GFn8IUQfab2WV7XXcP76HK8Csgldf0hdt70p1p2GsEj27Ly1blGDzl5Z+ddfeP3no
	 xQwQovVJl1oTxrnJ5BVo+eexXqhAjJRzc8oBkcuEHSd51YrxhZIMWWMtvsJE/uXNpkccv
	 yDikf46G3Dmym13MOwG+PhelzTiq5mKDdYyJtId0kcOb3q366XDoRK2tdVezVygbmiw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X06nXas+;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937126;
	bh=Kl1qM77s+XqaYfh5aPEiW32vO+LpJGnq++IurysqM/U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=T0Hw3REyxqDprO73pqqhvDbf+Gj4+Fwwh8MgMc9fiAo9cpWfin4X81q8w7Lum18yK
	 hNW73l1plPgOy+fxB03OgmepRDTSgtMndXd+/EgdE2sFWWSWXiv1uP+eJOAOcdrd2A
	 0K27aZEyCV/rq5F/hUwFaR1s4Dy9nFwS424aE/UecqlyKAkxg8UU47UogdwwCNNWel
	 XphPLR3Qbyq4fXG4EwLeiPdzohyMj5BLCkIWiMUe1C8ZkDB1QA603kEKDpRO5gaWVh
	 O04v7/qwbReoNEI+EEKM1bzn2RIeufz8YiVzVxdqIbvC2hB07xIJTlq3tX64RfwgeJ
	 T5InzdYOEZXvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C2E460828;
	Fri,  2 Oct 2026 10:32:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBAD33AC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E88F46083B
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fq1H_vizk4Ea for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:32:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C0317607A3
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937123;
 b=QIgjljPttgrLfBX/0fl0KUTAY/DMlFssQXOkzFZd75Rl7eCY2ot9gg9cay+XCpWiRlAx
 ufGxeJZAP32T4CVJADKxTt3E8d//u+H4wQwIXkqXxGxEQc1ERVtLgZQ4twOoM/I+9SF1c
 C/n6lrpTI5trUPG74sFq4uXq31JQvcZjVL7ZxKgdb+paT2HQYyTREPlwu2Bt+c6Gs/QP7
 0RItkOjIDlN9QGNrQlEyhlUHDH93MwSgXhn46hVbUaPnUTCp88BRktVrMNeI2dsf61d9W
 M8dItu8JWNHk55YaDfyJoGgY0vHWcqfJwiDkTo3Ay6nOFfyw1YcRuFikjcoO0TqThmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937123;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=cg68WdmrNUGbU33K9AtMEdeaY43PpwB9KM9CKEQJ2g4=;
 b=ab3OCIekEvMM6KxWCwKCWQj1Xq4pAW7vuTTK90kieAhwjQ3aKtR7VayDnVg9fndgcPUe
 etkPgqkGIQZLfXK63DygMPFjtVo/k/Ql8z6c6dNmJ4avN4hA/Ljc11wkTCNLYOtfVJFAt
 VKBbLQANKlGalttni3op5roMAPf6L9mdHkczQ1BkvyguiAXV8rvdpdxt8X8nBzvrc0LeM
 reRussYUiOu6+uiNgfBAwRtwbEgqDwtAX2+tnSK48RBIMs9HXdW102E+53qQ0V9Wm8Jdq
 ZUN9Io1c7FjeSEbsuRySyMRnkHI3Tv8CwGVV+Zqy1jM8vpMi4D3PBOLn6+fsbheJenA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=X06nXas+; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=flaviu.nistor@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=X06nXas+
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0317607A3
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:02 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-4887840c529so2564384f8f.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790937120; x=1791541920; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cg68WdmrNUGbU33K9AtMEdeaY43PpwB9KM9CKEQJ2g4=;
 b=X06nXas+lToKJyKXRSJr93L0TnbwkjsH6lLKqdMepPOhDEcc0w1UDp8DTIR/xe3q8x
 icY90XFqidm0x0z1cFJ+ZFxIx3unh9myvYpWnR1zQ2hs+RNPAICAxcDS1u408CdHg2C1
 YBhJ5S1pr7FUCc9fuNPCKAbaXaJSgcyqzfSvmfeiusv1Nnfba5mYNpcXqTBhcrsCBZwp
 qm7/6MzgfMMeb8fwYVqsQY/WBsY8+dYWDUiSndsKXLQeOQBoz/n9oq1lTCNkhiUg7lEx
 SwfKeHPr4N35hlSD84UyB1Yjs6K+AGb+3Eo0ViuuGLXnEhcSa/W4PNJq1icdEnSpSH1m
 jXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937120; x=1791541920;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=cg68WdmrNUGbU33K9AtMEdeaY43PpwB9KM9CKEQJ2g4=;
 b=PicXk8rhMD+Ce4ZdJiXVB+5MAT/YYEoWBkUjW0y4lw861sCXY0N4FcJjNuIXrmxMwe
 UKPWS21BPcD6bhLyg2EDndPwAilbCLRQttk3dBTn2vRCM/TPzndzGQtxfbzABoBLCWvV
 V4A2vEApq/0j0s4/ccK4s5kis1TVnvS1IfUmJ9/JXqOy4BYsIx/bwqYCo1Owfzwfwcca
 qUTo8ezw0fpMC+5CzWynzjpYMMQ1PVjnaQ0zyaa/e+3N0QUhUYUAnxXt9xv+MtBKpt5i
 zOl58170E0tedgQGYFwHXK773RtAzE8BMFTM9GmpmDJtOmpXkSbdNcrQvKIynmSBLLOD
 rUAA==
X-Gm-Message-State: AFuF++nIdjikz2N8GdaUsNFnyLCOAU4PbqbfnH3nP5Npb99h+M6ZeInc
 kloTm7IF8N/d0PqOSPr2TB6jltRbnXfO9ai4k6K8OxLEiPrLQE1+2kXKG1v4JLgLIfQtBQ==
X-Gm-Gg: AYBFou0KKlTskfJmbLKRrOXgGQaqsjR3/+Q5+Rkz8nNjmn1TQKvR4Z+SGTGEEsjqoss
 mVGvrdmNFGeGwpa3qQOCMdZFQPAQWtmOEn2bztdUmXWrvoCjMQeaZysRok+kMXJ9CjtG3qZCbDB
 jDFjsPaYMhM08O2KJhVcn1o60+xYi0PbZK7E+NfVvGb/64A+OdFYQ1/YM9Hswf3csZvvLJ9qoQp
 frwnAj4s6cgLVytlTg0E5cwRX9esMyea4dRGM81He0oN5EjA6HI7Eg0Ng7qxtOYmwNRrAwlDELq
 5ppaAft8zGFusg41xRuyhKiPykaj3mKZlPUHCoSQshPIbM62UzXX5JPBFNbEbS4FT6wTT0uDZ9n
 lthVrm0PDh8pAPz3Ty+FKoVDbba4laKMWMYQBUjuif30J3s4Q1T1yyyljRsUqs/lesplF8MBUoU
 6wQgHgNAIbB64SNLdBxv6z54cCaBPwPHjP+Udaea+pxa0axolxKETMUZo1LaZJ9TUjau+BYrxUf
 yJehbhfdJYTZPXBkRjFXfUe9tVPiOKQyKpGD/ysPYPijOsb9jXL
X-Received: by 2002:a05:600c:354a:b0:4a0:ec5:46d9 with SMTP id
 5b1f17b1804b1-4a027447475mr44175265e9.0.1790937119717; 
 Fri, 02 Oct 2026 03:31:59 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027734b49sm73677865e9.10.2026.10.02.03.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:31:59 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 13:31:35 +0300
Message-ID: <20261002103144.13914-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 RESEND 1/3] package/python-cramjam: new
 package
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGNyYW1qYW0sIGEgcHl0aG9uIGJpbmRpbmdzIHRvIGRlL2NvbXByZXNzaW9uIGFsZ29yaXRo
bXMuCkl0IGlzIG5lZWRlZCBieSBweXRob24tc25hcHB5IHBhY2thZ2UgaW4gb3JkZXIgdG8gYnVt
cCB0aGUgdmVyc2lvbi4KClNpZ25lZC1vZmYtYnk6IEZsYXZpdSBOaXN0b3IgPGZsYXZpdS5uaXN0
b3JAZ21haWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2NDoKLSBVcGRhdGUgYWxzbyBERVZFTE9QRVJT
IGZpbGUgYXMgc3VnZ2VzdGVkIGJ5IEZpb25hIEtsdXRlLgotIExpbmsgdG8gdjM6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDcyNDA2NTAwNC4yMTc0MTEtMS1mbGF2aXUubmlzdG9y
QGdtYWlsLmNvbS8KCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMyArKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKIHBhY2thZ2UvcHl0aG9uLWNyYW1qYW0vQ29uZmlnLmluICAgICAgICAgICB8ICA5ICsrKysr
KysrKwogcGFja2FnZS9weXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5oYXNoIHwgIDQgKysr
KwogcGFja2FnZS9weXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5tayAgIHwgMTQgKysrKysr
KysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWNyYW1qYW0vQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9weXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5oYXNoCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9weXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5tawoKZGlmZiAt
LWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IGYyNzEzYzcyMzkuLjkzNTE5NTc0
YzkgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTEzNCw2ICsx
MTM0LDkgQEAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZnRhYmxlcy5w
eQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fbmV0d29ya21h
bmFnZXJfZ29pLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhv
bl9weXJvdXRlMi5weQogCitOOglGbGF2aXUgTmlzdG9yIDxmbGF2aXUubmlzdG9yQGdtYWlsLmNv
bT4KK0Y6CXBhY2thZ2UvcHl0aG9uLWNyYW1qYW0vCisKIE46CUZsw6F2aW8gVGFwYWrDs3MgPGZs
YXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgogRjoJY29uZmlncy9hc3VzX3Rpbmtlci1zX3Jr
MzI4OF9kZWZjb25maWcKIEY6CWJvYXJkL2FzdXMvdGlua2VyLXMvCmRpZmYgLS1naXQgYS9wYWNr
YWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCmluZGV4IGZjMWU1N2QzMGQuLmQ0ZTNj
MmZlNTggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvQ29uZmln
LmluCkBAIC0xMDYxLDYgKzEwNjEsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxlcyIK
IAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNvbnN0cnVjdC9Db25maWcuaW4iCiAJc291cmNlICJw
YWNrYWdlL3B5dGhvbi1jb250b3VycHkvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRo
b24tY291Y2hkYi9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL3B5dGhvbi1jcmFtamFtL0Nv
bmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWNyYXlvbnMvQ29uZmlnLmluIgogCXNv
dXJjZSAicGFja2FnZS9weXRob24tY3JjL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0
aG9uLWNyYzE2L0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWNyYW1qYW0v
Q29uZmlnLmluIGIvcGFja2FnZS9weXRob24tY3JhbWphbS9Db25maWcuaW4KbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uODQxMTljYTk2OAotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvcHl0aG9uLWNyYW1qYW0vQ29uZmlnLmluCkBAIC0wLDAgKzEsOSBAQAorY29uZmln
IEJSMl9QQUNLQUdFX1BZVEhPTl9DUkFNSkFNCisJYm9vbCAicHl0aG9uLWNyYW1qYW0iCisJZGVw
ZW5kcyBvbiAhQlIyX0FSTV9DUFVfQVJNVjUKKwloZWxwCisJICBQeXRob24gYmluZGluZ3MgdG8g
ZGUvY29tcHJlc3Npb24gYWxnb3JpdGhtcyBpbiBSdXN0LgorCSAgQWxsb3dzIGZvciB1c2luZyBh
bGdvcml0aG1zIHN1Y2ggYXMgU25hcHB5LCB3aXRob3V0IGFueQorCSAgc3lzdGVtIG9yIG90aGVy
IHB5dGhvbiBkZXBlbmRlbmNpZXMuCisKKwkgIGh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9jcmFt
amFtCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1jcmFtamFtL3B5dGhvbi1jcmFtamFtLmhh
c2ggYi9wYWNrYWdlL3B5dGhvbi1jcmFtamFtL3B5dGhvbi1jcmFtamFtLmhhc2gKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMjA0MmJiNjI4MQotLS0gL2Rldi9udWxsCisr
KyBiL3BhY2thZ2UvcHl0aG9uLWNyYW1qYW0vcHl0aG9uLWNyYW1qYW0uaGFzaApAQCAtMCwwICsx
LDQgQEAKKyMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCitzaGEyNTYgIDU0MmVh
MzQ5YTc1MjhkODg5MzU4NTZkM2ViNTYyY2QxN2JmZjcxM2Q3YTQxZWFiOGQ2ODEyZDc4YTNjYjAw
YmEgIGNyYW1qYW0tMi4xMS4wLnRhci5negorc2hhMjU2ICAxMDg5MmYyNzk5NDhmZTlhMmRkNWYy
YzU1OWVmNzhhYWUxZWJmNGI1ZDU4MjVlMWVhZjY4YjAzNzg3ZmRlNDAyICBweXRob24tY3JhbWph
bS0yLjExLjAtY2FyZ282LnRhci5negorc2hhMjU2ICBiNGY4ODJiZmM4MGQyN2EzNzMyNzg5YmQ4
ODNhOGMxZDM0MmU4ZmZlYTdmNjIyYTcxYjNkZmRlZDgzNDIwNWZmICBMSUNFTlNFCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3B5dGhvbi1jcmFtamFtL3B5dGhvbi1jcmFtamFtLm1rIGIvcGFja2FnZS9w
eXRob24tY3JhbWphbS9weXRob24tY3JhbWphbS5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi5lMWUwNjBiZmJhCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRo
b24tY3JhbWphbS9weXRob24tY3JhbWphbS5tawpAQCAtMCwwICsxLDE0IEBACisjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIworIworIyBweXRob24tY3JhbWphbQorIworIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKKworUFlUSE9OX0NSQU1KQU1fVkVSU0lPTiA9IDIuMTEuMAorUFlUSE9OX0NSQU1KQU1f
U0lURSA9ICQoY2FsbCBnaXRodWIsbWlsZXNncmFuZ2VyLGNyYW1qYW0sdiQoUFlUSE9OX0NSQU1K
QU1fVkVSU0lPTikpCitQWVRIT05fQ1JBTUpBTV9TRVRVUF9UWVBFID0gbWF0dXJpbgorUFlUSE9O
X0NSQU1KQU1fTElDRU5TRSA9IE1JVAorUFlUSE9OX0NSQU1KQU1fTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UKKworJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQorJChldmFsICQoaG9zdC1weXRob24t
cGFja2FnZSkpCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
