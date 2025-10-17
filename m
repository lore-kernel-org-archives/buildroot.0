Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A585DCCD19F
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A17380969;
	Fri, 17 Oct 2025 16:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVxNRlTr6Jve; Fri, 17 Oct 2025 16:59:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64F8D809B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F8D809B9;
	Fri, 17 Oct 2025 16:59:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6599D8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3CA9409FA
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBlLmLAz2YV9 for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:59:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB68640A93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB68640A93
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB68640A93
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:59:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5D24F13F8B5;
 Fri, 17 Oct 2025 18:59:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Oct 2025 18:59:00 +0200
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 18:59:00 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, James Hilliard
 <james.hilliard1@gmail.com>
In-Reply-To: <30d188b1-5a62-49d3-bc2c-f7c26d3c560e@bubu1.eu>
References: <20251017080920.28339-1-buildroot@bubu1.eu>
 <30d188b1-5a62-49d3-bc2c-f7c26d3c560e@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <0f8f74135f4c9f4521f540d27fc7d4c7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760720343;
 bh=C8871ZcndWwcyWKkW0YDwcU2YgUG2IlZPgMI0bBKRl4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tqq8Si7mEae42pfooe1FUokEv8D+XKAnDG5eT04mrj2J49LQc6Kj9dNzAT+dTS3HE
 +LRzt8Uclyhas0oE9PYTxYNjKFmIoodANZYGs7qJiJH59VWGYTE7RtyfNzKbRpcsGc
 clawppGTYVFYrhUppMdks50Uhx0xFIN7FIpZ2NWF3n5Gp8zvmkWTFOh4uveGHKEt44
 CQsdArPxQyWn3y1PnWYHQ1NPfjZm0sPwUmDuS+xjqWh4TP/SsLVqrmlauYng++t3hZ
 wYSF8WGsN6QGNnNEyXqGpHiq/bO4EtXvgDAGyjNb+vx+xJAH5kuafWTzpYN8cT9SO7
 1HVg4G6ZYv2vQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tqq8Si7m
Subject: Re: [Buildroot] [PATCH] package/python-uvloop: bump to v0.22.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus,

Thanks for the patch.  I have few comments, see below.

On 17/10/2025 10:11, Marcus Hoffmann via buildroot wrote:
> On 10/17/25 10:09, Marcus Hoffmann via buildroot wrote:
>> Changelog: https://github.com/MagicStack/uvloop/releases/tag/v0.22.0
> 
> The commit title should say 0.22.1, but the release is identical to 
> 0.22.0, so I linked to that changelog here.

I agree that the commit title should say 0.22.1. Can update it to that, 
please?
Then, to simply have the evidence that those releases are the same, you
can just put the release notes:

Changes since v0.21.0:
https://github.com/MagicStack/uvloop/releases/tag/v0.22.0
https://github.com/MagicStack/uvloop/releases/tag/v0.22.1

>> 
>> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
>> ---
>>   package/python-uvloop/python-uvloop.hash | 7 +++----
>>   package/python-uvloop/python-uvloop.mk   | 4 ++--
>>   2 files changed, 5 insertions(+), 6 deletions(-)
>> 
>> diff --git a/package/python-uvloop/python-uvloop.hash 
>> b/package/python-uvloop/python-uvloop.hash
>> index 24111e759b..e6eb188739 100644
>> --- a/package/python-uvloop/python-uvloop.hash
>> +++ b/package/python-uvloop/python-uvloop.hash
>> @@ -1,6 +1,5 @@
>>   # md5, sha256 from https://pypi.org/pypi/uvloop/json
>> -md5  adedf20cf065ff49a96813b783ec1d29  uvloop-0.21.0.tar.gz
>> -sha256  
>> 3bf12b0fda68447806a7ad847bfa591613177275d35b6724b1ee573faa3704e3  
>> uvloop-0.21.0.tar.gz
>> +md5  3fdd58ac1b7c2a520ed05e3151a64515  uvloop-0.22.1.tar.gz
>> +sha256  
>> 6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f  
>> uvloop-0.22.1.tar.gz
>>   # Locally computed sha256 checksums
>> -sha256  
>> 377025287798f9dcd819e1f826fa5fc5e2f382528691ab0528c5cf8c8c282c27  
>> LICENSE-APACHE
>> -sha256  
>> 6dd4c399f26de043d77a2ad7e31db4cb5bf08ea8368b0a42d6e158635cc8ab62  
>> LICENSE-MIT
>> +sha256  
>> 16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  
>> vendor/libuv/LICENSE

Here, you remove LICENSE-APACHE and LICENSE-MIT, and introduce 
vendor/libuv/LICENSE
but this patch does not update PYTHON_UVLOOP_LICENSE nor
PYTHON_UVLOOP_LICENSE_FILES in the .mk.

Running the command:

make python-uvloop-legal-info

generates the warnings:

ERROR: No hash found for LICENSE-APACHE
ERROR: No hash found for LICENSE-MIT

The file vendor/libuv/LICENSE only includes the MIT license.
What the upstream relicensed?
Could you givea justification in the commit log why you change
those license files? (because the original files are still present
in the new version you update to.

>> diff --git a/package/python-uvloop/python-uvloop.mk 
>> b/package/python-uvloop/python-uvloop.mk
>> index fbdf74769e..419ee33062 100644
>> --- a/package/python-uvloop/python-uvloop.mk
>> +++ b/package/python-uvloop/python-uvloop.mk
>> @@ -4,9 +4,9 @@
>>   #
>>   
>> ################################################################################
>>   -PYTHON_UVLOOP_VERSION = 0.21.0
>> +PYTHON_UVLOOP_VERSION = 0.22.1
>>   PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
>> -PYTHON_UVLOOP_SITE = 
>> https://files.pythonhosted.org/packages/af/c0/854216d09d33c543f12a44b393c402e89a920b1a0a7dc634c42de91b9cf6
>> +PYTHON_UVLOOP_SITE = 
>> https://files.pythonhosted.org/packages/06/f0/18d39dbd1971d6d62c4629cc7fa67f74821b0dc1f5a77af43719de7936a7
>>   PYTHON_UVLOOP_SETUP_TYPE = setuptools
>>   PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
>>   PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT

Can you send an updated patch please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
