Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19984CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E68096E56C;
	Thu, 11 Sep 2025 19:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFWB7N3zTiqO; Thu, 11 Sep 2025 19:24:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08BA56ECC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08BA56ECC1;
	Thu, 11 Sep 2025 19:24:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8D34E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEC5A6ECC1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXzTYnNIRkMN for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:24:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AEAE26E56C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEAE26E56C
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEAE26E56C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:24:18 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b04271cfc3eso142180666b.3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618657; x=1758223457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4V0GbOIaEZ3aQmTTV3NL75Mh3A5gowrvvvsAHOE36m0=;
 b=F9aj+UXbDtH7ITnvB7+UccuBSQG7s4vaJrHwbfwVimEbEpRjMkVjqiRvS5Ns9l1xz9
 vK2sUL1eq1Hvb1p4ZlqU9duat7XJCuPqHwPm5IgVr9t8nVf9SeDmPx4j/eF8zOEuaiAw
 RsZMd3dFSAWeC6Cys+siw7m4lBaG/0sK9j0GRpPfPrLRGs8/nefg/Ruho6yChDGFJWcD
 6Do6d3yK2j0Ly/VJDr5xptz15PozRuXlXuvh5u58aCNBuq8vFhYwywx+bD+6kae7yu5D
 YC4e1ypqtNy31Ma2kqhPVd5fEfP+DAA2nemixJUAomCSWNpK1lCrxWf6SeOuW6YJWYsr
 Fv1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWID9kztu8kQ+3jJtdVDEZ2BaIMZ+2W0fKSG7gejyJFP6pVLVSVwAtD0BhUWkuv9v8YsGoLUyW6ZwM=@buildroot.org
X-Gm-Message-State: AOJu0YznCxTFmy8RVRSQi0kRTGPrO4tGy8B53r06g9jRTOUbDIUn6u/F
 r5B8HEhfEBuiR8DioKm/XAUHHSWjVz9R9KL5+1cJAcvZOMjVJxuGLKPX3QFkeF1pEnQ=
X-Gm-Gg: ASbGncv0aYH4v7CRVYEO7hTBRLOVOVdIRtyUbyYHn+YSNDSrFUa7/NMpLX/KtzVOXBa
 il+3R7xh+qtMrCKPCDUth1oCvR2cPkqIJCibqqlKvxM+OayAK6c5af7CwuESept20Miqf7hFEWu
 JGl+9FZUzpZpySOMBOggW0PnGerFgaFmMLLiX8puSQeB4TiEV8dbaOr4n3V4eQq7VgPSGqwHnOY
 zo+u2VNySEnFjlZOY18rTQVXUhOiPxTG7TZjP8er/gZ1D8ag2jFvQHbyhx6Ii1dwHdwiJxgd1g5
 9dkXRlNuN7MM4S1eWl+VFWXnpCgEXZsO/M4Hv3Mqp+kUOnmdmi9Ma3cMJocf4/TFlm17WTvaYca
 TcvEOY4/pIXm3q3qvf1ET/5MlC+WjTuzzsBnZSRCLZIlvoN4=
X-Google-Smtp-Source: AGHT+IE6t6HklZBwmOWXWyg55sqEsXGv++C7bQAw5NqlryRF+DyDiTYnqYKRdB3w8g0aimMzFNoMpw==
X-Received: by 2002:a17:907:d28:b0:b04:3e43:eccc with SMTP id
 a640c23a62f3a-b07c37e11c4mr30805766b.40.1757618656691; 
 Thu, 11 Sep 2025 12:24:16 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b31285a5sm201356766b.33.2025.09.11.12.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:24:16 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:23:53 +0200
