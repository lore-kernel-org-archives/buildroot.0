Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEF6EFCE4B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74CF2409B9;
	Wed,  4 Mar 2026 21:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1tmIjem6OmB; Wed,  4 Mar 2026 21:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ADB4409BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772660145;
	bh=d6CtVln649QUPhDkP0Yhnz0sfjsH/9V1rtuWX7JDZ+0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tAArnnIcphKSg1g4ZlqcnWulDGS6oqRsKyl9hsNOcXD8sHJlZ/BbU2Y08nZGTjl4D
	 ZBkst4aiTbKlJ5av39eZ8ROOMFZijJo5kqYnRrSUDkgSri4JuNjhblEe+sbxV8tTP9
	 vVlLNISZtHQQX+aBI3iM/pAmrEONQO85T93nVtZwsFK4cmNAd3lPrOe9ldXsVLQoL+
	 smY3D2EWzQg6/mvE3vj2NJAKdtz3ezzOXGfodWJRxm+4RKgT17/ZI/pC25NIT7tijW
	 liJwZX6tYKGpjFI26qtVB7mcHPOgfanDzd+UjFLMEYLP1YUc9LXpojU1t4CHKFS4ps
	 EKQWfZnx0fGng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ADB4409BC;
	Wed,  4 Mar 2026 21:35:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD913223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF34C405FD
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kp7I9euRve3U for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:35:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B14DF4052F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B14DF4052F
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B14DF4052F
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:35:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439ac15f35fso4227629f8f.0
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 13:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772660141; x=1773264941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ucdynhYJWfqmWJXwFd+GbLv9I8kgYoIFYDuIpInQUWQ=;
 b=gLkBPQ7PF8K74PKegandge1W9kcPhFW4CzyIBHeEPkJzWSV0eiVmurHYnMbnQXgAn2
 zt6G9cnQonueprdZ27FOCRB6vddaFI0CB6WMtK/pn0fT/i1SapksB6u6QFD37zqzc2dp
 Hujwi5p2EMXy6cmB2vG1bqSt5XdpiKT0gLPMuVcatoEo6uFoIbgh/zh8FdofbBFfGdfr
 WQIAeMrXEFof7k+/9M6Bmz/Maxtm5ejzioOukgjdORvpfJm6xJg9OHe/RfhEBZmKSAl8
 fr8GoIvx8AHc/mPgsud2hUo0MlLVN/xH8+cEiEBce0L2fzF32CVe2quHiIRyumnk76wR
 28Aw==
X-Gm-Message-State: AOJu0YwGocWy/Iwj6XKR2f6UMN4cj11WCrU9AlmBAEPA7WNJCfR0hjih
 ehxQmlEC8AfjsKUzffxyuAYeG1nBpiCVcqIPZj9mdhpPBCjXLxeshRaA5gHeG0y4lQ9ka1ygWK3
 yqB1j
X-Gm-Gg: ATEYQzxZrFPm5ICkipwgdf4lB+LG7T5YN825ZsROrcmP+sj1kZ472g0hzhdWotGyGYC
 2O2HQJJy4B5rKO/xvwW4idm/rVrsz01EOzcaseAttasWNvJxpgK4PVbnO+qmh4RhOMk4XBFVf74
 BgvS1e96ybQ87qXGFqJ9KHcHPtqcvWIkKUR2cq+R0d3MeBIluQqExEUVgCekVcRfBB7G3NPq5bf
 wkBBNiv69HniWdum06+JDbcJi+o44//si2UcU3wlLn7cFqxTrwt8EWvtw1vCj5xxazJXC9KfWO3
 s9+EVQU2m8Ms3Fp4JR8/OQVShQBbNGHe1EcJKgMOyNAgtq4StOQ1GNr4N3tYYYE/w23zaqtvYMT
 9sHCpDgJP8NDFWHV4/LVk6a5ELlMdRXyCY0TkgN+uWQnDDFjeJLb6yE4FSZOEEGm6BSMjVHcZ4b
 /5rw8rP2+b0Y7n0fuEiPjtSw/sc/5VfXVlpr1yfGyCPfYB2uBuRfEbbDlpg49ebQj68L5T71KTh
 SeeVYTMPuPXqMZsxN/P90VIMg==
X-Received: by 2002:a05:6000:1152:b0:439:c9d6:4313 with SMTP id
 ffacd0b85a97d-439c9d64396mr4680272f8f.44.1772660140666; 
 Wed, 04 Mar 2026 13:35:40 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b59723fesm27668606f8f.38.2026.03.04.13.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 13:35:40 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed,  4 Mar 2026 22:35:27 +0100
Message-ID: <20260304213528.1380898-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304213528.1380898-1-romain.naour@smile.fr>
References: <20260304213528.1380898-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1772660141; x=1773264941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ucdynhYJWfqmWJXwFd+GbLv9I8kgYoIFYDuIpInQUWQ=;
 b=vRCHbwRIjOAr54Fv3ubvLzD1ms0XLhyKEsCADtixtQc5FoPXDNPwDFQI8t1ADSbgEY
 7cWEhEa24V/SKl+cmlcKkQdoTC8VkTfaXr/3Xse4bdOJddm8ytpOEaof9AarHpS01I8l
 8d8FK2Lz4cAKBRYe6ASqdCTd275Lzn6gX5gXA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=vRCHbwRI
