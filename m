Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33BEC636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 16:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EB9260B48;
	Mon,  6 Feb 2023 16:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EB9260B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXybH0FEVmUn; Mon,  6 Feb 2023 16:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77EF660B3C;
	Mon,  6 Feb 2023 16:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77EF660B3C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64B1E1BF33A
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AF6460B46
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AF6460B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wsr2vOra1FF0 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 16:46:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3A9860B43
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3A9860B43
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 16:45:59 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id t5so2711114oiw.1
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 08:45:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vwJpJ92qWcs9tLD53K0VbtjIh6+XoyclyigbDaR3H6M=;
 b=grIUTh4yUJ4GADpjs5o1JNS+DNU0VOtPF/i9dPUIaPHwjS2/Zd2sQqioP2tLYb4cRS
 m3vgyHT8APqhej4tFWpdzjsOs6NhpvwvMbM53+G6YaJWJpbAreX1pAXTIz2Gb5QVvetS
 prTA9oiVRjtS7OJYX5BnTwCUoY4NZyU24s3YoBk4aVEi0CIrLMMJBUCGxyyr9SHL8AFX
 gyuplFQsGgpNK2/CFMohbBuB+l8bgMy3DYt6wwc9CuQ9UeP4i1WsRnx7DTeLHWRu9VQq
 3/aq3q9Y5B8vF9NNYV38DJJ5a3q/rhfJ3x3E5l9LEQ1CJAiYNHtzEkYiCqCOOSezEQ41
 TeFQ==
X-Gm-Message-State: AO0yUKValGVnTCFSBzmsmv6VRjtgtT66TbAXbdcP1u7DnyX8My5Zirhk
 WK7zESGaFw7ZAbgNxntvP+uJZY3I8C5Hf5UZ/8dVWsexodVJGQ==
X-Google-Smtp-Source: AK7set+CbURgfo36LPt99aCLPYap7EaT3McVYy6NsgsIxFyDNhxATuDN2PsQuUeJ0CFLupoeAnPRStC3Ng5NXbcy/ow=
X-Received: by 2002:a05:6808:199c:b0:378:3f28:221f with SMTP id
 bj28-20020a056808199c00b003783f28221fmr734031oib.93.1675701958842; Mon, 06
 Feb 2023 08:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20220413224004.1225568-1-james.hilliard1@gmail.com>
 <50d6810c-888f-940e-50ac-13e4a8a1aa3c@mind.be>
In-Reply-To: <50d6810c-888f-940e-50ac-13e4a8a1aa3c@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 6 Feb 2023 09:45:47 -0700
Message-ID: <CADvTj4oNAFVoTHvm-TyPqtp06-V7-SdFNw6t+O0DgakX5TGDQQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vwJpJ92qWcs9tLD53K0VbtjIh6+XoyclyigbDaR3H6M=;
 b=G3EI4tv/EcJ1jV5gEwAvIUpIp6bha3n85QOQLRk+XLINtlpWIhIySn+au9VbDftR31
 DdOR1ldEDpOTD/mUFLwD2p7JsNmDu4r9gAm+XeD5dSMfDnyWzltzYddMbn1fLbLU3KZn
 XrzhojZyn6+RA1XPCK5VrqL8XDogvKbk+55zGcWVGdQFP75CALve8qZqBjWhq4rEOQQo
 /mKfNrD8VxrARH6XtAByELxke0h6O4RMrU1zFqDAU7JVGJzXD6oQDoC/wsNgXjkp/ldj
 og4LNwV7XjJ9IoAfcsIyn0PfR2m2C+EDXxC0B+r0LclwfMwcUnZfgdqjMylTbh5beA+W
 mE+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G3EI4tv/
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Feb 6, 2023 at 9:39 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>   Hi James,
>
> On 14/04/2022 00:40, James Hilliard wrote:
> > Since genrandconfig no longer appears to support python2 we can
> > migrate the subprocess calls to use asyncio variants.
> >
> > This has the advantage of allowing for runners like autobuild-run to
> > integrate directly into genrandconfig by calling the asyncio
> > gen_config using importlib instead of having to run genrandconfig as
> > a subprocess.
> >
> > Using asyncio is advantageous here as it eliminates the requirement
> > for the runner to deal with blocking subprocess calls(by having to
> > use threading for example).
> >
> > Also cleanup some unused functions/python2 compatibility shims.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
>   I finally applied to master. Needed to resolve some conflicts, but otherwise
> no changes. I still do have a few comments though.
>
> > ---
> > Changes v1 -> v2:
> >    - compatibility shims for python 3.4 and newer
> > ---
> >   utils/genrandconfig | 94 +++++++++++++++++++++++++++++----------------
> >   1 file changed, 61 insertions(+), 33 deletions(-)
> >
> > diff --git a/utils/genrandconfig b/utils/genrandconfig
> > index 59fe34e58d..aa82a41d5c 100755
> > --- a/utils/genrandconfig
> > +++ b/utils/genrandconfig
> > @@ -18,23 +18,18 @@
> >
> >   # This script generates a random configuration for testing Buildroot.
> >
> > -import contextlib
> > +import asyncio
> >   import csv
> >   import os
> >   from random import randint
> > -import subprocess
> >   import sys
> >   from distutils.version import StrictVersion
> >   import platform
> >
> > -if sys.hexversion >= 0x3000000:
> > -    import urllib.request as _urllib
> > +if sys.version_info < (3, 8):
> > +    from asyncio import coroutine
> >   else:
> > -    import urllib2 as _urllib
> > -
> > -
> > -def urlopen_closing(uri):
> > -    return contextlib.closing(_urllib.urlopen(uri))
> > +    from types import coroutine
> >
> >
> >   class SystemInfo:
> > @@ -63,6 +58,7 @@ class SystemInfo:
> >           # --
> >           return None
> >
> > +    @coroutine
> >       def has(self, prog):
>
>   Isn't the usual way to use
>
>         async def has(self, prog):
>
> ? Or does that mean something different?

