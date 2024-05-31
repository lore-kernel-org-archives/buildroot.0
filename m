Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06671C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 19:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A003846A9;
	Fri, 31 May 2024 19:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVEQ_qhDdNxy; Fri, 31 May 2024 19:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56F25846A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56F25846A4;
	Fri, 31 May 2024 19:23:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB971D5666
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 19:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A9A740513
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 19:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVON-OLwVxrN for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 19:23:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D85DF4037C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D85DF4037C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D85DF4037C
 for <buildroot@buildroot.org>; Fri, 31 May 2024 19:23:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6F49613F81D;
 Fri, 31 May 2024 21:23:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 May 2024 21:23:23 +0200
Date: Fri, 31 May 2024 21:23:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zlojq9qcUCZfqRWc@landeda>
References: <20240528132218.2307479-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240528132218.2307479-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717183405;
 bh=262SdkiEXw17U3vAq/UkS9ut/b3HFraTvIQMAq4HoB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ndVLqo294sJ5d2qCYZfaKQMsinMcoOAliTlD5LT/fzoG09eHv86NkErdE2/kb0DKh
 XnWGaEw+xXn/eoKjUMiRcMKhkDAxZkvynIBZvl0IYSl42xBPN+J4AXQutNeL2Oo/0I
 B0o6EAtTrBqZYyyLPVxXEYkqKcgUbQxKwT2S2A8L+ZX8gGPGWLbYE/3HID8AeXV0OY
 O/BPXCUVJ4sXqUIYpou40ucaKtQ/mmlRHgi1lOfJUBmHamx7pnzaCbvH0GDrIiTNBu
 vsTFxvCa42HNkqFWeBkzugS/pNqKZYhLOXbEIyovUKDWpT5vFuIfcswpxB8p6lhEpz
 Klkw9cys6PgkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ndVLqo29
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: switch to
 async/await format
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

James, all,

