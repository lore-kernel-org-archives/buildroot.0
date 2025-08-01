Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C90AC87FCA
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 15:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CBA983DE4;
	Fri,  1 Aug 2025 15:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oy1KEzCWp9ZH; Fri,  1 Aug 2025 15:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9837E84196
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9837E84196;
	Fri,  1 Aug 2025 15:07:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A050160
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70EAE60A79
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mqal1nkbqhK6 for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 15:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B775D607B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B775D607B3
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B775D607B3
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:07:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b78d13bf10so1812664f8f.1
 for <buildroot@buildroot.org>; Fri, 01 Aug 2025 08:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060852; x=1754665652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1OK4/w0FxOaA3HOvkPz6jYd/5ZCIAiy4kigUIGvJ/Bk=;
 b=r1TnxIA6C8tEHm4CFZA5kzxHYuoHJjC7zKriIjpzUVbTDBQwDFmtTmHsC8VoJxZmWJ
 tP8C6DtHOryFJ6K22DpTk3henbaMNzlGYuyku+mTXL0NJxEJ+X3cWL8u+LwVhNEWlMM1
 uFeTBH2JDODeM/AwfsVo3TlwRLg3ubwElY/4e/IOpQLWvkLXnfYKN5BMidmCY+trKCel
 lvVURBB7RXH4hjnBBiS8zWBr/ulSoYPZ//zwK1ECNEiWjSlt9OlDwbyQBJ5wtbD9Wz1g
 mlSSRciLa1PzDqx93gDJX2uOgg4tuo+tY9KGyyOMFulXwhdTW4GZavnnzly7L4j7B/xB
 C5nw==
X-Gm-Message-State: AOJu0YyfdWdpx1G7WaCxpD4BU+2V3jOxpy4JU3Eg7ywHXHmKfapK0kvJ
 l9L35JPf8oDLkbMQPUkiXRl6PA5T4Ee27AXwIqOFQVRUprvlxj7yv92Btp47fCktOaTytb74FUO
 CLq5P
X-Gm-Gg: ASbGnctIcK9nqLzASPyO5i7Yq8uxBMRtr3rZ1YjwvZXM/ewbhzTtie0eoyEWqCtjklU
 3WP/Vm6qaGJtOhNYjrBOZWaXHPY6k8/Fjmh4e1A7DUGckVyEwnA7bqJp3wpJSidXUwjqp+CNtG6
 wpuIt0WihycLMGLg2lbOmxZh+r2UX/yCaQPmPMFR+y6erGZwEDClDicDCcl+i0FHYnFkRMeM+lo
 O9d90PT5YAsbNxOujqBvWM+s8UXgZsoM0wh0LkqUNtwCOOT2jbOPFcXx18nQl24bysRmomC3WHm
 oczfy5gka4ujaqupcQY4uviK64P1CasHekvEA3lMK/hZiXBl3PhDBRXu/IZGrVnuvRnk8v3V9YZ
 4a7PzVkPsyzZWwmt7a8aN6kQ78ImvdwQgRdQU2KqPN0WzyMZVOi3o1gdYHpApT00OqZRDHVjIUm
 g4rseoV2s7
X-Google-Smtp-Source: AGHT+IHCvpC06ZoY7t21iHmJcZCWLNQf19B3/XtJtkIPSbw+n8GdpFs8dH5c1pT77JhSSERdY7uA2Q==
X-Received: by 2002:a05:6000:40db:b0:3b7:888d:8d9a with SMTP id
 ffacd0b85a97d-3b8d94bb19amr83812f8f.29.1754060851516; 
 Fri, 01 Aug 2025 08:07:31 -0700 (PDT)
Received: from mind2.local.ess-mail.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee5790dsm66731015e9.27.2025.08.01.08.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:07:31 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  1 Aug 2025 15:07:15 +0000
Message-Id: <20250801150722.4003476-3-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801150722.4003476-1-raphael.melotte@mind.be>
References: <20250801150722.4003476-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754060852; x=1754665652; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1OK4/w0FxOaA3HOvkPz6jYd/5ZCIAiy4kigUIGvJ/Bk=;
 b=GBWHQ/T0jxLsFCoyhSXt9j+xB2DJboOlzK2kjPhjqYTI7C8DF6zeltzA55gllW9n0c
 xD/u81BDeVH+sTzyyrf9QZ3jzAcuW97Z8hvrAYpfhO9ci7ugO/JhdQ9exW3HaiA4iz8V
 PNzITIgJwYtLIYFQ/JkvUMfqf0hZzNaH2O95EXKClQdptqp3jPYPMwu0rx+Co4FYWMrK
 O+A/DD2JezlRJijM0rOWjOyt6N1xV1Cl7dGK6lYjsdHXp+8hDC1edZdYQ/RQt+sEGQSg
 JGuo58DvOYRHtk7zQeOPLKP9QSWzhY/Maywnb7ZNvPB7OS8LweOoX8sn+SGc7g04Kg0/
 wenQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GBWHQ/T0
Subject: [Buildroot] [PATCH 2/6] package/python-pymupdf: add missing depends
 on python3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIHBhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weW11cGRm
L0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluCmluZGV4IGU2ZTdj
MzhjOWUuLjgzOTkwYWM3ZmYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29u
ZmlnLmluCisrKyBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvQ29uZmlnLmluCkBAIC00LDYgKzQs
NyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX1BZTVVQREYKIAlkZXBlbmRzIG9uIEJSMl9U
T09MQ0hBSU5fSEFTX1NZTkNfNCAjIG11cGRmIC0+IGhhcmZidXp6CiAJZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkgIyBtdXBkZiAtPiBoYXJmYnV6egogCWRlcGVuZHMg
b24gIUJSMl9TVEFUSUNfTElCUyAjIHJ1bnRpbWUgZmFpbHVyZQorCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfUFlUSE9OMwogCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1NXSUcKIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfRlJFRVRZUEUKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTVVQREYKLS0gCjIuMzQuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
