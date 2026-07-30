Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD672C531D0
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 07:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F37260670;
	Thu, 30 Jul 2026 07:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLtFAFzPgF5e; Thu, 30 Jul 2026 07:52:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CD6560794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785397957;
	bh=wmNBhxPbVIdp70DIn+Hs9WO9T+yTPB4O8J+IAJV4pvo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CbOoxzRlKt2be6hMSD9Mw/ugJXyLxqUDcd0wsQLsld3936uNf4/LhL7pNewDqKl6N
	 WZmsNFxHR0V3rlA/F2or/0cPADqWAGeHX5dSqE15DisL4aCmeWHB7mYDdRbF8G9ma6
	 x1x5zHgyCOmwXvIsO3Kq6TWjlMi3TI/wjqEyqqyjiEjX1eSpTkLI2UnrEZr0QgiyQ9
	 b8aKzuc26ZrEFcPlSmkBM0oPUpAYzOwEFNfN5yH8rfMQkCKfMLlk6J2PnPiiVlIEVT
	 Iq484NHSBkwEi1g+wSF9TFa829YaanWVY1D5tHtUL4wuhFnrs3mx47pz/HJGk/ptBx
	 p1r29choG4h8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CD6560794;
	Thu, 30 Jul 2026 07:52:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 970B5350
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 07:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88C82408A2
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 07:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6Vd1Qmclbr7 for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 07:52:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38499407C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38499407C9
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38499407C9
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 07:52:33 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so16713335e9.3
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 00:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785397952; x=1786002752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KEr8pjgQX97E2ExrLmC5RZnKvlGti3V6+pohDQbFYxY=;
 b=j88UHJsOxug2qUxczQcFg9wkhdEOwevTbdjQIsZ9DcDx0BtjnAAiyhMhnpmaW2AUNR
 TtvCXGYnnYJG03vjTGYTp7MvhRA9/aGR7oNGBR8yGKxXfcMas7ZVX5UfoZXGWt++2Lpg
 fpQUthAVMBw9yVwAunhswwM2EiIuhr0kkNNaNebyoSvg1V1uKyzZfyU2cD9P4e9b+Rba
 xm1pDx9YW2+JSwumcbaY6nxslTrHdQacKNKHLIJ1YJCXeXepDX3J2xXX3Sp26iWqCKUa
 djKHOqXBTudMqxMmEkvB/wS6S0cshGc0t1fD2Gv1kR0J4dngv4b5oVramAOwFREK5c1+
 CjDQ==
X-Gm-Message-State: AOJu0Yy//0xHXuSzdV5korGdpz1RL+r9a2ZxfvEHDYRyuMqolbga4tOc
 CPNphzkuvFV48cbjFalnsZIs5Ix548abnI6ulqoS0lJDq94FKpM2XNlG
X-Gm-Gg: AR+sD102GnqgRVPwOkGVszW+Oxd/RVuy9PuKH+LP+cfjNIBmevOFZsKvFggmGiqTAif
 fhOutuhwBCPKzll01QFZp6VMXDVWP8WtEil1lN5VWCFf7jO+OrwCWi/sB/ftJbuGy43ZWbGaI6L
 yjYq61/bxKZjzjNhKvWuxBAT1Ize9cySqGkoIJARr4rEoq1xP+tA/ouMdP2Uwnyd5qml6nclruw
 z7yfxSzyp9U6IoRJ6h/ZICiIOLRcKpkwFWbEbhZnP0f0Q5yo2KXrMLpwfgx0EHrLf1itrn//kU2
 P/W6aJSNYhbRnkYkvT/jWnpF0sBMLfN2szNRujPlXxkfQj/1RiOaZGiuCW1W4yWiZ9U2CdU/yDi
 C3g4sw2So9aDwxNKdYssVYDyUOe27jIc67h5WChMe8p89FTdTzMaViyQCxSGhWKxU4D7EQa6hRZ
 4HY5MuGPZz7ktdCjBwDFn8ro+vT1Dspx/dqfDS2gSBUN7q3rQOkrmt/+o153zmTGucY2TKoB9b0
 GrCoR8/lKZsGU+X0A83q5DdEM41tRBrwx16
X-Received: by 2002:a05:600c:8b26:b0:493:c8f7:3631 with SMTP id
 5b1f17b1804b1-49800ea217fmr17145845e9.22.1785397951648; 
 Thu, 30 Jul 2026 00:52:31 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.69.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-498011fd5fesm35182575e9.7.2026.07.30.00.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 00:52:31 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Date: Thu, 30 Jul 2026 10:52:25 +0300
Message-ID: <20260730075225.5131-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724064006.216995-1-flaviu.nistor@gmail.com>
References: <20260724064006.216995-1-flaviu.nistor@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785397952; x=1786002752; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KEr8pjgQX97E2ExrLmC5RZnKvlGti3V6+pohDQbFYxY=;
 b=Q84nLMBCjyuAZvJjhckPR3oDCPDZDpv7AxSsO7mcb+WHNb7X5remkNennY/GKfEstC
 Nl7PH89rc4gR7sUh+4VhBYiwrIi4T46CgSx56awCYKRFvgN3Y4a1orml1spNbvKVaJHA
 1uGiwNze590pU743Uw4woZZnRNvwNjTH6IDipLi+butlo8LO2eBTidivS56XzBIs1ka2
 as87HfBoX+urnzzDWYLEVgprgsQGF5up0f3ONI0Xb6R4oCMYrpc8lfV83qq9j2r8pdfm
 0MzzS0bA6vFoveCPaY7ip8wesBp+Goj2SSgSCDXiGqIoLkODriivs17KeiQsOwRguF4q
 YdyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Q84nLMBC
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

