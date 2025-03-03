Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B916FC282D1
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 16:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BFA4827A1;
	Mon,  3 Mar 2025 16:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8wrHzQRKy03; Mon,  3 Mar 2025 16:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EA1D82893
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EA1D82893;
	Mon,  3 Mar 2025 16:16:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DEB6944
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04A2A40E48
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPshFfpf8kHj for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 16:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A14D740962
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A14D740962
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A14D740962
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:16:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-390dc0a7605so2537374f8f.1
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 08:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741018559; x=1741623359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pnL/KOA5Dc3msnsG4Xa/4G90NZ/Qb/Jf8Nef/wmjZRo=;
 b=D/cJFFcstjsvHNh3oe9o0eqEgkZ9FESu4IlM88ypW78q2W5dqmrQctOqIz3yOOO4F0
 QIACoTwhZZstl5JEJbhBKMTEUpzIwtDM4JTei4OSzLc7N9xviL8Vis5UzjB32yaKPcKA
 4mboJSX0pOVHdFJmmGxieWBuFiIbb6OIM5fdHV3cO4jIpNUku5rAaQW5eGC8sE9wDZpd
 JiT/kjHOYvlOVC5WpQ4a+R512BdhnhbtfML/sJpTk7u5nExDdihgdFoo1j/7U2cu7+80
 vCnTIlx3NTJ+XIFVEeyeS2RNF0ic9JC3tulqSBvKQlMT9ZuNNIm631TJNc+D3aQ0s0hj
 G85g==
X-Gm-Message-State: AOJu0Yy3kAtnFi6MkxXaWM+UOXDLwfekgqJF/jgilB3MR+WQ9iM63HEA
 2DOyTgiE5HSWwMLGF8xF7uGIZwJn+UuckhNcN+nRbL7E2RlVYQecyORHj3lPG0o=
X-Gm-Gg: ASbGncsXblr6T+GGoeaGaX3K3lMvkdu9FmUdJfopb1bN/gBJVv2O3WVAwKD1oMtnjpC
 5jLQcdHC1x6J0A5OXECm0sW13pQOUApRFtDHQhcJkXI0gDIrS/r6r0QCkfoY1tTA9bbn0cEF1Cu
 vZk/SKb5SsDzAkH0qsuNy3HTe/NxBTMAsVT8BejcAKqydRvoQWaSOQ6tiSy2ejacQUW0GAzyjcn
 jRNdQwPsIvP0WzcrD7V5No9L9wHPf3n7zGxGXM7I43QfYVxD46qQEz+WZA6a4PU1wX88h8hPIuX
 DC63CSYjzrlRjrsD2VDTNXyZHziizGlMe8quV0LBvjwBhMw=
X-Google-Smtp-Source: AGHT+IG7BBobT8PqbMVplgAwlKsZgEY+ttzFibTzyY4rBYm9vwxgsv/I0h4dqpQ8AMKJi4XNaQ1hvg==
X-Received: by 2002:a05:6000:381:b0:391:1f9:c599 with SMTP id
 ffacd0b85a97d-39101f9c70bmr3662382f8f.4.1741018559501; 
 Mon, 03 Mar 2025 08:15:59 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bcaab6991sm756675e9.23.2025.03.03.08.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 08:15:58 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E87515F949;
 Mon,  3 Mar 2025 16:15:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon,  3 Mar 2025 16:15:52 +0000
Message-Id: <20250303161557.571619-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303161557.571619-1-alex.bennee@linaro.org>
References: <20250303161557.571619-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741018559; x=1741623359; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pnL/KOA5Dc3msnsG4Xa/4G90NZ/Qb/Jf8Nef/wmjZRo=;
 b=vXQNkAzagQ3aO94smTz1szB5fsyyBDmyYIgb1srinofjZwmXwib+L+zYPLUw1jrn2U
 SuVhBNagNu06r4kqQ9xU0Fp08rnG2BJ2nx5xWRd+VsBq9K3Ti1UX+6f2IH++Db0nPQd6
 MRfA3DJktmOd1YwhxKzB3EuIWb43bFkHnH0HcqfH/m2EB6ZnmGCx0fU+jnuiZlQPVZ34
 /vSfLYsqajgGgm056vbJ6UFx5m0iqKVDVu5YxAG2LVvabWY/k0PY/fTopJ/YiUSOeUQg
 VtsdkraZl8pmts3p3tg5nctqgaaP2BVfZxSO8o9gm+S6aba6M0dAeYyxtljtthQVPmcO
 9O/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vXQNkAza
Subject: [Buildroot] [PATCH v4 1/6] testing: drop unneeded vga/vnc stanzas
 from QEMU invocation
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGFhcmNoNjQgdmlydCBwbGF0Zm9ybSBkb2Vzbid0IGhhdmUgYW55IGRlZmF1bHQgVkdBIGRl
dmljZXMgc28gd2UKZG9uJ3QgbmVlZCB0byBjb25maWd1cmUgdGhlbSBoZXJlLgoKU2lnbmVkLW9m
Zi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgotLS0KIHN1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZmx1dHRlci5weSB8IDIgLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfZmx1dHRlci5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfZmx1dHRlci5weQppbmRleCBlNDA0MGNhN2RjLi4xOTQwNmI3Y2IxIDEwMDY0NAotLS0gYS9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2ZsdXR0ZXIucHkKKysrIGIvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9mbHV0dGVyLnB5CkBAIC00OCw4ICs0OCw2IEBA
IGNsYXNzIFRlc3RGbHV0dGVyKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCwgR3JhcGhpY3NCYXNlKToK
ICAgICAgICAgICAgICAgICAgICAgICItY3B1IiwgImNvcnRleC1hNTciLAogICAgICAgICAgICAg
ICAgICAgICAgIi1tIiwgIjUxMk0iLAogICAgICAgICAgICAgICAgICAgICAgIi1zbXAiLCAiNCIs
Ci0gICAgICAgICAgICAgICAgICAgICAiLXZnYSIsICJzdGQiLAotICAgICAgICAgICAgICAgICAg
ICAgIi12bmMiLCAibm9uZSIsCiAgICAgICAgICAgICAgICAgICAgICAiLWRyaXZlIiwgZiJmaWxl
PXtpbWd9LGlmPXZpcnRpbyxmb3JtYXQ9cmF3Il0pCiAgICAgICAgIHNlbGYuZW11bGF0b3IubG9n
aW4oKQogCi0tIAoyLjM5LjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
