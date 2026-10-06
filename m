Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8727CA6004
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 19:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E5B74054A;
	Tue,  6 Oct 2026 19:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrIj_6nNKn1i; Tue,  6 Oct 2026 19:18:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 24D5F40767
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791314323;
	b=P5me7CWcAo9nHM8YqcfZO5e78dcW0W6UsPhYTfn0eZu2si8+zJ/RtjXJWZQ65IHZabPD
	 HV0Lcw5lyzklrou3c8tVRMOPFVOIhxcyzYpKwjSA+49q+YUU/8ec222uTxVHtMi9Ad5T9
	 Aair8upd25AfyhQi4hFtV/pgP/MISGLELHFGrDd3+lV3XlV5iQj6ruu9P59bZTXUnv4+y
	 DJssaI505yjITeFh1YySIn6pViBRQWHQN5oxxdr8Gxa4C202t9UW6fQBd81ckownnrG2I
	 JLhn3002vrXSploNz9C1Lma2RLDHKfk3aBm3Bsmubpvz+/Cmr9N55Se8WJ1IaqRX7fw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791314323;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jY5UVqaSiX1hV/wpBrpvHteST++6sHHVSt4dpD9OB5k=;
	b=dDd5D6GrMCKx6el589v+aWuFSBoSpXCt9ekf72yWagRmAhQkB3yFBVX1eqQj7g4LoX+E
	 5fxbju3hnsj9i+cHT3N2H5ws4i8Et4pBwsBUVHlRdNwZ93EEbA9NpfiShWzwPkyeiqufK
	 SBm1okYaZKQBYIP7dPyM+RLW7DYJ6n4HmMeiSz8c0AKuRry9nqo9Ejvl+Wi8GNEyhTehs
	 D1l5QmdfS5L4UNsHXgG+FtwDHJm/7aJi4koCpv76V9B7r35gJt4jH8uQ0XibplymbecTD
	 HrZqzdEdpiCkDpxQ2hHnAth9mqJXYgzZewFLqR7RpmKPXLA8iJP+N3KaP2QFWWPj+7w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791314323;
	bh=jY5UVqaSiX1hV/wpBrpvHteST++6sHHVSt4dpD9OB5k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P/aGrXD3leIDP5nIKzYpBnTkIShGZdkHepQRTEVTP+V+U2KKpyUaViPXG9XXjrgL7
	 Nv2Gj5jIZX7PNUgfaK6qpAI07C3ftElL/OE/+DxZXqkEQHY7w7n8C+Zq0mpHkR2FCL
	 ERV/wZtK35ye7cvMMrE5gpjX+0zCK1FAv0pj5qxG/b1YrWg0cgvE95QPjfOpBuqmY9
	 thtaUGAO1N325/gdQsmtfFPbl9DMvQZ1pJgqajz7lld4gMFGO82OyzF5IR8w2SwSwA
	 ZQR0nNBc9JkeatgcqX+ijqcZVcwF4owyZLSEUV0XuGGqYxwhxEcbDR8zUMBj80ahC7
	 MpEVkpFeiQfUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24D5F40767;
	Tue,  6 Oct 2026 19:18:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1A2E1D2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C96F1607F0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFcrqi7-7YQS for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 19:17:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E3A9260624
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791314245;
 b=fWjwSuigAoe4PVplgJhQV52ftRT6cw4rUlw3lnnywf9wCuA0p0uagIbH5rifvYLwCt2x
 VrvdeHMD8OKv+rMWVzMfmYjY/TSHZKMK/CKOjKyuQOipRioQIe3rdw2oqC955PZza6wPx
 w6IPcGWSmBpfpL5K7ggAITi96P61088V7bPd+W32XaoQpehq7OvPz+i+7NViIONdF0ISW
 HgI5tSqT/a+KS7V0PljuCbt9E6/RyhQDPiWpv+EvrrCuT1Yrps3Y5q0+uSIFaFD3jBIiQ
 GYCmRvEHUmcQNKLdKYGhDi3UNHcuivvp/yTW6OlDuB9aPIs39dzbyfuS38A8PPW1+9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791314245;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=fYCL/hV12F41H9bKZ+C/YuqugH5nEJPR/oHna8iUuug=;
 b=AsQ0qWMZ+bpA0HhC12UePMpsbYGzckLEJfWXJZ1DcUSYZhNw8cXpZNTTHXYHrJWkRvBc
 XctmguOCAo/AR24itWZ2I2Bk9it7OoanqIoX+bUR6CNiRjxGdj4NONVs/3IyuvFkcpeF+
 AKkfFxQa3r2yqK8BYu0X9ijR6rHBMvYtcw/dDxJiIMwWF27umA0XMmdkVRNKFD0NsrqQI
 EdEYhCuRdl4Fg1sFjzhRpxcHXX0/vJnpMPSzM7tohJgGKgBE87qVb2Eangqik07q7t7VS
 SZbPen6jpi8MYAhBDTbR9TyPWfjTjmxjIZqqMzv1JGbeEzjx0JFh1PqYzmq+v30pP8A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JRFOqqnu; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3A9260624
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:17:24 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-487048857f6so878377f8f.3
 for <buildroot@buildroot.org>; Tue, 06 Oct 2026 12:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791314242; x=1791919042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fYCL/hV12F41H9bKZ+C/YuqugH5nEJPR/oHna8iUuug=;
 b=pui5VaLHr36DFmq6CiGEQBXdwczwTElhLqotp9wIcPmvapZJozfXETcaDcoeNzzNek
 2Z/3LfrwBoywJ8PeVbnc3Hy9XguTH7zRKSr+4pPj30yJUS5vsnZuZLBDICRtNa/ktpVC
 enUEXxo1N5ZnJXY+dSaVilQ9OiNvB5G3sLNLv2pGQ3z6KjShcQXyxzFK0HpAzLYvKOAW
 wcYlWnbRf/gclY3EJrKpIGEqhKrWsuis5mkuT/8ad0Xc0Ln1E4GHwYVX7zbJDAT7J25y
 vIfh8gASRvxP/nOcN8II7gK+t2p9TN0vt8tFaJYDKtmEihizECgBKnM1KXy43mKuXm6A
 sOhA==