Subject: [Buildroot] [PATCH 2/3] boot/uboot: add support for embedded TEE in
 raw binary format
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U29tZSBwbGF0Zm9ybXMgc3VjaCBUZXhhcyBJbnN0cnVtZW504oCZcyBLMyBmYW1pbGx5IG9mIFNv
Q3MgcmVxdWlyZXMKVEVFIGluIHJhdyBiaW5hcnkgZm9ybWF0IHRvIHN1cHBvcnQgdGhlaXIgYm9v
dCBmbG93IFsxXS4KCkFkZCBhIG5ldyBvcHRpb24gdG8gc2VsZWN0IHRlZS1yYXcuYmluIGluc3Rl
YWQgb2YgdGVlLmJpbi4KClsxXSBodHRwczovL2RvY3MudS1ib290Lm9yZy9lbi9sYXRlc3QvYm9h
cmQvdGkvazMuaHRtbCNidWlsZGluZy10aXNwbC1iaW4KClNpZ25lZC1vZmYtYnk6IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgotLS0KIGJvb3QvdWJvb3QvQ29uZmlnLmluIHwg
MTIgKysrKysrKysrKysrCiBib290L3Vib290L3Vib290Lm1rICB8ICAyICsrCiAyIGZpbGVzIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ib290L3Vib290L0NvbmZpZy5p
biBiL2Jvb3QvdWJvb3QvQ29uZmlnLmluCmluZGV4IDE3YjdmOTVmNTAuLjMzMzFiODFlOGMgMTAw
NjQ0Ci0tLSBhL2Jvb3QvdWJvb3QvQ29uZmlnLmluCisrKyBiL2Jvb3QvdWJvb3QvQ29uZmlnLmlu
CkBAIC0zMTQsNiArMzE0LDE4IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1VCT09UX05FRURTX09QVEVF
X1RFRV9CSU4KIAogCSAgQmluYXJ5IGZvcm1hdCBtdXN0IGJlIHVzZWQgZm9yIE9QLVRFRSB2ZXJz
aW9ucyBzaW5jZSAzLjguMC4KIAorY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BURUVf
VEVFX1JBV19CSU4KKwlib29sICJ0ZWUtcmF3LmJpbiIKKwloZWxwCisJICBSYXcgYmluYXJ5IHN1
aXRhYmxlIHRvIGNvcHkgaW50byBwaHlzaWNhbCBtZW1vcnkgd2hlcmUgT1AtVEVFCisJICBiZSBj
YW4gZXhlY3V0ZWQgZnJvbS4KKworCSAgT1AtVEVFIHNpbmNlIDMuMjEgc3VnZ2VzdHMgdG8gdXNl
IHRlZS1yYXcuYmluIGluc3RlYWQgb2YgKHRoZQorCSAgc3RpbGwgaWRlbnRpY2FsKSB0ZWUtcGFn
ZXJfdjIuYmluLgorCisJICBUZXhhcyBJbnN0cnVtZW504oCZcyBLMyBmYW1pbHkgb2YgU29DcyBl
bWJlZCB0ZWUtcmF3LmJpbiBpbgorCSAgVS1Cb290ICh1c2luZyBCaW5tYW4gdG9vbCkgdG8gc3Vw
cG9ydCB0aGVpciBib290IGZsb3cuCisKIGVuZGNob2ljZQogCiBjb25maWcgQlIyX1RBUkdFVF9V
Qk9PVF9ORUVEU19PUEVOU0JJCmRpZmYgLS1naXQgYS9ib290L3Vib290L3Vib290Lm1rIGIvYm9v
dC91Ym9vdC91Ym9vdC5tawppbmRleCA2ZGRiYjllNDM4Li41YjNmNDZhYzc0IDEwMDY0NAotLS0g
YS9ib290L3Vib290L3Vib290Lm1rCisrKyBiL2Jvb3QvdWJvb3QvdWJvb3QubWsKQEAgLTIwNCw2
ICsyMDQsOCBAQCBpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BURUVfVEVFX0VMRiks
eSkKIFVCT09UX01BS0VfT1BUUyArPSBURUU9JChCSU5BUklFU19ESVIpL3RlZS5lbGYKIGVsc2Ug
aWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX05FRURTX09QVEVFX1RFRV9CSU4pLHkpCiBVQk9PVF9N
QUtFX09QVFMgKz0gVEVFPSQoQklOQVJJRVNfRElSKS90ZWUuYmluCitlbHNlIGlmZXEgKCQoQlIy
X1RBUkdFVF9VQk9PVF9ORUVEU19PUFRFRV9URUVfUkFXX0JJTikseSkKK1VCT09UX01BS0VfT1BU
UyArPSBURUU9JChCSU5BUklFU19ESVIpL3RlZS1yYXcuYmluCiBlbmRpZgogZW5kaWYKIAotLSAK
Mi41Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
