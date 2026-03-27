Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B28710ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AF98613D8;
	Fri, 27 Mar 2026 10:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7m9CNy9lwDb1; Fri, 27 Mar 2026 10:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30273613D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605762;
	bh=p+53g7nuHT2vI/3fg3TinR9w9eLovWfMTGUunCKlJhU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=atP+i/k2LkilkSMvBgy+erXVx83z1Iei7BPfmbUlSc6Pt4XTLy0CQ/CNNvZvFTTQE
	 ptmZQoueiqH2e5riBHJafTiKHoNhZIZk0MvAtoT5w7VpC21c9rzfks+2Vx2N4NLilG
	 vRNDrJlgTQiUMl71pPCAcFVDUSwEfVjWFBaWsx0k51jNGsTgTvFrb0QsTFayJ8g58w
	 DnVaLoA9LE96Q61Qtn3saqMqmfzRS0tK6bSwbNv4xlEn13H1XD5tyNEOKiiALqy2uQ
	 i70iYuewJ7moPrX8Ma1po1vcOzNkxWkeHc9J3hf4yzdgeKNQ/hSdIgHSQ7FmO5N+JM
	 bscJxxzRtlTcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30273613D9;
	Fri, 27 Mar 2026 10:02:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E9DA1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44C6783D61
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJvLY_F466OW for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A27583D5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A27583D5E
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A27583D5E
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-486fb112c09so19025045e9.1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605757; x=1775210557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OGT3pZxkEFIaMq+xYI4g3GVH4cG8hWTGpBlFBPQO/V8=;
 b=C+FajDkeuD/jgJ8PvsSM3yQ5Te99in03Qk5ufdNuWNQ4na0++Izpo9nAdcBFsWcJbR
 +RzP4PI33RTEHzXgiCe0p+XzalbjDLxpd70kfgZZgIEOXgmNAJyh9OZ8kuDGj6kCVQLC
 Bu6APEjT8jJoKlN/VdpczpzTiZzDmg01aMMCdTKAwvyAJEKq7/DsC4Gj5U75744x4B3l
 MFQEI0H4GGaZnpYRb6T2GPj4PIunarvlsmvH+Nl37F3mGWE3Yh2F7jHFUIak3yAMesBK
 jdOxfgc+5JythsfONsJMsGrYOxz9x5Vmcn1hj4HsNVMC2sIpEJH+5JflF8hTT8LuJiKM
 ee3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOt94yxxW6wHiEM7khtPYwhCrzKaFFK9nx0pfiJ6qLjbysMtkRk8Nlg3+hWbhND+HzwWZOkkfMXUk=@buildroot.org
X-Gm-Message-State: AOJu0YwgS9LjQDwDeGt2J6DoOzVk4hYlP0J1Z92mZQSnadOmYNsTn8Zn
 lKTGhqbour7AFl3jW2WtQAx07WpzHUeOa/QYQagb3oswOw9g+nSQy5IhAm6r72NeIdQ=
X-Gm-Gg: ATEYQzztkJU7wjXrXFSgQLMEWS7y7rsq4KmcD4HmgJCJpdslgLYz1xbTkxIJdoUp7G7
 WE20cM3XOCdb/IJhmlVWotODnUHmycfZZMG+bVaNJq8lR+Q2UkBsoKsRyf3r3bfeBj+PMbSWK75
 nhUR7qvmDjtTRQ91VQM5+WuEARcuqGZe/XE7N1htSyepc+0vCttOlJxLV4mX6+JnIEAn/qGLXTx
 wajebweR1wPSyjCqxoDQxYg99GEkyfK02M1T3n7sewTq9YX4z5xomUY0aoKjibaapai/KZxKt3e
 XoLmVQzPpg1B/V4nRZIgPkzHj5dSadW3E3AhAIp0Mxv9IMkKW69C9tl/Vqk+6r6iqNScjZqmfH+
 rL0I9ozPIDP651qgY9DErFhWaIkcCLZxgBv22LwZTQaGdT9keDOiLeYtWuoIAuOTqO7lcEoDA67
 dKCxoky5HywIU1j/3WMhHNUYBPTR8=