X-Forwarded-Encrypted: i=1;
 AKwUvByWGGnLoim18VEe6jz8ybgQPu6Nfu/t5An7DAuq05zZ9AXe+tNqMWxhChj1cB00nJHnPWlN1rI9jcA=@buildroot.org
X-Gm-Message-State: AFq9FYIB5wTY6cWM3SYHRFXzO0UucN1Kcvi9OIWRnNefQbclJw0g1klM
 dvsSkrdKuhCnf1Zx5rBAt5R9H0SDuTN459E6xvjsu85gV+jwrcI/IUfNW0WTc96RUDM0hCKKTX2
 gGGjf+kw=
X-Gm-Gg: AYBFou0PauyfoSYjmkdYNmXjhbp/BYzEwfUyxLC9H0F+howZvUPrP5W1ZaObEWJ/486
 HJYtbFU5kyfjgjTOOHQvcfDqtc5g5j/baphlFB0MSvH9zWWJpkB+skvLB+VF4dgk5NJfQr/diOv
 /oEa7ZeG0c8T+/bfMPpd8H8xkDe3hYHshaKt4nwGB4uJYNN5lZXImg0CJIuxw7QmTLg4T/bNRg7
 +cOWzW/vyc7hypA5J27iSmeKK7Amnt2/T3J2FsMJY87NSgl7ZXvvunkVh7rEWWQdD8WcnaH6hEe
 Eua28+/LpaSgm18KaPgyibA/Kfkj+rkOHFPG/dUzv1v4ArrK3RGtdAz8EJ56oYRdiIOSlEzwUQa
 jeTlgTVidqKlTkdE8U5PhJqX287RtoPoZDryBNwEmJ8Rcjz8GRAFdKUAXP8OF2Zhpx7h4Ul0qbq
 4l69tpgYo9c+JpuOB2xrZZWmO0YCI7yJh2JT2+4HEjZr0NZfbDOalU5A7WzhfsFycPwFs/EW8Wp
 f/8XsWZoAIZDefvtbD38B6V+9qGHCkIY8g55IW1qboeQ6WklEf+Vv4R
X-Received: by 2002:a05:6000:480c:b0:48b:2a1:dffc with SMTP id
 ffacd0b85a97d-48c7288b053mr552365f8f.40.1791314242372; 
 Tue, 06 Oct 2026 12:17:22 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-6134-ce7a-f873-1485.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:6134:ce7a:f873:1485])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71d3d3eesm1254336f8f.53.2026.10.06.12.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 12:17:21 -0700 (PDT)
To: Mahammed Sadik Shaik <s-sadik@ti.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Arnout Vandecappelle <arnout@mind.be>, thomas.petazzoni@bootlin.com,
 Bajjuri Praneeth <praneeth@ti.com>, Prudhvi <prudhvi@ti.com>
Date: Tue,  6 Oct 2026 21:17:20 +0200
Message-ID: <20261006191720.184725-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923105122.659234-1-s-sadik@ti.com>
References: <20260923105122.659234-1-s-sadik@ti.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH][RFC]utils/generate-spdx3: add script to
 generate SPDX 3.0.1 SBOM
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

Hello,

Thanks for taking the time looking into this.

I checked the output in spdx3_viz. Do you know if there a tool I can feed the
SPDX SBOM into to perform a security scan ? I would like to compare the results
with the one we have with `support/scripts/cve-check`.

Thanks !
PERALE Thomas


