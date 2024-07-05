Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C872BC3271F
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 09:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 298E840B57;
	Fri,  5 Jul 2024 09:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0YnBmrYPZjg; Fri,  5 Jul 2024 09:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 143E340B37
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 143E340B37;
	Fri,  5 Jul 2024 09:14:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 212671BF31D
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E91B6066D
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 09:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oe4IRl4HkIQM for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 09:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29DE160668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29DE160668
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29DE160668
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 09:14:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4256eec963eso9485235e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jul 2024 02:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720170868; x=1720775668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+AaUukI2H8Z/PULBBOztJFBzAcYWIPoIQBuuWqbqFrY=;
 b=vrwgFV2KnKGzCPkT150n2/I+jftxJ1tQt7FQhjEl7of7Kub2fdfZlDQxttqQuzrhxZ
 Fo0qo58Sug0XHeo0ij1PdtzG0NrfZ60yyMUWiqtz49QU51L+smHKgAmoUyo6tkRS78/i
 FT5BmAcNhA2jsfhndI5DfbAFDStrM+vMQa2vS+DqetbVvE0vbiaQLVHulhtBZSZEfKez
 +NTXUv+lRpyrxGbJcjbXrQX/xmwTT/r6rTeClX+URgQSFB8k8q7rSqGcm0pga0Fyo1sU
 WuOiDcewc9e/SrPo72vlnk2I+eiTpPuES79Mic3O1GcVhSBosRDSfkXvX/4mAWNrE7wN
 +nYw==
X-Gm-Message-State: AOJu0YxW9sqcUX6+gp+i6uRbAELvLEQPZz/jCde9sunAqHw2NUxMtgS0
 XI95HDeLyKj8zE7fg7YvfyqqPNLCsYLUmkhkleUqk9Bfvjl9OZ5cuDEUDqKwBHgaIUVS4gPbCm5
 Wsow=
X-Google-Smtp-Source: AGHT+IGXHsDIjYwkczgCzTyEDUzNXOY/oCqIRPUwtYQvMSnwfkOSXWFPGZeL68oVHGSRpKN+GsY+hQ==
X-Received: by 2002:a7b:cd95:0:b0:425:6dce:8c54 with SMTP id
 5b1f17b1804b1-4264a48c4e0mr23369565e9.33.1720170868161; 
 Fri, 05 Jul 2024 02:14:28 -0700 (PDT)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367963fa692sm5486844f8f.85.2024.07.05.02.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:14:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 11:14:07 +0200
Message-Id: <20240705091409.3370272-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240705091409.3370272-1-raphael.melotte@mind.be>
References: <20240701145708.2886402-1-raphael.melotte@mind.be>
 <20240705091409.3370272-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720170868; x=1720775668; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+AaUukI2H8Z/PULBBOztJFBzAcYWIPoIQBuuWqbqFrY=;
 b=ZnxxIN5mRZnWK4zfa0/lgvCVZeG3kQIITtu+MDVX7UZ2Ch+iSYl4C5zjN5qJ7f+aDU
 nPeP436nIj6XX78CrKNEPxpbE4MQgH+ATyUZyBtR3pHlBnFZbvyOib03UJ3UVJOIWVa0
 IdaXxQcASwWD2TYVd/m791Si6Rc2z1Z7Zn9HBRnDmvesPfJ1Gzw2qWXR8ZUKrQOU4K9l
 FvkkuAkidE9KzfN/te0OK6qF2K9GlONOOleXlBGWRG/o+k9CVs1W4IaE3IADHzDhB1kD
 zuiJ9DKbsY27kYlAcp7Ow0dE+vRGX4rZ5pPGZN3rbvR543A9LFHlC/exy6bv5EYLL6fp
 K44g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZnxxIN5m
Subject: [Buildroot] [PATCH v2 2/4] support/testing: add new test for
 python-sdbus
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICsrCiAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc2RidXMu
cHkgICAgfCAxMyArKysrKysrKysrKysrCiBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3B5dGhvbl9zZGJ1cy5weSAgfCAxMiArKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwg
MjcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc2RidXMucHkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zZGJ1cy5weQoKZGlmZiAtLWdp
dCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDBkNThkZjdkNTAuLjE0NmM2ZmZlYTUg
MTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjY3Miw5ICsyNjcy
LDExIEBAIEY6CXBhY2thZ2UvcHl0aG9uLXNkYnVzLwogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9qbWVzcGF0aC5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9yc2EucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3NhbXBsZV9weXRob25fczN0cmFuc2Zlci5weQorRjoJc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zZGJ1cy5weQogRjoJc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fam1lc3BhdGgucHkKIEY6CXN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3JzYS5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF9weXRob25fczN0cmFuc2Zlci5weQorRjoJc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc2RidXMucHkKIAogTjoJUmFwaGFlbCBQYXZsaWRp
cyA8cmFwaGFlbC5wYXZsaWRpc0BnbWFpbC5jb20+CiBGOglwYWNrYWdlL252aWRpYS1wZXJzaXN0
ZW5jZWQvCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVf
cHl0aG9uX3NkYnVzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5
dGhvbl9zZGJ1cy5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi42ODEz
MWNlZGU1Ci0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
c2FtcGxlX3B5dGhvbl9zZGJ1cy5weQpAQCAtMCwwICsxLDEzIEBACisjIS91c3IvYmluL2VudiBw
eXRob24zCisKK2ltcG9ydCBzZGJ1cworZnJvbSBzZGJ1c19ibG9jay5kYnVzX2RhZW1vbiBpbXBv
cnQgRnJlZWRlc2t0b3BEYnVzCisKK3MgPSBGcmVlZGVza3RvcERidXMoc2RidXMuc2RfYnVzX29w
ZW5fc3lzdGVtKCkpCisKK3Byb3BzID0gcy5wcm9wZXJ0aWVzX2dldF9hbGxfZGljdCgpCisKK3By
aW50KHByb3BzKQorCisjIENoZWNrIGZvciBhIHJhbmRvbWx5IGNob3NlbiBpbnRlcmZhY2U6Cith
c3NlcnQgJ29yZy5mcmVlZGVza3RvcC5EQnVzLk1vbml0b3JpbmcnIGluIHByb3BzWydpbnRlcmZh
Y2VzJ10KZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0
aG9uX3NkYnVzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25f
c2RidXMucHkKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNzE2M2JiZWVk
MQotLS0gL2Rldi9udWxsCisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rf
cHl0aG9uX3NkYnVzLnB5CkBAIC0wLDAgKzEsMTIgQEAKK2Zyb20gdGVzdHMucGFja2FnZS50ZXN0
X3B5dGhvbiBpbXBvcnQgVGVzdFB5dGhvblBhY2thZ2VCYXNlCisKKworY2xhc3MgVGVzdFB5dGhv
blB5M1NkYnVzKFRlc3RQeXRob25QYWNrYWdlQmFzZSk6CisgICAgX190ZXN0X18gPSBUcnVlCisg
ICAgY29uZmlnID0gVGVzdFB5dGhvblBhY2thZ2VCYXNlLmNvbmZpZyArIFwKKyAgICAgICAgIiIi
CisgICAgICAgIEJSMl9QQUNLQUdFX1BZVEhPTjM9eQorICAgICAgICBCUjJfSU5JVF9TWVNURU1E
PXkKKyAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OX1NEQlVTPXkKKyAgICAgICAgIiIiCisgICAg
c2FtcGxlX3NjcmlwdHMgPSBbInRlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zZGJ1cy5weSJd
Ci0tIAoyLjM3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