On 2024-05-28 07:22 -0600, James Hilliard spake thusly:
> This requires python 3.5 or newer but is a bit cleaner than the
> previous coroutine method.
> 
> This should also fix a python3.12 issue:
> [Tue, 28 May 2024 13:09:05] INFO: generate the configuration
> Traceback (most recent call last):
>   File "/home/autobuild/autobuild/instance-0/buildroot/utils/genrandconfig", line 833, in <module>
>     ret = asyncio.run(gen_config(args))
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.12/asyncio/runners.py", line 194, in run
>     return runner.run(main)
>            ^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3.12/asyncio/runners.py", line 89, in run
>     raise ValueError("a coroutine was expected, got {!r}".format(coro))
> ValueError: a coroutine was expected, got <generator object gen_config at 0xffff7bd822c0>
> [Tue, 28 May 2024 13:09:06] WARN: failed to generate configuration
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - rebase
>   - update commit message with python 3.12 fix info
> ---
>  utils/genrandconfig | 62 +++++++++++++++++----------------------------
>  1 file changed, 23 insertions(+), 39 deletions(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index df6bede158..b838dda34d 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -28,11 +28,6 @@ import traceback
>  from distutils.version import StrictVersion
>  import platform
>  
> -if sys.version_info < (3, 8):
> -    from asyncio import coroutine
> -else:
> -    from types import coroutine
> -
>  
>  class SystemInfo:
>      DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
> @@ -60,8 +55,7 @@ class SystemInfo:
>          # --
>          return None
>  
> -    @coroutine
> -    def has(self, prog):
> +    async def has(self, prog):
>          """Checks whether a program is available.
>          Lazily evaluates missing entries.
>  
> @@ -76,11 +70,11 @@ class SystemInfo:
>          have_it = self.find_prog(prog)
>          # java[c] needs special care
>          if have_it and prog in ('java', 'javac'):
> -            proc = yield from asyncio.create_subprocess_shell(
> +            proc = await asyncio.create_subprocess_shell(
>                  "%s -version | grep gcj" % prog,
>                  stdout=asyncio.subprocess.DEVNULL,
>                  stderr=asyncio.subprocess.DEVNULL)
> -            ret = yield from proc.wait()
> +            ret = await proc.wait()
>              if ret != 1:
>                  have_it = False
>          # --
> @@ -159,8 +153,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
>      return configs
>  
>  
> -@coroutine
> -def is_toolchain_usable(configfile, config):
> +async def is_toolchain_usable(configfile, config):
>      """Check if the toolchain is actually usable."""
>  
>      with open(configfile) as configf:
> @@ -180,9 +173,9 @@ def is_toolchain_usable(configfile, config):
>             'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
>             'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
>             'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
> -            proc = yield from asyncio.create_subprocess_exec(
> +            proc = await asyncio.create_subprocess_exec(
>                  'ldd', '--version', stdout=asyncio.subprocess.PIPE)
> -            ldd_version_output, _ = yield from proc.communicate()
> +            ldd_version_output, _ = await proc.communicate()
>              if proc.returncode:
>                  return False
>              glibc_version = ldd_version_output.decode().splitlines()[0].split()[-1]
> @@ -193,8 +186,7 @@ def is_toolchain_usable(configfile, config):
>      return True
>  
>  
> -@coroutine
> -def fixup_config(sysinfo, configfile):
> +async def fixup_config(sysinfo, configfile):
>      """Finalize the configuration and reject any problematic combinations
>  
>      This function returns 'True' when the configuration has been
> @@ -210,8 +202,7 @@ def fixup_config(sysinfo, configfile):
>  
>      BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
>  
> -    has_java = yield from sysinfo.has("java")
> -    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not has_java:
> +    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not await sysinfo.has("java"):
>          return False
>      # The ctng toolchain is affected by PR58854
>      if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
> @@ -669,8 +660,7 @@ def fixup_config(sysinfo, configfile):
>      return True
>  
>  
> -@coroutine
> -def gen_config(args):
> +async def gen_config(args):
>      """Generate a new random configuration
>  
>      This function generates the configuration, by choosing a random
> @@ -728,8 +718,7 @@ def gen_config(args):
>  
>      # Randomly enable BR2_REPRODUCIBLE 10% of times
>      # also enable tar filesystem images for testing
> -    has_diffoscope = yield from sysinfo.has("diffoscope")
> -    if has_diffoscope and randint(0, 10) == 0:
> +    if await sysinfo.has("diffoscope") and randint(0, 10) == 0:
>          configlines.append("BR2_REPRODUCIBLE=y\n")
>          configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
>  
> @@ -743,14 +732,13 @@ def gen_config(args):
>      with open(configfile, "w+") as configf:
>          configf.writelines(configlines)
>  
> -    proc = yield from asyncio.create_subprocess_exec(
> +    proc = await asyncio.create_subprocess_exec(
>          "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
> -    ret = yield from proc.wait()
> +    ret = await proc.wait()
>      if ret:
>          return ret
>  
> -    toolchain_usable = yield from is_toolchain_usable(configfile, toolchainconfig)
> -    if not toolchain_usable:
> +    if not await is_toolchain_usable(configfile, toolchainconfig):
>          return 2
>  
>      # Now, generate the random selection of packages, and fixup
> @@ -764,37 +752,33 @@ def gen_config(args):
>                    file=sys.stderr)
>              return 1
>          bounded_loop -= 1
> -        make_rand = [
> +        proc = await asyncio.create_subprocess_exec(
>              "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
>              "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
>              "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> -            "randpackageconfig" if args.toolchains_csv else "randconfig"
> -        ]
> -        proc = yield from asyncio.create_subprocess_exec(*make_rand)
> -        ret = yield from proc.wait()
> +            "randpackageconfig" if args.toolchains_csv else "randconfig")
> +        ret = await proc.wait()
>          if ret:
>              return ret
>  
> -        ret = yield from fixup_config(sysinfo, configfile)
> -        if ret:
> +        if await fixup_config(sysinfo, configfile):
>              break
>  
> -    proc = yield from asyncio.create_subprocess_exec(
> +    proc = await asyncio.create_subprocess_exec(
>          "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
> -    ret = yield from proc.wait()
> +    ret = await proc.wait()
>      if ret:
>          return ret
>  
> -    proc = yield from asyncio.create_subprocess_exec(
> +    proc = await asyncio.create_subprocess_exec(
>          "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "savedefconfig")
> -    ret = yield from proc.wait()
> +    ret = await proc.wait()
>      if ret:
>          return ret
>  
> -    proc = yield from asyncio.create_subprocess_exec(
> +    proc = await asyncio.create_subprocess_exec(
>          "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "dependencies")
> -    ret = yield from proc.wait()
> -    return ret
> +    return await proc.wait()
>  
>  
>  if __name__ == '__main__':
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
