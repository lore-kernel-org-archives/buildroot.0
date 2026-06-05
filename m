Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584F7CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337A18294A;
	Fri,  5 Jun 2026 12:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bx_4URMj1LYQ; Fri,  5 Jun 2026 12:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4376C82950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663825;
	bh=mhT4cagV88VUGGHnQzOrw/4YXid/ntaD3tKOghY/fpk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zs+By6wJmUzEIjhkrCZyAO7MzosIN/zAs3WfQXupfyh35T7qqVRhCRF8R3WAKFV/w
	 xJ5/ESqxW8WFGhv2uTeafHu6e3krqhQz9UhW7drk/irdNzz0QGrKSmoOFp1RivXZcN
	 7l8dBCj6DcfT0YszxB3TYri+QKmuDjq7WrbExLI4CpDrKzkYvcJVyLASfHlHDvKzyb
	 Od7Re45XRgO1WreJmQmXFIquszVUPhe/5j/5PxF5Y/jIwn0emda+6/Xa6bZsqYnyvm
	 GVBKPYn0BwEnypoMV1uEtSstUT8iQAebndsZp9RGl01Qpt6L9YJZCam7J0+WgwEAGP
	 9IovxhuyyfuNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4376C82950;
	Fri,  5 Jun 2026 12:50:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 386A6388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E47941F28
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BpZesTcdXhO for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90F5241F06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90F5241F06
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90F5241F06
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45eea68dd6fso1000508f8f.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663816; x=1781268616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zwLLwQU0BB/2YS2eC11bN11FOm76dAVSBtrvk90mBp4=;
 b=m1YRmvJzCNl6JynjWSXmduhCmvmm+QNxYVa6LT8fkRdpWg6Sn9TRfZX8+/I6VWqqFZ
 SojL5D16Zz0r8u4OvI8zYmHzzcQpJfF3Gx/nO7kGLTX1xBUhkv18Awa7tES6N1PHebpL
 GVoWpYWxY5JqOgObFPkaHZjfWv+Lpr9a/nF1lIWhk/Oa9Gggq6vz9EBu4bQbijqHz6Ka
 7Pp/vZgx/LdypbY0fS+MrKiifYNdsZhcTZqJJp9qlJsIHugxoQgjYvyoUMsGZ6ZaWMo7
 zi6erJfFKwZbkSP66XMFUuSJISMBSCKwPZq5yFklIN063OYTuauROYbEF+2viAsAZq0G
 ZuDQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ93nZF6Yx9zIOPg6/fj8t1dUA2MdcNPqJ68b14CjEN0LG2BQ8Q4CL4My+nNl14tPBtM0jpeioDxCdk=@buildroot.org
X-Gm-Message-State: AOJu0YyVBN8Y8i1/IYOrbko65QKsiZsl5TOR35nnvIE3G1vDx5A7WcLt
 uZ1Sbt4luYi3KNnSNTBk/9FcnGSX4OIdbYoSV1F2KCna3Lw+zfFPDsCaefUOkyyBvaM=
X-Gm-Gg: Acq92OHnV4XS+TU1bGihz/UhH+/TL2XXWH2WN9KX8zsZ5y2o0VWyCZyk2UlEFKvqKSX
 90vksO2Hg0qoXM6rXksUD1eeRT3936XCbsCrB+O/lJxV1X2hR7oprw0YsXvAD0JkdU/2vEV4uGw
 RUC71cMklJObdl5+tuqL4ab3tdRwI4KSnvl+4UuQUfTUxP+H28j7EYVpzAriWVmHMes/tcLkprB
 awyK6M2ZXP8/eyenArGXXEcUppKQFMtztG8EMsE7I612FqV5P0n20M4HZo+/3GMLUyvOmBrzrs2
 qmYRjOaF0r+q6B+9DF/VbMaOTG5Zwfw8zSNQrwWO6tog0aCD1O7OARFJTwxHbodaW25H4JnVD4V
 482oUsMEOORgiMEg/upx/OB1Aj43qraRWQfxi2Aw7VoE+3iKaOvQUwwPvgkHPNwIAx5wiSMG9zQ
 kSksPMpk3HHEJuGGu51ZR1kgz0Bw==
