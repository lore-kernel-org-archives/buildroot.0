Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4CDC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 07:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94FF040256;
	Mon, 22 Jul 2024 07:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_u8mEn9PPaA; Mon, 22 Jul 2024 07:58:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29C4A4027E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29C4A4027E;
	Mon, 22 Jul 2024 07:58:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 082391BF294
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 07:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA62A60073
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 07:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tqKqvcrI8CB for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 07:58:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 440836067A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 440836067A
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 440836067A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 07:58:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-36865a516f1so2726230f8f.0
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 00:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721635091; x=1722239891;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9Pe//CdasQjbK5fkkXfLfeOqiAna7JdXaUcsxy5u64=;
 b=aBqwOPUydyxakuNgcccAWf1Pobo7pzx732MSNgmJAJ3RxSFghu/SWZ8m/kDFdJVNiX
 Qdby0NRHlwC4lkWdp229HQY38DMhgp+ZMUsMoCXavLo8RekcgDsANQVDCJqHhOfN5ZIa
 1qjy+U98+As0u7qKdFBjYuCx8J2v73o6KO5vXbHENMCv54zAxUIzLD/QnJdhg2oXehlU
 SFmq3s4hkLVCgg+sjC5jaEZ3qYT472IsyZzDcKOZJjOAHR0eK3kvxGQzmowVrFoXzzqz
 Eyx6HL9TGjRROH3YD0h4sV00m4hg3TTFefzURvEPf2nd3J5vMBAof9dl/nvbetpRUnbo
 Nbag==
X-Gm-Message-State: AOJu0YyCtW+xuU8PaeUyZ8xzcdnvU/060Y6gLp7KKAKiEBt4eU7yZzp/
 oVQcU7pHOQuJc2CfP+DxKH6B02C8X81vV8OXSYyWGMbrHLTsL/slj7BWNog4FmpgVopHVR+0P9S
 o
X-Google-Smtp-Source: AGHT+IHPvakHyfQrIu76ec3CFXiLl36dovw0eouJmMhCqKb7M/4RRAuaBgZK2X4ZCNCW82nnc2eLdg==
X-Received: by 2002:a5d:420c:0:b0:368:3384:e9da with SMTP id
 ffacd0b85a97d-369bb2d6208mr3765581f8f.62.1721635091545; 
 Mon, 22 Jul 2024 00:58:11 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687868b24csm7735728f8f.25.2024.07.22.00.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 00:58:11 -0700 (PDT)
Message-ID: <53a5f1f2-515b-41a0-97e8-64ada35a8d17@mind.be>
Date: Mon, 22 Jul 2024 09:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Frank Wunderlich <frank-w@public-files.de>
References: <trinity-5c5ad72e-281b-4354-bf44-2eae6f8ae579-1721478860307@3c-app-gmx-bs02>
 <trinity-6ec563fa-da3b-425d-9184-a34393e6d9b5-1721504982908@3c-app-gmx-bs02>
Content-Language: en-GB
In-Reply-To: <trinity-6ec563fa-da3b-425d-9184-a34393e6d9b5-1721504982908@3c-app-gmx-bs02>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721635091; x=1722239891; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s9Pe//CdasQjbK5fkkXfLfeOqiAna7JdXaUcsxy5u64=;
 b=VTwG0g3zm4ncoS+fjOiJfXsaY8RDDsC/YtqaDfSrflxSsa7iW11kPysgoKRvvg8sZu
 HMLS4RUzx8nedMH09kw720F1csA1R8CmdcSjbb+4fZ/rrL81gLIjOAsvmkADx87tgj7e
 00Ztqzw6rwxegEItcAtlhN8Nc0sepe2u7VAjCWPkVt+mbmxUyCYrgi+OqvZtl6aohZZl
 0x8NFWfCHhcNUtn8E/pogJC3OmrqD+BTeWZxebqT+DUMyvryVENS1SbQf7VbH2ZxVqAa
 HeThOE3gRcfgORfXBwAOwoAUaeaKUP49Do0DaQS/I12BEmzbEif+1TNLw2WJOYGK7FLe
 H25w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VTwG0g3z
