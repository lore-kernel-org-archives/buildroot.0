Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D905AC7EE32
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 12:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5CAF40940;
	Fri, 27 Jun 2025 12:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fK7fXIYpA9KG; Fri, 27 Jun 2025 12:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE9C240707
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE9C240707;
	Fri, 27 Jun 2025 12:20:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A28C611A
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 12:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9416D608D4
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 12:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4aJs5BO54vq9 for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 12:20:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AA4760675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AA4760675
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AA4760675
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 12:20:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so1913549f8f.0
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 05:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751026804; x=1751631604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OmG/w01XQVIRxnojtbJkO8jNMEitQUFtnX3aU5asBKI=;
 b=mfVJBqxj4jaRF2ujyCdYFB66JPRR4+jF0hEf1a2YC14J4DoLgmVeusKE5roafumnxk
 Fsg5DqG6zNZaPy3LDsjzAJbbeynp2367PDfWYMWMsa2M23tJ7XIM8CFWSj0Jr3gjWAxx
 Y13z+Nf0gMI+RCBv+PO0369OLwbe4OS39GBfZxpcD2CEt6klVeSzmVJyj/+kK9C7IrS5
 Hby81nNVMGDy4wpLzRh91XrCrQTphzXQUV983BucDyyj/rY2meqEkRpz7m0wWV6KYef8
 jMaXfuUA9rS75K2J+SLW+RccuEHxlSZp+t6xD2lLPP7Vpy5bX+GE+xNlcmiL265IAvvB
 s7hA==
X-Gm-Message-State: AOJu0YyVUdFsRGn6od/Z8BilxngBw5a+X321JRFaAlcGZbUav00pJM67
 6XJARcmHaBZskw5NFImUywvCirndLPto4db9av7vXCG+m6Ojmskk7fSWwCiJgOV4TtSyJUugTru
 U0BFZcAA=
X-Gm-Gg: ASbGncsx6dZ7IGgRVNyEAtKIdNs23hT7ANo+3mXOGAot/VBlAgZGt2FoZ1/FmTl9UfV
 JnurZ59+8xZkzxEqBXlPaRXqmEoQeQm9twBdvExm9LN8zeN18RhKo6rCNtpIHhvUlIjwIRWT/aV
 3e6LsWOk2FgHi/gAzNO83hi+YcGH4zmprSs09glgDbFNwRHJCAT2/ydUwRs8NUfz2JpBixxt1oL
 4LGt+HdhqZwJef0pSizTU48zZ4ME5HPfbadczOPTJwnoWHsZwDAVVnjfZ2hBZhQV+v5eSc0nKZ6
 geQXk2VQSXFhvLzb3+UCYvWrSPd+JuTBgdFlJoUXaRY9L3gbrpjK5XbmsAA83QIgQDMNDFvs+4v
 rZaiH0g==
X-Google-Smtp-Source: AGHT+IF1rUQbt8BPOXm5c0ovSm19ZthOEXNRGENQrSZVJxZO51U6d1i/Bt8KhJk/utGinOcb0+YDQg==
X-Received: by 2002:a05:6000:104e:b0:3a4:f513:7f03 with SMTP id
 ffacd0b85a97d-3a917bc827cmr2420740f8f.44.1751026803734; 
 Fri, 27 Jun 2025 05:20:03 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a390c88sm51949885e9.8.2025.06.27.05.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 05:20:03 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Frank Vanbever <frank.vanbever@mind.be>
Date: Fri, 27 Jun 2025 14:19:45 +0200
Message-ID: <20250627121948.1933049-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627121948.1933049-1-raphael.melotte@mind.be>
References: <20250627121948.1933049-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751026804; x=1751631604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OmG/w01XQVIRxnojtbJkO8jNMEitQUFtnX3aU5asBKI=;
 b=a2UdbhUwStQ430QKDUHnMzeOJVpya5ejrB0RcgFLpg10HEPZaT3TcvgavmGqbJP7mG
 +GeOB3urF8shbpwaLeKg1SA9xpJAVD6wuRb+lXR570moHJgE3p/+s4KxGmoSW2asVWtw
 Bzn9bZ0i4K9hSaO//9Q7KCOiLZPrU1SgI5uzLHUYjcp0UCaMvxR2At7HPXK0urXoSNR2
 cMQZQTKbSVTKKRmuLMxJfYym3CSITJHOUxqT3V24QXwAIPOVQ+fGGZmLq+b0mL6qKpve
 SkQ9jTgGMfPHpzp9i574W/OmOEMhY+un5QMKeSAnyhozxmQWOESgSxad+c93uzEG0C6R
 4MCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a2UdbhUw
