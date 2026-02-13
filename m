Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87845EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59A606177C;
	Fri, 13 Feb 2026 19:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8rhy9P-Xuqv3; Fri, 13 Feb 2026 19:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70D6861784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011627;
	bh=ktv+LU/+FGEn1HtW0lFCZnAe0QmxJsFCVP7bOJRH++c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G5aP+xFM2i44QWqDfRtqcd8n/p6YKWA+hmntLtTTtUB70s+RYkuzFuEiY3sUwr6gO
	 TKp8D0iWhoNJrwoOGq3LPsrNoaHjES2y/eH3WAepIKdoutQf4p+2LF5FdSPEW8n83r
	 UVgxQMwjtgFfQF10XoLyUrnXu7Izp5CkTOfdAZuZWEvheh5QtMbpxQrTSwtR8uDWkR
	 oxFl1hLIHqFMKGUOLCFi8aOUXSRsRhIAZJHEFJOlqC0x9qlg5NSRdJehHN2BuJR3Xx
	 PX9HYmnjfxInIqCK+H8UaMlZ6R1g5vPPxZWChsbVkq2jlNOPWK4wJ3D3ngKqUF9AU1
	 Svh3oPZFDMSnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70D6861784;
	Fri, 13 Feb 2026 19:40:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2FF869
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C0C34026C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTmUQAZTlDDG for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B79D40407
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B79D40407
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B79D40407
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:03 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so7127465e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011482; x=1771616282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RlMg0k1uzTx/CeRPhHpD553FTQyyUSSaxu3K/GkuyeA=;
 b=ZAPG3WpW9yqD2UhBAApUQHvWvdSqBy6ZMVQH9R8mz0WmU1FkZMih6mvo5Haqnz2yXR
 al6oT0hdILaylyvC7EturcskZF1MDemy0Al2Vv7+N7CsfsE6pnm9wxASgW+5et2YAXet
 +DO52aljPhnYhCsBFG5snCB9jH0JbXcYeRzeaJG5+J+cd3IntgdlsA+QcQdKz9nIzdqW
 xTLrpabTtJhdwgUeI1YEV/tVu8ehQTHe2oPLU4o2P2Rkn9qZi03arpICcnfbAjuleuer
 6tR22OKr+aPnHefuDGuCjUd8lDcIkKlcQue2D/wMjN3l3zSQiXDnog7rpbvevyUpBtjk
 B5Gg==
X-Gm-Message-State: AOJu0YwjVwHi4ooflkIZ619t3+jnvPr94SITRk+4yYMu6t5B3zvZGmea
 OQouwEc+S44r+gwSyf2cyGjacHSqOxHarxvpfJHyXa1/g5Mo0rxTjy9Aq44oJxpCnTVJUwWfPr7
 fhOvK
X-Gm-Gg: AZuq6aLvibxjDrbpXlalu7wW7ZZMdH8HPJiV3PMeSVy8Y1mODESQm+n1BpKllKfIdU6
 MbrmS/7pYHmE0o8Vft6m7z+QqikFGmzy0Z9ejJmsGdf4HLtXa81EWCk0XXqf4dJXne4vg2KaqjC
 ZSjWsR/fuQJe7tD6olfyAvi31rmCK9vKP7h42HIY2LxfAXTpKuVFV+BOHQ+Wue8d0t1zrtf3WLA
 W63YZA5aELvy0IneUQLVESdG1TigYRCz8/Eylf2Xt6hvtLjRuTMp605VBJUaeGhKTSnYU53Pb82
 V8vuBPsm8rk6+aSZGHOq6kP6BzDOozZdPwmsvm0jjQR7TYfhkRD1oxTfE9ROx92zkUP2YVfRTnD
 xqFypFpiKULJQ2fier99AcY2Qwg/NcM7CZ3VaJEVwGugK7/HqhcsqaoS7bx+smzrK3w5FfmZPwl
 klm9mm0buiLwXdahY=
X-Received: by 2002:a05:600c:474e:b0:479:3a86:dc1f with SMTP id
 5b1f17b1804b1-4837109740amr67421825e9.37.1771011481431; 
 Fri, 13 Feb 2026 11:38:01 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5e11f5sm271376845e9.4.2026.02.13.11.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:01 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:38:00 +0100
Message-ID: <20260213193800.41347-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130414.59175-2-thomas.perale@mind.be>
References: <20260126130414.59175-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011482; x=1771616282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RlMg0k1uzTx/CeRPhHpD553FTQyyUSSaxu3K/GkuyeA=;
 b=IFGrxK6UYuS86qWs1TiCKBOoDW3+8KtAkXfGBU33L8iG3tb3yWaQKW8T1vq5JceneU
 bcX+I79h4fgTcJKMoeLEC2EuXorS5arHOB1YUxIPGS5yX+6T5KeutPP7JVe9831XA0PN
 BDYHCsg/sJuu58PafkH8bvwy1wZMHOx6cXe9WxleiBaPAPo1ePsQUVjyRg7A6LPgOUTl
 CiLipAXzJ4X74iVM7AfJ9APEeg22y1SHr3pS60GiDduU9uDI5g0x1g61sMHNmvRJxwLE
 C/0MvhRFN16L8xWtmBIPNcPiOiDy1N0UhteDLmK6k4cUNnwSx+GhpF4WWfU2vZw/9LWy
 ntFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IFGrxK6U
Subject: Re: [Buildroot] [PATCH v2 2/4] utils/generate-cyclonedx: use direct
 dependencies
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
> Since the introduction of the `generate-cyclonedx` script in [1] the
> dependencies were 'recursive'. This means that the dependencies of a
> package dependency were included.
> 
> The CycloneDX spec [2] states that only direct dependencies needs to be
> included.
> 
> This patch drop the recursive dependencies.
> 
> [1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to generate CycloneDX-style SBOM
> [2] https://cyclonedx.org/docs/1.6/json/#dependencies
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  utils/generate-cyclonedx | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index e864edf181..04ce8fc3a1 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -337,10 +337,9 @@ def cyclonedx_vulnerabilities(show_info_dict):
>      } for cve, components in cves.items()]
>  
>  
> -def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
> -    """Parse dependencies from the show-info output. This function will
> -    recursively collect all dependencies, and return a list where each dependency
> -    is stated at most once.
> +def br2_parse_deps(ref, show_info_dict, virtual=False):
> +    """This function will collect all dependencies from the show-info output.
> +
>      The dependency on virtual package will collect the final dependency without
>      including the virtual one.
>  
> @@ -350,18 +349,14 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
>          show_info_dict (dict): The JSON output of the show-info
>              command, parsed into a Python dictionary.
>  
> -    Kwargs:
> -        deps (list): A list, to which dependencies will be appended. If set to None,
> -            a new empty list will be created. Defaults to None.
> -
>      Returns:
>          list: A list of dependencies of the 'ref' package.
>      """
> +    deps = []
> +
>      for dep in show_info_dict.get(ref, {}).get("dependencies", []):
> -        if dep not in deps:
> -            if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
> -                deps.append(dep)
> -            br2_parse_deps_recursively(dep, show_info_dict, virtual, deps)
> +        if virtual or show_info_dict.get(dep, {}).get("virtual") is False:
> +            deps.append(dep)
>  
>      return deps
>  
> @@ -429,7 +424,7 @@ def main():
>          ],
>          "dependencies": [
>              cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
> -            *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
> +            *[cyclonedx_dependency(ref, br2_parse_deps(ref, show_info_dict, args.virtual))
>                for ref in filtered_show_info_dict],
>          ],
>          "vulnerabilities": cyclonedx_vulnerabilities(show_info_dict),
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