Message-Id: <20250911192353.2672293-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250903132521.13551-1-titouan.christophe@mind.be>
References: <20250903132521.13551-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618657; x=1758223457; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4V0GbOIaEZ3aQmTTV3NL75Mh3A5gowrvvvsAHOE36m0=;
 b=NMOJ/SN+82KUxwEhbq5dfyGSBtRhNc+7wyXSw5jNnWTbB+TkKuArt0pxFTmZXbKDMs
 q7fnaMuEVEFzmTKDvavr+h/GSusdTZ02ceUKUAdeuQtrl9IvvEF/PRvg212F7CzKI+pJ
 oz/QwsMZauLCwqXYtY6YWNEd+hB/PU5nC17aji9QhNZ8EU5fws95xRsufcHKHJWpzgS9
 II1k0UL81VfMnykyFwZRojR9dvLkBdldX7ER6CBgnSG/JUzupvloKRkzy99M9831HESH
 CrmAN8ny+y2G01ON3boEYzx3FgaUeWuLs0fL9zZ8L096NBMqQxURhnO7tNyri/PPPjij
 jJmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NMOJ/SN+
Subject: Re: [Buildroot] [PATCH] package/python-flask-cors: security bump to
 v6.0.1
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
> This is a major version bump, because it could break user code that depends
> on the (wrong) previous logic fixed by the new release
> 
> See the release notes:
> - https://github.com/corydolphin/flask-cors/releases/tag/6.0.0
> - https://github.com/corydolphin/flask-cors/releases/tag/6.0.1
> 
> This fixes the following vulnerabilties:
> - CVE-2024-6839:
>     corydolphin/flask-cors version 4.0.1 contains an improper regex path
>     matching vulnerability. The plugin prioritizes longer regex patterns
>     over more specific ones when matching paths, which can lead to less
>     restrictive CORS policies being applied to sensitive endpoints. This
>     mismatch in regex pattern priority allows unauthorized cross-origin
>     access to sensitive data or functionality, potentially exposing
>     confidential information and increasing the risk of unauthorized
>     actions by malicious actors.
>     https://www.cve.org/CVERecord?id=CVE-2024-6839
> 
> - CVE-2024-6844:
>     A vulnerability in corydolphin/flask-cors version 4.0.1 allows for
>     inconsistent CORS matching due to the handling of the '+' character in
>     URL paths. The request.path is passed through the unquote_plus
>     function, which converts the '+' character to a space ' '. This
>     behavior leads to incorrect path normalization, causing potential
>     mismatches in CORS configuration. As a result, endpoints may not be
>     matched correctly to their CORS settings, leading to unexpected CORS
>     policy application. This can cause unauthorized cross-origin access or
>     block valid requests, creating security vulnerabilities and usability
>     issues.
>     https://www.cve.org/CVERecord?id=CVE-2024-6844
> 
> - CVE-2024-6866:
>     corydolphin/flask-cors version 4.01 contains a vulnerability where the
>     request path matching is case-insensitive due to the use of the
>     `try_match` function, which is originally intended for matching hosts.
>     This results in a mismatch because paths in URLs are case-sensitive,
>     but the regex matching treats them as case-insensitive. This
>     misconfiguration can lead to significant security vulnerabilities,
>     allowing unauthorized origins to access paths meant to be restricted,
>     resulting in data exposure and potential data leaks.
>     https://www.cve.org/CVERecord?id=CVE-2024-6866
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/python-flask-cors/python-flask-cors.hash | 4 ++--
>  package/python-flask-cors/python-flask-cors.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
> index 41c232df36..7070b5462e 100644
> --- a/package/python-flask-cors/python-flask-cors.hash
> +++ b/package/python-flask-cors/python-flask-cors.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/flask-cors/json
> -md5  a6e8202cc008ef6f70ce75a7ae7f8d9d  flask_cors-5.0.0.tar.gz
> -sha256  5aadb4b950c4e93745034594d9f3ea6591f734bb3662e16e255ffbf5e89c88ef  flask_cors-5.0.0.tar.gz
> +md5  2879503d54f25a4cacb62f7060b96e14  flask_cors-6.0.1.tar.gz
> +sha256  d81bcb31f07b0985be7f48406247e9243aced229b7747219160a0559edd678db  flask_cors-6.0.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
> diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
> index 1119648370..d0923d665b 100644
> --- a/package/python-flask-cors/python-flask-cors.mk
> +++ b/package/python-flask-cors/python-flask-cors.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PYTHON_FLASK_CORS_VERSION = 5.0.0
> +PYTHON_FLASK_CORS_VERSION = 6.0.1
>  PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
>  PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/4f/d0/d9e52b154e603b0faccc0b7c2ad36a764d8755ef4036acbf1582a67fb86b
>  PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
