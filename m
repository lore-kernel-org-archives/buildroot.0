Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBF6CA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0566361C2C;
	Thu, 21 Aug 2025 19:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wV6hKXpKJfYS; Thu, 21 Aug 2025 19:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 368E5616BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 368E5616BA;
	Thu, 21 Aug 2025 19:21:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 099111C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 443918463A
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzQyeO0Entjg for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BB55846D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BB55846D7
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BB55846D7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45a1b05ac1eso8296235e9.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804045; x=1756408845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I5vi2eDKike/ZrWl5TnG+v86NuG83lxwjLkmCvR+VAE=;
 b=abxxAzHJtuDII6xjoemx+oTW5lLJqxUA8BmjJEIhowRBBkj0OWNPQf4uVkrSPEyPLU
 UDnkedFzHZrHGsKmzhowEX5HdHZNGrwLnbFxxQlAGFKAmq/LT6xOykjV59FsKIilm3hu
 c76KuHxms68ievxv0B8qmVAgAwHLjKU8O4HztUZYvqQOUYXUvg0tIBdN8dV4zPMD1NvA
 j6PNZl/j5C4le8rUOWuoWg/yF90sq38TN51vE7eMt6MHALrNHOAAeV2T5eNXHm6ZuBuj
 UpWulh3i3t8ACoJ3nLeX+8SwwiSwmBAiWp1XpXyMvbnA27q/uDcyf2QFGZbQr+vKggTN
 gKww==
X-Gm-Message-State: AOJu0YyyKgts490ConFoBi4ukZo7r3DOPD24ZmyuUxipJprYUItGkNJr
 1Io4+E08lYL+ztPFwAj/TJ0EUk0u7EAxkA3qPOwpAJeFDQGQHjwAuJduyYMzCgOm7J0=
X-Gm-Gg: ASbGncsK4OmAvTY/D4HoP/Dck2yOmi9K51TyToxEseidQkcTUGqndI95T+LwNw6DgPK
 CEBwbwbivS27lpT463gO/o/pI8m9Vp1m/oyks0VfgrKg+sX/rLtbfot954qAertk1BmnIQuOvCU
 fk2GNpE8/9L55VYzlzPbQZIqbeNSM0Px7EKRtVRq4pR2ruaARgdROpbVVKBfOVVRLZnsnYAFYfw
 RIZZz7hP5/DkmBReZMGcHD6Q0qFOVDB0bsJKdVv8Xk8hmmKd+k6CYecSbtqCj2fvvaDstJvM6i2
 j8JG8kADEVLL8Zr/CqriMewd5izl4KRsgLGryOKAT46/xRc4myDCrpKb/kbNNeO+ZKby/JEAl3Q
 RZj+dRgaGa5D/4Q==
X-Google-Smtp-Source: AGHT+IF1+FE8vFoqyYiut70h2oz4ReIzbCVVmlXXSJyM57NXYmcgbc1HX/xEYsZUPoc0MNGVK71aoQ==
X-Received: by 2002:a05:600c:1c28:b0:456:2698:d4d9 with SMTP id
 5b1f17b1804b1-45b5179ccb8mr2045815e9.3.1755804045248; 
 Thu, 21 Aug 2025 12:20:45 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50dc4c55sm8125825e9.4.2025.08.21.12.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:20:44 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:20:44 +0200
Message-ID: <20250821192044.23504-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807152907.3225581-2-thomas.perale@mind.be>
References: <20250807152907.3225581-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804045; x=1756408845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I5vi2eDKike/ZrWl5TnG+v86NuG83lxwjLkmCvR+VAE=;
 b=AYYY90HOkG3l5adv3QuUNagJ2zq/jbJUiQxPemgFlAq8guv0Ql8sa0gB+hHmWe6PNx
 v89RW4QcEKlAPOIlu81ZcEyJO2qf7X2LQkbS9einFrkrj1nvQfaeVP4LrKZA9ELMnIzN
 VPJ2xzhIBAlRgW2fMgHqls/rWm63J/dG/XGlM2+euVYQi9O1UHdXLO6gtMfWKPkQ/mbX
 fnK3e00RP6r3EyXvJXXxye3hrARchAF1LMuWsLSW3vdsIPfo0S5FdSrezVXEjb8Y2PqR
 LwH2FCTZ6nukgv7OeGGNWmV0b6Gt7Y8F/LeNIXZNf8nu2OUPwkpfGIzpyUKmMKYP/r0g
 iteQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AYYY90HO
Subject: Re: [Buildroot] [PATCH 2/2] package/luajit: ignore multiple CVEs
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This patch ignores the following CVEs that are already fixed in the
> current version.
> 
> - CVE-2020-15890
> 
> For more informations, see:
> - https://nvd.nist.gov/vuln/detail/CVE-2020-15890
> - https://github.com/LuaJIT/LuaJIT/commit/53f82e6e2e858a0a62fd1a2ff47e9866693382e6
> 
> - CVE-2020-24372
> 
> For more informations, see:
> - https://nvd.nist.gov/vuln/detail/CVE-2020-24372
> - https://github.com/LuaJIT/LuaJIT/commit/e296f56b825c688c3530a981dc6b495d972f3d01
> 
> - CVE-2024-25176
> 
> For more informations, see:
> - https://nvd.nist.gov/vuln/detail/CVE-2024-25176
> - https://github.com/LuaJIT/LuaJIT/commit/343ce0edaf3906a62022936175b2f5410024cbfc
> 
> - CVE-2024-25177
> 
> For more informations, see:
> - https://nvd.nist.gov/vuln/detail/CVE-2024-25177
> - https://github.com/LuaJIT/LuaJIT/commit/85b4fed0b0353dd78c8c875c2f562d522a2b310f
> 
> - CVE-2024-25178
> 
> For more informations, see:
> - https://nvd.nist.gov/vuln/detail/CVE-2024-25178
> - https://github.com/LuaJIT/LuaJIT/commit/defe61a56751a0db5f00ff3ab7b8f45436ba74c8
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/luajit/luajit.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index ebec4d87ac..f4836df91d 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -12,6 +12,21 @@ LUAJIT_CPE_ID_VENDOR = luajit
>  LUAJIT_CPE_ID_VERSION = 2.1.0
>  LUAJIT_CPE_ID_UPDATE = beta3
>  
> +# Fixed in 53f82e6e2e858a0a62fd1a2ff47e9866693382e6
> +LUAJIT_IGNORE_CVES += CVE-2020-15890
> +
> +# Fixed in e296f56b825c688c3530a981dc6b495d972f3d01
> +LUAJIT_IGNORE_CVES += CVE-2020-24372
> +
> +# Fixed in 343ce0edaf3906a62022936175b2f5410024cbfc
> +LUAJIT_IGNORE_CVES += CVE-2024-25176
> +
> +# Fixed in 85b4fed0b0353dd78c8c875c2f562d522a2b310f
> +LUAJIT_IGNORE_CVES += CVE-2024-25177
> +
> +# Fixed in defe61a56751a0db5f00ff3ab7b8f45436ba74c8
> +LUAJIT_IGNORE_CVES += CVE-2024-25178
> +
>  LUAJIT_INSTALL_STAGING = YES
>  
>  LUAJIT_PROVIDES = luainterpreter
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