Yeah, the weird style here was for python 3.4 compat, but if 3.6 is fine
this should work:
https://patchwork.ozlabs.org/project/buildroot/patch/20230206150847.3621475-1-james.hilliard1@gmail.com/

>
>
> >           """Checks whether a program is available.
> >           Lazily evaluates missing entries.
> > @@ -78,11 +74,13 @@ class SystemInfo:
> >           have_it = self.find_prog(prog)
> >           # java[c] needs special care
> >           if have_it and prog in ('java', 'javac'):
> > -            with open(os.devnull, "w") as devnull:
> > -                if subprocess.call("%s -version | grep gcj" % prog,
> > -                                   shell=True,
> > -                                   stdout=devnull, stderr=devnull) != 1:
> > -                    have_it = False
> > +            proc = yield from asyncio.create_subprocess_shell(
> > +                "%s -version | grep gcj" % prog,
>
>   Perhaps we should also start using f-strings. That bumps the requirement to
> python 3.6 but I don't think it's unreasonable for genrandconfig.

Yeah, older than 3.6 starts getting pretty annoying.

>
> > +                stdout=asyncio.subprocess.DEVNULL,
> > +                stderr=asyncio.subprocess.DEVNULL)
> > +            ret = yield from proc.wait()
> > +            if ret != 1:
> > +                have_it = False
> >           # --
> >           self.progs[prog] = have_it
> >           return have_it
> > @@ -159,6 +157,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
> >       return configs
> >
> >
> > +@coroutine
> >   def is_toolchain_usable(configfile, config):
> >       """Check if the toolchain is actually usable."""
> >
> > @@ -179,8 +178,12 @@ def is_toolchain_usable(configfile, config):
> >              'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
> >              'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
> >              'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
> > -            ldd_version_output = subprocess.check_output(['ldd', '--version'])
> > -            glibc_version = ldd_version_output.splitlines()[0].split()[-1]
> > +            proc = yield from asyncio.create_subprocess_exec(
> > +                'ldd', '--version', stdout=asyncio.subprocess.PIPE)
> > +            ldd_version_output, _ = yield from proc.communicate()
> > +            if proc.returncode:
> > +                return False
> > +            glibc_version = ldd_version_output.splitlines()[0].split()[-1].decode('utf-8')
>
>   The decode was already added in commit
> 12e4f7c5c43fb7b4db6d6548b9dbabb9c1b5f875 so I didn't modify this line.
>
> >               if StrictVersion('2.14') > StrictVersion(glibc_version):
> >                   print("WARN: ignoring the Linaro ARM toolchains because too old host glibc", file=sys.stderr)
> >                   return False
> > @@ -188,6 +191,7 @@ def is_toolchain_usable(configfile, config):
> >       return True
> >
> >
> > +@coroutine
> >   def fixup_config(sysinfo, configfile):
> >       """Finalize the configuration and reject any problematic combinations
> >
> > @@ -202,7 +206,8 @@ def fixup_config(sysinfo, configfile):
> >
> >       BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
> >
> > -    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
> > +    has_java = yield from sysinfo.has("java")
> > +    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not has_java:
> >           return False
> >       # The ctng toolchain is affected by PR58854
> >       if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
> > @@ -507,6 +512,7 @@ def fixup_config(sysinfo, configfile):
> >       return True
> >
> >
> > +@coroutine
> >   def gen_config(args):
> >       """Generate a new random configuration
> >
> > @@ -565,7 +571,8 @@ def gen_config(args):
> >
> >       # Randomly enable BR2_REPRODUCIBLE 10% of times
> >       # also enable tar filesystem images for testing
> > -    if sysinfo.has("diffoscope") and randint(0, 10) == 0:
> > +    has_diffoscope = yield from sysinfo.has("diffoscope")
> > +    if has_diffoscope and randint(0, 10) == 0:
> >           configlines.append("BR2_REPRODUCIBLE=y\n")
> >           configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
> >
> > @@ -579,10 +586,14 @@ def gen_config(args):
> >       with open(configfile, "w+") as configf:
> >           configf.writelines(configlines)
> >
> > -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> > -                           "olddefconfig"])
> > +    proc = yield from asyncio.create_subprocess_exec(
> > +        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
> > +    ret = yield from proc.wait()
> > +    if ret:
> > +        return ret
> >
> > -    if not is_toolchain_usable(configfile, toolchainconfig):
> > +    toolchain_usable = yield from is_toolchain_usable(configfile, toolchainconfig)
> > +    if not toolchain_usable:
> >           return 2
> >
> >       # Now, generate the random selection of packages, and fixup
> > @@ -596,21 +607,34 @@ def gen_config(args):
> >                     file=sys.stderr)
> >               return 1
> >           bounded_loop -= 1
> > -        subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> > -                               "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> > -                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
> > -
> > -        if fixup_config(sysinfo, configfile):
> > +        proc = yield from asyncio.create_subprocess_exec(
> > +            "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> > +            "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> > +            "randpackageconfig" if args.toolchains_csv else "randconfig")
>
>   This was refactored a bit, can you check if I fixed it up correctly?

Yeah, looks good from what I can tell.

>
>   Regards,
>   Arnout
>
> > +        ret = yield from proc.wait()
> > +        if ret:
> > +            return ret
> > +
> > +        ret = yield from fixup_config(sysinfo, configfile)
> > +        if ret:
> >               break
> >
> > -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> > -                           "olddefconfig"])
> > +    proc = yield from asyncio.create_subprocess_exec(
> > +        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
> > +    ret = yield from proc.wait()
> > +    if ret:
> > +        return ret
> >
> > -    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> > -                           "savedefconfig"])
> > +    proc = yield from asyncio.create_subprocess_exec(
> > +        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "savedefconfig")
> > +    ret = yield from proc.wait()
> > +    if ret:
> > +        return ret
> >
> > -    return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> > -                            "dependencies"])
> > +    proc = yield from asyncio.create_subprocess_exec(
> > +        "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "dependencies")
> > +    ret = yield from proc.wait()
> > +    return ret
> >
> >
> >   if __name__ == '__main__':
> > @@ -642,7 +666,11 @@ if __name__ == '__main__':
> >       args.outputdir = os.path.abspath(args.outputdir)
> >
> >       try:
> > -        ret = gen_config(args)
> > +        if sys.version_info < (3, 7):
> > +            loop = asyncio.get_event_loop()
> > +            ret = loop.run_until_complete(gen_config(args))
> > +        else:
> > +            ret = asyncio.run(gen_config(args))
> >       except Exception as e:
> >           print(str(e), file=sys.stderr)
> >           parser.exit(1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
