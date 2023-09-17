Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F584CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 20:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 758D14048E;
	Sun, 17 Sep 2023 20:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 758D14048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2l4lbmdOEdZo; Sun, 17 Sep 2023 20:21:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 461A54056A;
	Sun, 17 Sep 2023 20:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 461A54056A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70BA51BF399
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4909F81A81
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4909F81A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hpiKLuPLCcnA for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 20:21:03 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A983281A3B
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 20:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A983281A3B
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99bdcade7fbso483889066b.1
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 13:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694982060; x=1695586860;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jspJNJspGurSmzy0r2ZU/FK2S/HIg06+cCCwovEyKKQ=;
 b=pE9i+2N0cR1GSJ+zFomrzu40zFlmY2mveba8QzO5TK46Q1s0uqKMpRITW3GHdl+dN+
 Kn/VW988tpD5gUORUqH+TCR24gH6rjIu2+52EYjjOIrQQ4bnOMGQ5MVcYUPOEJFhDtqO
 oLmWX/bLf3kYGnWC4uf+kiH7wkubIRYXPjM1/Vo9LOTuxPNDGpoTzdY12DfNibsZ3EX0
 sgo/DJm1ET6r15l9XCnNehRPrdRFzbEYhUK1upAY1GF9I+z9WnN7mJOugDYzDSSe8nK2
 7KpLIB1UIt+Z5viUPadfNsX8SO+NbW+d1hdzLeQPaq1oOjXCX3ODRkaM0yfaf9GsoFfJ
 /K+g==
X-Gm-Message-State: AOJu0Yy2Ef4kOjJU34AVgjE+L7a5n3VTN8d0LA1oFIKdW02gEIQwFCIt
 5g3OBfqdaGlvePqtAdgY+mDwGQ==
X-Google-Smtp-Source: AGHT+IEzs4xNPyWnwmxoznlv0/ZpeOAUc9Rk4eMxO09lf9IpYIOI68Yy9rjpFAaDmjVkQviNflQl3g==
X-Received: by 2002:a17:907:775a:b0:9a9:f14a:22dc with SMTP id
 kx26-20020a170907775a00b009a9f14a22dcmr6287616ejc.8.1694982060680; 
 Sun, 17 Sep 2023 13:21:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a1709064f0200b0099bcf1c07c6sm5400013eju.138.2023.09.17.13.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Sep 2023 13:20:59 -0700 (PDT)
Message-ID: <78c7e70e-b0c8-728f-18e7-b35b0cb71e52@mind.be>
Date: Sun, 17 Sep 2023 22:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20230917171244.139679-1-ju.o@free.fr>
In-Reply-To: <20230917171244.139679-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1694982060; x=1695586860; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jspJNJspGurSmzy0r2ZU/FK2S/HIg06+cCCwovEyKKQ=;
 b=H6JFCk8QswIp5eUhrizFzkW7lcWAu39xPkjjQFUht7D7QV51aJfvsNoA36nphs7nJ0
 ksnm3T0EIQvJo/Ff2HQadPwcMEcF+CgizWQp4pLlKyb1qqGTvf2rMj0ty6Ep8w/tLMxh
 MYJoWSO2Y24fmLu6ZF0txG9URjZGJt+AE1WLuXcGnegXs0v4a9yP6Bg188sFQubuvmpU
 UgDPyFUS8cRPp3hk6fmKEGrsrC46b3cxKVFABsSjYOpWK02aXnZ6qu2Aq/5WCoJA7Skh
 E6JncIzxtWRGXIDsDod64e9hGUeUax4rsiuRebNCMMYkd4VpoRicWwcHLucHuOxrJDi2
 ae6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H6JFCk8Q
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_tcl.py: new runtime test
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/09/2023 19:12, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks, with one little change...


