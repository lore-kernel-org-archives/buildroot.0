Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09029CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D233980E25;
	Thu, 14 Aug 2025 20:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z76_tak0w7uM; Thu, 14 Aug 2025 20:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FBDF80E1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FBDF80E1A;
	Thu, 14 Aug 2025 20:31:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE692228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4560402F8
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9pYgOxaOKFh for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA2E5402F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA2E5402F3
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA2E5402F3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:50 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45a1b0c8867so10282145e9.3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203509; x=1755808309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jzniVCoeBK7ycih20pTv3o5Hc7cxIn6q3Mx8f1W+dFU=;
 b=i3D6vey6mS1O/fDI22nQv6jVcm/d/gDiqjyz2eEuqEYJeSLlcYHmap+F18oQ+XSzfF
 T6EvAbIkY86Xla3kjJFIfkoigb3P1qJLBr+NGnxd35JhqZksGDVlBfdBGdK3bEIxesoi
 4W3cxw4E56Q3KZLW5s59uJtLsxI3uJVyR0BQ/aZ71yvFXrkh8gTAgWm8UJGGP7QXLX4T
 B6DSxvGIkV8DT8NdxT/nlKkqMUvzK3mCHMTM38i7JluvC+VJnw4jLeo9N21j9PIzETvk
 FpXks+UtAaoXB2Kc/V1ryZd5ZKvXXDb3JPKBykj/lKnu23fXVPReEFS78zqnMPS8pS+Y
 CWdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl49v26d9V4HWy9WsGCHQkU2GxSW5/IsrD8SYM/YwFiXYqZuGyIOVVxdRSv/wVnnr1jFDCr7yWiQE=@buildroot.org
X-Gm-Message-State: AOJu0YwTyRqDMkRvSz9vfZCbgsQV/wUHXlNXfvixfuz71jiMryDXjeIg
 8Z2hAUe889j+ffYonvGZL3k/slIagnCaSVLqL7bb157+FS4E1O0ND4s3BkGCRcePpm8=
X-Gm-Gg: ASbGncvUSjrXZRQcTxyXL4nrC7b238pV5C7pMDvXAqwtLNOCNRnKcvpGERyjOPFEAKr
 l+4iKTG4XR85qKaQBUSVLonbyZlvgt04hOfmA44oVfRJSJf8kHDb14XJe2v2SUz6a6Kyztgc6VN
 FpA84XhX5kQgy/gzkpp708adYnIE+MEBOBgpvHc8x6ZU/ReF21hAadeJHBNU2zRxCj6HsQmIcbr
 NcOj2zPTiftrtO4nZULEF+7Nu6kUWmUgeDeKe6bXeIE/sqlz9fHHmqn7eMOQWI1yOcP4qXis6f8
 4SoxvL5aQL+OyMoCB8ev2ol5cuIoK/nW1z9gi9A9ptp9BIX+gFlREZoiC2VRAdknyiyv2Iukj7V
 1LbBFQvwx9C70/w==
X-Google-Smtp-Source: AGHT+IEKQh0oPDIq5htYKNyiujNqFxDUQ0rnsdag+c1r8OXG/q2j0OTRSEtsQ04+GfXrm0TUEzgm+w==
X-Received: by 2002:a05:600c:4f0b:b0:459:d8c2:80b2 with SMTP id
 5b1f17b1804b1-45a1b604efemr35725695e9.7.1755203508990; 
 Thu, 14 Aug 2025 13:31:48 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6cec65sm34544785e9.11.2025.08.14.13.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:48 -0700 (PDT)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:48 +0200
Message-ID: <20250814203148.2815410-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716093401.1213358-3-fabien.lehoussel@smile.fr>
References: <20250716093401.1213358-3-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203509; x=1755808309; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jzniVCoeBK7ycih20pTv3o5Hc7cxIn6q3Mx8f1W+dFU=;
 b=TOLQHh4dbPM0jVQEX9L/SF/f5bq5bP5bep2hEuzB3eFkk0pJKKN/1eS27mPBYs0mex
 4KwL4vtLcJ+EFUkzEuz6218pUt5b25uWVJd391X3xnNK5FMgi/A5Pb9iVLuvCw7bA3s6
 eyeGUgHcfJYaT9+BsD0Oyg9SIwE+OHfr0le8fKF1z6TiNk4ZRAeEgDVbqoy08V8IhetI
 MB9sV5a+L1qDme6HiyWa/YdP9oPiZWG1Add2AgzrpM7j37nYPppGI8VByZAe6QJr87O0
 9DqDtDOBeB5WlqKD9PW/saVuQ2Uv8uShS8it09P6zZrCDROvd9srTFKji63kqz6Ey64z
 r4dA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TOLQHh4d
Subject: Re: [Buildroot] [PATCH v2 3/5] utils/generate-cyclonedx: move
 metadata section to top level
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
> This makes it more readable and easier to quickly identify basic information.
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  utils/generate-cyclonedx | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 14f655bca2..d3acf755e1 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -298,6 +298,14 @@ def main():
>          "bomFormat": "CycloneDX",
>          "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
>          "specVersion": f"{CYCLONEDX_VERSION}",
> +        "metadata": {
> +            "component": {
> +                "bom-ref": "buildroot",
> +                "name": "buildroot",
> +                "type": "firmware",
> +                "version": f"{BR2_VERSION_FULL}",
> +            },
> +        },
>          "components": [
>              cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
>          ],
> @@ -307,14 +315,6 @@ def main():
>                for ref in filtered_show_info_dict],
>          ],
>          "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
> -        "metadata": {
> -            "component": {
> -                "bom-ref": "buildroot",
> -                "name": "buildroot",
> -                "type": "firmware",
> -                "version": f"{BR2_VERSION_FULL}",
> -            },
> -        },
>      }
>  
>      args.out_file.write(json.dumps(cyclonedx_dict, indent=2))
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
