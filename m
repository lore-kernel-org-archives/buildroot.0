Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E15EFB7F9
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 07:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3FAD84454;
	Tue, 24 Feb 2026 07:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbcW6A_4mLjg; Tue, 24 Feb 2026 07:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E32E284457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771917777;
	bh=6DzWstAjnlFkjW5paoTkoEQ/QpcRryQtpB5zzprQDVU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mZIuRB/2Sq2zUXxAVstEMA3Rb6K2QT7wZxSQu9rd4KGGHapJySB0aN0JkLv7XQJMR
	 trZwj32iQSisVWp6vIpJZ6fLjTaDnmzeh7P+TWiFVOT6dplRUrfThV0wTt08JIuOCB
	 bVdPlXYh91728/78Pjwblnp0B5DUcgtizrMcSaalH4Vo/fBOO4NXRhMqSaEWUJwI2y
	 brFQN+jMgTxm/Gfz1nKts01pNvemXGP2jh6cXfEYF6fwUOsOaE52AFOZhB5K+3FE57
	 wGLS2ktdsQpD7bmOl/g2+ufJ3jm09ximnR6GIg/HPj4bxz5/3sw8bZIZmhwn9XpVBv
	 FYSK0Q+Cct/gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E32E284457;
	Tue, 24 Feb 2026 07:22:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC143249
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 07:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9173784454
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 07:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJB5YE8cNXMr for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 07:22:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BDDCF84457
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDDCF84457
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDDCF84457
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 07:22:53 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48069a48629so52765885e9.0
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 23:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771917771; x=1772522571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rKdJiK9ly39/tqqC5PzFurptFAt50GfzBFDDWANKvlo=;
 b=BJpSv+ipJxNYFf3S65P2MC0Lw+QYfZ689wgIkFPI3E/ClMR3bnEOb267xTGSE+7B+T
 wHmKJ1FTlb7uH064mFhkJb6+gj7ZZiGpfsixYMZQTIh0LTs/ldJyEaPJEadV7xLI9zAl
 A1IkYhHrNFWUj42CetHA55dvejDDXpn8qgv0tRyy2UZAd/EXmvwopOy49/bAO1LYNsCd
 aO2BQjZC93RUpiSCRglBgJzM/0rywSueyKO1tlvMbrvYrnqQfuvr9UGBZPOSHeDPlUsr
 6jTOppAxdNlnWjG12YGIeuPcaUU7GyyVsm/ePIK+n+47w2I/+cgKmF5gQrWIUDlSXhB4
 Csyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXphpV8jtbHt2Z6TDmyC0RlQy3qgc/7qFD51oASk8UkEq1F+oYJ/sHGh3hkgWkEWh/HmdyFoqH207o=@buildroot.org
X-Gm-Message-State: AOJu0YzSG9qIgcNuo2lRtmZJLazUzmPDekCTxRAV4Qy6+/QalvqPmS56
 Od26M3wvCmFC4pmrducdTL6gr4bOyeKjxXv8hyWHPhxGFx4/h5jtmeBFb/cEDPencr43vfCmoCM
 PQBY/
X-Gm-Gg: AZuq6aK65+XLP9MGFl7Jk6vXpHsPJVKl4lQ7vMi7AHm8TcjeLU5pU7A5gOQ56q5oYf1
 5GKlMNx2ztUvlhFvWvfeHX/dIyZW1lEiQi3Ln6YPFgdB95gQVTw4sLTduqW83gJZFSOK1QwuBTC
 mTb/8YsBPTE9GpK0SEGpfzqSMm6Zkm/1qQ2SADh3+vFfdUVGPPmmfOqWSxY4FM6DoiWqHlqAKfB
 vTSr07NIsEfjfdt//blXOfreI1CfMFU3tYrK9/NGSntEku5fwgqMxoBaPeuHnTuoR12Y2ESBHU8
 3JqHHUNeM6BPRgLFqqXzlRxiTghIIpgmQNia/1oQfVV8e3AjfqkQIfIEd/gA7/G5zaj+8bfu/Bh
 01x8E+hBG1rp6fCbT28rX79PNqJCfcOneCURMgEBT/G/EjuIYw5x+fYf6H3tG0dJMB4IE/XsrGM
 JATJiJ23ea3YlGMyzsGmY9WQwKcg==
X-Received: by 2002:a05:600c:a418:b0:483:b3d7:2e80 with SMTP id
 5b1f17b1804b1-483b3d72f30mr67561195e9.33.1771917771058; 
 Mon, 23 Feb 2026 23:22:51 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9caadd4sm228706265e9.11.2026.02.23.23.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 23:22:50 -0800 (PST)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 24 Feb 2026 08:22:50 +0100
Message-ID: <20260224072250.12521-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223165523.1392281-1-fabien.lehoussel@smile.fr>
References: <20260223165523.1392281-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771917771; x=1772522571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rKdJiK9ly39/tqqC5PzFurptFAt50GfzBFDDWANKvlo=;
 b=brSzAa0mTiUa55ce8DWYMSDD1AdmwbjLCNICYSwDsIDwexWIFK0o3ALeeem3sIWDsX
 C+kucJ3HwkwmJaGJAC7bW2zkt1lwXL2tkz5ZDD95HbdAlQ466DJRAoAt+z9wepnMwS6r
 ELt01NHwisO9TucQmH1RfWYVegGgoIQEdA69pbBpKYjnRpCRrBIUyEVJL33TwA4+zS1e
 joQqQg0of5xvLU7xUQS8eVbQYziYw8w1HPdOR3v/3w28y3FJJfPFsZ4wPd06IANSbAUZ
 Lo7dP8uTcaF1yhxMKpFB+0jG+HCMpwevU/15hdODYI3i7qMdNVyxyJ27s2BqthvCF9yE
 siBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=brSzAa0m
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/generate-cyclonedx: add
 source attribute to each CVE
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

Hi Fabien,

Yes indeed, this should be added for DepTrack users. Thanks for the submission.

In reply of:
> The CycloneDX 1.6 specification requires that each CVE include a 'source'

I'm not sure if this is CycloneDX spec that requires it or just DepTrack.

> attribute to identify the origin of the vulnerability information.
> Without this mandatory source attribute, SBOM files cannot
> be properly imported as VEX into vulnerability management tools like
> Dependency-Track.
> 
> Test Environment:
> - Buildroot: 2025.02.1 (or master)
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
> CVEs are correctly filtered and imported in Dependency-Track
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

> ---
>  utils/generate-cyclonedx | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 2b6c6d63d3..6007a6a402 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -327,6 +327,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
>  
>      return [{
>          "id": cve,
> +        "source": {
> +            "name": "NVD",
> +            "url": "https://nvd.nist.gov/"

Any reason to not use the full URL like the example provided on the spec:
https://cyclonedx.org/docs/1.6/json/#vulnerabilities_items_source_url ?
Does DepTrack complains if the ID is provided during the import ?

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
