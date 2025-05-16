Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF09C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 16:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DA8561254;
	Fri, 16 May 2025 16:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n59rb5wGHoLl; Fri, 16 May 2025 16:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77B2E60B49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B2E60B49;
	Fri, 16 May 2025 16:51:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E7E213D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4339760B49
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJx3_Od35pqK for <buildroot@buildroot.org>;
 Fri, 16 May 2025 16:51:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D52E060799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D52E060799
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D52E060799
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:51:19 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a1b8e8b2b2so1545207f8f.2
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747414277; x=1748019077;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x8UN3bojnyHqZKRmtVtoXurxA0ZcuaHzlTEo4aMSn3g=;
 b=v6moI2DPBD3kScA6YatwhuTBkRnrT1EQj0zeUwJKucL/XdK4y1Bql+e2CUsixYNOqr
 k7EwM4Ke5dl5VEdyxxOJLqxNkZdGSPBAR80VI/LTOvJOuV1Ppl4RiNpv282HkAlmWLrc
 +DT1NLaQFFbQWdPjC658EWYZn7VVmz2yX/pOIDcpLTtZ0sjpvO0JY4h6Q/Uop1X/oRVq
 NEN3WyJUzZ/UwK3logcLD53QLoV99REi5w+U7GocWPwA44E9DjHm8uSiTxPj2u2+09vq
 jpoo/KWD4IErhVvo+nZm+G2guyx49r8ISK05P+PUZgqkBeBKNmAmD2KCZcSY9bdSGlrG
 bPZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3PxzBt2U2ax7e4cjk7Lw8iGclPTs5G29sVPydz7F0xIaDPo+JMErmyUnZ6BYs+ZajPSS4m6F4Tdo=@buildroot.org
X-Gm-Message-State: AOJu0Yxr6igfhRQbF25R9p3byVxn4a7vQFn05sbq+GDk1iAeZrzFTION
 Pk/nLcQR/o62q2V43Tevi/HWoi+ZdpaVhRhAn/5rQ4hFmmUM00uK7GTe3PTpLPiJGog=
X-Gm-Gg: ASbGnct28POkCSPTSqwut/4gJvepYsXCNyTWKNeSD/W7CGQeaKyY83bu/6ftnuWtFcz
 GsTiTcUBfp18HZ3YX4cxfXb73buVRpbzLMlogML7eNGjv03iKdJso3NPMfqG0NV7Cx5jniXKk8S
 ER5nHud6/wnu929b/OsE7vqf72dRMELFl88Gy+HW3+ELwmp2pP761k8PKOq7RTgJSafCG0J3hF4
 XYOnmY7l3MMOG0icnShYJf7sNwRQcHMfmXgWe+QoqorKS9o9Zp/a2Mtpdf0KkwQbzCTDJVb7RMk
 6N7ixRo7CflJhKemHU9hqcPfl4j9Kuu6aItr75Fxp0ufAtapGni63w+7YFi914XX8I5GzdOSXAA
 +A2COor4DHWhLsph5ifK1ncetfRqrbaAeXXE=
X-Google-Smtp-Source: AGHT+IEit0InOLJsrHPPVye0JdG+vZ4+M3YBpYEKqaLhvGOPj8mROw4wwhdhz+hrgE2CwzGLOuRAnA==
X-Received: by 2002:a5d:5f8d:0:b0:3a1:f67f:1bc with SMTP id
 ffacd0b85a97d-3a35c7e747cmr4460918f8f.0.1747414277415; 
 Fri, 16 May 2025 09:51:17 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a3631c728esm1766237f8f.60.2025.05.16.09.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 09:51:17 -0700 (PDT)
Message-ID: <ce2cee78-926a-4af2-910c-6314b4de64a9@mind.be>
Date: Fri, 16 May 2025 18:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250505160327.3422096-1-fiona.klute@gmx.de>
 <20250505160327.3422096-2-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20250505160327.3422096-2-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747414277; x=1748019077; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x8UN3bojnyHqZKRmtVtoXurxA0ZcuaHzlTEo4aMSn3g=;
 b=PpZ7WFr+Go1e9AiywflwBjAiExnmUQDFOt6A2P3ODVQJk296fUM0lZCJD9VDG61xk3
 vGhGCO3aEbENdjqWHoVCW5zFdQvGUnuP8pl3AllBa7boTvKWnwD3VnRop02N2LLtlXYa
 drAEFatLuA4ZdH9XIYYa8UCBiCkHFBEotLTzR0g13H9kHBqYYoVxJKDilUHrMGEEi8Ik
 FUqkx/jbyQwcc994veqSDOWBya0BckLEag1YF5Qn694bV5RGnXliVz6iYPNcuRt90F3N
 f6aNNHOdrqCQGJ2CoX4TaYt2QBvj0Z36DNCE0WXgD7albONclSmEv+lBNpIYN+bQSYcB
 5zCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PpZ7WFr+
