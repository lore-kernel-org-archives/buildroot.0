Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4225BC531C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 06:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1968810C7;
	Fri, 24 Jul 2026 06:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxth3xH2GnSw; Fri, 24 Jul 2026 06:40:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0B5D810CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784875222;
	bh=SVr7VBscZt+KMjbAIZRbH5y7PG8oJrv7BHexQb6HSZk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FyuavIPatrEx06LPX+w5P5aR+QCO3F+ck+TWHLhENGUHpbLAOPi/xLJvs2EuVrd25
	 vk0i2aqswXFq9GDOFnZCFgQl6SUi229MxoHsZkKeFzDbxEMpY8LrsWSqY/+zZ5cozs
	 f2xNssrKvrZDuDNEt7uraogDyGrOmvtCA4AKon0mpaZ2TKyXyJjxCjkDnN0MH5RmHm
	 rBSEgorzW1osNV83Lz0PsXMKgCeyo1aowgqXm4mS484rIWFsnZINo70t4Dqv7lUjoN
	 WTB/U2vLu1wwNl2M3eoSseBTprgVAZYST/h5kAFZm0GnFP3G4Nni4aew1lHsCdPtY5
	 dtEBt5eD4rhuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0B5D810CB;
	Fri, 24 Jul 2026 06:40:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E66AE3B1
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 06:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D848B810CB
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 06:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H04dHC0I0XxH for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 06:40:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C4642810C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4642810C7
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4642810C7
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 06:40:20 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so594515e9.3
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 23:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784875218; x=1785480018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9M31BWaeETtrrZdfxm0+fXY060/GlJaXNj9+t3guEV0=;
 b=NJYD64gD0c0FIHpcnGiRenyv2oJm0PT2Kl2Yn5Dl4ixVUWr1LPbsYOEwQr7p84Bt3u
 uhEtxptlYyY7HTe0stVSLONJSQUPZNtNM4bi/NbvOjHAFmXXa/qfu5zhIR7yZQjY1Uf+
 342v0/aYlHjY+C0S7psUOFFVWQMSvkny54NwgtJRELRj+8ZiOBQ37MQIy3aqjoFRyr0s
 8WezdnliQctGFGoR4UZZcYc5NnH4+178oDMe5fhoElIXrSzLss2qERiND1nVoLZ0bOxM
 RIVzrDV0dhQzgr8WYvfKSz8GHxVi2j2K5vIpJiyW82JDNEDF1z+/Z2E0IXDu4tOujNhf
 RfXg==
X-Gm-Message-State: AOJu0YylFbMSmHp0JccoMliRZQV6FBKup1tt5+KbJPpG69PjgnJPF0mR
 s0bSShGWYx2IW4mxpCGVcMsQex7WP3aGof/6gYaqL1vpKcDlkGenr1Su
X-Gm-Gg: AR+sD125uq8MODEqlZ3fRuIoFmDcxlZOdissxfhqLExgkBXqOw9tniFg4Ve/+I/hcqz
 Vvdy3VHM9JGSRUN1WYrNr72yRZ+TUNWgj2bI38lvabfZ0HC9iQMYdyGM8VD/IfUeZ3kjQC3ckpY
 esjKp7nctUjcl7+NPa0zGxn0xpzc3j2dAJncj7nkyVmaGiNAsY1DF/p1UCTNm82aCIj00sDo99+
 Eszpa8F9vAwY/H7Ct9n1iRWcIhe9HJv/5fjyrKWgChjkTXRf7v12F6w8SzdGF21SpmXVvcDA8kS
 vs8C41E4/GQwLdoGOq/O2m3o1Ya2P6HagZKg1V80L8yYQl/9AI/NgD3xoZcYnKafUhEbazhtZGr
 OgVdtX7qMwzTiPGWdXcmmNcG570r8sH86hSsxDS5UEOnQKSPlc297vslKH7y9VYtje9iFJrNrvw
 xqF99qPzshRfZdfPNVE8/pUt30VZhPCE9o0KukmglevoUfv1PEbfQypg==
X-Received: by 2002:a05:600c:4e8a:b0:495:6a0f:200 with SMTP id
 5b1f17b1804b1-49573ce97e1mr60005035e9.27.1784875218279; 
 Thu, 23 Jul 2026 23:40:18 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.94])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957afac44bsm51092965e9.9.2026.07.23.23.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 23:40:17 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Date: Fri, 24 Jul 2026 09:40:06 +0300
Message-ID: <20260724064006.216995-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2b65947d849cb7dfcee512ef2407d2df@free.fr>
References: <2b65947d849cb7dfcee512ef2407d2df@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784875218; x=1785480018; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9M31BWaeETtrrZdfxm0+fXY060/GlJaXNj9+t3guEV0=;
 b=E7lL6juIUDLyhMsT0acjc4e8Ym2S6Zd/qjq4fQ6AEiSS6I+3JtQqCBDgVmHSERGZKM
 0PMXvT/kzRcusAmHXvGPRBK2AsWBDx09MGmNhW+5R+rrBXWOMGGBvz+uixh8W3dGK6Rd
 1cQbv+43ZQeHyHfeawmTdY6QhuBueDGT6DBz2yBflqOAMYEfw//2Z5MHsWA1dMtz/M5C
 X+BOE/wec/A7XgMut7iZbartgyW3MIOWCdNhX3bkE5f871h2iYLDFyWwxCuBNSdP1fxc
 8hd3VHGQY6dnVilJzsXtSZsX2oHfaK3okezCDKWw4bYo/0yNSsTNToF7I3WkbUvz84LC
 GhFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=E7lL6juI
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien

