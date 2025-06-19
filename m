Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9238C7115A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 14:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68DE406E6;
	Thu, 19 Jun 2025 14:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_VzuQroDUyR; Thu, 19 Jun 2025 14:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4B4C40730
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4B4C40730;
	Thu, 19 Jun 2025 14:48:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41E75181
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33FB28114B
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oznrkAGV9fw6 for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 14:48:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7895881369
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7895881369
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7895881369
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:48:41 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-453634d8609so1823605e9.3
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750344519; x=1750949319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cXoKfwSe/2ZMLJQ2lar/gn2A7YYTN4jND+XcYoqN+js=;
 b=f548fbt3UkaGYSQ37aVTg0e89J2ZTi9L1/P/JvuMmafO0ENyIDiIEdPqVGRq9UXvNa
 bs/aJ2DMQaImIV3Zm8eeQ2uj/CkCtCYuZU0m8bp6hb+jLCmXp5eJwHtuKERlXz8OS6zW
 FBKg94bpXqMMhg27ShiUii5qPjbGfTz1UQdhk5RF5l+iVeGd8ZuAGVd5c/7bYxAjhHbc
 gCYG2i82vYEif+jFNKBVECX35Br1wKwskw17rZBwDTX5wOV68DJX/xbdQcKX/ZzYT1Wh
 IrSDOtr2BHN/aJHR6HIjENH8ykABaCS8YD0dNBntfcDi+J7YENH6u5akxYbSpjEaIrbj
 cnUQ==
X-Gm-Message-State: AOJu0YxRWqA98PfpvsV8EKmwXgRwDZ8P8UijhQ1OF2gmfkc4y+zWY7AB
 TcoW18lFHCGCSpvKBuOUYkbxQjWsTzht7HRp2Hvtst0IVO5eBlDU8hiBNvStF6Xrhc1bIriFB5Q
 vXa150IU=
X-Gm-Gg: ASbGncvT99F2cnHouQ6irc9GAoqHyqdy2GMD29aM5bn9eJwI7y6kXCA6sFXKN0ZgZwd
 LWS+bncNHHYkavwpZW9dYAjbRonTiR7YKX9pvXzr3GVoOA/QdI/d8hQDJOUyRhnaS39Bws6RPzH
 pYu9RYUBWSoqpZ5jn8kzIbUj+6wEkuZDl5zX8YP/64GAEov8NgJMrM1wPaFeQDugWb8nAqSap3n
 3wz9vZ/P76nMh8vfoOvOsxr5FfAO1zOAesWN80na7loRCBHy1Z7eQBWPuOMwjZXoo7lxBlTqOhp
 0Sv9leUHMyYzVUm2dZmOos0gd7MX2ou3SvE50l/4W6YBhEdI+/dKM5WdAeRd6mM=
X-Google-Smtp-Source: AGHT+IHOPkM3Hn0zL9ZxEwwQYQkXFlVqzk1eXfnsZuwVhXb8NIiG1ElcMYEJKsQgWBcFw4s73wVu5A==
X-Received: by 2002:a05:600c:638d:b0:43b:ca39:6c75 with SMTP id
 5b1f17b1804b1-453449cb47emr179984585e9.16.1750344519006; 
 Thu, 19 Jun 2025 07:48:39 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e97ab73sm32425875e9.6.2025.06.19.07.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 07:48:38 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B76055F869;
 Thu, 19 Jun 2025 15:48:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 19 Jun 2025 15:48:34 +0100
Message-ID: <20250619144837.1298990-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250619144837.1298990-1-alex.bennee@linaro.org>
References: <20250619144837.1298990-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750344519; x=1750949319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXoKfwSe/2ZMLJQ2lar/gn2A7YYTN4jND+XcYoqN+js=;
 b=bquWRVxgNMTV0uldCqjjGcl86ICVbw9bTVXTpFUiN/6JYfDsTM+8KkgyaA6s9Tofb/
 JWBKb9+m9aHxrL28zJR5IDX7HrPv9RUDTEf6j1R57P/hgnWoxrbC0oATKT5ABySudoSI
 xmQBiGAfIxjemVbeqWYNgf/Z8Um3KnI7YGEEEN6BC11mqtuvLmvNN+p65ZUeLJDrZnjQ
 gvZpwAFX/Xz8mkedOFLhWI5FymNYcfebWTbr224K2XjUPfYfiJoWDtMQFz8m0zczJWGr
 YuB0zOVbyYgNd3OwxM8eo6J7MF4SYxiKU4HNLaJt8DjqxpwmdJBQmFeMkwQQdSEeSo1N
 EjVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=bquWRVxg
