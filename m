Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBC9C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 11:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A560401F3;
	Wed, 29 Nov 2023 11:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A560401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duEuflfiqjP0; Wed, 29 Nov 2023 11:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ED73400DC;
	Wed, 29 Nov 2023 11:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ED73400DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6A21BF369
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 11:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0670B41A04
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 11:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0670B41A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6MqE5_yq8l5u for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 11:03:11 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27B92401DD
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 11:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27B92401DD
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-53fa455cd94so4379921a12.2
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 03:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701255790; x=1701860590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohZOO1qR6zAjQvK2iLvS8s92cB6afDhy3agh9tRmE+c=;
 b=PPHI2b8StWpi/EJfKRISteTkZGPxoYOZQImIgaXoXxCF8sRu35RwpRu0YjAVYbs1KC
 6svK6ERO2LXWRHDhG7OOGwkuYqK2ZI7mnTyWcTkwZXfsYfmwgA3c6MEbGS/l7sISbB2F
 83z7oY1k2KQFDESqFi8rPPxKsDyoAV6YHqs+Ok5MtxBApF3LPL2EpSy6iSLfEjfwFl8a
 mkx5hbLm9QIQKmh/HjN0KH77ZcB565552jgO5cmoePhHYQFTWpwfi0b3Rc/oHPgEFDto
 fJoROHZJ/W0ezeM+Pnu66tL6YiY9+kqikn/mFb95i5hLGLyqjy3mUOZ+4zTIlzWaudYe
 ggAg==
X-Gm-Message-State: AOJu0YzammG6fT2JYPIJz7ks8zFgjYUWCCekVwTqUGA1pA3oy00e4bOn
 zHoRXyowEZ2zIY2w0OwBADW61jfxk4oxVA+Q36GCbw==
X-Google-Smtp-Source: AGHT+IEE4blvBc0cZqdpbCPboe8tirAMSkBP09sDyFdJuu2v3Yv9E2hG2VJCjSb2GFdWge7WGRs0sQ==
X-Received: by 2002:a05:6a20:729e:b0:18a:f5df:5f88 with SMTP id
 o30-20020a056a20729e00b0018af5df5f88mr19701219pzk.62.1701255790260; 
 Wed, 29 Nov 2023 03:03:10 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056a0010c300b006cdd5dfc11asm810213pfu.166.2023.11.29.03.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 03:03:09 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 08:02:58 -0300
Message-ID: <20231129110258.3708-2-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129110258.3708-1-flavio.tapajos@newtesc.com.br>
References: <20231129110258.3708-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1701255790; x=1701860590;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohZOO1qR6zAjQvK2iLvS8s92cB6afDhy3agh9tRmE+c=;
 b=b+ce/nGQnlgwwKNDHdbDMst7VAXzrQ+5sXaPDlEUaneGoBJq2yhzAkMbJ+B0bbd6yb
 YRvoDoJrq1KGbiiJlkE4jky8ZR0cdpS9SmP5zZlby7y8zoWZKEhELSX4njifJorH7DCv
 5bCHEXeDfOCUMzrRxw03fTZaFihrfmo3BgQexm8PpXG2u82Fpsulbcwq+uAWtphYPoXK
 1pGSf38+rJ9lfk4c92HRWMxpcc44UdA8zKNmrs6etl3I6LFL50L0VwygaW0kpAEJTjgd
 nSYKqgqkxhzMQg10d0qm+pizr9ZIWU1FQRrRHfSIKP8uzpgjuAVVwywYmrdLdPOU5euw
 vEsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=b+ce/nGQ
Subject: [Buildroot] [PATCH 2/2] package/rsyslog: add libdbi-drivers
 optional dependency
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmVlZGVkIGluIG9yZGVyIHRvIHVzZSBvbWxpYmRiaSBtb2R1bGUKClNpZ25lZC1vZmYtYnk6IEZs
w6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgotLS0KIERFVkVM
T1BFUlMgICAgICAgICAgICAgICAgIHwgMSArCiBwYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayB8
IDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCAxZjI2ZTliYzgxLi4yZjNlZWRmOGEwIDEw
MDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTEwNzgsNiArMTA3OCw3
IEBAIEY6CXBhY2thZ2UvcHl0aG9uLXB5bW9kYnVzLwogTjoJRmzDoXZpbyBUYXBhasOzcyA8Zmxh
dmlvLnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+CiBGOgljb25maWdzL2FzdXNfdGlua2VyLXNfcmsz
Mjg4X2RlZmNvbmZpZwogRjoJYm9hcmQvYXN1cy90aW5rZXItcy8KK0Y6CXBhY2thZ2UvcnN5c2xv
Zy8KIAogTjoJRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+CiBGOglwYWNr
YWdlL2NwdWxpbWl0LwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cubWsgYi9w
YWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tawppbmRleCBjZjlmMmMwZTc5Li44ZWE5MmVhNzg1IDEw
MDY0NAotLS0gYS9wYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5taworKysgYi9wYWNrYWdlL3JzeXNs
b2cvcnN5c2xvZy5tawpAQCAtMTUxLDYgKzE1MSwxMyBAQCBSU1lTTE9HX0NPTkZfT1BUUyArPSBc
CiAJLS1kaXNhYmxlLW9tam91cm5hbAogZW5kaWYKIAoraWZlcSAoJChCUjJfUEFDS0FHRV9MSUJE
QklfRFJJVkVSUykseSkKK1JTWVNMT0dfQ09ORl9PUFRTICs9IC0tZW5hYmxlLWxpYmRiaQorUlNZ
U0xPR19ERVBFTkRFTkNJRVMgKz0gbGliZGJpLWRyaXZlcnMKK2Vsc2UKK1JTWVNMT0dfQ09ORl9P
UFRTICs9IC0tZGlzYWJsZS1saWJkYmkKK2VuZGlmCisKIGRlZmluZSBSU1lTTE9HX0lOU1RBTExf
SU5JVF9TWVNURU1ECiAJJChJTlNUQUxMKSAtbSAwNjQ0IC1EIHBhY2thZ2UvcnN5c2xvZy9yc3lz
bG9nLnNlcnZpY2UgXAogCQkkKFRBUkdFVF9ESVIpL3Vzci9saWIvc3lzdGVtZC9zeXN0ZW0vcnN5
c2xvZy5zZXJ2aWNlCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
