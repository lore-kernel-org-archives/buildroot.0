Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC835D3E2BB
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 19:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A6DC406F2;
	Mon, 28 Oct 2024 19:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qvq4iA8Ac8Kd; Mon, 28 Oct 2024 19:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1BFD406A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1BFD406A7;
	Mon, 28 Oct 2024 19:22:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A899C112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A3D3812AB
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXG770GcJETD for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 19:22:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CA26812A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CA26812A9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CA26812A9
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:22:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C77472003DA;
 Mon, 28 Oct 2024 20:22:09 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51404])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 28 Oct 2024 20:22:09 +0100
MIME-Version: 1.0
Date: Mon, 28 Oct 2024 20:22:09 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Carlo Caione <carlo.caione@gmail.com>
In-Reply-To: <20241028164327.3e494f48@windsurf>
References: <20241025180523.118939-1-ju.o@free.fr>
 <20241028164327.3e494f48@windsurf>
User-Agent: Webmail Free/1.6.9
Message-ID: <a4eb330bb35e5986f04b8356a4434406@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730143332;
 bh=ECnoSsgoc/0uk9m5rcECGR6+rZkhy72SauFVTn5Nu/Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YKPOzby5CADXCYMuv0lzBcpBc6m4P/hlcx+tOBp9faZCP7omZfmWEVQi8mc7wGMYd
 ByVJHMNtm/KpuoI3o7DiletEwKaoUxWRbMv0Ka78fL0fLSoTEHapaiMOkxuupcAQ/g
 HYd/Vr8E5Yde/T4JAWL710l/X19OKiUiwJpftquYs7hTKMIN6tHJ/ZBk3iL8ragBGP
 sDdWqgc9r9vXIK/CkeZwPyWFlhQ6c3u4kHP28eEpSBEAntyLJQGfrVmHE+S7ZbYiCO
 28MMOE4eBUwBVepqxWYAbOFO6d23W8aLjklIeR1G2rxYZ1/HGZfuUU+Rcf5/rI9xo7
 +86R03o/HoWig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YKPOzby5
Subject: Re: [Buildroot] [PATCH 1/1] package/jailhouse: fix build when
 python helper scripts are enabled
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 28/10/2024 16:43, Thomas Petazzoni wrote:
> On Fri, 25 Oct 2024 20:05:23 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> When compiling jailhouse with BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS=y,
>> build is failing with error:
>> 
>>     Traceback (most recent call last):
>>       File 
>> "/buildroot/output/build/jailhouse-e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560/setup.py", 
>> line 18, in <module>
>>         setup(name="pyjailhouse", version=version,
>>       File 
>> "/buildroot/output/host/lib/python3.12/site-packages/setuptools/__init__.py", 
>> line 108, in setup
>>         return distutils.core.setup(**attrs)
>>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>       ...
>>       File "/buildroot/output/host/lib/python3.12/sysconfig.py", line 
>> 549, in _init_posix
>>         _temp = __import__(name, globals(), locals(), 
>> ['build_time_vars'], 0)
>>                 
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>     ValueError: Empty module name
>> 
>> This is due to a missing dependency on the target python3 package.
>> 
>> This commit fixes the issue by adding this missing dependency.
> 
> This error message is quite unclear... how is this error message
> related to having or not having python3 installed on the target?

I agree, the Python error message is somewhat cryptic ;) The hint is
"sysconfig.py". A more detailed explanation of the situation would be:

"""
Jailhouse Python scripts are using setuptools with host-python3 which
reads its sysconfig data from the target-python3. See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.1/package/pkg-python.mk?ref_type=tags#L33

If the target python3 is not installed, this get expanded as an empty
string, leading to this "ValueError: Empty module name" error.

Pure Python packages which are using the python-package infrastructure
usually get this dependency automatically from:
https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.1/package/pkg-python.mk?ref_type=tags#L295

Here, the jailhouse package rather uses the generic-package
infrastructure, then installs the Python scripts (if enabled) with
dedicated macros. This is why the target python3 is needed.
"""

Do you want me to send a v2 adding that to the commit log?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
