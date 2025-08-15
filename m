Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0A9CA0ED1
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 11:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59BE1814C3;
	Fri, 15 Aug 2025 11:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WoE0Bu9HZ_cF; Fri, 15 Aug 2025 11:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94F65814C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94F65814C8;
	Fri, 15 Aug 2025 11:07:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFA56196
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 11:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D628840ADF
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 11:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziN-rdbatUvI for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 11:07:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CC70404CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CC70404CB
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CC70404CB
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 11:07:44 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6188b70abdfso2733120a12.2
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 04:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755256062; x=1755860862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zG5xncgWpd+0jJGvOS5rrIAakIG+V2nJeDNfHeMlLKQ=;
 b=O7lD6CxVGm99UhydHZlOHDRFVqh8eZtXk3GHA6p2IJK7hQUPerswmBqLOmbA/6YPRG
 0+H2B/lRBig+RKiDAubvBKTiMnBsGTQ7v/pqRWcesiJvonIhJ3mastqQIkXyplt1480K
 HmBPutEFKXjQoCtVvr18/xkG2rY7A4252ReCa05qk/gtc6yNGlN2cEX0UWC6bZSgMwSN
 HvGeafov9kdCbsgFxfPOCAXMzhe/bwamREZ6hL5ynC2rQiFHbJb/M7r5+tlDfULG+rwo
 UAw9L0rCBaUx2mNYZyqBICdeu3IMW8o0R3sTBJ79YWTMgzZGDt5WrPC/ybn1Pcmt0tDD
 X56A==
X-Gm-Message-State: AOJu0YznL9J+0uTijVTsKEhZtvUIJQv2nr1yPMd84xQE+Usra3x573dH
 bpFCSYs1NzU1u7QvGiJKw9t7ZSkptnm4JeC5sF24coNwiKvbk8tPbyM8MiOD
X-Gm-Gg: ASbGncuVwlTHGX3+JxTdT6gwm8Mmepnj0WluPKSYcoONVjQnNutGxqsDHhuF1jqUH5h
 y9RITOUbJmOU0c2/JfgFGsvYafZtUBxPIi29LIkKxPOF8JVV6hmb1OAr60gHq0qBsfSdHs1//1C
 WKHnaqIGQDYQhNZ9Yl3Lgz3EKgRWhrJwRt3AWmOCj7wVY78LLurOsXEY5E7o4OGoel0T3XACN6O
 S29eibuO9rUQNroPsqR07jJtR9GBWULK4zdN//U1hZi9HTUHLiYirLji+EB7moXlpxx3WrDrGHG
 OUNOaePITITuADAxDM8ZEOy5B6QhLsu9YOlxreW/wR+5YvX+bt/9vl5BCpn/hvr7F1uy4pbhT7b
 y272YWQGakwUiwjYy/iE+CV+mY/eDm3U9tt+Iqg==
X-Google-Smtp-Source: AGHT+IHXIsjuZ2PUUmEZQs9CVe3nJFm3LvQu7Db0Ddnu9UTWVfvuQtHJsCuQX5oDdVfKRso10+mA7w==
X-Received: by 2002:a05:6402:1d53:b0:612:bd30:d326 with SMTP id
 4fb4d7f45d1cf-618b0558f0bmr1259842a12.22.1755256061886; 
 Fri, 15 Aug 2025 04:07:41 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618b02b1cefsm1280320a12.55.2025.08.15.04.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 04:07:40 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Aug 2025 13:05:45 +0200
Message-ID: <20250815110739.9546-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cecb803e-1707-43f4-be41-0b13acdf5112@rnout.be>
References: <cecb803e-1707-43f4-be41-0b13acdf5112@rnout.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755256062; x=1755860862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zG5xncgWpd+0jJGvOS5rrIAakIG+V2nJeDNfHeMlLKQ=;
 b=RrL6hk91AnkgBoWOP1X5HIxyYfB6hdCIAswo+BZ4sn7utXC3kl0VXoT/54qNwDzq6+
 znQmDr/sdSlkEoedt4RQ4I8RqJqVpuyOO7xT33Hs4aP4hsm+dFq57bVc1aNLjQm2HiOy
 oK4sV8PpXPb7rILDkhf8p0h9vS2E4M5NXYvXNJY7edckV2ImT0rKdN0RgLF/FKkjwXnW
 bs89Tv2e4XrqagSoXbg+Zx7+0rnoWJ4IqA91kxC78JAvOYS0a+DFmrgZi0RE6XsguxDn
 JNDzEu5vVu8T6qCXBbAmIJTLZxmyC0Y98+rnyG8sZKQll9s/UEZFgTTj5OLaVRlzl1T/
 z8dg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RrL6hk91
Subject: [Buildroot] [1/1] package/nnn: new package
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

SGkgQXJub3V0LAoKTWFueSB0aGFua3MgZm9yIHlvdXIgcmV2aWV3IGFuZCB0aGUgaW5mb3JtYXRp
dmUgY29tbWVudHMuIEnigJlsbCBtYWtlCnRoZSBjaGFuZ2VzLCB0ZXN0IHRoZW0sIGFuZCByZXNl
bmQgdGhlIHYyIGluIGEgY291cGxlIG9mIGRheXMuCgpSZWdhcmRzLApBbGV4YW5kZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