Subject: Re: [Buildroot] lvm2 seems to require systemd
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Frank,

On 20/07/2024 21:49, Frank Wunderlich via buildroot wrote:
> Hi
> 
> in the meantime i tried to add systemd (which i want to avoid due to size and complexity)
> 
> BR2_PACKAGE_SYSTEMD=y
> BR2_INIT_SYSTEMD=y
> 
> but hang on this:
> 
> Found CMake: /media/data_ext/git/buildroot/output/per-package/systemd/host/bin/cmake (3.28.3)
> Run-time dependency libbpf found: NO (tried pkgconfig and cmake)
> Run-time dependency mount found: NO (tried pkgconfig and cmake)
> 
> output/build/systemd-254.13/meson.build:1188:11: ERROR: Dependency "mount" not found, tried pkgconfig and cmake

  This smells like you changed the config and didn't do a clean rebuild. systemd 
selects some sub-options of util-linux, and in your first build, those weren't 
enabled. You can probably fix it with 'make util-linux-dirclean; make'. But just 
to be safe, 'make clean; make' is better.


> tried installing libmount-dev pkgconf-bin libbpf-dev on my building-machine without success
> 
> also tried without BR2_INIT_SYSTEMD, which compiles good, but the error below is on running bootup (before login)
> so i guess i need systemd as init, but maybe i'm wrong
> 
> regards Frank
> 
> 
>> Gesendet: Samstag, 20. Juli 2024 um 14:34 Uhr
>> Von: "Frank Wunderlich" <frank-w@public-files.de>
>> An: buildroot@buildroot.org
>> Betreff: lvm2 seems to require systemd
>>
>> Hi,
>>
>> i try to build a buildroot (2024.05) initrd with lvm2 support
>>
>> so basicly added these options:
>>
>> #to select BR2_PACKAGE_HAS_UDEV
>> BR2_PACKAGE_EUDEV=y
>> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>> BR2_PACKAGE_LIBBLOCKDEV=y
>> BR2_PACKAGE_LVM2=y
>>
>> build is fine, but i see this while bootup:
>>
>> [    3.665010] udevd[1520]: failed to execute '/usr/bin/systemd-run' '/usr/bin/systemd-run --no-block --property DefaultDependencies=
>> no --unit lvm-activate-vg-nvme /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme': No such file or directory

  I guess the udev rule for lvm2 is systemd-specific... You will have to either 
re-write the udev rule, or write an init script, to do the equivalent if systemd 
is not enabled. Look in the lvm-activate-vg-nvme systemd unit and rewrite that 
logic in a shell script.

  You can add these udev rules and scripts to the lvm2 package and install them 
with the LVM2_INSTALL_INIT_SYSV variable [1].

  Regards,
  Arnout

[1] https://buildroot.org/downloads/manual/manual.html#generic-package-reference



>> done
>>
>> i see the physical volume, but logical volumes are disabled
>>
>> # pvscan
>>    PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
>>    Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
>> # vgscan
>>    Found volume group "vg-nvme" using metadata type lvm2
>> # lvscan
>>    inactive          '/dev/vg-nvme/var' [10.00 GiB] inherit
>>
>> and so i cannot mount the logical volume
>>
>> # mount /dev/vg-nvme/var /mnt
>> [  281.006375] /dev/vg-nvme/var: Can't lookup blockdev
>> [  281.011279] /dev/vg-nvme/var: Can't lookup blockdev
>> [  281.016202] /dev/vg-nvme/var: Can't lookup blockdev
>> [  281.021080] /dev/vg-nvme/var: Can't lookup blockdev
>> mount: mounting /dev/vg-nvme/var on /mnt failed: No such file or directory
>>
>> any ideas?
>>
>> regards Frank
>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
