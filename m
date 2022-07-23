Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D508C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 21:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C24E416BB;
	Sat, 23 Jul 2022 21:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C24E416BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SK8FyWiLKk4i; Sat, 23 Jul 2022 21:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1818416A6;
	Sat, 23 Jul 2022 21:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1818416A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE88B1BF419
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8833461B15
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 21:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8833461B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nC4r6wpj6Xe1 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 21:21:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 315E261B1E
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 315E261B1E
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 21:21:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 r188-20020a1c44c5000000b003a34ac64bdfso192755wma.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+NhyQzh6yLL15A2xPbO3QNn+7Mavkv7p4cWpWQfT1JY=;
 b=xvwYn6C4Ri96V8ORdB8Vvlaq7yGVwwrLorKXJu3f98GxucDvshSni5Pzu65EnqZRfu
 KfG8eHqK+eh30Feah0F2P95trPQ0cVSgGqxExp/wk75J4oDIITX7N68RjzkCBry14U1z
 FNC74qwV4TYx5bJ3zmI9sMdfmC5+XE7wesjGnRGNZDdxbVS8ZaaQ00ZAPU52hTtoX/7W
 EHb/BDP3n9Gjq6ZJVWi2GF22jv6Dj8CE9V04hV3V9vSWD1RgA/grVJCWXVb7sGCWB9Jo
 daWHKNGlOXBiRKOhmv9YEHxvYtzFkXlKvP7PmJMns8pej8zLFUQ3RTWPphfZiHIL6Q3F
 1OKw==
X-Gm-Message-State: AJIora/nhEFFCb6cnBatQS87ISqWnwt3SM5U1fH/q1SITA+0jP0Sehqs
 Ish7m4oP5FnkntCxB/Y6DXV1NA==
X-Google-Smtp-Source: AGRyM1uFYTS3xkKhZQ6Rz1psbrOP2SfqVCnK1WyU0do9ab5QjIy96Tjm9GkhUrqSAOMygh35mSbFWw==
X-Received: by 2002:a05:600c:21d7:b0:3a3:2088:bbc6 with SMTP id
 x23-20020a05600c21d700b003a32088bbc6mr16304024wmj.68.1658611286152; 
 Sat, 23 Jul 2022 14:21:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 b18-20020adff912000000b0021d65675583sm7727937wrr.52.2022.07.23.14.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 14:21:25 -0700 (PDT)
Message-ID: <54f4c154-910c-66b9-1c6a-173997565863@mind.be>
Date: Sat, 23 Jul 2022 23:21:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: James Knight <james.d.knight@live.com>,
 Romain Naour <romain.naour@smile.fr>
References: <BYAPR06MB4805F290E2B4224008BC23EAA08D9@BYAPR06MB4805.namprd06.prod.outlook.com>
 <b7b3bb6f-af5d-1987-0bf0-4da328e1bc77@smile.fr>
 <CALAjcgW56=jP5-h048PwsGezdYhFTPcDhH+uPLbUbp0vrhkn=g@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CALAjcgW56=jP5-h048PwsGezdYhFTPcDhH+uPLbUbp0vrhkn=g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+NhyQzh6yLL15A2xPbO3QNn+7Mavkv7p4cWpWQfT1JY=;
 b=CyOv3W7BalZt/oNxdlstdFq8xEhGlg0OK6xvA2b3hh7JxdFblFNZis1fVHAS7GDdgK
 xfwYs53usv7sy6vs7RFunDKQ23OZzyRa/Nna7Mr8inJvcu2xpDn97R7AvPUSjBZyDbnE
 42TYQfEbvvu4w0ueUMwf0WwPxAsI+S4qCzttpYrFM77JsWFZcnoqNda3pTqy3j0HLL6c
 mUGPkjrJHDvvI81SSgp/Dy6BtYXSZtGGbc5LTz87kD9qKMQ5R5BY6YNVmc/yoSJ6YYHB
 ZCNe+3/F+RKptkIFVDnUYVghRi6dR3qVoEGJc3OppWlW9eQGW5FOS538TWunRZmVlP55
 i3UA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CyOv3W7B
Subject: Re: [Buildroot] [PATCH 1/1] board/qemu/post-image.sh: flexible qemu
 launch options
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

On 23/07/2022 22:48, James Knight wrote:
> Romain,
> 
> On Sat, Jul 23, 2022 at 12:33 PM Romain Naour <romain.naour@smile.fr> wrote:
>>
>> The start-qemu.sh script is actually used by the Buildroot gitlab-ci to test do
>> a runtime test (boot test) for all Qemu defconfigs.
> 
> My reasons for presenting changes to this script was under the
> assumption that this was a generic helper for QEMU-supported images.
> Trying to play around with Buildroot again (it has been awhile), I
> just selected the `qemu_x86_defconfig` configuration as an easy way to
> get things started. I noticed the `start-qemu.sh` script in the
> `output/images/` folder and thought "This is a nice script to help me
> test my images with".
> 
> If the intent is to only use this script for CI-related work, that's
> fine by me -- and we can drop the patch if desired.
> 
>> So only this qemu command line command line is supposed to work out of the box.
>> If you let the used customize the qemu command line, it can raise some issue.
> 
> I can agree, injection custom options will void the warranty. The main
> reason for introducing these changes was to test a QEMU tweaked
> configuration which utilized some display-related changes which
> sometimes required additional modifications. For example, providing an
> environment with more memory (e.g. `-m 1G`) or customizing the
> graphics driver (e.g. `-vga virtio`). I would apply modifications,
> test things which may require a rebuild on a kernel/component, which
> would replace the script and I would have to modify it again.
> 
>> I would throw a warning if $@ is not empty, just to warn the user.
> 
> This would be fine for me (to help promote the idea that extra
> arguments are not officially supported).
> 
>> Naming stuff is hard, here we want an option to use Qemu installed on the host system, not from host-qemu (--host may be misleading).
>> ...
>> Using Qemu installed on the host may be really old and not able to boot the system.
> 
> I can agree that this may be the case for some distributions, but I
> find some distributions (like Arch) provide a fast turnaround time for
> newer versions. The only intention of providing a way to use a
> system's version (if available) was to maybe utilize some options that
> may have not been enabled on the host-qemu package. For example, I was
> trying to utilize the `-display gtk` option that was available on the
> host, but not supported with the built host-qemu package. Having the
> option may also provide flexibility if the system's QEMU is a newer
> version then that of Buildroots (i.e. when dealing with older tags/LTS
> builds).
> 
> We could tweak the argument to something like `--use-system-qemu`, to
> be a bit more explicit. And also, generating the same type of warnings
> that using such options is officially unsupported and for advanced
> testing.

  Those sound like good ideas, would you like to respin the patch to include them?

  It would also be nice to split it in two: first one that just does refactoring 
of how arguments are parsed, and second one that adds the --use-system-qemu option.

  Also, it would perhaps be nice to move the script into a separate file instead 
of cat-ing it from the post-build script. You can use sed to replace the 
variables (just QEMU_CMD_LINE I think) from start-qemu.sh.in to the final 
start-qemu script. This would be a patch that comes before the two others.

  Regards,
  Arnout

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
