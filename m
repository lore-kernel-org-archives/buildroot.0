Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AFDCA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C0AF60898;
	Fri,  2 Oct 2026 10:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nF5Y-S-KFyve; Fri,  2 Oct 2026 10:32:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2DA6860B35
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937133;
	b=pu04rXfBRQ0y+W95IpJLHmU4Hjz1yD/KIQyBi8bgUR1D118rbYDztanOf530BwCMCNwf
	 L/LPAVbBDm0NBdOPDy+RPmyIHfIQUiUOVsaRhncy3vSTA9N5IKM+Z5TpeF6QarjRaiC9o
	 RqYFKHbCXXae4T5X7sbUWsmMjjj3xJ3KG5vE+tkFziwEUDM3o49BRZoKq9Kr7dWqkJWuw
	 pUUdLcFCLCoereZkydMwlatXIatkCUKNnFWYJSBynuz3/RMGdFrGHQWxiwzNQUc15iYsP
	 ucaG/ZBqasFbffmGcP60CTAfWRkwsL75F5iM7v/45r7tByY79af5lL9MN0fkiALp+0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937133;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=p7SYLy84Qld87Kz+3UQEXyyMKl+3hyHq+u1zg5qQVpc=;
	b=LdFg+/dZV8OLZtcrklnHinsGcltkNjkgkX//sR2ThMpQMX1ACCCwfh/DKFV2yXPyPtWh
	 VQVD7qHWt/27tJDrRMGK86koRvS1tV35S7WQA30kdrJsRKXBBZs3Q9dh8cAPXsG7GuGWz
	 JRJYL/TKwUuQ4hMPuvdJEBi8TWXJ+O6VNci9ELzL/mPA3/12ropWjYLzLl9CjE3W4NPHr
	 SEyEAaIYsW6zLh1mWvLHOWSRm8uHWU5rhDSLX9hrDkF4PQ9Ni9vNykVoHECvK0bMpgo7/
	 GuVF1owW9oYTj4mesfHsDeJE3prGEJ0HxoBMKHlErBPbOLb3Ocg11KBVXvEDN+ENHiA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937133;
	bh=p7SYLy84Qld87Kz+3UQEXyyMKl+3hyHq+u1zg5qQVpc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IrZWklbBbZ5haVhRl8kz+JEChrxCZjLCNH0V1qgNecwyl5DInc5mI1BS49PEgvmk+
	 T3+Qn00WuO4DGn1CSF/MqN1A5YCtuX0xPMcwzOQyqvemxf/BgyTvoh7CldQSlvsA1F
	 R6oxEMfWOKS0nVavX+VcKQ5DAMhYDs24i7C9tIVQvjyWH3/kAWwPmNLncICWteux9x
	 KQvStv6U6qhBNhpeSyAd04VuVKAYs5JnpkCxicXVobWmDsKt5VOBbvtbIE6h51aVU/
	 J7nYbvvRo9/Nle2zAgu8rFmMn/abU5g4hv6EJKi0XJ4ALOZxoqrJ6av17dDe4N/WKN
	 TqZjbLoIul1aQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA6860B35;
	Fri,  2 Oct 2026 10:32:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58B663AC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A5E081202
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxkYACghnCSq for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:32:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6373B80F69
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937130;
 b=g6mPtpz54jGxBYGSgfHDy/wTk2cMG95CBkBr0IXPEpceK0j9Ybn9Qox94ZNUXdevaPc2
 UZpZOnqOzkMYU3olsd37gYNfanugD7GWNqCYZkeBL7SfQfSzritAOqsW7n0MdyjmYMgNp
 RcbNR7IC4fgH6jYOLWcpEUHJgI2egy9Da7lHCNgPPkkq/CWHADJyj7oxwcHzYACX/2RrA
 YPvmOKcUMa1BU06UsRUVSglieN91qSfesVbzLrZOWrLuIem3hhkylwaUS5FQbyRGmnh1t
 Z3URR+ZPfucN77dRyrpNDrGsjPAx6ew1SA/iaoWAcVGaZSO4KyaNXjcUxRluKoTAtUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937130;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=QRkthABxqNpzdUR6X8yAQo6BWXHn8HAZeT8MvXDGRpU=;
 b=OyYogZZ7SnXqyp2XCvSBAsNbEIubHfkoVXx87/nC7EJPlH310QEDSoIxzWoLb/dJHOdw
 oEhocRL5fpLX8tCmJ1q8ynekqfq92nRFwIpb6O2qB67S2PcZa4thCxtkcs6hg/2jlNZ0G
 JUGMDssojHiLSuPV0RIm1jVKvmrVSAte8bcc/13ho6DNtU1CX/nuRrRT59qvKnqhCPnV6
 ebHR1MVCe8d9NkbAivWHO2+zOv1MIA1N8NAqdAUQ5Rd0KEgufVplFsPkLX+t72DRajnST
 CZy+OO1dDIUrAR0eEh0+57x9USjyd+hNiqSs7OB7GEhRwBSS+wI/wmvSgPp57Xiio9A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=EQnYRP2n; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=EQnYRP2n
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6373B80F69
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:09 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49e66390995so44033005e9.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790937128; x=1791541928; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QRkthABxqNpzdUR6X8yAQo6BWXHn8HAZeT8MvXDGRpU=;
 b=EQnYRP2nGwRSawARFFfBG8t9TU1GCJ1q0rJenzMRS7JtWE9GEPzVvZpXP6DKYEb7/1
 0SHTtc9N/KFlGksLP/h2gDtPJLRzPfiYFMYoPB6SkQn4isaeTj0Qf/9BDT90FCr/+CNP
 dQHVn8hoVZp1HnG86Xdzmpw+mrVyu0JjzA7Fh7gVuKRMwuFvnOu9dAGObbgISQQpMzGa
 W/DD78u8byqxjxHVaIzYGw8SMHf7llJCo3iuZBZrPxOdn72NXUkOhd9F0OBH4yYsiF0L
 uCu1N7RtuNhbYUn9i/PGUslE81zT7M9CkwJ8zfoB/GIXxxZuEj3khmXIFx/Agp7gNwb7
 2f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937128; x=1791541928;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QRkthABxqNpzdUR6X8yAQo6BWXHn8HAZeT8MvXDGRpU=;
 b=JF20M/t+EicEqc/vqL2nfbWuwq2EmjkqV83KKPIskEygD47HKHd3RseKuIjcQjEKNr
 wADwMqBYipKRC/j0cKTGRtPnW2BZWYZxSYCNoxPI5zIE4PeTPsMdFGsHgjfLF3BvmPxF
 l4N9owWo+pbf4M1nyokA4IPsloDu4dfy4RdY2aRe2EDRc/Ne9Y7I/MUeCRJ6yhQVnzCG
 VwIWpufD8CJ+kUSpOqQDHrBNmBNuDar4l32+pjSoZztTUMt6TBc3T2WYmOuSG6wmKv0P
 SBXrr8ceGsSoDV+6lJxyjSfmhJ5E5Kv4PiMQhenoric7GafUNQsOF3H+0mcEe3e4xcT7
 hnEA==
