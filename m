Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800F9C71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 19:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF54608CB;
	Mon, 16 Jun 2025 19:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoxpwB0viafT; Mon, 16 Jun 2025 19:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AB54608CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AB54608CD;
	Mon, 16 Jun 2025 19:55:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7805D79
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E08C403DA
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0aK1nGuvxkbr for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 19:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19E224023F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19E224023F
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19E224023F
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:55:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0DC771C00D6; Mon, 16 Jun 2025 21:55:43 +0200 (CEST)
Message-ID: <7cafc718-5f76-4f5d-bce4-10f7364cd0a5@rnout.be>
Date: Mon, 16 Jun 2025 21:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
 <20250613110559.2665663-4-fabien.lehoussel@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250613110559.2665663-4-fabien.lehoussel@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1750103743; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=r1BsP9nyXgBIdIdaL047wOgmHqiIjcJ5AhDEDEVXfgY=;
 b=CAHGKTC3THabw0l6/aLYzhcZ4BQoqiKufFrRwv6yJ72H9UzP2L3MrKl8ueYjkrtQIW/tpp
 Kp1DvRk69gg0UFz20hVkxyESH6Xytuz2x5HqiJmGfCHKRJp6EH5MqqSAqoGFgDa26og229
 HiaIyoDzQ0LdG2CXV59FvDpfCjQtYjxQFEtLbVB5Li36BJb0tqxAtgsA18rFMfrmJbFJqZ
 dKyFTRhZa4BFH10zl9SRFghjS9zVYB06hnI54cbvLb8NZRBv/dVp8rjmh1GGhUox0yK+1I
 cDsstx25tlrnKX5uLqTCuL1DnUUHLvL8tHQggkNUwVbAQBi2oWwgZqyif2KM4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=CAHGKTC3
Subject: Re: [Buildroot] [PATCH 4/7] utils/generate-cyclonedx: add timestamp
 field in metadata
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
> Adds a timestamp field to the SBOM metadata section, following the
> CycloneDX specification requirements. This improves compliance with

  "improves compliance" suggests that it is currently not compliant. AFAICS the 
spec [1] doesn't mark the timestamp property as required though.

> the standard and provides valuable information about when the SBOM
> was generated.

  The value of a timestamp on a generated artifact is very questionable. In 
addition, it makes this non-reproducible (i.e. running the tool twice on the 
same config, with the same Buildroot version, will yield different results 
because of this timestamp). And finally, you do have this information already, 
with the last modified timestamp of the output file.

  So I'm not in favour of this change.

  Regards,
  Arnout

[1] https://cyclonedx.org/docs/1.6/json/#metadata_timestamp


> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
> ---
>   utils/generate-cyclonedx | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index a069f467b6..5a6a191606 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -17,6 +17,7 @@ from pathlib import Path
>   import urllib.request
>   import subprocess
>   import sys
> +import datetime
>   
>   CYCLONEDX_VERSION = "1.6"
>   SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
> @@ -302,6 +303,7 @@ def main():
>           "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
>           "specVersion": f"{CYCLONEDX_VERSION}",
>           "metadata": {
> +            "timestamp": datetime.datetime.now().astimezone().isoformat(),
>               "component": {
>                   "bom-ref": "buildroot",
>                   "name": "buildroot",

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
