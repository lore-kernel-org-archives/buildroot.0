Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27ACC87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 15:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79D683EE0;
	Tue,  5 Aug 2025 15:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlnQeXP3TL7A; Tue,  5 Aug 2025 15:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0A6583F8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0A6583F8D;
	Tue,  5 Aug 2025 15:18:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 203F11A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3EBF83F07
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJwU_lFAaA8x for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 15:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F4E883EEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F4E883EEF
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F4E883EEF
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 15:18:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-459e3926cbbso3878215e9.1
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 08:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754407100; x=1755011900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=485tjEb7dI6NVIqjsWyuWPN5r6YwLgObUUCFLIJt04c=;
 b=vaPyZKTJ8bNswBVl9bbBx+9unMkzZSHbSSip8oABHeAcSxBkjMFIEGUyBPzOMn3qqK
 NACN9FlsSoFoB6jC1yuc+FfhP/JN3Do9BsysR8JTX+z0AYRjmk4y/YhrbVAy9B5Paemj
 Vd55TBQupUa352qi3Q+ipOfqEARTOZLJcFC3r1ucgFVjVfgukG8C3XYIV970tPY+6q3Y
 vK3sC9qAPE7sIPEYE1m8GhYEHkA9kyDp9hL+XuU07HOpSC7eferSk+XvtZ7MTO+KGZAk
 XpbntLFkTVeBBcJH36JYVnjhCS/jktDElqF4inHtE9wBjpfRN10CmhPxqU+HToBhC/Hd
 wqbA==
X-Gm-Message-State: AOJu0YwyC7j5rxOWIrYF67qVmUDS+zERrhOeX1kKe/EUA9p52R6No2Yr
 lVuYb1VnH4rJzXjLqYCdC4vtFiqolmXoqB0dPHd9I+cmReM3uHSIdKzQeLiIgt0Lo7tN+plFrbp
 iyuxl
X-Gm-Gg: ASbGncv2NpVF/+S3jh3A1PC1lrCaKWbWBeSkcsqhDaIrF5IVtYJABr38aK61lPaAD66
 Ry0OkVxU8OaZ5+ADHFsqPj6G27/2G0FfQ2vrdNaX04paaGebxyqyjVz2JrgS42GwN3EI8epfa0t
 YqeB1DUt8iHvHlwBjufzGJgzUFDZmtF6ho7QEmzj/dgCC0H00PetsHnzQvnNTMnzSScmJ/7SN2g
 77AWLSgx3yx01KdRlA/b5zbTSkKJKNZJaHLLxF/BAubuGIrNICRSOQw+aZBMCJH+0EEx2MIa1T1
 6VohLY1mryTcd9D/YWsk88UWkdhzKHAwTteyJZOvW7isx9+c20cIs+eGQ+cO0IWSHotoZ0JvzSc
 QUUebtwlWl+lDjC2x0dSwQaMMJCnh9qTI4Q==
X-Google-Smtp-Source: AGHT+IEyXbBqZMyYXRZiBXusjbj6Yddlp5ko1QgQYWdZ3HXOed6YoMDtn8W1NkWKLqkwxFUhPVsh8Q==
X-Received: by 2002:a05:600c:5248:b0:459:d4b5:623a with SMTP id
 5b1f17b1804b1-459d4b56388mr79025745e9.9.1754407100488; 
 Tue, 05 Aug 2025 08:18:20 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abeb2sm19618028f8f.11.2025.08.05.08.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 08:18:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CBC675F8A6;
 Tue, 05 Aug 2025 16:18:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  5 Aug 2025 16:18:08 +0100
Message-ID: <20250805151814.1114414-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250805151814.1114414-1-alex.bennee@linaro.org>
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754407100; x=1755011900; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=485tjEb7dI6NVIqjsWyuWPN5r6YwLgObUUCFLIJt04c=;
 b=JHGCTUxoKLztTQGwEiAh3TS5TPL6aP4OXkiPAc3GhCKEYUWEuuUM7g5oCsTT/fhDm4
 8ik2ZNnC5gD4ZXbGqfrJDhrDq7ztYudve78qyMw+CYAPFhIk26ZD6IcqHjouDm20ELpW
 ujJYafYR9UnDJVdyd5ItGZntDCmAdDQKOXSXYq0y9D+aF2dvHMrvgay70HzRElqA4MKA
 iTCdmL57GOQaAQmv5OP5NOW5GVsqhJzVmZAOUFgYSRXCQj+3gaSfvF8wjWiyXeRz4hX6
 aVc5xJF64L1D9ta9LSwijSs1zo4hJLxUlp62Nivo81PW2jA0KM5oOfhd9fNuaj2bmJh9
 qtTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=JHGCTUxo
Subject: [Buildroot] [PATCH v4 6/9] package/kvm-unit-tests: honour
 BR2_ARM64_PAGE_SIZE
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
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGxhdGVzdCBrdm0tdW5pdC10ZXN0cyBkZWZhdWx0cyB0byA0ayBidXQgdGhlcmUgaXMgbm8g
cmVhc29uIHdoeSB3ZQpzaG91bGRuJ3QgaG9ub3VyIHRoZSBzeXN0ZW0gcGFnZSBzaXplIGlmIGl0
IGlzIHNldC4KClJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8aHV0aEB0dXhmYW1pbHkub3JnPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ci0tLQog
cGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tayB8IDggKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11
bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0t
dW5pdC10ZXN0cy5tawppbmRleCAxZDdlZWMyZDIxLi5lZmMzYzg1OWFhIDEwMDY0NAotLS0gYS9w
YWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCisrKyBiL3BhY2thZ2Uva3Zt
LXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKQEAgLTQwLDYgKzQwLDE0IEBAIEtWTV9VTklU
X1RFU1RTX0NPTkZfT1BUUyA9XAogCS0tcHJvY2Vzc29yPSIkKEdDQ19UQVJHRVRfQ1BVKSIgXAog
CS0tZW5kaWFuPSIkKEtWTV9VTklUX1RFU1RTX0VORElBTikiCiAKK2lmZXEgKCQoQlIyX0FSTTY0
X1BBR0VfU0laRV80SykseSkKK0tWTV9VTklUX1RFU1RTX0NPTkZfT1BUUyArPSAtLXBhZ2Utc2l6
ZT00aworZWxzZSBpZmVxICgkKEJSMl9BUk02NF9QQUdFX1NJWkVfMTZLKSx5KQorS1ZNX1VOSVRf
VEVTVFNfQ09ORl9PUFRTICs9IC0tcGFnZS1zaXplPTE2aworZWxzZSBpZmVxICgkKEJSMl9BUk02
NF9QQUdFX1NJWkVfNjRLKSx5KQorS1ZNX1VOSVRfVEVTVFNfQ09ORl9PUFRTICs9IC0tcGFnZS1z
aXplPTY0aworZW5kaWYKKwogIyBGb3IgYWxsIGFyY2hpdGVjdHVyZXMgYnV0IHg4Ni02NCwgd2Ug
dXNlIHRoZSB0YXJnZXQKICMgY29tcGlsZXIuIEhvd2V2ZXIsIGZvciB4ODYtNjQsIHdlIHVzZSB0
aGUgaG9zdCBjb21waWxlciwgYXMKICMga3ZtLXVuaXQtdGVzdHMgYnVpbGRzIDMyIGJpdCBjb2Rl
LCB3aGljaCBCdWlsZHJvb3QgdG9vbGNoYWlucyBmb3IKLS0gCjIuNDcuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
