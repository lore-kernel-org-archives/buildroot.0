Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFC4C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 14:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE17E810F4;
	Mon, 22 Jul 2024 14:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENvfxb5Ei8fz; Mon, 22 Jul 2024 14:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87BD0810EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87BD0810EF;
	Mon, 22 Jul 2024 14:48:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 804E81BF286
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 14:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7928A810EF
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 14:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bw1hIzZ8FawM for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 14:48:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A620E80E00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A620E80E00
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A620E80E00
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 14:48:11 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1AD8B2C85CB6;
 Mon, 22 Jul 2024 16:48:09 +0200 (CEST)
Message-ID: <99a9d884-8052-4128-8f4e-f68517d80a65@bubu1.eu>
Date: Mon, 22 Jul 2024 16:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ~bubu <bubu@git.sr.ht>
References: <170715461915.13905.5968173515742280918-0@git.sr.ht>
 <170715461915.13905.5968173515742280918-1@git.sr.ht>
 <20240722145236.4e7ec0bf@windsurf>
Content-Language: en-US
In-Reply-To: <20240722145236.4e7ec0bf@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1721659689; bh=69fV7CPr7sG+r4Vq/PpR2Ilr7weAw4fKuvGpAq6VskE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=f6SurFw/VC04+xuyBliAZJPWtsVKcVPWbSqJazpgQDR4BaWBymRMmfSLhUm54vSTo
 JG0zyXTocYynqxI6L/UvjRI4tvxSpnV7ry+12HFF/rrYRGex2T2x/B1yG5h9oROE7j
 8DNoYtra7C4UCSqlhr8j7gj7LvqtE6ZKBsVxCJefVResQUMLPs3vBji7InOuQKt/Iv
 5lIjSM1YAruAqNFtzUOpmDVMESvIvEfIXaOq8GPt5ssI4KtPAKTw8emaiJmq7T+FQ+
 vDnbF9eQ8anEiO0FagaZDcyXyB7YY4L40WiXoroNw0vyFCUO7jOKLQhdd0580Q7325
 j56aZjs0UFZHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=f6SurFw/
Subject: Re: [Buildroot] [PATCH buildroot v2 2/2] support/testing: add
 fastapi runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, ~bubu <bubu@bubu1.eu>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 22.07.24 14:52, Thomas Petazzoni via buildroot wrote:
> Hello Marcus,
> 
> On Mon, 05 Feb 2024 18:25:10 +0100
> ~bubu <bubu@git.sr.ht> wrote:
> 
>> From: Marcus Hoffmann <bubu@bubu1.eu>
>>
>> Add a runtime test for fastapi. Use uvicorn as the asgi server
>> application as does the fastapi hello world example [1].
>>
>> Fastapi depends on PydanticV2 now which is written in rust so we need to
>> run the test on armv7.
>>
>> [1] https://fastapi.tiangolo.com/tutorial/first-steps/
>>
>> Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>
> 
> It looks like this test is no longer passing in our CI:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/7391793123
> 
> Could you perhaps have a look?

This is caused by our pydantic-core install apparently being broken:

   File "/root/sample_python_fastapi.py", line 1, in <module>
     from fastapi import FastAPI
   File "/usr/lib/python3.12/site-packages/fastapi/__init__.py", line 7, 
in <module>
   File "/usr/lib/python3.12/site-packages/fastapi/applications.py", 
line 16, in <module>
   File "/usr/lib/python3.12/site-packages/fastapi/routing.py", line 22, 
in <module>
   File "/usr/lib/python3.12/site-packages/fastapi/params.py", line 5, 
in <module>
   File "/usr/lib/python3.12/site-packages/fastapi/openapi/models.py", 
line 4, in <module>
   File "/usr/lib/python3.12/site-packages/fastapi/_compat.py", line 20, 
in <module>
   File "/usr/lib/python3.12/site-packages/fastapi/exceptions.py", line 
3, in <module>
   File "/usr/lib/python3.12/site-packages/pydantic/__init__.py", line 
404, in __getattr__
   File "/usr/lib/python3.12/importlib/__init__.py", line 90, in 
import_module
   File "/usr/lib/python3.12/site-packages/pydantic/main.py", line 29, 
in <module>
ImportError: cannot import name 'PydanticUndefined' from 'pydantic_core' 
(unknown location)


People have hit that here through conda forge as well: 
https://github.com/pydantic/pydantic/issues/8429

James, can you take a look maybe? (We still use pydantic-v1, so I don't 
really have any idea about pydantic rust core build topics.

Marcus

> 
> Thanks a lot!
> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