X-Gm-Message-State: AFuF++kuJzi0J+0KBR0mp3QUP1UerFE5AJeZBm4NV0SJuA6xouKtyqOh
 j3v33CHIOsWEOmqjhQg8igaEBTaXaKGCr4k90PZzhOUSc/Z3iHKKjLH/I5p7b0/y2K+NLw==
X-Gm-Gg: AYBFou1OjrzRteLwkdVbvl/SLDutwoxd848uDaIYjaedkyiwy1sSCpaiXUYfDLtcSph
 5UE4URagLyUWd9MTKVQJiYyUFUOxvFqYxDAbwtyp4tiy5ND8pJdSixhonRCeJZisHnP0C8VLxXt
 wEbmI55vubAOHPgexgfckzRzU8aIyWUPvRuw30axSXRIpb+g4BRm1iVQuqE91kVtRcZzq84z1SA
 oSewhUIPVjgqCMocN8V1FAWxXUXZHQQV5FDxFj0EVmKYsqzyUWs0M1LoC7QAIvIxWjMmvqqrJ1W
 DoqxylRyKVlExjRmatrlVmTqCzVv1oExzf005MPpVSxXn3s5+baOtAZiYG/Vl8zEe71ZCSOmEfc
 HqZsTk+hW7QPeLOYUTxpl9HO9lzGFXGE/Xr2IUMj4/2Dp4cb3VFIX0GRJEGkShrvUpqCr6b7kIV
 TFKB6HkWCtkFyAKLOpRbi2oddeufru/YS/SN491asZ/gbeyRx7wv26gbZMKXzzm41XtWIPMrgjq
 8LzYDJN7HIT9OKaH0ms2Xb9UVamdWoXVW9KpZRuGvloC9+xqj0g
X-Received: by 2002:a05:600c:c162:b0:4a0:1b77:db0 with SMTP id
 5b1f17b1804b1-4a0276b86b5mr44062095e9.35.1790937127732; 
 Fri, 02 Oct 2026 03:32:07 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027734b49sm73677865e9.10.2026.10.02.03.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:32:07 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 13:31:37 +0300
Message-ID: <20261002103144.13914-3-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002103144.13914-1-flaviu.nistor@gmail.com>
References: <20261002103144.13914-1-flaviu.nistor@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 RESEND 3/3] support/testing: add snappy test
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

