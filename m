Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233DEC636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 16:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3F1260B3D;
	Mon,  6 Feb 2023 16:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3F1260B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nf2NLSG_atb9; Mon,  6 Feb 2023 16:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB20D60B43;
	Mon,  6 Feb 2023 16:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB20D60B43
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0A5B1BF33A
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7504D81852
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7504D81852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3_J6iwi5g_oE for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 16:39:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B3C5817A4
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B3C5817A4
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 16:39:40 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so7823067wms.0
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 08:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1lAO+X0YK6BMtnP6XeNAe7CXymNmfzFhNUULcXB1H4k=;
 b=PMih59k6VkZlh2MmslDasNF6kKHk1wei/1wyNe47NZE6Op2+T1X4vp9rtg/CK5lihV
 J+Q90UYRoa2DYrMZiWluUEwQ8Wv9lJtfKiqeczQ6axWzok3IgCSWlU1EjURPYekyDLr2
 QMeyRuOKtq/zAZ75IKurf96ZMZLjQ2f+H/xRD+oEBH74Srpf7R4R4pwENA435TbY+MtJ
 0eaUH/cuhcRzXVedKYPSRRgblKSBoNCLZo8CUlxyGOee0I0TW2ivsQjj8qEibDn0JMK+
 PFBGtZK2qf8xIVsarsRbSiM81dy+P7vIY1lqcvU3ZEuGMVXQIm4/nGcCd/CN1zKKQnPC
 oMbg==
X-Gm-Message-State: AO0yUKUaw0srGWiu236DaREjk5b+2XxEJZxkset3SngFKDVXTpeFUfd5
 LsHnI7IKPXTIpF/yXreeJg8AEIh78gXcVZoi
X-Google-Smtp-Source: AK7set+HupjeGNu49Gobr7wnySPMrERrXMSX7V/RsHNCg22cu1yg2PN0k3oSxL45RU3eI8SdQQwtEw==
X-Received: by 2002:a05:600c:3423:b0:3e0:185:e916 with SMTP id
 y35-20020a05600c342300b003e00185e916mr338465wmp.13.1675701578909; 
 Mon, 06 Feb 2023 08:39:38 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 bv20-20020a0560001f1400b002bc8130cca7sm9079707wrb.23.2023.02.06.08.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 08:39:38 -0800 (PST)
Message-ID: <50d6810c-888f-940e-50ac-13e4a8a1aa3c@mind.be>
Date: Mon, 6 Feb 2023 17:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220413224004.1225568-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220413224004.1225568-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1lAO+X0YK6BMtnP6XeNAe7CXymNmfzFhNUULcXB1H4k=;
 b=F74RAvwFGV0+XyG3UODbrAF71xjGK3hlQqlA2kNrAd4FwgJHIKEeTeVaSwm5AowxdN
 sWI5YnEDyLlSZUDuoPwbA5Jh3KAySdhe1rInqiEvIG37wSul17Ke/V1nlsjGNo37fsHm
 o6bAm7DXib2hVxrGSjI8hc0DBpt3RKPuXherWkWaNiXvZXDZyO6NTXrPr3nX7vxUzZWB
 0rfvRAVAHQnNnUF7vSRhNmb2p6noCmP02Sk7iOGXBBjG+8ww5X3q8CwF13isriMslWWX
 6yuDxnzfSMwS9H35b3iq9RDON+PGfvILub1heaokAZ/0Sg5gnDX5Kik6JBd6jXma2zsf
 i6NA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F74RAvwF
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: migrate to
 asyncio subprocess calls
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

On 14/04/2022 00:40, James Hilliard wrote:
> Since genrandconfig no longer appears to support python2 we can
> migrate the subprocess calls to use asyncio variants.
> 
> This has the advantage of allowing for runners like autobuild-run to
> integrate directly into genrandconfig by calling the asyncio
> gen_config using importlib instead of having to run genrandconfig as
> a subprocess.
> 
> Using asyncio is advantageous here as it eliminates the requirement
> for the runner to deal with blocking subprocess calls(by having to
> use threading for example).
> 
> Also cleanup some unused functions/python2 compatibility shims.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  I finally applied to master. Needed to resolve some conflicts, but otherwise 
no changes. I still do have a few comments though.

