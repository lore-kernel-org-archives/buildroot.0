Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E76C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 18:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DAAE605D1;
	Mon, 20 Jul 2026 18:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmhjyCkVoqZF; Mon, 20 Jul 2026 18:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B2AC605E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784573489;
	bh=Hq5e326/n6lFuw2AIoXcWKtt4om87KE2FyUGPwWu67g=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=S8SOlpMZSn5SEh440Bb8Q9n8EiBrJIDzTAGSiMsk9orIuWfQ+o93xvgdT6CzSjLad
	 ivTkKTsXzasp/65r4F2GcfaABxhJSrtz6gDyifR9n74bnLyfVUiDE9NYtG6BlJRMHF
	 rc7k/lXPGMU75weEoY2qqyiyBFRw/MiYgk9NJ6IkxLR1a67kngFs+q5XhukxzTbCWk
	 XoawTL4bZOii2A63jEkJnnub0EF1toIkSuJ8NR8QO0RWDHNxfQ6DKq55vxHWAAz4Q9
	 t6clvrMGQvUx4M1ut/7PocyzrmsA4VN/MF0me/GnOc++2Rio7b/icPRYbqM/QQwY0+
	 FRX28mzD4wkQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B2AC605E1;
	Mon, 20 Jul 2026 18:51:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCC41DF0
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 18:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C284E80CAE
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 18:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwabIgIShqRc for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 18:51:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2ABE280CA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ABE280CA8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2ABE280CA8
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 18:51:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8D31B19F5BE;
 Mon, 20 Jul 2026 20:51:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Jul 2026 20:51:20 +0200
MIME-Version: 1.0
Date: Mon, 20 Jul 2026 20:51:20 +0200
To: Flaviu Nistor <flaviu.nistor@gmail.com>
In-Reply-To: <20260720133343.10111-1-flaviu.nistor@gmail.com>
References: <a97b4a7a76d63c6f7b0ebe23c3b43ca1@free.fr>
 <20260720133343.10111-1-flaviu.nistor@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <2b65947d849cb7dfcee512ef2407d2df@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784573483;
 bh=dT8OhOvncPDis59A4Lx+LAXVxUAbZJOF4R+7AoaVfmU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pp2rhSnU5AzWPtFTn8WoZftfkNkXO5bhlgiQ/+COrp9gsK147ZXKnQ9kxZ09J38P/
 0CEj1cZi9H2Xfan8dCGilCAfLVeMGKtDOFmKUX4DmVx7WU4K/DcbcKu2MZSYYzKqPJ
 Je4YLP/FT1a/PABlgnMcFFBww0uo0uaaCocgT9Ry63f0xC0gIKy7kIUYAhPJwkH1/j
 0LUJt804d7ffi2DwLbkts0jx0Vv+BIJZ5CheoKOroyrrXM4+LZZKCntAumA/Pz4sxD
 /di3PQrfkdXUu30hFKEWirYfUrZLoPzHTN5KFDKYtE/2u4D4IEQ9hZgC7hQCLe5bv7
 OAFBDmiHs0dYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pp2rhSnU
Subject: Re: [Buildroot] [PATCH v2] package/python-snappy: bump version to
 0.7.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Flaviu,

On 20/07/2026 15:33, Flaviu Nistor wrote:
> Hi Julien
> 
> On 18/07/2026 13:54, Julien Olivain wrote:
>> Hi Flaviu,
>> 
>> Thanks for the update.
>> 
>> On 17/07/2026 08:19, Flaviu Nistor wrote:
>>> Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
>>> on the project homepage, hence the bump to 0.7.2.
>>> Add also PYTHON_SNAPPY_SOURCE for correct package on Pypi.
>>> 
>>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Fix error indicated by Julien Olivain when running make
>>> python-snappy-legal-info.
>>> - Link to v1:
>>> https://lore.kernel.org/all/20260409152520.5894-1-flaviu.nistor@gmail.com/
>>> 
>>>  package/python-snappy/python-snappy.hash | 4 ++--
>>>  package/python-snappy/python-snappy.mk   | 5 +++--
>>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>> 
>> [...]
>>> diff --git a/package/python-snappy/python-snappy.mk
>>> b/package/python-snappy/python-snappy.mk
>>> index e80aa861df..b1bd8ca6ca 100644
>>> --- a/package/python-snappy/python-snappy.mk
>>> +++ b/package/python-snappy/python-snappy.mk
>>> @@ -4,8 +4,9 @@
>>>  #
>>> 
>>> ################################################################################
>>> 
>>> -PYTHON_SNAPPY_VERSION = 0.6.1
>>> -PYTHON_SNAPPY_SITE =
>>> https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
>>> +PYTHON_SNAPPY_VERSION = 0.7.2
>> 
>> When building with the commands:
>> 
>> cat >.config <<EOF
>> BR2_aarch64=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>> BR2_PACKAGE_PYTHON3=y
>> BR2_PACKAGE_PYTHON_SNAPPY=y
>> EOF
>> make olddefconfig
>> make python-snappy
>> 
>> The build fails with the error:
>> 
>> ERROR Missing dependencies:
>>         cramjam>=2.6.0
>> 
>> It seems python-snappy was updated to switch from the snappy library
>> to cramjam, since v0.7.0:
>> https://github.com/intake/python-snappy/commit/277fb4a4b7e16b771f1ed1addde33feebd96c979
>> 
>> Cramjam is currently not included in Buildroot. So, I believe you will
>> need to add it, and update this python-snappy bump to reflect that
>> library change.
>> 
>> I also suggest you write a Buildroot runtime test to make sure
>> everything works. For the test, you can use the simple sequence
>> such as:
>> https://github.com/intake/python-snappy/blob/0.7.2/README.rst?plain=1#L50-L51
>> 
>> Could you send an updated patch series addressing those issues,
>> please?
> 
> First of all thanks a lot for the great support in guiding me and 
> patience.
> For sure I will send a new patch series addressing the isseu, as soon 
> as I have
> some time available.
> On my side, running the commands you provided fails even at installing
> toolchain-external-bootlin (2025.08-1), where look like a link can't be 
> created.
> I'll have to make this work also on my side.

The error you observe is most likely due to an "unclean" working 
directory.
I believe you will just have to do a "make clean" first, then retry with 
the
sequence I provided.

>>> +PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
>>> +PYTHON_SNAPPY_SITE =
>>> https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
>>>  PYTHON_SNAPPY_SETUP_TYPE = setuptools
>>>  PYTHON_SNAPPY_LICENSE = BSD-3-Clause
>>>  PYTHON_SNAPPY_LICENSE_FILES = LICENSE
>>> --
>>> 2.34.1
>> 
>> Best regards,
>> 
>> Julien.
> 
> Best Regards,
> Flaviu

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
