Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588A3E9B258
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 13:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CC2141C03;
	Tue, 24 Feb 2026 13:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_nEQI7Pzf7l; Tue, 24 Feb 2026 13:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C2664071D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771940216;
	bh=8QQimeQU27qYUJAQNPoN9yRPPI22fI97ad6ezE526Zo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P6WLkfDROuxY2VTvKqiC1QK76Z3xx31fDa/jOFZgCljYtGdZb6mnnEGOC5blqrv94
	 C8O/oLhfME1qMX7IgLRwTv9SmZR5VZ6o/4VW5yL5+aoX2SrfHbjjZY+9GyTrh/NeIE
	 rAXR0oVNv4Xr1u7sC0IXi7BWB7yO0TvrGRWzVPul7kRXURjJcl9ugqai0wcuCEX4BM
	 dW+krVYLg8FnP/fi5rJyt+kxadFkW9UvJ3slMdZ9iiDyyB0lzDMnA7A0KBzPE1wKLM
	 oNYgmYePvVR7i03SxJ0PPQP7OlVnBnRAhBAznXe586Ucz8buUemVBLhyJg/Kdf3i2d
	 1tBIs2C4hdU4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C2664071D;
	Tue, 24 Feb 2026 13:36:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D356237
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 13:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E93782318
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 13:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1VXZLmqVShx for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 13:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A35B8230B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A35B8230B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A35B8230B
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 13:36:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48371119eacso65144155e9.2
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 05:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771940211; x=1772545011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O2zjl26d6OLa8+ts7HFahVaNLCYVWk8D5KugMi6WW4I=;
 b=IxvyKeoRxBHUC+R0IkDIOiUp9py+Hma1QC3p1kg/AS96PKX+6WZqlUtVdd8bgANV8Z
 mP9q+9INj5NlAPI21IW807ihOzI96fchu5wOZZnaAsNMR3+0A8z/jBKij3AYhTjLLQ0T
 ppneVAkFpRStl4qKBAHTdYwgCCPVPt66FPUrd5w6sIxH03fghCt2r9lj3gWI2lUwYMcv
 qD7IKYE3/28OSdXU5jQDNRwnmTI6o0XinUnl9SAjBj8OFX+86ndhd5RmkQFDawj9CS4G
 N53D7LsKDzQqC9OATHDDLJdzxqGFpGIzdP3Bift9pU67hRDDMwmhs+jbTf0hY0XBpN6S
 Bh2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+Rj6CWD0revwnHCeE/vg4EA+6ZxxPmWZbg80cXWsxrj7Yh3JMYjZUrMDQZ7rfJWWbTe9mtxu/CX4=@buildroot.org
X-Gm-Message-State: AOJu0Yz6eV3VfBQBZ/o2Ud14WAiZU/aYi1k3YjsWlSEC8G9shpkbPWLW
 Frp6Rc7kewme0nchYz7U1cvuZAED19TUZoqmU3X3TLKKF7sykWaUebR18O6vPxqGHIXfAOf19IQ
 TLwEB
X-Gm-Gg: AZuq6aJ5nyMqN9MHetW8V72Ab0emhIcbzZXeWX9zfDyHwzDB5GWD45VeELZPqEy22tH
 06dS0Gk3DFYDSUeBD/xhUdtn4I0sSF4hSRVi7UR0B9Gf664Ms4j9EvZeXfPiDywRW0668qispX/
 +3PjSgFOpoypVP77pzLJkFIpjerfzDLggBYp0DgYr/JuCrURgrHsuTDNAXxV0PUSjlnyBVV+oK/
 QwZvIOdHbsXY67JiGnzs69bX4TIkFooizdH7mUEyGgwAIc5gUflhvr9dWqVpGPEl23zJE2xshH6
 /ou/7W0DDfZRAwiy8L9M7XI+xXDmp9MHrcaXZ98kIq4dUmtJU2IeWga18FwsxWVKKaPpPt4r32P
 5iQtX4roOfB+dDvdPCNJh33JALOPoWxzvMbuZY30baKmykXVL0t6CzdJ2vvKW6ShpdU9GpAkBYQ
 nEX6WnqxYEIVmST0s=
X-Received: by 2002:a05:600c:a016:b0:477:fcb:2256 with SMTP id
 5b1f17b1804b1-483a962e470mr206891175e9.17.1771940210547; 
 Tue, 24 Feb 2026 05:36:50 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b891cd8bsm19862425e9.32.2026.02.24.05.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 05:36:50 -0800 (PST)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 24 Feb 2026 14:36:49 +0100
Message-ID: <20260224133649.89563-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224132033.1700023-1-fabien.lehoussel@smile.fr>
References: <20260224132033.1700023-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771940211; x=1772545011; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O2zjl26d6OLa8+ts7HFahVaNLCYVWk8D5KugMi6WW4I=;
 b=H+HhFtBU0/Xcl2yP86/Txus3wX3AcMhR7/AS5+Vz8d4GKy2xz2UbmmxJ5IBXKWNZtn
 3FwikMhU/xkeQa+lK+lGyyTo27mGr9QtW6LoRPKzrqXu1ZJ0bYlJ2K3X0zrI/ZsHOe4K
 oCYdMtWKZH0k26gKhaNPkDhb2oniBVIiRDns2seHxX5m1vHqu6vvQkLwrqYNcReYxvSi
 FRAJVzY6f2J2R7bPQ8GyzV/zGc4nVxDV9AqdgrGrhhdFty+mGJ6VMa+0NwF3hX6bN7vY
 vuBLDTVuNvb0tnztCXEvShCDdyxvJLiGQUYuFVQz77c8cV/C6drMe7JFsNNU+hFHPpXA
 pCyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H+HhFtBU
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

Thanks Fabien.

Acked-By: Thomas Perale <thomas.perale@mind.be>

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