> ---
> Changes v1 -> v2:
>    - compatibility shims for python 3.4 and newer
> ---
>   utils/genrandconfig | 94 +++++++++++++++++++++++++++++----------------
>   1 file changed, 61 insertions(+), 33 deletions(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 59fe34e58d..aa82a41d5c 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -18,23 +18,18 @@
>   
>   # This script generates a random configuration for testing Buildroot.
>   
> -import contextlib
> +import asyncio
>   import csv
>   import os
>   from random import randint
> -import subprocess
>   import sys
>   from distutils.version import StrictVersion
>   import platform
>   
> -if sys.hexversion >= 0x3000000:
> -    import urllib.request as _urllib
> +if sys.version_info < (3, 8):
> +    from asyncio import coroutine
>   else:
> -    import urllib2 as _urllib
> -
> -
> -def urlopen_closing(uri):
> -    return contextlib.closing(_urllib.urlopen(uri))
> +    from types import coroutine
>   
>   
>   class SystemInfo:
> @@ -63,6 +58,7 @@ class SystemInfo:
>           # --
>           return None
>   
> +    @coroutine
>       def has(self, prog):

  Isn't the usual way to use

	async def has(self, prog):

? Or does that mean something different?


>           """Checks whether a program is available.
>           Lazily evaluates missing entries.
> @@ -78,11 +74,13 @@ class SystemInfo:
>           have_it = self.find_prog(prog)
>           # java[c] needs special care
>           if have_it and prog in ('java', 'javac'):
> -            with open(os.devnull, "w") as devnull:
> -                if subprocess.call("%s -version | grep gcj" % prog,
> -                                   shell=True,
> -                                   stdout=devnull, stderr=devnull) != 1:
> -                    have_it = False
> +            proc = yield from asyncio.create_subprocess_shell(
> +                "%s -version | grep gcj" % prog,

  Perhaps we should also start using f-strings. That bumps the requirement to 
python 3.6 but I don't think it's unreasonable for genrandconfig.

> +                stdout=asyncio.subprocess.DEVNULL,
> +                stderr=asyncio.subprocess.DEVNULL)
> +            ret = yield from proc.wait()
> +            if ret != 1:
> +                have_it = False
>           # --
>           self.progs[prog] = have_it
>           return have_it
> @@ -159,6 +157,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
>       return configs
>   
>   
> +@coroutine
>   def is_toolchain_usable(configfile, config):
>       """Check if the toolchain is actually usable."""
>   
> @@ -179,8 +178,12 @@ def is_toolchain_usable(configfile, config):
>              'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
>              'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
>              'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
> -            ldd_version_output = subprocess.check_output(['ldd', '--version'])
> -            glibc_version = ldd_version_output.splitlines()[0].split()[-1]
> +            proc = yield from asyncio.create_subprocess_exec(
> +                'ldd', '--version', stdout=asyncio.subprocess.PIPE)
> +            ldd_version_output, _ = yield from proc.communicate()
> +            if proc.returncode:
> +                return False
> +            glibc_version = ldd_version_output.splitlines()[0].split()[-1].decode('utf-8')

  The decode was already added in commit 
12e4f7c5c43fb7b4db6d6548b9dbabb9c1b5f875 so I didn't modify this line.

>               if StrictVersion('2.14') > StrictVersion(glibc_version):
>                   print("WARN: ignoring the Linaro ARM toolchains because too old host glibc", file=sys.stderr)
>                   return False
> @@ -188,6 +191,7 @@ def is_toolchain_usable(configfile, config):
>       return True
>   
>   
> +@coroutine
>   def fixup_config(sysinfo, configfile):
>       """Finalize the configuration and reject any problematic combinations
>   
> @@ -202,7 +206,8 @@ def fixup_config(sysinfo, configfile):
>   
>       BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
>   
> -    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
> +    has_java = yield from sysinfo.has("java")
> +    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not has_java:
>           return False
>       # The ctng toolchain is affected by PR58854
>       if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
> @@ -507,6 +512,7 @@ def fixup_config(sysinfo, configfile):
>       return True
>   
>   
> +@coroutine
>   def gen_config(args):
>       """Generate a new random configuration
>   
> @@ -565,7 +571,8 @@ def gen_config(args):
>   
>       # Randomly enable BR2_REPRODUCIBLE 10% of times
>       # also enable tar filesystem images for testing
> -    if sysinfo.has("diffoscope") and randint(0, 10) == 0:
> +    has_diffoscope = yield from sysinfo.has("diffoscope")
> +    if has_diffoscope and randint(0, 10) == 0:
>           configlines.append("BR2_REPRODUCIBLE=y\n")
>           configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
>   
> @@ -579,10 +586,14 @@ def gen_config(args):
>       with open(configfile, "w+") as configf:
>           configf.writelines(configlines)
>   
> -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> -                           "olddefconfig"])
> +    proc = yield from asyncio.create_subprocess_exec(
> +        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
> +    ret = yield from proc.wait()
> +    if ret:
> +        return ret
>   
> -    if not is_toolchain_usable(configfile, toolchainconfig):
> +    toolchain_usable = yield from is_toolchain_usable(configfile, toolchainconfig)
> +    if not toolchain_usable:
>           return 2
>   
>       # Now, generate the random selection of packages, and fixup
> @@ -596,21 +607,34 @@ def gen_config(args):
>                     file=sys.stderr)
>               return 1
>           bounded_loop -= 1
> -        subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> -                               "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> -                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
> -
> -        if fixup_config(sysinfo, configfile):
> +        proc = yield from asyncio.create_subprocess_exec(
> +            "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> +            "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> +            "randpackageconfig" if args.toolchains_csv else "randconfig")

  This was refactored a bit, can you check if I fixed it up correctly?

  Regards,
  Arnout

> +        ret = yield from proc.wait()
> +        if ret:
> +            return ret
> +
> +        ret = yield from fixup_config(sysinfo, configfile)
> +        if ret:
>               break
>   
> -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> -                           "olddefconfig"])
> +    proc = yield from asyncio.create_subprocess_exec(
> +        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
> +    ret = yield from proc.wait()
> +    if ret:
> +        return ret
>   
> -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> -                           "savedefconfig"])
> +    proc = yield from asyncio.create_subprocess_exec(
> +        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "savedefconfig")
> +    ret = yield from proc.wait()
> +    if ret:
> +        return ret
>   
> -    return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> -                            "dependencies"])
> +    proc = yield from asyncio.create_subprocess_exec(
> +        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "dependencies")
> +    ret = yield from proc.wait()
> +    return ret
>   
>   
>   if __name__ == '__main__':
> @@ -642,7 +666,11 @@ if __name__ == '__main__':
>       args.outputdir = os.path.abspath(args.outputdir)
>   
>       try:
> -        ret = gen_config(args)
> +        if sys.version_info < (3, 7):
> +            loop = asyncio.get_event_loop()
> +            ret = loop.run_until_complete(gen_config(args))
> +        else:
> +            ret = asyncio.run(gen_config(args))
>       except Exception as e:
>           print(str(e), file=sys.stderr)
>           parser.exit(1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