Subject: Re: [Buildroot] [PATCH 1/3] utils/generate-cyclonedx: support
 including external tree information
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On 5/05/25 18:03, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> External tree information may be important for interpreting SBOM
> information, especially if the SBOM lists packages (components) that
> do not exist in the listed version of Buildroot itself.
>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Tested-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   utils/generate-cyclonedx | 57 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
>
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 46f68ac63d..cbb7ef630e 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -10,6 +10,7 @@
>   
>   import argparse
>   import bz2
> +from dataclasses import dataclass
>   import gzip
>   import json
>   import os
> @@ -50,6 +51,49 @@ except json.JSONDecodeError:
>       print(f"Failed to load the SPDX licenses file: {SPDX_SCHEMA_PATH}", file=sys.stderr)
>   
>   
> +@dataclass
> +class ExternalTree:
> +    name: str
> +    path: Path
> +    version: str
> +    description: str
> +
> +    @classmethod
> +    def parse_vars(cls, variables: dict[str, dict[str, str]]) -> list['ExternalTree']:
> +        """Load external trees from JSON data as generated by `make
> +        show-vars VARS="BR2_EXTERNAL%"`.
> +
> +        Args:
> +            variables: dict created by loading the JSON data
> +
> +        Returns:
> +            list of parsed ExternalTree objects
> +        """
> +        return [
> +            cls(
> +                ext,
> +                Path(variables[f"BR2_EXTERNAL_{ext}_PATH"]["expanded"]),
> +                variables[f"BR2_EXTERNAL_{ext}_VERSION"]["expanded"],
> +                variables[f"BR2_EXTERNAL_{ext}_DESC"]["expanded"],
> +            )
> +            for ext in variables["BR2_EXTERNAL_NAMES"]["expanded"].split()
> +        ]
> +
> +    @property
> +    def bom_ref(self) -> str:
> +        return f"buildroot-external:{self.name}"
> +
> +    def as_component(self) -> dict[str, str]:
> +        """Format self as a component dict ready to be included in
> +        CycloneDX JSON output."""
> +        return {
> +            "bom-ref": self.bom_ref,
> +            "name": self.name,
> +            "type": "firmware",
> +            "version": self.version,
> +        }
> +
> +
>   def split_top_level_comma(subj):
>       """Split a string at comma's, but do not split at comma's in between parentheses.
>   
> @@ -277,6 +321,10 @@ def main():
>                           default=(None if sys.stdin.isatty() else sys.stdin))
>       parser.add_argument("-o", "--out-file", nargs="?", type=argparse.FileType("w"),
>                           default=sys.stdout)
> +    parser.add_argument("-e", "--external-trees", nargs="?", type=argparse.FileType("r"),
> +                        default=None,
Nitpick: default=None is not needed here 
(https://docs.python.org/3/library/argparse.html#default)
> +                        help="Load external trees to list in SBOM from this JSON file, "
> +                        "can be created by running: make show-vars VARS=\"BR2_EXTERNAL%\"")
>       parser.add_argument("--virtual", default=False, action='store_true',
>                           help="This option includes virtual packages to the CycloneDX output")
>   
> @@ -293,6 +341,11 @@ def main():
>       filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
>                                  if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
>   
> +    if args.external_trees is not None:
> +        external_trees = ExternalTree.parse_vars(json.load(args.external_trees))
> +    else:
> +        external_trees = []
> +
>       cyclonedx_dict = {
>           "bomFormat": "CycloneDX",
>           "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
> @@ -312,6 +365,10 @@ def main():
>                   "name": "buildroot",
>                   "type": "firmware",
>                   "version": f"{BR2_VERSION_FULL}",
> +                **(
> +                    {"components": [ext.as_component() for ext in external_trees]}
> +                    if external_trees else {}
> +                )
>               },
>           },
>       }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