On 27/07/2026 9:40, Flaviu Nistor wrote:
>Hi Julien
>
>On 20/07/2026 21:51, Julien Olivain wrote:
>>Hi Flaviu,
>>
>>On 20/07/2026 15:33, Flaviu Nistor wrote:
>>> Hi Julien
>>> 
>>> On 18/07/2026 13:54, Julien Olivain wrote:
>>>> Hi Flaviu,
>>>> 
>>>> Thanks for the update.
>>>> 
>>>> On 17/07/2026 08:19, Flaviu Nistor wrote:
>>>>> Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
>>>>> on the project homepage, hence the bump to 0.7.2.
>>>>> Add also PYTHON_SNAPPY_SOURCE for correct package on Pypi.
>>>>> 
>>>>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Fix error indicated by Julien Olivain when running make
>>>>> python-snappy-legal-info.
>>>>> - Link to v1:
>>>>> https://lore.kernel.org/all/20260409152520.5894-1-flaviu.nistor@gmail.com/
>>>>> 
>>>>>  package/python-snappy/python-snappy.hash | 4 ++--
>>>>>  package/python-snappy/python-snappy.mk   | 5 +++--
>>>>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>>>> 
>>>> [...]
>>>>> diff --git a/package/python-snappy/python-snappy.mk
>>>>> b/package/python-snappy/python-snappy.mk
>>>>> index e80aa861df..b1bd8ca6ca 100644
>>>>> --- a/package/python-snappy/python-snappy.mk
>>>>> +++ b/package/python-snappy/python-snappy.mk
>>>>> @@ -4,8 +4,9 @@
>>>>>  #
>>>>> 
>>>>> ################################################################################
>>>>> 
>>>>> -PYTHON_SNAPPY_VERSION = 0.6.1
>>>>> -PYTHON_SNAPPY_SITE =
>>>>> https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
>>>>> +PYTHON_SNAPPY_VERSION = 0.7.2
>>>> 
>>>> When building with the commands:
>>>> 
>>>> cat >.config <<EOF
>>>> BR2_aarch64=y
>>>> BR2_TOOLCHAIN_EXTERNAL=y
>>>> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>>>> BR2_PACKAGE_PYTHON3=y
>>>> BR2_PACKAGE_PYTHON_SNAPPY=y
>>>> EOF
>>>> make olddefconfig
>>>> make python-snappy
>>>> 
>>>> The build fails with the error:
>>>> 
>>>> ERROR Missing dependencies:
>>>>         cramjam>=2.6.0
>>>> 
>>>> It seems python-snappy was updated to switch from the snappy library
>>>> to cramjam, since v0.7.0:
>>> https://github.com/intake/python-snappy/commit/277fb4a4b7e16b771f1ed1addde33feebd96c979
>>>> 
>>>> Cramjam is currently not included in Buildroot. So, I believe you will
>>>> need to add it, and update this python-snappy bump to reflect that
>>>> library change.
>>>> 
>>>> I also suggest you write a Buildroot runtime test to make sure
>>>> everything works. For the test, you can use the simple sequence
>>>> such as:
>>>> https://github.com/intake/python-snappy/blob/0.7.2/README.rst?plain=1#L50-L51
>>>> 
>>>> Could you send an updated patch series addressing those issues,
>>>> please?
>>> 
>>> First of all thanks a lot for the great support in guiding me and 
>>> patience.
>>> For sure I will send a new patch series addressing the isseu, as soon 
>>> as I have
>>> some time available.
>>> On my side, running the commands you provided fails even at installing
>>> toolchain-external-bootlin (2025.08-1), where look like a link can't be 
>>> created.
>>> I'll have to make this work also on my side.
>>
>>The error you observe is most likely due to an "unclean" working 
>>directory.
>>I believe you will just have to do a "make clean" first, then retry with 
>>the
>>sequence I provided.
>>
>
>That did the trick (make clean). I generated and tested a new patch series that
>now also added cramjam package and all is working fine. I even generated a QEMU
>image and tested inside the emulated that expected version is present and a simple
>py script using the python-snappy is working.
>

Even do I have send a working v3, please discard it since I have now send a v4 that
contains also the patch for a working test (see below) and a more clean version for
the other files.

>I still have some issue with the python-snappy package tests since I have an error
>(segmentation fault) when running and I still can't find my bug. The test is simple,
>so I can't understand what is happening. Once I solve this I will send a different
>patch for the test.
>

I had to spend a lot of time to understand what was happening. As I sad, same content
of the test was working inside qemu for aarch64 and x86_64. The problem was that running
the test is using as default armv5, 32 bits. This was causing a segmentation fault
at the beginning of the test when snappy was imported, which was actually caused by snappy
importing cramjam. Look like it is not working for amrv5, 32 bits.
This is now reflected in Config.in file for the package.

>One more question: Since I added a new package and is not covered in the Developers
>list, should/can I add my self to that list in the future (for specific packages)?
>

Thanks Fiona Klute for the clarification! 

>>>>> +PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
>>>>> +PYTHON_SNAPPY_SITE =
>>>> https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
>>>>>  PYTHON_SNAPPY_SETUP_TYPE = setuptools
>>>>>  PYTHON_SNAPPY_LICENSE = BSD-3-Clause
>>>>>  PYTHON_SNAPPY_LICENSE_FILES = LICENSE
>>>>> --
>>>>> 2.34.1
>>>> 
>>>> Best regards,
>>>> 
>>>> Julien.
>>> 
>>> Best Regards,
>>> Flaviu
>>
>>Best regards,
>>
>>Julien.
>
>Best regards,
>Flaviu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
