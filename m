Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FE2C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 13:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC616606C5;
	Mon, 20 Jul 2026 13:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1G4jxGZAqky; Mon, 20 Jul 2026 13:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BB1B606B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784554432;
	bh=fQz7AkiyRYeM2Vjshc8etJwOOl3gOnvBTjk9v0shfH8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=b/gjlF0g/Mr1Ix36ihjsWVPLbZdeHbEWzmWzI5+1II8kriIljGoWMgjJIRKZieywo
	 AA1vNcq8vciiqiVPNFi3pfdAA/61oZAJ6JXT7trdm1soQXc0deJFr0Ep2J7Lw4Jqbo
	 9kir1Uc9gpC+XRVXoZ5ECnlRdcE7m1muX/+RHPjkvG8jP536HNwj5DMxdv89HIlsGj
	 yIlOBclqY+ZFn5NdEeAL7bYXqXCwYlKrK3XzPA/ljA2NgmQIu6bGIdlxV+QS1ri6ME
	 a3dZyWZAYptW3SoEdol0443RlsRg1O595T8RvE9zQvaTn32f5Z6+XIr5A4zff40w9E
	 MxJ6WB5r3EX1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BB1B606B3;
	Mon, 20 Jul 2026 13:33:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0533282
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 13:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5C444011A
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 13:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPJMSgREAZlU for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 13:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 66A5A4005D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66A5A4005D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66A5A4005D
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 13:33:50 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4955484387cso10159385e9.1
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 06:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784554428; x=1785159228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YVqQDh3vnohSzvadGvwvvFtAkQgyPUN96pNssFd0T00=;
 b=M0iDBjvI2oELCfcx9RDYAalxHzD/69i/GZj+JwQveMpf0d5ldfZZU08TWaCGeWMdMv
 dRakPx4Ra4jxmR+LmuDmZtSw6YjtZVE27IrUjCzndrZJM3qzp4MHzpAuZuKZiHB8YpxK
 vOmYmUN4+k3l6wWoHXfvzKGhb4oAAbCV678pi1IOwbRm4WYrVSAOf9qsN6sYZX4yw/jO
 D1e0IzSNj8JBS1cQrB3di6in13jr0uv46B5IqR3nLkk1oWPGYYgJ9pV1Cc1Sq8aufxjB
 ZrgoRdVINGsaHVohobwad3IsEOBUsyvnuLl8R2Y0VDuYV5rW2gx4zk2mx3EN7bnen/2b
 X+XQ==
X-Gm-Message-State: AOJu0YyI5r9WNE+yLzAXXU9f4K+7KoBs8MMU/2C2Mt1uGOIuFxnbmvTZ
 rqgjafLS6jsZuTqwFnLV+QbzAgVSwCfa6QXxnB/erBFLX5a2SWVccVjlcM9SwCG4KLM=
X-Gm-Gg: AfdE7ckjv4e3YAFwKNFts0xHcyBgJ/f9xcktBMEITZ+ZDcQfmb6kt112ncXEDU/kLI2
 llDid1+beNH51yYSuMV0JCkpMn5bLhc/tGYgEAVvSM3TMPPD/mc0QrCkR2F9Yr88Az7shk+6lXy
 5hXtY1HaaxG0kmdZeI7QJxi3x7ASKTjyWwtBUsHJw6r/iu5TuWWYVQ4X/RJrSUkgj12h4YWXNF2
 AYdPx6Gn8QHqB2LudR+d/d+dj1tnfvyLIxUZTO06KR6iMq1eSRWSr+i5YICt5Bt+oEACeGlIRKy
 O2k6c7lsVElaqt8k93zbhxUdkgjJmx61fCpP90bt5qn/+4tP5Xh/mKtI6i2eF4i78irGN81dqci
 g9tRsLVMwQ2IPywx8fpRxBrBTc/Ara/jMWUbWsVe0e7uXr7D5VVdFBlBd3gN+h/gmBUpfT2+wsX
 jKQ9DmKX58kQ6r9VTQ1PsKmbKLk/RssNIW+PJU9l/UDBK7X0O9zQ==
X-Received: by 2002:a05:600c:6c85:b0:490:c032:ae92 with SMTP id
 5b1f17b1804b1-4954a412f97mr109126465e9.33.1784554427828; 
 Mon, 20 Jul 2026 06:33:47 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.69.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49562709500sm51162025e9.14.2026.07.20.06.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 06:33:47 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Date: Mon, 20 Jul 2026 16:33:43 +0300
