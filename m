Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AEEC5DF82
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 10:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824F880C81;
	Thu, 20 Aug 2026 10:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8-PQjE2Q3kK; Thu, 20 Aug 2026 10:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787223441;
	bh=4oyemUv2SvkVExUVZQ44lR2nXkF4CGUaCv3craYJibs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j8rF1Am2QwcEGN5SCinuOlt6COG6ceGJmUUXmrVKovyVe0hrQmLLre3SZuS9AYqLx
	 A2+UnmbUYJjzNoF1Ko2r576Kv1mNH0zjDDX4uCYY3fqxwKJWWAiZO2VUMuxx7WKLZA
	 TAR4bsIdI79ntrvNM+UceRWtU3mHhlDzWo1byC99AgiME0Dt8HMvl6r0qwzUHj/T3B
	 SleyRVp7fCmd1LUcmAXyjFRzYpFwapZXnJAge2COanJnYgJxFcq2V6baQHWK8TlTnN
	 AVwtbmL922quvVvyiB1HqXcdgFLBIrOFgszyekw3nvYCIsPssJ3mJ4CU6dPPCnjJPk
	 ihrN5fZrqo2mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE99980C8A;
	Thu, 20 Aug 2026 10:57:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5627E40B
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4745A80C8A
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqkbKYlzvjpp for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 10:57:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCD7D80C81
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:57:17 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c15f020a223so306233066b.1
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 03:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787223435; x=1787828235;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Pti1kTF4dkgZ++1S016BemkC3vlyWlLwEx+6604Bal8=;
 b=SoVFSnEmefOIsK0mfyADFVNmqKDw4hFHqvl2dMg8enpgRwHLyc5PI+TAXJ32PBjhpG
 LOPDHRJcmN5/UNp7PipOcGFueCn7GyqLgRA+p1c1C2Z8RV9Aly5Tl82esqoLDt8im5Wf
 eYVCjiCbZuxL59EcqRo9E48hOn4AyjNEk1IFZGrfDxJmeP4Jl5L0Kcwiz9MOMHztddRE
 uUmHNpjbVZ7359Fi0t1nqgHyJ/KTvWI2obFwBB3KP4PXSMY0Qf7n/xaU56hZ/87rUxJh
 EEZ3Ro2/SwP50lARgAj57pBjzK54eEiHBCxnqA5R0+oKTI2igVs+adO9rxvyIz/Laffw
 LiPA==
X-Gm-Message-State: AOJu0YwHbHVc5nRdEAFlwV9Ny9m676tMCi/33r6nLNBcadSr47HeMjTu
 pfSK2IPIJdmUXdSJKRzcNUu0/Qh6MQpmJTgUh09HSaUv7pgLVeV7WMZOYDN4z6ZqNjyUJv2D/mV
 VDe3peps=
X-Gm-Gg: AR+sD10W065uo9bJ4KKdGuJ13AbSqGWlKC2qOy/Rw+A3bXgz2PYs8NTqT6t7DxWPtkr
 k1V7A4pNO4wbtz4sOUsvrfSYYaIw0i7qS0YtWHGkIXOCD91oCHAtEsb4OdT1jSGnbBEviC8QeEK
 J6Cd6bLCfkmGw+P3GhWjbnvB9RTYOg5ZQx8nc4oC4jqWogGDCEmyYfvJTlrUbgx8HE+XrhUZ9aa
 wIXSDZQ3MQkI+8DxgYA1qnWFyKLWUDX4zguJV88yqDd5600nqeWUX0Fpw+pcz/MLBnYLK/Jqi3g
 48RwewQyvABxSvdnOmlRjOArSkbfL/yqOHvbSoRxew3I+xZXtOokVf2IEr3L5nMyz+hRDBSrllJ
 oxvsDDN1k4FZiCcVOEtuZKWVJqpFE3c22SzDxB2tBnUTuj0k0+dUC75h1sUuwO0tzUyWqtWZ2ep
 KO+m9Co618gYaR8D2vXeZ8h9VWZmpN8xPJ4P4WQ4qOpcdu9kDK9fJHzR24kY+QcfWLFO2ztu9LI
 TvcJLOQuFCqtJbcYNffAntyoQHaX7I=
