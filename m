Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2D2C71136
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 19:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 893BF80ED4;
	Fri, 13 Jun 2025 19:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRGqy9hajSzs; Fri, 13 Jun 2025 19:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A73B88112D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A73B88112D;
	Fri, 13 Jun 2025 19:54:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5EB4183
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 19:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D701360EFA
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 19:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzCcpfS2XzdJ for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 19:54:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D46BA60B8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D46BA60B8F
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D46BA60B8F
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 19:54:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 636161C00D6; Fri, 13 Jun 2025 21:54:38 +0200 (CEST)
Message-ID: <7b8c1766-43fb-4331-98c0-61ea8ee215eb@rnout.be>
Date: Fri, 13 Jun 2025 21:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>, Vincent Jardin <vjardin@free.fr>,
 Titouan Christophe <titouan.christophe@mind.be>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
 <20250613110559.2665663-7-fabien.lehoussel@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250613110559.2665663-7-fabien.lehoussel@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749844478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PPfVFVDWZiNTQynRRN+t3pkU91Kiw5jDYM7wQDaU7KY=;
 b=gVHn/uhnVhWPQJuzFjAijb6dK9cCMgXu3B16F8KG6QKGqcbNUSiRAtMyqHtzLNKRgpIvMX
 j6oKv36k7bYJprxlMowIO6/lmT+fO2z1kDpeb4OLm3SDCGNO2zwmhZ0qQqsZW+rOhtDkBo
 sUrm+0SlU0Us0FLLBprMQAzYyPqW4s4VhcuP2A+NCbsPfV+eqt0+lTEifynb6ss3KFI2Wn
 w9CFpB9XOD8gCjDPjI96eNzS7q/hm9UcK+0P++wJAJPQTnSFdFc6k5LxcyloMIUdRoo/Ys
 hRpJoDWnZDEr+AsQeGoGpcvapxX9nd+XfjCv6Va+GY40hGPfACxf3acgLZjOZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=gVHn/uhn
Subject: Re: [Buildroot] [PATCH 7/7] utils/generate-cyclonedx: mark CVEs as
 'resolved' instead of 'in-triage'
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/06/2025 13:05, Fabien Lehoussel via buildroot wrote:
> Changes the status of CVE entries in the generated SBOM from 'in-triage'
> to 'resolved' to accurately reflect that these vulnerabilities have been
> addressed through patches applied in Buildroot recipes.

  We discussed this in the FOSDEM developer meeting, with Thomas, Vincent and 
myself (all in Cc).

  The reasoning behind in-triage was that we don't actually know if it was 
resolved, resolved with pedigree, false positive, or not affected. In fact, 
"resolved" is the least likely (it means that the vulnerability was resolved 
through some other measure than changing the software, e.g. by changing some 
other component to make sure the vulnerability becomes unexploitable).

  In addition, we felt that it was better for the downstream to re-evaluate if 
the vulnerability is really resolved (or not applicable or whatever). That is 
perhaps not ambitious enough though.

  Finally, we felt that for any state other than in_triage, the other fields (at 
the very least "justification") should also be filled in.

  We concluded that "in_triage" was the best option to start with. The detail 
should give a hint for manual review that it really was ignored by Buildroot 
upstream. The idea was that you'd be able to use some tool to keep track of your 
own analysis, and merge that with re-generated SBoM from CycloneDX. I'm not sure 
if that really works - Titouan (in Cc) has been working on something similar, 
perhaps he can comment.

  Regards,
  Arnout

> 
> This provides a more accurate security posture in vulnerability tracking
> systems and reduces false positives during security scans.
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
> ---
>   utils/generate-cyclonedx | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 30c0d48857..a9998e3fb6 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -234,8 +234,8 @@ def cyclonedx_vulnerabilities(show_info_dict):
>               "url": "https://nvd.nist.gov/"
>           },
>           "analysis": {
> -            "state": "in_triage",
> -            "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
> +            "state": "resolved",
> +            "detail": f"The CVE '{cve}' has been marked as resolved by Buildroot (patch applied)"
>           },
>           "affects": [
>               {"ref": bomref} for bomref in components

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