Message-ID: <20260720133343.10111-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a97b4a7a76d63c6f7b0ebe23c3b43ca1@free.fr>
References: <a97b4a7a76d63c6f7b0ebe23c3b43ca1@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784554428; x=1785159228; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YVqQDh3vnohSzvadGvwvvFtAkQgyPUN96pNssFd0T00=;
 b=jY24g1DO3Gnf6mIGyhGTuuNoyUCuejwusOVXZsQv/erMRYJYimc4IGndWVgT0vdDit
 9L2ieZUWZw2LZ7urkO2iy8roSnrW7YhLpOMyW2U0y8bKGoMqTKVwXbkh7a+opqdz/W7m
 1JMe/HAVZc145ZTUG58qoBxH3NsF4Ylvzcj7XieXP/eR8GvbtJKOQ2+5VEwiazq0MTEl
 Nff8CGln3S9Smie36pRJH8tZ527uQciM5nzNNJFozVzE9u4nHiMUxldFJ7n3rae8pAbm
 Ros2oo2r5Wk0LRqmTtwS/qW9ce5RuesuvshjDtFd40a/Fwp5DbIF8Se3bwHjR3eZ8Hwr
 NePg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jY24g1DO
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien

On 18/07/2026 13:54, Julien Olivain wrote:
>Hi Flaviu,
>
>Thanks for the update.
>
>On 17/07/2026 08:19, Flaviu Nistor wrote:
>> Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
>> on the project homepage, hence the bump to 0.7.2.
>> Add also PYTHON_SNAPPY_SOURCE for correct package on Pypi.
>> 
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> ---
>> Changes in v2:
>> - Fix error indicated by Julien Olivain when running make 
>> python-snappy-legal-info.
>> - Link to v1: 
>> https://lore.kernel.org/all/20260409152520.5894-1-flaviu.nistor@gmail.com/
>> 
>>  package/python-snappy/python-snappy.hash | 4 ++--
>>  package/python-snappy/python-snappy.mk   | 5 +++--
>>  2 files changed, 5 insertions(+), 4 deletions(-)
>> 
>[...]
>> diff --git a/package/python-snappy/python-snappy.mk 
>> b/package/python-snappy/python-snappy.mk
>> index e80aa861df..b1bd8ca6ca 100644
>> --- a/package/python-snappy/python-snappy.mk
>> +++ b/package/python-snappy/python-snappy.mk
>> @@ -4,8 +4,9 @@
>>  #
>>  
>> ################################################################################
>> 
>> -PYTHON_SNAPPY_VERSION = 0.6.1
>> -PYTHON_SNAPPY_SITE = 
>> https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
>> +PYTHON_SNAPPY_VERSION = 0.7.2
>
>When building with the commands:
>
>cat >.config <<EOF
>BR2_aarch64=y
>BR2_TOOLCHAIN_EXTERNAL=y
>BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>BR2_PACKAGE_PYTHON3=y
>BR2_PACKAGE_PYTHON_SNAPPY=y
>EOF
>make olddefconfig
>make python-snappy
>
>The build fails with the error:
>
>ERROR Missing dependencies:
>         cramjam>=2.6.0
>
>It seems python-snappy was updated to switch from the snappy library
>to cramjam, since v0.7.0:
>https://github.com/intake/python-snappy/commit/277fb4a4b7e16b771f1ed1addde33feebd96c979
>
>Cramjam is currently not included in Buildroot. So, I believe you will
>need to add it, and update this python-snappy bump to reflect that
>library change.
>
>I also suggest you write a Buildroot runtime test to make sure
>everything works. For the test, you can use the simple sequence
>such as:
>https://github.com/intake/python-snappy/blob/0.7.2/README.rst?plain=1#L50-L51
>
>Could you send an updated patch series addressing those issues,
>please?

First of all thanks a lot for the great support in guiding me and patience.
For sure I will send a new patch series addressing the isseu, as soon as I have
some time available. 
On my side, running the commands you provided fails even at installing
toolchain-external-bootlin (2025.08-1), where look like a link can't be created.
I'll have to make this work also on my side.

>> +PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
>> +PYTHON_SNAPPY_SITE = 
>> https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
>>  PYTHON_SNAPPY_SETUP_TYPE = setuptools
>>  PYTHON_SNAPPY_LICENSE = BSD-3-Clause
>>  PYTHON_SNAPPY_LICENSE_FILES = LICENSE
>> --
>> 2.34.1
>
>Best regards,
>
>Julien.

Best Regards,
Flaviu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