X-Received: by 2002:a05:600c:6287:b0:486:f4d2:eac6 with SMTP id
 5b1f17b1804b1-48727efc92amr29935505e9.13.1774605757185; 
 Fri, 27 Mar 2026 03:02:37 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919dfb54sm13998425f8f.31.2026.03.27.03.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:36 -0700 (PDT)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:35 +0100
Message-ID: <20260327100235.46151-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224132033.1700023-1-fabien.lehoussel@smile.fr>
References: <20260224132033.1700023-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605757; x=1775210557; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OGT3pZxkEFIaMq+xYI4g3GVH4cG8hWTGpBlFBPQO/V8=;
 b=eOXckNOKkNp/xUvDvrS80Ml3FN6X98u6sfhZo3B9T01yWHhAGkO4UbFlUJvnbgBeuQ
 WxVOYwoyBxaweuYS7IuDvdw3YSpRssLf1fF8QzVrv45wBuzkqnbxvXSeF6CJWZ63gBmh
 Vte4DvJyg69IBRxDXGgrs2kuEPPcC0754tKHNJsFF9tGNtzx2qTWItLvqkuTYZmcVKQi
 6PE51fhR08giJDW91SlAfRWCUzh9nbvAhd02InRn601uFWgTdsTXhoWUl4J75bjAG1V4
 +2hrIVIjpJyy/CP/ky3JYwUJfSK0kUrR2fwlIu+VFH+unKfiXMtM7LlCqoMFHrICQxYu
 UA/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eOXckNOK
Subject: Re: [Buildroot] [PATCH 1/1 v2] support/scripts/generate-cyclonedx:
 add source attribute to CVEs
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
> Add 'source' attribute to each CVE in vulnerabilities node, including NVD
> URL reference to enable proper import into Dependency-Track.
> 
> Dependency-Track's VEX importer requires the source attribute to
> properly process vulnerability entries. Without it, vulnerabilities are
> skipped during import with "does not have an ID and / or source" warnings.
> 
> Include the full NVD URL following the CycloneDX 1.6 documentation format:
> https://nvd.nist.gov/vuln/detail/{CVE-ID}
> 
> Test Environment:
> - Buildroot: 2025.02.11 (or master)
> - Dependency-Track: v4.13.6
> 
> Test Results - BEFORE (without source attribute):
> apiserver_1  | 2026-02-23 16:05:40,890 INFO [VexUploadProcessingTask] Processing CycloneDX VEX uploaded to project: e43fe185-c0a3-4e3a-a908-667344a66a9c
> apiserver_1  | 2026-02-23 16:05:40,941 WARN [CycloneDXVexImporter] VEX vulnerability at position #0 does not have an ID and / or source; Skipping it
> apiserver_1  | 2026-02-23 16:05:40,941 WARN [CycloneDXVexImporter] VEX vulnerability at position #1 does not have an ID and / or source; Skipping it
> ...
> apiserver_1  | 2026-02-23 16:05:40,941 WARN [CycloneDXVexImporter] VEX vulnerability at position #19 does not have an ID and / or source; Skipping it
> apiserver_1  | 2026-02-23 16:05:40,941 INFO [CycloneDXVexImporter] The uploaded VEX does not contain any applicable vulnerabilities; Skipping VEX import
> 
> Test Results - AFTER (with source):
> apiserver_1  | 2026-02-23 16:17:13,492 INFO [VexUploadProcessingTask] Processing CycloneDX VEX uploaded to project: e43fe185-c0a3-4e3a-a908-667344a66a9c
> apiserver_1  | 2026-02-23 16:17:14,054 INFO [VexUploadProcessingTask] Completed processing of CycloneDX VEX for project: e43fe185-c0a3-4e3a-a908-667344a66a9c
> 
> CVEs are correctly imported in Dependency-Track
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

Applied to 2026.02.x & 2025.02.x. Thanks

> ---
>  utils/generate-cyclonedx | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 2b6c6d63d3..35198a47cf 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -327,6 +327,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
>  
>      return [{
>          "id": cve,
> +        "source": {
> +            "name": "NVD",
> +            "url": "https://nvd.nist.gov/vuln/detail/" + cve
> +        },
>          "analysis": {
>              "state": "resolved_with_pedigree" if cve in VULN_WITH_PEDIGREE else "in_triage",
>              "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
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