On 20/07/2026 21:51, Julien Olivain wrote:
>Hi Flaviu,
>
>On 20/07/2026 15:33, Flaviu Nistor wrote:
>> Hi Julien
>> 
>> On 18/07/2026 13:54, Julien Olivain wrote:
>>> Hi Flaviu,
>>> 
>>> Thanks for the update.
>>> 
>>> On 17/07/2026 08:19, Flaviu Nistor wrote:
>>>> Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
>>>> on the project homepage, hence the bump to 0.7.2.
>>>> Add also PYTHON_SNAPPY_SOURCE for correct package on Pypi.
>>>> 
>>>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>>>> ---
>>>> Changes in v2:
>>>> - Fix error indicated by Julien Olivain when running make
>>>> python-snappy-legal-info.
>>>> - Link to v1:
>>>> https://lore.kernel.org/all/20260409152520.5894-1-flaviu.nistor@gmail.com/
>>>> 
>>>>  package/python-snappy/python-snappy.hash | 4 ++--
>>>>  package/python-snappy/python-snappy.mk   | 5 +++--
>>>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>>> 
>>> [...]
>>>> diff --git a/package/python-snappy/python-snappy.mk
>>>> b/package/python-snappy/python-snappy.mk
>>>> index e80aa861df..b1bd8ca6ca 100644
>>>> --- a/package/python-snappy/python-snappy.mk
>>>> +++ b/package/python-snappy/python-snappy.mk
>>>> @@ -4,8 +4,9 @@
>>>>  #
>>>> 
>>>> ################################################################################
>>>> 
>>>> -PYTHON_SNAPPY_VERSION = 0.6.1
>>>> -PYTHON_SNAPPY_SITE =
>>>> https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
>>>> +PYTHON_SNAPPY_VERSION = 0.7.2
>>> 
>>> When building with the commands:
>>> 
>>> cat >.config <<EOF
>>> BR2_aarch64=y
>>> BR2_TOOLCHAIN_EXTERNAL=y
>>> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>>> BR2_PACKAGE_PYTHON3=y
>>> BR2_PACKAGE_PYTHON_SNAPPY=y
>>> EOF
>>> make olddefconfig
>>> make python-snappy
>>> 
>>> The build fails with the error:
>>> 
>>> ERROR Missing dependencies:
>>>         cramjam>=2.6.0
>>> 
>>> It seems python-snappy was updated to switch from the snappy library
>>> to cramjam, since v0.7.0:
>> https://github.com/intake/python-snappy/commit/277fb4a4b7e16b771f1ed1addde33feebd96c979
>>> 
>>> Cramjam is currently not included in Buildroot. So, I believe you will
>>> need to add it, and update this python-snappy bump to reflect that
>>> library change.
>>> 
>>> I also suggest you write a Buildroot runtime test to make sure
>>> everything works. For the test, you can use the simple sequence
>>> such as:
>>> https://github.com/intake/python-snappy/blob/0.7.2/README.rst?plain=1#L50-L51
>>> 
>>> Could you send an updated patch series addressing those issues,
>>> please?
>> 
>> First of all thanks a lot for the great support in guiding me and 
>> patience.
>> For sure I will send a new patch series addressing the isseu, as soon 
>> as I have
>> some time available.
>> On my side, running the commands you provided fails even at installing
>> toolchain-external-bootlin (2025.08-1), where look like a link can't be 
>> created.
>> I'll have to make this work also on my side.
>
>The error you observe is most likely due to an "unclean" working 
>directory.
>I believe you will just have to do a "make clean" first, then retry with 
>the
>sequence I provided.
>

That did the trick (make clean). I generated and tested a new patch series that
now also added cramjam package and all is working fine. I even generated a QEMU
image and tested inside the emulated that expected version is present and a simple
py script using the python-snappy is working.

I still have some issue with the python-snappy package tests since I have an error
(segmentation fault) when running and I still can't find my bug. The test is simple,
so I can't understand what is happening. Once I solve this I will send a different
patch for the test.

One more question: Since I added a new package and is not covered in the Developers
list, should/can I add my self to that list in the future (for specific packages)?

>>>> +PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
>>>> +PYTHON_SNAPPY_SITE =
>>>> https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
>>>>  PYTHON_SNAPPY_SETUP_TYPE = setuptools
>>>>  PYTHON_SNAPPY_LICENSE = BSD-3-Clause
>>>>  PYTHON_SNAPPY_LICENSE_FILES = LICENSE
>>>> --
>>>> 2.34.1
>>> 
>>> Best regards,
>>> 
>>> Julien.
>> 
>> Best Regards,
>> Flaviu
>
>Best regards,
>
>Julien.

Best regards,
Flaviu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
