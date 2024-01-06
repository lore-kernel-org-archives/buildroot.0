Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E682CC47077
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 03:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6726F84392;
	Sat,  6 Jan 2024 03:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6726F84392
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nh_NG0V-5rCo; Sat,  6 Jan 2024 03:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99A8E8439B;
	Sat,  6 Jan 2024 03:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99A8E8439B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9AAA1BF589
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 03:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B491A60A81
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 03:52:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B491A60A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jBDU-ffx7JmW for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 03:52:02 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5219960A69
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 03:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5219960A69
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7ba903342c2so14275239f.3
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 19:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704513121; x=1705117921;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=enno4RDG7Jc2tI8Uw9IJMPfOQP8dq6cok+ed1FX+/z8=;
 b=X0IBpTWlD4YNZktx4a5wMysq2QJ7+o+7JSOXP+AWbxIte7WC/g9myVFFq06yGxKvGs
 5i8vx2baiAB5yeUBgMu2l3qaIs2C0CKrJijLMM7Ew9KMAOoDD1eUQxiea1RmmM5DZj7B
 zeAb8EywqNprm1RlW2cyCvbbm7LjSu6vlaYvH5A2nDy4ql9Do9vnnKTOibdCbZYr1IMQ
 +JPAoSjeGwYJLE8NHQfSuDDbzedvIp8Kqg4fCQwHr2ta2axSyv/oA0G0H2LRHNFv5P4S
 A9jTzizHPHNxTVO0LqXA6qL4tDPxudOJt8rU+8Vdmalk7lWDF412KAUiXiIZ7qfA7e2M
 6AeA==
X-Gm-Message-State: AOJu0YycjzrzEuxf+bx5gjpxylySNO8tdEG9o7goVZwuLxG1GU3zb8s3
 QYzo7Tyc7pK5AQ1DWDD3oi39GfSoYxyeEQ==
X-Google-Smtp-Source: AGHT+IGTddaSjZgOGB35qmivrEEVWMRiyLxFuiI9YqBmA2e7RS9koXVG6vidS0Xx6CzgCLA+n146Kw==
X-Received: by 2002:a5d:8059:0:b0:7b4:28f8:519 with SMTP id
 b25-20020a5d8059000000b007b428f80519mr667420ior.25.1704513121061; 
 Fri, 05 Jan 2024 19:52:01 -0800 (PST)
Received: from [172.16.32.83] ([198.232.126.202])
 by smtp.gmail.com with ESMTPSA id
 ck15-20020a0566383f0f00b004665f85c6d7sm823366jab.4.2024.01.05.19.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 19:52:00 -0800 (PST)
Message-ID: <90c1ddc1-c608-30fc-d5aa-fdf63c90d055@landley.net>
Date: Fri, 5 Jan 2024 21:58:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
 <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki> <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
 <20240105131135.GA1484621@pevik>
From: Rob Landley <rob@landley.net>
In-Reply-To: <20240105131135.GA1484621@pevik>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20230601.gappssmtp.com; s=20230601; t=1704513121; x=1705117921;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=enno4RDG7Jc2tI8Uw9IJMPfOQP8dq6cok+ed1FX+/z8=;
 b=UacLekBgnouBRrJALLFSq8+io28cbI4SDUn6z+5u6zbVOoAcC1WygpSUzSLwK35pvv
 IAgTZ1stJUHqKy1GHwug4iYsBRguqFDS/hdZNrgVg1DXGEE0x2zuT2q0xmgVJI9pc2KS
 ETcIxI3k95UBCqKf0GHdr0rWMdCdZVxC6KswyatJuwQFM8G4JQIfOb+nDbEimEyi1+3W
 xmBZiFYZkHVs+mZtQCKVaPmwbZsVZZP5f6Ks7s6nm3kPtSL+aoHPR/sjjCC1yhIGfR3Z
 BpEYv9hH9o/22U0gZnVDc2wMDyV9KfFNRNwl0fTEJ85vPcxGAi4tGsNaVDIwVLqHMrTb
 EerQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=landley-net.20230601.gappssmtp.com
 header.i=@landley-net.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=UacLekBg