X-Received: by 2002:a17:907:c78c:b0:c16:13c3:b1ef with SMTP id
 a640c23a62f3a-c242e26272bmr910588566b.24.1787223435443; 
 Thu, 20 Aug 2026 03:57:15 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24591e0397sm52884866b.53.2026.08.20.03.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 03:57:15 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 20 Aug 2026 12:57:00 +0200
Message-ID: <20260820105705.1502630-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260820105705.1502630-1-raphael.melotte@mind.be>
References: <20260820105705.1502630-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/gumbo-parser: update hash following
 Codeberg changes
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

Q29kZWJlcmcgaGFzIGNoYW5nZWQgdGhlIHdheSBpdCBnZW5lcmF0ZSBoYXNoZXMgZm9yIGF0IGxl
YXN0IHNvbWUgb2YKdGhlIGdlbmVyYXRlZCB0YXJiYWxscyAoc2VlIFsxXSkuCgpTaW5jZSBpdCBv
bmx5IGFmZmVjdHMgYSBzbWFsbCBudW1iZXIgb2YgcGFja2FnZXMgZm9yIHVzICgzIG9uIG1hc3Rl
cikKYW5kIHRoZSB1cHN0cmVhbSBkaXNjdXNzaW9uIHNlZW1zIHRvIGNvbnNpZGVyIGl0IGEgIm9u
ZSB0aW1lIGNoYW5nZSIsCmp1c3QgdXBkYXRlIHRoZSBoYXNoIHRvIG1hdGNoIHRoZSBuZXcgb25l
LgoKWzFdOiBodHRwczovL2NvZGViZXJnLm9yZy9Db2RlYmVyZy9Db21tdW5pdHkvaXNzdWVzLzI4
NjEKClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWlu
ZC5iZT4KLS0tCiBwYWNrYWdlL2d1bWJvLXBhcnNlci9ndW1iby1wYXJzZXIuaGFzaCB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZ3VtYm8tcGFyc2VyL2d1bWJvLXBhcnNlci5oYXNoIGIvcGFja2FnZS9ndW1i
by1wYXJzZXIvZ3VtYm8tcGFyc2VyLmhhc2gKaW5kZXggYjg4MDlkNGRiOS4uOGUwZGQ5MTYyOSAx
MDA2NDQKLS0tIGEvcGFja2FnZS9ndW1iby1wYXJzZXIvZ3VtYm8tcGFyc2VyLmhhc2gKKysrIGIv
cGFja2FnZS9ndW1iby1wYXJzZXIvZ3VtYm8tcGFyc2VyLmhhc2gKQEAgLTEsNSArMSw1IEBACiAj
IExvY2FsbHkgY29tcHV0ZWQ6Ci1zaGEyNTYgIGRiZGMxNTlkYzhlNWM2ZjNmMjU0ZTUwYmNlNjg5
ZGQ5ZTQzOTA2NGZmMDZjMTY1ZDU2NTM0MTBhNTcxNGFiNjYgIDAuMTMuMi50YXIuZ3oKK3NoYTI1
NiAgOTBiZWE4MzI4Mzc2MDMzOWRhMTk0ZmI5MDExMmE1MzI4NTRjMTNjZDFlYWJkYWJjN2VmN2E0
ZGVkZTFkYmM5ZCAgMC4xMy4yLnRhci5negogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXM6CiBz
aGEyNTYgIGM3MWQyMzlkZjkxNzI2ZmM1MTljNmViNzJkMzE4ZWM2NTgyMDYyNzIzMmIyZjc5NjIx
OWU4N2RjZjM1ZDBhYjQgIGRvYy9DT1BZSU5HCi0tIAoyLjU0LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