In reply of:
> There is a growing need to generate software bill of materials (SBOM) from
> buildroot configurations. Right now there is CycloneDX which is optimized for
> application security and Vulnerabity. while SPDX is designed for legal
> complainces, copyrights, and deep license analysis.
> SPDX 3.0 is a ground-up redesign of the SPDX specification. All elements
> (packages, relationships, annotations, licenses) are first-class Elements
> with their own spdxId URI and creationInfo, serialized as a flat @graph
> array in JSON-LD format. This format allows the generated SBOM to be used
> with modern SPDX 3.0 visualization tools, such as https://tools.spdx.org/app/spdx3_viz/.
> This patch introduces a Python script that converts the JSON output of the
> show-info Makefile target to an SPDX 3.0.1 JSON-LD SBOM.
> The script output contains the following information:
> - A list of all packages as software_Package elements with information
>   about version, download location, checksums (from .hash files),
>   CPE identifiers, VCS references, and applied patches recorded in
>   software_sourceInfo.
> - By default virtual packages are not listed in the SBOM.
> - The Buildroot package type (target/host/toolchain) is recorded in the
>   software_primaryPurpose field and the element comment.
> - Per package, a simplelicensing_LicenseExpression element is emitted
>   for the declared license. Deprecated SPDX identifiers (GPL-2.0,
>   GPL-3.0, LGPL-2.1, etc.) are mapped to their current equivalents
>   (GPL-2.0-only, GPL-3.0-only, LGPL-2.1-only, etc.).
> - Structural relationships: the SpdxDocument describes the root
>   firmware package; the root firmware package contains each top-level
>   package; inter-package dependencies are expressed as dependsOn
>   relationships.
> - hasDeclaredLicense relationships linking each package to its
>   LicenseExpression element.
> - Ignored CVEs are recorded as Annotation elements (annotationType
>   review) on the affected package, noting whether the CVE was fixed
>   by a patch in the Buildroot tree or simply marked as ignored.
> 
> More information on SPDX 3.0 at https://spdx.github.io/spdx-spec/v3.0.1/.
> Usage:
> make show-info | utils/generate-spdx3 > sbom.spdx3.json
> 
>   Example output (abbreviated):
> 
>   {
>     "@context": "https://spdx.org/rdf/3.0.1/spdx-context.jsonld",
>     "@graph": [
>       {
>         "@id": "_:creationInfo",
>         "type": "CreationInfo",
>         "specVersion": "3.0.1",
>         "created": "2024-01-01T00:00:00Z",
>         "createdBy": ["https://buildroot.org/sbom/...#tool-..."]
>       },
>       {
>         "type": "SpdxDocument",
>         "spdxId": "https://buildroot.org/sbom/...#document",
>         "rootElement": ["https://buildroot.org/sbom/...#buildroot"],
>         ...
>       },
>       {
>         "type": "software_Package",
>         "spdxId": "https://buildroot.org/sbom/...#busybox",
>         "name": "busybox",
>         "software_packageVersion": "1.36.1",
>         "software_primaryPurpose": "library",
>         "externalIdentifier": [
>           {
>             "type": "ExternalIdentifier",
>             "externalIdentifierType": "cpe23",
>             "identifier": "cpe:2.3:a:busybox:busybox:1.36.1:*:*:*:*:*:*:*"
>           }
>         ],
>         ...
>       },
>       {
>         "type": "simplelicensing_LicenseExpression",
>         "spdxId": "https://buildroot.org/sbom/...#lic-GPL-2-0-only",
>         "simplelicensing_licenseExpression": "GPL-2.0-only",
>         ...
>       },
>       {
>         "type": "Relationship",
>         "spdxId": "https://buildroot.org/sbom/...#rel-1",
>         "from": "https://buildroot.org/sbom/...#busybox",
>         "to": ["https://buildroot.org/sbom/...#lic-GPL-2-0-only"],
>         "relationshipType": "hasDeclaredLicense"
>       },
>       {
>         "type": "Annotation",
>         "spdxId": "https://buildroot.org/sbom/...#ann-1",
>         "annotationType": "review",
>         "subject": "https://buildroot.org/sbom/...#busybox",
>         "statement": "CVE-2022-28391: Marked as ignored by Buildroot"
>       },
>       ...
>     ]
>   }
> 
> Sample SPDX3 SBOM generated is available here:https://gist.github.com/sadik-smd/4d428052f71c90d85ddf0a15b2c998f5
> This SBOM can be validated at:https://tools.spdx.org/app/spdx3_viz/
> 
> Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>