Subject: [Buildroot] [PATCH 1/3] package/kvm-unit-tests: assume AArch64
 supports KVM
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

QWx0aG91Z2ggaXQgaXMgcG9zc2libGUgdG8gY29uZmlndXJlIGFuIEFBcmNoNjQgQ1BVIHdpdGhv
dXQgc3VwcG9ydApmb3IgRUwyIGluIHByYWN0aWNlIGFsbCB0aGUgY29tbW9uIEFBcmNoNjQgaGF2
ZSBzdXBwb3J0ZWQKdmlydHVhbGlzYXRpb24gZnJvbSB0aGUgc3RhcnQuCgpJZiB3ZSByZWFsbHkg
d2FudGVkIHRvIGJlIHN0cmljdCB3ZSBjb3VsZCBibGFja2xpc3Qga25vd24gbm9uLUVMMiBDUFVz
CmJ1dCBBRkFJQ1QgYWxsIHRoZSBjdXJyZW50IG9uZXMgaW4gdGhlIGNvbmZpZyBoYXZlIEVMMi4K
ClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KLS0t
CiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiB8IDkgKysrKy0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9D
b25maWcuaW4KaW5kZXggMDJlYThkZDU4Yy4uMDAwZjVkY2VjZiAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KKysrIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9D
b25maWcuaW4KQEAgLTEsMTMgKzEsMTIgQEAKIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9U
RVNUU19BUkNIX1NVUFBPUlRTCiAJYm9vbAogCSMgT24gQVJNLCBpdCBuZWVkcyB2aXJ0dWFsaXph
dGlvbiBleHRlbnNpb25zIGFuZCBsaXR0bGUgZW5kaWFuIENQVXMKLQlkZWZhdWx0IHkgaWYgKEJS
Ml9hcm0gfHwgQlIyX2FhcmNoNjQpICYmIFwKKwlkZWZhdWx0IHkgaWYgQlIyX2FybSAmJiBcCiAJ
CShCUjJfY29ydGV4X2E3IHx8IEJSMl9jb3J0ZXhfYTEyIHx8IFwKIAkJQlIyX2NvcnRleF9hMTUg
fHwgQlIyX2NvcnRleF9hMTVfYTcgfHwgXAotCQlCUjJfY29ydGV4X2ExNyB8fCBCUjJfY29ydGV4
X2ExN19hNyB8fCBcCi0JCUJSMl9jb3J0ZXhfYTU1IHx8IEJSMl9jb3J0ZXhfYTc1IHx8IFwKLQkJ
QlIyX2NvcnRleF9hNzVfYTU1IHx8IEJSMl9jb3J0ZXhfYTc2IHx8IFwKLQkJQlIyX2NvcnRleF9h
NzZfYTU1KQorCQlCUjJfY29ydGV4X2ExNyB8fCBCUjJfY29ydGV4X2ExN19hNykKKwkjIEZvciBB
QXJjaDY0IHdlIGNhbiBhc3N1bWUgYWxsIHY4LjArIHN1cHBvcnQgdmlydHVhbGl6YXRpb24KKwlk
ZWZhdWx0IHkgaWYgQlIyX2FhcmNoNjQKIAlkZWZhdWx0IHkgaWYgQlIyX2kzODYgfHwgQlIyX3g4
Nl82NAogCWRlZmF1bHQgeSBpZiBCUjJfcG93ZXJwYzY0IHx8IEJSMl9wb3dlcnBjNjRsZQogCWRl
ZmF1bHQgeSBpZiBCUjJfczM5MHgKLS0gCjIuNDcuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