Subject: [Buildroot] [PATCH 2/2] package/nginx-modsecurity: bump to version
 1.0.4
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nOgpodHRwczovL2dpdGh1Yi5jb20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJp
dHktbmdpbngvYmxvYi92MS4wLjQvQ0hBTkdFUwoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOp
bG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvbmdpbngtbW9kc2Vj
dXJpdHkvbmdpbngtbW9kc2VjdXJpdHkuaGFzaCB8IDQgKystLQogcGFja2FnZS9uZ2lueC1tb2Rz
ZWN1cml0eS9uZ2lueC1tb2RzZWN1cml0eS5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZ2lu
eC1tb2RzZWN1cml0eS9uZ2lueC1tb2RzZWN1cml0eS5oYXNoIGIvcGFja2FnZS9uZ2lueC1tb2Rz
ZWN1cml0eS9uZ2lueC1tb2RzZWN1cml0eS5oYXNoCmluZGV4IDM0ZTdiODdmNDEuLjFkODAxMzhi
OTQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvbmdpbngtbW9kc2VjdXJp
dHkuaGFzaAorKysgYi9wYWNrYWdlL25naW54LW1vZHNlY3VyaXR5L25naW54LW1vZHNlY3VyaXR5
Lmhhc2gKQEAgLTEsNCArMSw0IEBACi0jIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL293YXNwLW1v
ZHNlY3VyaXR5L01vZFNlY3VyaXR5LW5naW54L3JlbGVhc2VzL2Rvd25sb2FkL3YxLjAuMy9tb2Rz
ZWN1cml0eS1uZ2lueC12MS4wLjMudGFyLmd6LnNoYTI1Ngotc2hhMjU2ICBhZTgxMWM3MjA4YWMw
MjljYjdhOTlkNmY2M2UwM2QzOTcxNzk3NjA3NTE3MTg3ZjQ3NjIwZGYzOWMxZjc4YWRkICBtb2Rz
ZWN1cml0eS1uZ2lueC12MS4wLjMudGFyLmd6CisjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL293
YXNwLW1vZHNlY3VyaXR5L01vZFNlY3VyaXR5LW5naW54L3JlbGVhc2VzL2Rvd25sb2FkL3YxLjAu
NC9tb2RzZWN1cml0eS1uZ2lueC12MS4wLjQudGFyLmd6LnNoYTI1Ngorc2hhMjU2ICA2YmRjNzU3
MDkxMWJlODg0YzFlNDNhYWY4NTA0NjEzN2Y5ZmRlMGNmYTBkZDRhNTViODUzYzgxYzQ1YTEzMzEz
ICBtb2RzZWN1cml0eS1uZ2lueC12MS4wLjQudGFyLmd6CiAjIExvY2FsbHkgY2FsY3VsYXRlZAog
c2hhMjU2ICBjNzFkMjM5ZGY5MTcyNmZjNTE5YzZlYjcyZDMxOGVjNjU4MjA2MjcyMzJiMmY3OTYy
MTllODdkY2YzNWQwYWI0ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL25naW54LW1vZHNl
Y3VyaXR5L25naW54LW1vZHNlY3VyaXR5Lm1rIGIvcGFja2FnZS9uZ2lueC1tb2RzZWN1cml0eS9u
Z2lueC1tb2RzZWN1cml0eS5tawppbmRleCA0MmE1MGNhMzlmLi5jMWNkNTBjZjlkIDEwMDY0NAot
LS0gYS9wYWNrYWdlL25naW54LW1vZHNlY3VyaXR5L25naW54LW1vZHNlY3VyaXR5Lm1rCisrKyBi
L3BhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvbmdpbngtbW9kc2VjdXJpdHkubWsKQEAgLTQsNyAr
NCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1OR0lOWF9NT0RTRUNVUklUWV9W
RVJTSU9OID0gMS4wLjMKK05HSU5YX01PRFNFQ1VSSVRZX1ZFUlNJT04gPSAxLjAuNAogTkdJTlhf
TU9EU0VDVVJJVFlfU09VUkNFID0gbW9kc2VjdXJpdHktbmdpbngtdiQoTkdJTlhfTU9EU0VDVVJJ
VFlfVkVSU0lPTikudGFyLmd6CiBOR0lOWF9NT0RTRUNVUklUWV9TSVRFID0gaHR0cHM6Ly9naXRo
dWIuY29tL293YXNwLW1vZHNlY3VyaXR5L01vZFNlY3VyaXR5LW5naW54L3JlbGVhc2VzL2Rvd25s
b2FkL3YkKE5HSU5YX01PRFNFQ1VSSVRZX1ZFUlNJT04pCiBOR0lOWF9NT0RTRUNVUklUWV9MSUNF
TlNFID0gQXBhY2hlLTIuMAotLSAKMi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