X-Received: by 2002:adf:ef88:0:b0:460:1e9d:31a5 with SMTP id
 ffacd0b85a97d-46030631ba3mr4277863f8f.35.1780663816511; 
 Fri, 05 Jun 2026 05:50:16 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2e4b18sm19364177f8f.10.2026.06.05.05.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:15 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:15 +0200
Message-ID: <20260605125015.272864-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260407-generate-cyclonedx-br-v1-2-03c45ccba2ed@cherry.de>
References: <20260407-generate-cyclonedx-br-v1-2-03c45ccba2ed@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663816; x=1781268616; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zwLLwQU0BB/2YS2eC11bN11FOm76dAVSBtrvk90mBp4=;
 b=TFr6mZ2up0tNjkYYdaljIrEmcf9SNCuuJPWrZM5M6mPeJRmnm3ESn6LVoc2foaF3ol
 xBPG+vwsl2LbSwchgDO3UR8uul0StNO0sD19cVcltV01c3P73NKD0TW+wnwv10/WhjZK
 uU6xwTrKyN3Fn1HI1rvKfKdKjBnF6bGanFQWPeezXdxr4Ko7katul2XhCQfS59JgR+Wr
 P3JKCBpZHfpUOyY9XSCHbZKYvqHGEPhcR0intE+149MrDLkKGgL8gwcVWL7wDM6lxGqp
 UGONmMdu2m5+AlqbKEXDvbO2AuhUQpFFo2Cd1uGMKvHB6RQ2WaKywfx4rqIwb+rZtST8
 m+ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TFr6mZ2u
Subject: Re: [Buildroot] [PATCH 2/4] utils/generate-cyclonedx: better error
 message when host Python is built without ssl
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
> urllib will eventually complain that it does not know what https is:
> Traceback (most recent call last):
>   File "/buildroot/utils/generate-cyclonedx", line 53, in <module>
>     urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 212, in urlretrieve
>     with contextlib.closing(urlopen(url, data)) as fp:
>                             ~~~~~~~^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 187, in urlopen
>     return opener.open(url, data, timeout)
>            ~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 487, in open
>     response = self._open(req, data)
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 509, in _open
>     return self._call_chain(self.handle_open, 'unknown',
>            ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                             'unknown_open', req)
>                             ^^^^^^^^^^^^^^^^^^^^
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 464, in _call_chain
>     result = func(*args)
>   File "/buildroot/build/host/lib/python3.14/urllib/request.py", line 1397, in unknown_open
>     raise URLError('unknown url type: %s' % type)
> urllib.error.URLError: <urlopen error unknown url type: https>
> 
> It's quite confusing really but what it means is that host Python was
> built without ssl support.
> 
> This adds an additional check importing _ssl and if the module is not
> found, tell the user what to do. This still doesn't make Buildroot's
> host Python3 fully usable for utils/generate-cyclonedx as it'll then
> fail when trying to validate certificates, this will be handled in the
> next few commits.
> 
> Note that ssl Python library is always built in CPython, but itself
> imports the _ssl module which is the one that may be disabled with
> py_cv_module__ssl=n/a (which is what happens when
> BR2_PACKAGE_HOST_PYTHON3_SSL is not enabled), hence why _ssl is checked
> and not ssl.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  utils/generate-cyclonedx | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index d17aa805b7..045bf14caa 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -9,6 +9,7 @@
>  
>  
>  import argparse
> +import importlib.util
>  import json
>  import os
>  from pathlib import Path
> @@ -42,6 +43,11 @@ VULN_WITH_PEDIGREE = set()
>  SPDX_LICENSES = []
>  
>  if not SPDX_SCHEMA_PATH.exists():
> +    if not importlib.util.find_spec("_ssl"):
> +        print(f"ssl module required for downloading {SPDX_SCHEMA_URL}. Try enabling BR2_PACKAGE_HOST_PYTHON3_SSL.",
> +              file=sys.stderr)
> +        exit(1)
> +
>      # Download the CycloneDX SPDX schema JSON, and cache it locally
>      cyclonedxpath.mkdir(parents=True, exist_ok=True)
>      urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
> 
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
