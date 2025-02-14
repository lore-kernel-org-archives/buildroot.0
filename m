Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11A8C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C09E4085F;
	Fri, 14 Feb 2025 11:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAXtL03Q9_8j; Fri, 14 Feb 2025 11:12:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D12F40D90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D12F40D90;
	Fri, 14 Feb 2025 11:12:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCAEF1E3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC6128484C
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWrNobB1nHut for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:11:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BC8F84847
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BC8F84847
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BC8F84847
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:11:59 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5dccaaca646so3506789a12.0
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739531517; x=1740136317;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WLIunDzUf9jy7GU2CTGceNT4oxIcqf9ZzHOUmU2uB9I=;
 b=emvzg1DSJ6FfW/KGTcV9c+Z3rGJr4fu/oZpB/zWDxfOd8EGuw0IZXeY+vKqp85K2Y7
 emG5EV1mZAPBjIeq8IKG7xtyYCUpTapvozJrXlVxUPCH6rYrDqntPvSbSCYCuNXBERPt
 3hUdubbgHZEtj+iQiOEHBBfPJlHLDH+JTLHo+CA6M/To4s9TIV+w2WvfYLiuJO4JjVg1
 ziFwlH0QC14kjQpFxm7vP9ZKtSaZqBOpnaTgxVad2p3XfV7QAt7XTlRBgzSDfYffBSXV
 5PPQjXvNnawaqfLikGSEqESuGHIfwnzi/UxgVbUj07nUhBN3i4Ejp78yAKXCRADSDWhC
 8Peg==
X-Gm-Message-State: AOJu0YwiGjI3sE7I33p/MwoM/OBODfT8/gi8NKBO502dPPvoYD0SUWVb
 B1liLAAFv59A0Cmc6ZfwKV+flRvYB/S4C9ITiVQURX1Xygq5ydZOoW39sM7hUZY=
X-Gm-Gg: ASbGnctlxFSN8bHpKSO2AUrioYytRDTQ2CnJBMy030GwzBS5MDEqn7BUWo+mDjjsHAR
 dHJ+EltzGNC+8EGQvpr1Ozj0r/fUIHxOyAGQ6Oq396KIUUjzCtWKy+xsjS3I7pX8WqC4/MDAt+/
 L5pLVc6Ou+WcqHFU7g5wL/6DgZ3E+ClCOugyeCCiO+SrhKP8qpKosIDRh/0pMvPIsF6A1QKLd/2
 8yqvLUFPzsDG39C9JHZ3GU7xxIWGGkrL0YJgu1uLCZlk2pjvriSK9Fmya0fJogZa91wJd+xFA+m
 sw2lOgG2gw/c1M+4Aw==
X-Google-Smtp-Source: AGHT+IFTTcY0g6Q3w2WyEAObftylPh3YtqnjHRc8jCCgdxbeV3Ds4kKhy0APS0poPwPMhordIPd1BQ==
X-Received: by 2002:a05:6402:1d50:b0:5db:68bd:ab78 with SMTP id
 4fb4d7f45d1cf-5decba815dcmr6987510a12.10.1739531517111; 
 Fri, 14 Feb 2025 03:11:57 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece28808fsm2702930a12.75.2025.02.14.03.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:11:56 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 988545F7DF;
 Fri, 14 Feb 2025 11:11:55 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Adam Duskett
 <adam.duskett@amarulasolutions.com>,  Daniel Lang <dalang@gmx.at>,  Eric
 Le Bihan <eric.le.bihan.dev@free.fr>,  Julien Olivain <ju.o@free.fr>,
 Romain Naour <romain.naour@gmail.com>,  Valentin Korenblit
 <valentinkorenblit@gmail.com>
In-Reply-To: <20250207182349.2746817-5-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 7 Feb 2025 19:23:49 +0100")
References: <20250207182349.2746817-1-bernd@kuhls.net>
 <20250207182349.2746817-5-bernd@kuhls.net>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 11:11:55 +0000
Message-ID: <87ed00pypw.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739531517; x=1740136317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLIunDzUf9jy7GU2CTGceNT4oxIcqf9ZzHOUmU2uB9I=;
 b=h8vXQBoW1Lc8DU6HFNqpPnVhzR+QmOiHG6+IhBL7v3y+tp1CoCoo1f48La9AZL9WMo
 OBodPYHCbLtTCpJe+HkowIOA6hV1SQ7C9bQ6Y2jrkfkbL1DeSJFkw7VOzzdMM8poDJKg
 BepnUrkuTXmg9v/BoMk9O6Ti7vKNeZWFuRXLU4nia7nP9sH8sRsGDwtw4mQ+eJWbn3zs
 oNFE5Dp62pxVz8hCVrItUUp4nt4AbFP6s6XmDH7q0/JtUHSVeA7fnmjUOS0J1UtKSdfV
 2e04VpvZWjIYEJNU90S+m4KM3P/5r1Jw458wI7c/0jhWaXcK0fIr8pOPtD0o9n1+8jIy
 4Ncg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=h8vXQBoW
Subject: Re: [Buildroot] [PATCH v5 5/5] package/{mesa3d,
 mesa3d-headers}: bump version to 24.3.4
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gd3JpdGVzOgoKUmV2aWV3ZWQtYnk6IEFsZXgg
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUg
PGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgotLSAKQWxleCBCZW5uw6llClZpcnR1YWxpc2F0aW9u
IFRlY2ggTGVhZCBAIExpbmFybwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