> ---
>  utils/generate-spdx3 | 813 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 813 insertions(+)
>  create mode 100755 utils/generate-spdx3
> 
> diff --git a/utils/generate-spdx3 b/utils/generate-spdx3
> new file mode 100755
> index 0000000000..1dc84e286f
> --- /dev/null
> +++ b/utils/generate-spdx3
> @@ -0,0 +1,813 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# This script converts the output of the show-info make target
> +# to SPDX 3.0.1 JSON-LD format.
> +#
> +# Example usage:
> +# $ make show-info | utils/generate-spdx3 > sbom.spdx3.json
> +
> +
> +import argparse
> +import importlib.util
> +import json
> +import os
> +from pathlib import Path
> +from typing import Iterator
> +import urllib.parse
> +import urllib.request
> +import subprocess
> +import sys
> +import re
> +import uuid
> +import datetime
> +
> +
> +SPDX_VERSION = "3.0.1"
> +SPDX_CONTEXT_URL = f"https://spdx.org/rdf/{SPDX_VERSION}/spdx-context.jsonld"
> +
> +# Namespace prefix used for all spdxId URIs generated by this script.
> +# Every element's spdxId is  "<SPDX_NS>#<local-id>".
> +SPDX_NS_BASE = "https://buildroot.org/sbom"
> +
> +# The official SPDX license list JSON from the spdx/license-list-data repo.
> +# It provides the list of valid SPDX license identifiers and the license list
> +# version string used in creationInfo.
> +SPDX_LICENSE_LIST_URL = "https://raw.githubusercontent.com/spdx/license-list-data/main/json/licenses.json"
> +
> +brpath = Path(__file__).parent.parent
> +
> +spdxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "spdx"
> +SPDX_LICENSE_LIST_PATH = spdxpath / "licenses.json"
> +
> +BR2_VERSION_FULL = (
> +    subprocess.check_output(
> +        ["make", "--no-print-directory", "-C", brpath, "print-version"]
> +    )
> +    .decode()
> +    .strip()
> +)
> +
> +SPDX_LICENSE_IDS = set()
> +SPDX_LICENSE_LIST_VERSION = ""
> +
> +if not SPDX_LICENSE_LIST_PATH.exists():
> +    if not importlib.util.find_spec("_ssl"):
> +        print(f"ssl module required for downloading {SPDX_LICENSE_LIST_URL}. Try enabling BR2_PACKAGE_HOST_PYTHON3_SSL.",
> +              file=sys.stderr)
> +        exit(1)
> +
> +    spdxpath.mkdir(parents=True, exist_ok=True)
> +    try:
> +        urllib.request.urlretrieve(SPDX_LICENSE_LIST_URL, SPDX_LICENSE_LIST_PATH)
> +    except urllib.error.URLError as e:
> +        if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
> +            raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")
> +        raise e
> +
> +try:
> +    with SPDX_LICENSE_LIST_PATH.open() as f:
> +        license_data = json.load(f)
> +        SPDX_LICENSE_IDS = {lic["licenseId"] for lic in license_data.get("licenses", [])}
> +        SPDX_LICENSE_LIST_VERSION = license_data.get("licenseListVersion", "")
> +except (json.JSONDecodeError, KeyError):
> +    print(f"Failed to load the SPDX license list file: {SPDX_LICENSE_LIST_PATH}",
> +          file=sys.stderr)
> +
> +
> +def split_top_level_comma(subj):
> +    """Split a string at commas, but do not split at commas inside parentheses.
> +
> +    Args:
> +        subj (str): String to be split.
> +
> +    Yields:
> +        str: Substrings between top-level commas.
> +    """
> +    counter = 0
> +    substring = ""
> +
> +    for char in subj:
> +        if char == "," and counter == 0:
> +            yield substring
> +            substring = ""
> +        else:
> +            if char == "(":
> +                counter += 1
> +            elif char == ")":
> +                counter -= 1
> +            substring += char
> +
> +    yield substring
> +
> +
> +def extract_cves_from_header(header: str) -> list[str]:
> +    """Extract CVE identifiers from the patch header.
> +
> +    Args:
> +        header (str): Content of the header of a patch.
> +
> +    Returns:
> +        list: Array of CVE identifiers present in a patch header passed as
> +        argument.
> +    """
> +    PATCH_CVE_HEADER = "CVE: "
> +    return [
> +        line.partition(PATCH_CVE_HEADER)[2].strip()
> +        for line in header.splitlines()
> +        if line.startswith(PATCH_CVE_HEADER)
> +    ]
> +
> +
> +def patch_retrieve_header(content: str) -> str:
> +    """Read the content of a patch and split the header from the content.
> +
> +    Args:
> +        content (str): Patch content.
> +
> +    Returns:
> +        str: Patch header content.
> +    """
> +    DIFF_LINE_REGEX = re.compile(r"^diff\s+(?:--git|-[-\w]+)\s+(\S+)\s+(\S+)$")
> +    INDEX_LINE_REGEX = re.compile(r"^Index:\s+(\S+)$")
> +
> +    lines = content.split('\n')
> +
> +    header = []
> +    for i, line in enumerate(lines):
> +        if DIFF_LINE_REGEX.match(line):
> +            break
> +        elif INDEX_LINE_REGEX.match(line):
> +            if i < len(lines) - 2 and lines[i + 1].startswith("===") and lines[i + 2].startswith("---"):
> +                break
> +        elif line.startswith("---"):
> +            if i < len(lines) - 2 and lines[i + 1].startswith("+++") and lines[i + 2].startswith("@@"):
> +                break
> +        else:
> +            header.append(line)
> +
> +    return '\n'.join(header)
> +
> +
> +def read_patch_file(patch_path: Path) -> str:
> +    """Read the content of a patch file.
> +
> +    Args:
> +        patch_path (Path): Patch path.
> +
> +    Returns:
> +        str: Patch content.
> +    """
> +    with open(patch_path) as f:
> +        return f.read()
> +
> +
> +def parse_uris(uris: list[str]) -> Iterator[tuple[list[str], str]]:
> +    """Parse download URIs into (schemes, url) tuples.
> +
> +    Splits the Buildroot URI format "scheme[|scheme]+url" and yields all
> +    Buildroot schemes with the stripped URL, excluding
> +    sources.buildroot.net mirrors.
> +
> +    Args:
> +        uris (list): Array of URI strings from the show-info output.
> +    Yields:
> +        tuple[list[str], str]: (schemes, url) for each usable URI.
> +    """
> +    for uri in uris:
> +        scheme, _, stripped_uri = uri.partition("+")
> +        if stripped_uri:
> +            parsed = urllib.parse.urlparse(stripped_uri)
> +            if parsed.hostname != "sources.buildroot.net":
> +                yield scheme.split("|"), stripped_uri
> +
> +
> +def br2_virtual_is_provided_by(ref, show_info_dict) -> list[str]:
> +    """Retrieve the list of packages that provide a virtual package.
> +
> +    Args:
> +        ref (str): The identifier of the virtual package.
> +        show_info_dict (dict): The JSON output of the show-info
> +            command, parsed into a Python dictionary.
> +
> +    Returns:
> +        list: package list that provides the virtual package.
> +    """
> +    return [
> +        name
> +        for name, comp in show_info_dict.items()
> +        if "provides" in comp and ref in comp["provides"]
> +    ]
> +
> +
> +def br2_parse_deps(ref, show_info_dict, virtual=False) -> list[str]:
> +    """This function will collect all dependencies from the show-info output.
> +
> +    The dependency on virtual package will collect the final dependency without
> +    including the virtual one.
> +
> +    Args:
> +        ref (str): The identifier of the package for which the dependencies have
> +            to be looked up.
> +        show_info_dict (dict): The JSON output of the show-info
> +            command, parsed into a Python dictionary.
> +
> +    Returns:
> +        list: A list of dependencies of the 'ref' package.
> +    """
> +    deps = set()
> +
> +    for dep in show_info_dict.get(ref, {}).get("dependencies", []):
> +        if not virtual and show_info_dict.get(dep, {}).get("virtual"):
> +            deps.update(br2_virtual_is_provided_by(dep, show_info_dict))
> +        else:
> +            deps.add(dep)
> +
> +    return list(deps)
> +
> +
> +def br2_root_deps(show_info_dict, virtual=False) -> list[str]:
> +    """Retrieve the list of direct dependencies of the root component.
> +
> +    This function returns all components that are not a dependency of any
> +    other component.
> +
> +    Args:
> +        show_info_dict (dict): The JSON output of the show-info command.
> +        virtual (bool): Whether to resolve virtual dependencies to their providers.
> +
> +    Returns:
> +        list: List of direct dependencies of the root component.
> +    """
> +    indirect = set()
> +    for ref in show_info_dict:
> +        indirect.update(br2_parse_deps(ref, show_info_dict, virtual))
> +    return [ref for ref in show_info_dict if ref not in indirect]
> +
> +
> +# ---------------------------------------------------------------------------
> +# SPDX 3.0 helpers
> +# ---------------------------------------------------------------------------
> +
> +# Map deprecated SPDX license IDs to their current equivalents.
> +# Buildroot package .mk files commonly use these short-form IDs.
> +# The "-only" interpretation is used for versionless IDs per common
> +# open-source convention; "+" suffix means "-or-later".
> +DEPRECATED_LICENSE_MAP = {
> +    "GPL-1.0":                    "GPL-1.0-only",
> +    "GPL-1.0+":                   "GPL-1.0-or-later",
> +    "GPL-2.0":                    "GPL-2.0-only",
> +    "GPL-2.0+":                   "GPL-2.0-or-later",
> +    "GPL-3.0":                    "GPL-3.0-only",
> +    "GPL-3.0+":                   "GPL-3.0-or-later",
> +    "LGPL-2.0":                   "LGPL-2.0-only",
> +    "LGPL-2.0+":                  "LGPL-2.0-or-later",
> +    "LGPL-2.1":                   "LGPL-2.1-only",
> +    "LGPL-2.1+":                  "LGPL-2.1-or-later",
> +    "LGPL-3.0":                   "LGPL-3.0-only",
> +    "LGPL-3.0+":                  "LGPL-3.0-or-later",
> +    "AGPL-1.0":                   "AGPL-1.0-only",
> +    "AGPL-3.0":                   "AGPL-3.0-only",
> +    "AGPL-3.0+":                  "AGPL-3.0-or-later",
> +    "GPL-3.0-with-GCC-exception": "GPL-3.0-only WITH GCC-exception-3.1",
> +}
> +
> +
> +def normalize_license_id(token: str) -> str:
> +    """Return the current SPDX ID for a (possibly deprecated) license token.
> +
> +    Args:
> +        token (str): A single license identifier token.
> +
> +    Returns:
> +        str: Normalized SPDX ID, or the original token if no mapping exists.
> +    """
> +    return DEPRECATED_LICENSE_MAP.get(token, token)
> +
> +
> +def spdx_uri(ns: str, local: str) -> str:
> +    """Build a full spdxId URI from a namespace and a local identifier.
> +
> +    Args:
> +        ns (str): Document namespace URI (without trailing #).
> +        local (str): Local identifier string.
> +
> +    Returns:
> +        str: Full URI suitable for use as spdxId.
> +    """
> +    sanitized = re.sub(r"[^A-Za-z0-9.\-+]", "-", local).strip("-") or "unknown"
> +    return f"{ns}#{sanitized}"
> +
> +
> +def br_type_to_purpose(br_type: str) -> str:
> +    """Map a Buildroot package type to an SPDX 3.0 SoftwarePurpose value.
> +
> +    Args:
> +        br_type (str): Buildroot package type from show-info.
> +
> +    Returns:
> +        str: SPDX 3.0 SoftwarePurpose enum value (camelCase).
> +    """
> +    return {
> +        "target":    "library",
> +        "host":      "application",
> +        "toolchain": "application",
> +        "rootfs":    "operatingSystem",
> +        "linux":     "operatingSystem",
> +    }.get(br_type, "other")
> +
> +
> +def license_expression_string(lic_list: str) -> str:
> +    """Convert a Buildroot comma-separated license string to an SPDX expression.
> +
> +    Buildroot comma-separated licenses mean "all of these apply" (AND semantics).
> +    Deprecated IDs are mapped to current equivalents. Unknown IDs are kept as-is
> +    since SPDX 3.0 LicenseExpression elements carry the raw expression string
> +    without needing a separate hasExtractedLicensingInfos list.
> +
> +    Args:
> +        lic_list (str): Comma-separated license string from show-info.
> +
> +    Returns:
> +        str: SPDX license expression string.
> +    """
> +    if not lic_list or not lic_list.strip():
> +        return "NOASSERTION"
> +
> +    tokens = []
> +    for token in split_top_level_comma(lic_list):
> +        token = token.strip()
> +        if not token:
> +            continue
> +        tokens.append(normalize_license_id(token))
> +
> +    if not tokens:
> +        return "NOASSERTION"
> +
> +    if len(tokens) == 1:
> +        return tokens[0]
> +    return " AND ".join(f"({t})" if " " in t else t for t in tokens)
> +
> +
> +def spdx3_hashes(comp: dict) -> list[dict]:
> +    """Build SPDX 3.0 Hash objects from Buildroot .hash files.
> +
> +    In SPDX 3.0, checksums are represented as Hash inline objects with
> +    fields 'type', 'algorithm', and 'hashValue'.
> +
> +    Args:
> +        comp (dict): Component information from show-info.
> +
> +    Returns:
> +        list: List of Hash inline objects.
> +    """
> +    ALGO_MAP = {
> +        "sha1":   "sha1",
> +        "sha256": "sha256",
> +        "sha512": "sha512",
> +        "md5":    "md5",
> +    }
> +
> +    hashes = []
> +    seen = set()
> +
> +    for download in comp.get("downloads", []):
> +        source = download.get("source")
> +        if not source:
> +            continue
> +        for hash_file in comp.get("hashes", []):
> +            try:
> +                with (brpath / hash_file).open() as f:
> +                    for line in f:
> +                        line = line.strip()
> +                        if not line.startswith("#") and line.endswith(f" {source}"):
> +                            parts = line.split()
> +                            if len(parts) >= 3 and parts[0] in ALGO_MAP:
> +                                key = (ALGO_MAP[parts[0]], parts[1])
> +                                if key not in seen:
> +                                    seen.add(key)
> +                                    hashes.append({
> +                                        "type": "Hash",
> +                                        "algorithm": ALGO_MAP[parts[0]],
> +                                        "hashValue": parts[1],
> +                                    })
> +            except OSError:
> +                pass
> +
> +    return hashes
> +
> +
> +def spdx3_download_location(comp: dict) -> str | None:
> +    """Extract the primary download URL for a package.
> +
> +    Returns the first non-mirror HTTP/HTTPS source distribution URL,
> +    or the first VCS URL, or None if no URL is found.
> +
> +    Args:
> +        comp (dict): Component information from show-info.
> +
> +    Returns:
> +        str or None: Download URL or None.
> +    """
> +    SOURCE_DIST_SCHEMES = {"http", "https"}
> +    VCS_SCHEMES = {"git", "svn", "cvs", "hg", "bzr"}
> +
> +    first_vcs = None
> +
> +    for download in comp.get("downloads", []):
> +        source = download.get("source")
> +        for schemes, uri in parse_uris(download.get("uris", [])):
> +            scheme_set = set(schemes)
> +            if scheme_set & SOURCE_DIST_SCHEMES and source:
> +                return f"{uri}/{source}"
> +            if scheme_set & VCS_SCHEMES and first_vcs is None:
> +                first_vcs = uri
> +
> +    return first_vcs
> +
> +
> +def spdx3_external_identifiers(comp: dict) -> list[dict]:
> +    """Build SPDX 3.0 ExternalIdentifier objects for a package.
> +
> +    In SPDX 3.0, CPE identifiers use ExternalIdentifier with
> +    externalIdentifierType='cpe23'.
> +
> +    Args:
> +        comp (dict): Component information from show-info.
> +
> +    Returns:
> +        list: List of ExternalIdentifier inline objects.
> +    """
> +    refs = []
> +    if "cpe-id" in comp:
> +        refs.append({
> +            "type": "ExternalIdentifier",
> +            "externalIdentifierType": "cpe23",
> +            "identifier": comp["cpe-id"],
> +        })
> +    return refs
> +
> +
> +def spdx3_external_refs(comp: dict) -> list[dict]:
> +    """Build SPDX 3.0 ExternalRef objects for VCS URLs.
> +
> +    In SPDX 3.0, VCS references use ExternalRef with
> +    externalRefType='vcs'.
> +
> +    Args:
> +        comp (dict): Component information from show-info.
> +
> +    Returns:
> +        list: List of ExternalRef inline objects.
> +    """
> +    VCS_SCHEMES = {"git", "svn", "cvs", "hg", "bzr"}
> +
> +    refs = []
> +    for download in comp.get("downloads", []):
> +        for schemes, uri in parse_uris(download.get("uris", [])):
> +            if set(schemes) & VCS_SCHEMES:
> +                refs.append({
> +                    "type": "ExternalRef",
> +                    "externalRefType": "vcs",
> +                    "locator": uri,
> +                })
> +    return refs
> +
> +
> +def spdx3_patch_source_info(comp: dict) -> tuple[set, str]:
> +    """Extract CVEs fixed by patches and a sourceInfo string for a component.
> +
> +    Args:
> +        comp (dict): Component information from show-info.
> +
> +    Returns:
> +        tuple: (cves_fixed: set[str], source_info: str)
> +    """
> +    cves_fixed = set()
> +    lines = []
> +
> +    for patch in comp.get("patches", []):
> +        patch_path = brpath / patch
> +        if patch_path.exists():
> +            try:
> +                content = read_patch_file(patch_path)
> +            except Exception:
> +                print(f"Failed to handle patch: {patch}", file=sys.stderr)
> +                continue
> +            header = patch_retrieve_header(content)
> +            cves = extract_cves_from_header(header)
> +            cves_fixed.update(cves)
> +            if cves:
> +                lines.append(f"Patch {patch_path.name} fixes: {', '.join(cves)}")
> +            else:
> +                lines.append(f"Patch applied: {patch_path.name}")
> +        else:
> +            lines.append(f"Patch (remote): {patch}")
> +
> +    return cves_fixed, "; ".join(lines)
> +
> +
> +def build_graph(ns: str, project_name: str, project_version: str,
> +                filtered_dict: dict, show_info_dict: dict,
> +                virtual: bool, timestamp: str) -> list[dict]:
> +    """Build the complete SPDX 3.0 @graph element list.
> +
> +    Produces the following elements:
> +      - CreationInfo blank node (shared by all elements)
> +      - Tool element (the generator itself)
> +      - SpdxDocument element
> +      - software_Package for the root firmware
> +      - software_Package for each filtered package
> +      - simplelicensing_LicenseExpression for each distinct license expression
> +      - Relationship: describes, contains, dependsOn, hasDeclaredLicense
> +      - Annotation: one per ignored CVE per package
> +
> +    Args:
> +        ns (str): Document namespace URI (without trailing #).
> +        project_name (str): Root firmware package name.
> +        project_version (str): Root firmware package version.
> +        filtered_dict (dict): Filtered show-info (no rootfs, optionally no virtual).
> +        show_info_dict (dict): Full show-info for dependency resolution.
> +        virtual (bool): Whether virtual packages are included.
> +        timestamp (str): ISO 8601 UTC timestamp.
> +
> +    Returns:
> +        list: All SPDX 3.0 Element dicts for the @graph array.
> +    """
> +    graph = []
> +
> +    # Relationship and annotation element counter for unique IDs
> +    counters = {"rel": 0, "ann": 0, "lic": 0}
> +
> +    def next_rel_uri():
> +        counters["rel"] += 1
> +        return spdx_uri(ns, f"rel-{counters['rel']}")
> +
> +    def next_ann_uri():
> +        counters["ann"] += 1
> +        return spdx_uri(ns, f"ann-{counters['ann']}")
> +
> +    def next_lic_uri(expr_key):
> +        # Re-use the same URI for identical expressions to avoid duplicates
> +        return spdx_uri(ns, f"lic-{re.sub(r'[^A-Za-z0-9]', '-', expr_key)[:60]}")
> +
> +    # --- Shared CreationInfo blank node ---
> +    tool_uri = spdx_uri(ns, f"tool-buildroot-generate-spdx3-{BR2_VERSION_FULL}")
> +
> +    creation_info_id = "_:creationInfo"
> +    creation_info = {
> +        "@id": creation_info_id,
> +        "type": "CreationInfo",
> +        "specVersion": SPDX_VERSION,
> +        "created": timestamp,
> +        "createdBy": [tool_uri],
> +    }
> +    if SPDX_LICENSE_LIST_VERSION:
> +        creation_info["comment"] = f"SPDX license list version: {SPDX_LICENSE_LIST_VERSION}"
> +    graph.append(creation_info)
> +
> +    # --- Tool element ---
> +    graph.append({
> +        "type": "Tool",
> +        "spdxId": tool_uri,
> +        "name": f"Buildroot generate-spdx3 {BR2_VERSION_FULL}",
> +        "creationInfo": creation_info_id,
> +    })
> +
> +    # --- Collect all element URIs for SpdxDocument.element ---
> +    # We build them first so we can populate element[] and rootElement[].
> +    root_pkg_uri = spdx_uri(ns, project_name)
> +    pkg_uris = {name: spdx_uri(ns, name) for name in filtered_dict}
> +
> +    # We accumulate relationship and annotation elements as we go;
> +    # collect their URIs for the SpdxDocument element list.
> +    deferred_elements = []   # (uri, element_dict) pairs added after packages
> +
> +    # --- Root firmware package ---
> +    root_pkg = {
> +        "type": "software_Package",
> +        "spdxId": root_pkg_uri,
> +        "creationInfo": creation_info_id,
> +        "name": project_name,
> +        "software_packageVersion": project_version,
> +        "software_primaryPurpose": "firmware",
> +        "comment": "Root firmware image",
> +    }
> +    graph.append(root_pkg)
> +
> +    # --- Per-package elements ---
> +    # Track which license expressions have already been emitted (deduplicate)
> +    emitted_lic_uris = {}   # expression_string -> lic_uri
> +
> +    # Pre-pass: collect all CVEs fixed by patches
> +    cves_fixed_by_patch = set()
> +    for comp in filtered_dict.values():
> +        fixed, _ = spdx3_patch_source_info(comp)
> +        cves_fixed_by_patch.update(fixed)
> +
> +    for name, comp in filtered_dict.items():
> +        pkg_uri = pkg_uris[name]
> +
> +        pkg = {
> +            "type": "software_Package",
> +            "spdxId": pkg_uri,
> +            "creationInfo": creation_info_id,
> +            "name": comp.get("name", name),
> +            "comment": f"BR_TYPE={comp.get('type', '')}",
> +        }
> +
> +        if not comp.get("virtual"):
> +            if "version" in comp:
> +                pkg["software_packageVersion"] = comp["version"]
> +
> +        purpose = br_type_to_purpose(comp.get("type", ""))
> +        if purpose:
> +            pkg["software_primaryPurpose"] = purpose
> +
> +        dl = spdx3_download_location(comp)
> +        if dl:
> +            pkg["software_downloadLocation"] = dl
> +
> +        hashes = spdx3_hashes(comp)
> +        if hashes:
> +            pkg["verifiedUsing"] = hashes
> +
> +        ext_ids = spdx3_external_identifiers(comp)
> +        if ext_ids:
> +            pkg["externalIdentifier"] = ext_ids
> +
> +        ext_refs = spdx3_external_refs(comp)
> +        if ext_refs:
> +            pkg["externalRef"] = ext_refs
> +
> +        _, source_info = spdx3_patch_source_info(comp)
> +        if source_info:
> +            pkg["software_sourceInfo"] = source_info
> +
> +        graph.append(pkg)
> +
> +        # --- hasDeclaredLicense relationship ---
> +        if not comp.get("virtual") and "licenses" in comp:
> +            expr = license_expression_string(comp["licenses"])
> +        else:
> +            expr = "NOASSERTION"
> +
> +        if expr not in emitted_lic_uris:
> +            lic_uri = next_lic_uri(expr)
> +            emitted_lic_uris[expr] = lic_uri
> +            lic_element = {
> +                "type": "simplelicensing_LicenseExpression",
> +                "spdxId": lic_uri,
> +                "creationInfo": creation_info_id,
> +                "simplelicensing_licenseExpression": expr,
> +            }
> +            if SPDX_LICENSE_LIST_VERSION:
> +                lic_element["simplelicensing_licenseListVersion"] = SPDX_LICENSE_LIST_VERSION
> +            deferred_elements.append((lic_uri, lic_element))
> +
> +        lic_uri = emitted_lic_uris[expr]
> +        rel_lic_uri = next_rel_uri()
> +        deferred_elements.append((rel_lic_uri, {
> +            "type": "Relationship",
> +            "spdxId": rel_lic_uri,
> +            "creationInfo": creation_info_id,
> +            "from": pkg_uri,
> +            "to": [lic_uri],
> +            "relationshipType": "hasDeclaredLicense",
> +        }))
> +
> +        # --- CVE annotations ---
> +        for cve in comp.get("ignore_cves", []):
> +            if cve in cves_fixed_by_patch:
> +                statement = f"{cve}: Fixed by patch in Buildroot tree"
> +            else:
> +                statement = f"{cve}: Marked as ignored by Buildroot"
> +            ann_uri = next_ann_uri()
> +            deferred_elements.append((ann_uri, {
> +                "type": "Annotation",
> +                "spdxId": ann_uri,
> +                "creationInfo": creation_info_id,
> +                "annotationType": "review",
> +                "subject": pkg_uri,
> +                "statement": statement,
> +            }))
> +
> +    # --- Structural relationships ---
> +    # Document describes the root firmware package
> +    rel_describes_uri = next_rel_uri()
> +    doc_uri = spdx_uri(ns, "document")
> +    deferred_elements.append((rel_describes_uri, {
> +        "type": "Relationship",
> +        "spdxId": rel_describes_uri,
> +        "creationInfo": creation_info_id,
> +        "from": doc_uri,
> +        "to": [root_pkg_uri],
> +        "relationshipType": "describes",
> +    }))
> +
> +    # Root firmware contains each top-level package
> +    for ref in br2_root_deps(filtered_dict, virtual):
> +        rel_uri = next_rel_uri()
> +        deferred_elements.append((rel_uri, {
> +            "type": "Relationship",
> +            "spdxId": rel_uri,
> +            "creationInfo": creation_info_id,
> +            "from": root_pkg_uri,
> +            "to": [pkg_uris[ref]],
> +            "relationshipType": "contains",
> +        }))
> +
> +    # Inter-package dependsOn
> +    for ref in filtered_dict:
> +        for dep in sorted(br2_parse_deps(ref, show_info_dict, virtual)):
> +            if dep in filtered_dict:
> +                rel_uri = next_rel_uri()
> +                deferred_elements.append((rel_uri, {
> +                    "type": "Relationship",
> +                    "spdxId": rel_uri,
> +                    "creationInfo": creation_info_id,
> +                    "from": pkg_uris[ref],
> +                    "to": [pkg_uris[dep]],
> +                    "relationshipType": "dependsOn",
> +                }))
> +
> +    # Append all deferred elements (licenses, relationships, annotations)
> +    for _, elem in deferred_elements:
> +        graph.append(elem)
> +
> +    # --- SpdxDocument ---
> +    # Collect every element URI except the CreationInfo blank node and the
> +    # Tool (Tool is referenced via createdBy, not element[]).
> +    all_element_uris = (
> +        [root_pkg_uri]
> +        + list(pkg_uris.values())
> +        + [uri for uri, _ in deferred_elements]
> +    )
> +
> +    spdx_document = {
> +        "type": "SpdxDocument",
> +        "spdxId": doc_uri,
> +        "creationInfo": creation_info_id,
> +        "name": project_name,
> +        "profileConformance": ["core", "software", "simpleLicensing"],
> +        "element": all_element_uris,
> +        "rootElement": [root_pkg_uri],
> +    }
> +    # Insert the SpdxDocument right after the Tool element (index 2)
> +    graph.insert(2, spdx_document)
> +
> +    return graph
> +
> +
> +def main():
> +    parser = argparse.ArgumentParser(
> +            description='''Create an SPDX 3.0.1 SBoM for the Buildroot configuration.
> +                Example usage: make show-info | utils/generate-spdx3 > sbom.spdx3.json
> +            '''
> +        )
> +    parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
> +                        default=(None if sys.stdin.isatty() else sys.stdin))
> +    parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
> +                        default=sys.stdout)
> +    parser.add_argument("--virtual", default=False, action='store_true',
> +                        help="This option includes virtual packages to the SPDX output")
> +    parser.add_argument("--project-name", type=str, default="buildroot",
> +                        help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
> +    parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
> +                        help="Specify the project version to use in the SBOM metadata (default: buildroot version)")
> +
> +    args = parser.parse_args()
> +
> +    if args.in_file is None:
> +        parser.print_help()
> +        sys.exit(1)
> +
> +    show_info_dict = json.load(args.in_file)
> +
> +    # Remove rootfs and virtual packages if not explicitly included
> +    # from the cli arguments
> +    filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
> +                               if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
> +
> +    timestamp = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
> +
> +    # Unique namespace URI for this document (UUID v4 per run)
> +    ns = f"{SPDX_NS_BASE}/{args.project_name}-{BR2_VERSION_FULL}-{uuid.uuid4()}"
> +
> +    graph = build_graph(
> +        ns, args.project_name, args.project_version,
> +        filtered_show_info_dict, show_info_dict,
> +        args.virtual, timestamp,
> +    )
> +
> +    doc = {
> +        "@context": SPDX_CONTEXT_URL,
> +        "@graph": graph,
> +    }
> +
> +    args.out_file.write(json.dumps(doc, indent=2))
> +    args.out_file.write('\n')
> +
> +
> +if __name__ == "__main__":
> +    main()
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