QWRkIGEgc2ltcGxlIHRlc3QgY2FzZSB0aGF0IGltcG9ydHMgdGhlIG1vZHVsZSBhbmQgZG9lcyBh
IHNpbXBsZSBjb21wcmVzcwpkZWNvbXByZXNzIHJvdXRpbmUuCgpTaWduZWQtb2ZmLWJ5OiBGbGF2
aXUgTmlzdG9yIDxmbGF2aXUubmlzdG9yQGdtYWlsLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogLi4uL3Rlc3RzL3BhY2thZ2Uv
c2FtcGxlX3B5dGhvbl9zbmFwcHkucHkgICAgIHwgIDcgKysrKwogLi4uL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9weXRob25fc25hcHB5LnB5ICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwogMyBm
aWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zbmFwcHkucHkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9zbmFw
cHkucHkKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCBkYmUwNWI3
ODA2Li4xNTNiMmY0YWY1IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMK
QEAgLTExNDAsNiArMTE0MCw4IEBAIEY6CXBhY2thZ2UvcHl0aG9uLWNyYW1qYW0vCiBGOglwYWNr
YWdlL3B5dGhvbi1yaWNoLwogRjoJcGFja2FnZS9weXRob24tc21tYXAyLwogRjoJcGFja2FnZS9w
eXRob24tc25hcHB5LworRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5
dGhvbl9zbmFwcHkucHkKK0Y6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0
aG9uX3NuYXBweS5weQogCiBOOglGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0
ZXNjLmNvbS5icj4KIEY6CWNvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnCmRp
ZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3Nu
YXBweS5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc25h
cHB5LnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmZmMmMwN2MwNWEK
LS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVf
cHl0aG9uX3NuYXBweS5weQpAQCAtMCwwICsxLDcgQEAKK2ltcG9ydCBzbmFwcHkKKworcGF5bG9h
ZCA9IGIiQnVpbGRyb290IHB5dGhvbi1zbmFwcHkgcnVudGltZSB0ZXN0XG4iCitjb21wcmVzc2Vk
ID0gc25hcHB5LmNvbXByZXNzKHBheWxvYWQpCitkZWNvbXByZXNzZWQgPSBzbmFwcHkudW5jb21w
cmVzcyhjb21wcmVzc2VkKQorCithc3NlcnQgZGVjb21wcmVzc2VkID09IHBheWxvYWQKZGlmZiAt
LWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3NuYXBweS5w
eSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3NuYXBweS5weQpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44YzAwOTJiZDIzCi0tLSAvZGV2
L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fc25h
cHB5LnB5CkBAIC0wLDAgKzEsMzQgQEAKK2ltcG9ydCBvcworCitmcm9tIHRlc3RzLnBhY2thZ2Uu
dGVzdF9weXRob24gaW1wb3J0IFRlc3RQeXRob25QYWNrYWdlQmFzZQorCisKK2NsYXNzIFRlc3RQ
eXRob25QeTNTbmFwcHkoVGVzdFB5dGhvblBhY2thZ2VCYXNlKToKKyAgICBfX3Rlc3RfXyA9IFRy
dWUKKyAgICBjb25maWcgPSAiIiIKKyAgICAgICAgQlIyX2FhcmNoNjQ9eQorICAgICAgICBCUjJf
VE9PTENIQUlOX0VYVEVSTkFMPXkKKyAgICAgICAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BP
UlQ9InR0eUFNQTAiCisgICAgICAgIEJSMl9MSU5VWF9LRVJORUw9eQorICAgICAgICBCUjJfTElO
VVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNU
T01fVkVSU0lPTl9WQUxVRT0iNi42LjEzNSIKKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9VU0Vf
Q1VTVE9NX0NPTkZJRz15CisgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19G
SUxFPSJib2FyZC9xZW11L2FhcmNoNjQtdmlydC9saW51eC5jb25maWciCisgICAgICAgIEJSMl9Q
QUNLQUdFX1BZVEhPTjM9eQorICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT05fU05BUFBZPXkKKyAg
ICAgICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15CisgICAgICAgICMgQlIyX1RBUkdFVF9ST09U
RlNfVEFSIGlzIG5vdCBzZXQKKyAgICAgICAgIiIiCisgICAgaW50ZXJwcmV0ZXIgPSAicHl0aG9u
MyIKKyAgICBzYW1wbGVfc2NyaXB0cyA9IFsidGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3Nu
YXBweS5weSJdCisgICAgdGltZW91dCA9IDIwCisKKyAgICBkZWYgbG9naW4oc2VsZik6CisgICAg
ICAgIGNwaW9fZmlsZSA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJv
b3Rmcy5jcGlvIikKKyAgICAgICAga2VybiA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAi
aW1hZ2VzIiwgIkltYWdlIikKKyAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9ImFhcmNo
NjQiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAga2VybmVsPWtlcm4sCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICBrZXJuZWxfY21kbGluZT1bImNvbnNvbGU9dHR5QU1BMCJdLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1bIi1NIiwgInZpcnQiLCAiLWNwdSIsICJj
b3J0ZXgtYTU3IiwgIi1tIiwgIjI1Nk0iLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIi1pbml0cmQiLCBjcGlvX2ZpbGVdKQorICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2lu
KCkKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