Subject: Re: [Buildroot] Call for nommu LTP maintainer [was: Re: [PATCH
 00/36] Remove UCLINUX from LTP]
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
Cc: Andrea Cervesato <andrea.cervesato@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linux-sh list <linux-sh@vger.kernel.org>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Li Wang <liwang@redhat.com>, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Cyril Hrubis <chrubis@suse.cz>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, buildroot@buildroot.org,
 Greg Ungerer <gerg@linux-m68k.org>, ltp@lists.linux.it,
 automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/5/24 07:11, Petr Vorel wrote:
>> Nobody is maintaining "uclinux" because that was a distro, but you can build
>> nommu support in buildroot and such, and people do.
> 
> Right, there are nommu users. Will anybody join LTP development to maintain
> nommu support in LTP? The needed work is to add this support to LTP new C API
> [1] and use it in the relevant test. There is some implementation in the old
> API, I have no idea how well it worked.
> 
> If nobody stands for maintaing nommu, we will have to delete it. There is nobody
> from the current maintainers who is using LTP on nommu HW (that is the reason why
> nommu support have not been implemented in the new API).

I'm interested, but overwhelmed. Not sure I've got the spoons to come up to
speed on a new project and give it regular attention just now.

I see you cc'd buildroot (although the message might not go through if you
aren't subscribed, dunno how clogged their moderation queue is these days, and
the cc: list is long enough it might twig anyway). They had a nommu fix go in
earlier this week (commit 98684ba7885b).

That said, qemu supports several nommu platforms and buildroot has defconfigs to
build systems for them:

$ git clone git://buildroot.org/buildroot
$ make help
$ make list-defconfigs | grep qemu
$ make qemu_ppc_bamboo_defconfig
$ make
  (time passes...)
>>> host-gettext-tiny 0.3.2 Extracting
gzip -d -c
/home/landley/buildroot/buildroot/dl/gettext-tiny/gettext-tiny-0.3.2.tar.gz |
tar --strip-components=1 -C
/home/landley/buildroot/buildroot/output/build/host-gettext-tiny-0.3.2   -xf -
mkdir -p
/home/landley/buildroot/buildroot/output/build/host-gettext-tiny-0.3.2/gettext-gnu
xzcat /home/landley/buildroot/buildroot/dl/gettext-tiny/gettext-0.22.4.tar.xz |
tar --strip-components=1 -C
/home/landley/buildroot/buildroot/output/build/host-gettext-tiny-0.3.2/gettext-gnu
 -xf -
xzcat: /home/landley/buildroot/buildroot/dl/gettext-tiny/gettext-0.22.4.tar.xz:
No such file or directory
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
make: *** [package/pkg-generic.mk:209:
/home/landley/buildroot/buildroot/output/build/host-gettext-tiny-0.3.2/.stamp_extracted]
Error 2


Sigh, never build git pull du jour of anything, buildroot's having glitch du
jour. But the point is:

$ grep -rl bamboo board/
board/qemu/ppc-bamboo/readme.txt
$ cat board/qemu/ppc-bamboo/readme.txt
Run the emulation with:

qemu-system-ppc -nographic -M bamboo -kernel output/images/vmlinux -net
nic,model=virtio-net-pci -net user # qemu_ppc_bamboo_defconfig

The login prompt will appear in the terminal that started Qemu
-------------------

In THEORY, once it builds an image (presumably using a tagged release version
rather than expecting "continuous integration" to ever mean anything) you should
be able to launch it with qemu. Assuming the instructions aren't also
bit-rotted. (Or using one of the other nommu boards, I haven't gone through the
whole list to see what they've got. I used to use a nommu arm board, but the
linux kernel broke it when converting everything to device tree and not
regression testing it.)

Buildroot also apparently has an LTP package selectable in menuconfig:

https://github.com/buildroot/buildroot/tree/master/package/ltp-testsuite

But I haven't tried it...

Rob

P.S. I automate qemu testing all the time over in toybox, see testroot.sh under
https://github.com/landley/toybox/tree/master/mkroot for an example.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