> ---
> Patch tested on branch master at commit 7af8dee with commands:
> 
>      make check-package
>      ...
>      0 warnings generated
> 
>      support/testing/run-tests \
>          -d dl -o output_folder \
>          tests.package.test_tcl
>      ...
>      OK
> 
> Note: for the record, writing this test caught the issue fixed in
> commit 7af8dee "package/tcl: add mandatory dependency to zlib". It also
> identifed a toolchain issue with the proposed fix:
> https://patchwork.ozlabs.org/project/buildroot/patch/20230917152303.1300577-1-yann.morin.1998@free.fr/
> ---
>   DEVELOPERS                                    |  2 +
>   support/testing/tests/package/test_tcl.py     | 52 +++++++++++++++++++
>   .../rootfs-overlay/root/factorial.tcl         | 11 ++++
>   3 files changed, 65 insertions(+)
>   create mode 100644 support/testing/tests/package/test_tcl.py
>   create mode 100755 support/testing/tests/package/test_tcl/rootfs-overlay/root/factorial.tcl
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7fae4841e4..e8b78a8d46 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1772,6 +1772,8 @@ F:	support/testing/tests/package/test_rdma_core.py
>   F:	support/testing/tests/package/test_rdma_core/
>   F:	support/testing/tests/package/test_screen.py
>   F:	support/testing/tests/package/test_stress_ng.py
> +F:	support/testing/tests/package/test_tcl.py
> +F:	support/testing/tests/package/test_tcl/
>   F:	support/testing/tests/package/test_weston.py
>   F:	support/testing/tests/package/test_weston/
>   F:	support/testing/tests/package/test_xz.py
> diff --git a/support/testing/tests/package/test_tcl.py b/support/testing/tests/package/test_tcl.py
> new file mode 100644
> index 0000000000..5986ebff01
> --- /dev/null
> +++ b/support/testing/tests/package/test_tcl.py
> @@ -0,0 +1,52 @@
> +import math
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestTcl(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_TCL=y
> +        # BR2_PACKAGE_TCL_SHLIB_ONLY is not set
> +        BR2_ROOTFS_OVERLAY="{}"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """.format(
> +            infra.filepath("tests/package/test_tcl/rootfs-overlay")
> +        )

  I admit that this is the pattern we have pretty much everywhere right now in 
the tests, but we started using f-strings a while ago, and it looks much cleaner 
like that. So I changed this into an f-string.

  Regards,
  Arnout

> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # Print tcl the interpreter version and patchlevel.
> +        tcl_cmds = "puts \"tcl_version: $tcl_version\";"
> +        tcl_cmds += "puts \"patchlevel: [info patchlevel]\";"
> +        tcl_cmds += "exit 0"
> +        cmd = f"echo '{tcl_cmds}' | tclsh"
> +        self.assertRunOk(cmd)
> +
> +        # We check tclsh correctly print a string.
> +        txt = "Hello Buildroot"
> +        cmd = f"echo 'puts \"{txt}\"; exit 0' | tclsh"
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], txt)
> +
> +        # We check tclsh can return a non-zero exit code.
> +        expected_code = 123
> +        cmd = f"echo 'exit {expected_code}' | tclsh"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, expected_code)
> +
> +        # We check a tcl program computing factorial run correctly.
> +        input_value = 12
> +        expected_output = str(math.factorial(input_value))
> +        cmd = f"/root/factorial.tcl {input_value}"
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], expected_output)
> diff --git a/support/testing/tests/package/test_tcl/rootfs-overlay/root/factorial.tcl b/support/testing/tests/package/test_tcl/rootfs-overlay/root/factorial.tcl
> new file mode 100755
> index 0000000000..0398f24ceb
> --- /dev/null
> +++ b/support/testing/tests/package/test_tcl/rootfs-overlay/root/factorial.tcl
> @@ -0,0 +1,11 @@
> +#! /usr/bin/env tclsh
> +
> +proc factorial {n} {
> +   set f 1
> +   for {set i 1} {$i <= $n} {incr i} {
> +      set f [expr {$f * $i}]
> +   }
> +   return $f
> +}
> +
> +puts [factorial [lindex $argv 0]]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
