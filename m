Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E69CCD1A5
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 11:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00F1860A42;
	Tue, 21 Oct 2025 11:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRMn9WyDayMw; Tue, 21 Oct 2025 11:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A34C60A5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A34C60A5C;
	Tue, 21 Oct 2025 11:31:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4699D70A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 11:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29A2781158
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 11:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKBxESs1uGhl for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 11:31:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B59D281157
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B59D281157
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B59D281157
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 11:31:16 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id BE7EB2C84551;
 Tue, 21 Oct 2025 13:31:13 +0200 (CEST)
Message-ID: <4b8956d4-d402-46d6-a20b-0c380b032598@bubu1.eu>
Date: Tue, 21 Oct 2025 13:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251021093500.744569-1-buildroot@bubu1.eu>
 <20251021121609.2a9d08be@windsurf>
Content-Language: en-US
In-Reply-To: <20251021121609.2a9d08be@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1761046273; bh=4GsuteROh975PC2WflAWJjoCadPiqHJECy6QL+Hrcbo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=heF0gNtIeTubsCWpyexeVmX+QfiMiSYgYXiWhkH9GOXJMciuv3LK2wJ5zxWJ/jL1n
 Xh4z2pD6XGnBqLEZIn3EecHdYDe3nmiM/2m0Dwwtv6DuI5h9SU844mhBO3OdU9okKB
 aMLFMu6YbrDW1ZrMB0xf9H5Prajf7qWfv39bBFrYB4xf9V3mvudcQfNgQwAUo1oVCY
 dTydjvXqnfvmYKfKflfKo58a9XYhhtPxepp8IfqhZO3Q5Ti5TX3XHrjfH4u01TrY6q
 4qrA2iYDLFD2T8O5P4RAgMx2RV+9yMTZpDhEzZONpT5tY8Px8XCnPZjvWR2ucAt+hF
 USW6im66avACQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=heF0gNtI
Subject: Re: [Buildroot] [PATCH v2] package/python-diskcache: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
thanks for the review!

On 10/21/25 12:16, Thomas Petazzoni wrote:
> Hello Marcus,
> 
> On Tue, 21 Oct 2025 11:35:00 +0200
> Marcus Hoffmann <buildroot@bubu1.eu> wrote:
> 
>> The package imports itself in setup.py to get the package-name and
>> version number. This doesn't work during the buildroot build, so we
>> replace this by the hardcoded package-name and the version number stored
>> in buildroot.
>>
>> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> 
> Sounds good overall. One question below.
> 
> 
>> diff --git a/package/python-diskcache/python-diskcache.mk b/package/python-diskcache/python-diskcache.mk
>> new file mode 100644
>> index 0000000000..327d076779
>> --- /dev/null
>> +++ b/package/python-diskcache/python-diskcache.mk
>> @@ -0,0 +1,20 @@
>> +################################################################################
>> +#
>> +# python-diskcache
>> +#
>> +################################################################################
>> +
>> +PYTHON_DISKCACHE_VERSION = 5.6.3
>> +PYTHON_DISKCACHE_SOURCE = diskcache-$(PYTHON_DISKCACHE_VERSION).tar.gz
>> +PYTHON_DISKCACHE_SITE = https://files.pythonhosted.org/packages/3f/21/1c1ffc1a039ddcc459db43cc108658f32c57d271d7289a2794e401d0fdb6
>> +PYTHON_DISKCACHE_SETUP_TYPE = setuptools
>> +PYTHON_DISKCACHE_LICENSE = Apache-2.0
> 
> License is OK, checked here.
> 
>> +PYTHON_DISKCACHE_LICENSE_FILES = LICENSE
>> +
>> +define PYTHON_DISKCACHE_REMOVE_SELF_IMPORT
>> +	sed -i -e '/import diskcache/d' -e 's/diskcache.__title__/"diskcache"/' -e 's/diskcache.__version__/"$(PYTHON_DISKCACHE_VERSION)"/' $(@D)/setup.py
>> +endef
> 
> This could use some splitting:
> 
> 	sed -i -e '/import diskcache/d' \
> 		-e 's/diskcache.__title__/"diskcache"/' \
> 		-e 's/diskcache.__version__/"$(PYTHON_DISKCACHE_VERSION)"/' \
> 		$(@D)/setup.py
> 
> but perhaps more importantly, has this been reported upstream? How can
> this even work? You need the thing installed... before you install it?

This was, unfortunately, a very common pattern in setup.py builds but 
it's going away with projects switching to declarative build definitions 
via pyproject.toml. (Which diskcache hasn't done yet, but I assume will 
do eventually, maintenance is a bit slow currently). setup.py is just a 
python script and python allows importing modules from $CWD, even if 
they are not installed. That's how that works in general.

Now I was confused why past me claimed that the same doesn't work inside 
the buildroot build and the reason for that is that host-python3 doesn't 
build with sqlite support, so the diskcache import (at build-time) fails.

Perhaps a less hacky, but also more wasteful, approach to solving this 
is enforcing host-python sqlite support is built when diskcache is 
selected. I just tested that and it works, unsure what approach to chose 
now. WDYT?


> 
> Thomas

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
