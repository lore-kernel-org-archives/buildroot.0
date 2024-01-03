Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14678C47077
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 14:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B21D404B5;
	Wed,  3 Jan 2024 14:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B21D404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_y6MBHsO0b4; Wed,  3 Jan 2024 14:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53386419B4;
	Wed,  3 Jan 2024 14:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53386419B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 807181BF2B5
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 14:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6608F82318
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 14:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6608F82318
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ou8YWc5iysLn for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 14:29:23 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32E7B82244
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 14:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32E7B82244
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6d9bec20980so2638941b3a.2
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 06:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704292162; x=1704896962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D79eyfVmW6PJQxEoqRtlFJge5Zg0l4VINfdjoOZvXuc=;
 b=CYSX8y+h0NaHsZE1z4Z2VZxjIOv9wfgX4hiado854Wc/VJ5KtdMxcLieDqt7gdbM15
 J30sq2zhvPOraUE3Qb8cvvwjWqftnfLvCCAPBTZkWHnVv5wBy2VAEEJW4d2IkO1PPF/e
 vz9OdgWej2DgF2ieZtu2Mfe7EtsXNv7CpmQvb1HbjDHmNRpErifRdq7/P5GudDbIPZ7a
 8mXF+c8mReI6BEnvNJoyNm9NwkzPjMQpE/yPfPW0FRBb8uNK673pdgJNdPq+BM5ZbY5m
 CQbbLjbr4UxaE4Sm5gBeD60Gmojw/F4WlWg4k9mNpVcjVwfv6Q9q4xELyuK99midWl1F
 o75g==
X-Gm-Message-State: AOJu0YzXNdNYHtNImThbJAHwJ01UP5hYZQIHN4iKZFYGvnIP31Djju7+
 ulQIMZ6F2dgMT/qvrrzZqgMM+xk9J0LSNWWEgBm2dS9jqTpP4w==
X-Google-Smtp-Source: AGHT+IGZwK5Ctxu/kqH4IhRacGosAt/Ite+wznQ0qcVjxYoonI5BhxfdLwOiGSZCdMo+oTfFWrZEyA==
X-Received: by 2002:a05:6a20:7495:b0:196:dff9:3989 with SMTP id
 p21-20020a056a20749500b00196dff93989mr2608316pzd.64.1704292162383; 
 Wed, 03 Jan 2024 06:29:22 -0800 (PST)
Received: from alesmao.newtesc.com ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 le13-20020a056a004fcd00b006da13e27904sm11054045pfb.44.2024.01.03.06.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 06:29:22 -0800 (PST)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 11:28:31 -0300
Message-ID: <20240103142831.901515-2-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103142831.901515-1-flavio.tapajos@newtesc.com.br>
References: <20240103142831.901515-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1704292162; x=1704896962;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D79eyfVmW6PJQxEoqRtlFJge5Zg0l4VINfdjoOZvXuc=;
 b=eaO3NE1vpbUjVQZpNJM7rHxwRRPwKQu71VE2/zlsvQT9FGfPrNdXfNoeo9CCd6yd9k
 y4TcYX9J+JCN73VJPK7bOQ4zWoqCnXxY53duGBaVlE/YW2T/2unfbIaaY+1N2vsU+2Ba
 rYKLSPvNe80cev8PLer0d2yfWttvWXlZ8hAAydadTOrTUoRi5KAbTQbcwzeoZ05N+dPc
 LcBsY3UHsJIwfcoOxGiZZPRdPJvXUvPxbiNrRT0Ozr5CsvxDHuVvLhm2y0LjtHIZusGW
 cbMDcOo8mlKA4wzBgbDm+Jz/savqOnBPvRDh+5flw3/TQH4x04P06fFO+XV/HVBpkVNc
 6OFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=eaO3NE1v
Subject: [Buildroot] =?utf-8?q?=5BPATCH_2/2=5D_DEVELOPERS=3A_add_Fl=C3=A1?=
 =?utf-8?q?vio_Tapaj=C3=B3s_for_python-sqlalchemy?=
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5j
b20uYnI+Ci0tLQogREVWRUxPUEVSUyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggNjQ2YjhlZTVh
Mi4uMmI2N2M2MTZmYSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBA
IC0xMDc3LDYgKzEwNzcsNyBAQCBGOglwYWNrYWdlL3B5dGhvbi1weW1vZGJ1cy8KIE46CUZsw6F2
aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgogRjoJY29uZmlncy9h
c3VzX3Rpbmtlci1zX3JrMzI4OF9kZWZjb25maWcKIEY6CWJvYXJkL2FzdXMvdGlua2VyLXMvCitG
OglwYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15LwogRjoJcGFja2FnZS9yc3lzbG9nLwogCiBOOglG
bG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4KLS0gCjIuNDMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
