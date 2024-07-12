Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A1CC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3A6846CE;
	Fri, 12 Jul 2024 19:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTqyf-xxJPvv; Fri, 12 Jul 2024 19:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07E4584698
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07E4584698;
	Fri, 12 Jul 2024 19:21:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB4FF1BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A825F400FF
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3t-BMNrshji for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:21:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 913BF4000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 913BF4000B
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 913BF4000B
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:21:19 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3679f806223so2065042f8f.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720812077; x=1721416877;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zw7rwq0JQoSp62+ohy+gPiqQEhs0HUM5qtmMMxr4Ih8=;
 b=JMw2pvjC/PebWm6J2aNsQ7AuaFWTjQkTB2yAQB6rfwpDkWt9nxvD+59LCnCQHeZnQE
 UzO8c95S2qjZ9LBBwFCJj9TtRGtu9GpX90d9WpEw92vfr+l2WNw3QAzHwnbn/YCGBBng
 NwmRt0oQ0nIJO9Nol0H8XSG/dqZOAGgAIV+p8gmRhmNx6/rxZg5FHMmjPhYvslSCMn3k
 wizpS7gUHLFU0iXwbVXgYuS1Qd2yxK512IgP0wtyrQ87Jl7gMVvFalna/Ap9J3plACNm
 C9KEBQ+kllbZi8lOqIxeRiYFO69S2QVSYzBwVpEnJdmylzR+Z6NQqlcY/KkfxNVMcbvs
 5Grg==
X-Gm-Message-State: AOJu0Yx31BHeIYQtmUH2PEO4YdExAn5B+gm67msWYt+7RW3mffy4fkDE
 bZy0L2GgXjShb+JKRyz6+f4FIDuYnWn3FCl98bb0Vq088LWteRRQKHiDe7uVTOk=
X-Google-Smtp-Source: AGHT+IGy6I6psT8veoJO4Ik3KscKPDcf18hOZonOk6YJ/MdBZS7msBBo6nTby7N3KakET5aJdV/yeA==
X-Received: by 2002:a5d:4fce:0:b0:360:8c88:ab82 with SMTP id
 ffacd0b85a97d-36804fda7a5mr2111397f8f.30.1720812077502; 
 Fri, 12 Jul 2024 12:21:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde846b9sm10812739f8f.29.2024.07.12.12.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:21:17 -0700 (PDT)
Message-ID: <96c4bf27-26a3-41aa-a7e2-3eeef8c9cfc1@mind.be>
Date: Fri, 12 Jul 2024 21:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>
References: <20240704123452.3535612-1-heiko.thiery@gmail.com>
 <20240704123452.3535612-2-heiko.thiery@gmail.com>
 <911573ac-f0bf-4ceb-99b0-5d24dd1937bd@mind.be>
 <CAEyMn7anNnq2aH9EViFjY+ihnmwCXaWXMs9sJAYFBpH=q_WT+Q@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAEyMn7anNnq2aH9EViFjY+ihnmwCXaWXMs9sJAYFBpH=q_WT+Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720812077; x=1721416877; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zw7rwq0JQoSp62+ohy+gPiqQEhs0HUM5qtmMMxr4Ih8=;
 b=V5xzbICrhIk6h5MTVTtOawwtp01h3RQusbxOstHeWfWxX5RZwOjNb6ZVSJcElqMiCK
 1VWZ3QWnfw3ojAssPhsKY/W/doHzKGa6gbq/0K4whSGrq1b8xq/9CEwebuXeglbyqtX+
 ON31qanpsyFX5DGG6G+QXwaa3jTyjIPR+QnoSNMDkFxO6tc/6sSCt7HBtoZSbsoOVwZb
 m0pVJu1QkXafaATac8WvR/sPlGQ9DMSZCXvpiTk3OCbTMaR5yp0+jxu4HbnU7tKAuc1r
 Kti5EjkMqApmkrpA3Ih4InCK8LgDyuUny7vxQFBSx5sRxjwqMdXVOUl5hk0XoQmoTqAJ
 sJcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=V5xzbICr
Subject: Re: [Buildroot] [PATCH v3 1/3] package/blake3: add new host package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/07/2024 21:08, Heiko Thiery wrote:
> Hi Arnout,
> 
> Am Fr., 12. Juli 2024 um 10:38 Uhr schrieb Arnout Vandecappelle
> <arnout@mind.be>:
>>
>>    Hi Heiko,
>>
>> On 04/07/2024 14:34, Heiko Thiery wrote:
[snip]

>>> +HOST_BLAKE3_CONF_OPTS += \
>>> +     -DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
>>
>>    Why is this needed? And is it even a good idea? In pkg-cmake, this is defined
>> as -DCMAKE_ASM_COMPILER="$$(HOSTAS)", and HOSTAS is simply "as" without any
>> ccache. In fact, this changes it from "as" to "gcc" which I expect is not
>> correct at all...
> 
> When not defining that I got the errror:
> 
> [ 25%] Building C object CMakeFiles/blake3.dir/blake3_portable.c.o
> [ 37%] Building ASM object CMakeFiles/blake3.dir/blake3_avx2_x86-64_unix.S.o
> [ 50%] Building C object CMakeFiles/blake3.dir/blake3_dispatch.c.o
> Assembler messages:
> Fatal error: bad defsym; format is --defsym name=value
> make[3]: *** [CMakeFiles/blake3.dir/build.make:117:
> CMakeFiles/blake3.dir/blake3_avx2_x86-64_unix.S.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> [ 62%] Building ASM object CMakeFiles/blake3.dir/blake3_avx512_x86-64_unix.S.o
> Assembler messages:
> Fatal error: bad defsym; format is --defsym name=value
> make[3]: *** [CMakeFiles/blake3.dir/build.make:130:
> CMakeFiles/blake3.dir/blake3_avx512_x86-64_unix.S.o] Error 1
> make[3]: Leaving directory
> '/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
> make[2]: *** [CMakeFiles/Makefile2:83: CMakeFiles/blake3.dir/all] Error 2
> make[2]: Leaving directory
> '/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
> make[1]: *** [Makefile:136: all] Error 2
> make[1]: Leaving directory
> '/home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/c'
> make: *** [package/pkg-generic.mk:283:
> /home/hthiery/sources/mainline/buildroot/output/build/host-blake3-1.5.1/.stamp_built]
> Error 2
> 
> So when changing to use gcc instead of as it works.
> 
> I tried to build on my host and see that cmake sets the var
> "CMAKE_ASM_COMPILER=/usr/bin/cc". When overwriting it with as it also
> does not build.

  Hah, indeed, our setting of CMAKE_ASM_COMPILER is incorrect in pkg-cmake.mk. 
That's why it also had to be overridden in llvm.mk. Also, we don't have such a 
definition for the target, which makes me think that by default it just uses 
CMAKE_C_COMPILER (which is exactly what we want here).

  Could you try to remove the definition from pkg-cmake.mk and see if that 
works? And then also remove it in llvm.mk. In separate patches, of course.

  Regards,
  Arnout


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
