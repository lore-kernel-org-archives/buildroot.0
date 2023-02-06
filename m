Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA8BC636D4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 16:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DB2141558;
	Mon,  6 Feb 2023 16:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DB2141558
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EaZBiJP--caj; Mon,  6 Feb 2023 16:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC7DB415AE;
	Mon,  6 Feb 2023 16:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC7DB415AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC1FF1BF33A
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5A6240184
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5A6240184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SslG4AfeV7iY for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 16:50:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D4EA400D0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D4EA400D0
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 16:50:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h16so10971152wrz.12
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 08:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kg1roXcCDIrc8E01SvibFh4qfXq0ZOKn5R3SMKlmTcc=;
 b=6KDAiGljWSzn3N8mKJEycKE5vb51/lxCFXvaw30H/5y0gz6o72+tcX2C8n62VZY31/
 NxoDR+GrYu20+RRXxvZ9pgzMYgUgquiuUSJhua0/CcAweKFbDCSU4CvWExR2XSQXMAjP
 WeOJ6E7oJLaj0yo0G93iYmaj07PPnvZQTw3d8LrFSWdyti1fqauXn0ZJFo84cwjhJf3d
 gCuGKQggktd9KusemHSN7TBtapg+a5cykJKfIyv01+cGJsDQPdC03r5lNMH5oo1L5ujv
 af4PbNpLqrAULnfrFaYqmRkwVDBgjZZuaM4hyTqajGpvFKUVDebgOYpseyi87e80Cori
 XQrQ==
X-Gm-Message-State: AO0yUKWyHBWuoGctNGR3pEBWzRrnOGkbfGOl0Fl86w8wH2MrHwcZZ95I
 NpzlcWs3Fd45nTbrhfeX2nepLg==
X-Google-Smtp-Source: AK7set/pS5nrwARd6klmc0hD2j9Ri4OoetJ+yypObPT2e/DQecX9u4E+1mDBsYe2V5+JQ686EO7PnQ==
X-Received: by 2002:a05:6000:1b04:b0:2c3:def9:7e1a with SMTP id
 f4-20020a0560001b0400b002c3def97e1amr6957975wrz.44.1675702233286; 
 Mon, 06 Feb 2023 08:50:33 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adff851000000b002c3dd82a0e9sm6589894wrq.91.2023.02.06.08.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 08:50:32 -0800 (PST)
Message-ID: <3edf52e1-0ba5-c8d0-8501-079a6e21abfe@mind.be>
Date: Mon, 6 Feb 2023 17:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230206150847.3621475-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230206150847.3621475-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kg1roXcCDIrc8E01SvibFh4qfXq0ZOKn5R3SMKlmTcc=;
 b=gvcBx5mgjvimo7lbNNmww+bTBORICkq5qhmH8lBn0+k2bRbz/02Ygd2lyHOl79w5Bm
 43RKaeWEhE3S7ZAtXUBAd6GyYd8mzpkfS3qgVBuNyEoHS5T/7jTywMVhaFfNzs8c5zsg
 n0cWVumMax1/VWz1mih0kGRxRluvu3iVZgYkrltCx+hAwnsARHQKNhDUTC7ka4PPY2IR
 2iWOGXBSd+kUg9qQWuQW8AtbytCMjwz9ZFbxwwjJ4IuK+STfRDDDEXJYKC0OiVX5kVsx
 r+pMs2A5FvuRtguh0dOQqJh8+t9B+0TzPt7O4rj2NGgZf3a45879WBaJ1MKBl7hEGxho
 l67g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gvcBx5mg
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: switch to
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2023 16:08, James Hilliard wrote:
> This requires python 3.6 or newer but is a bit cleaner.

  Does it? According to [1]

"The async def type of coroutine was added in Python 3.5"


  Regards,
  Arnout

[1] https://docs.python.org/3.5/library/asyncio-task.html#coroutines


> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   utils/genrandconfig | 62 +++++++++++++++++----------------------------
>   1 file changed, 23 insertions(+), 39 deletions(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index b3576f8a51..8947898d88 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -28,11 +28,6 @@ import traceback
>   from distutils.version import StrictVersion
>   import platform
>   
> -if sys.version_info < (3, 8):
> -    from asyncio import coroutine
> -else:
> -    from types import coroutine
> -
>   
>   class SystemInfo:
>       DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
> @@ -60,8 +55,7 @@ class SystemInfo:
>           # --
>           return None
>   
> -    @coroutine
> -    def has(self, prog):
> +    async def has(self, prog):
>           """Checks whether a program is available.
>           Lazily evaluates missing entries.
>   
> @@ -76,11 +70,11 @@ class SystemInfo:
>           have_it = self.find_prog(prog)
>           # java[c] needs special care
>           if have_it and prog in ('java', 'javac'):
> -            proc = yield from asyncio.create_subprocess_shell(
> +            proc = await asyncio.create_subprocess_shell(
>                   "%s -version | grep gcj" % prog,
>                   stdout=asyncio.subprocess.DEVNULL,
>                   stderr=asyncio.subprocess.DEVNULL)
> -            ret = yield from proc.wait()
> +            ret = await proc.wait()
>               if ret != 1:
>                   have_it = False
>           # --
> @@ -159,8 +153,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
>       return configs
>   
>   
> -@coroutine
> -def is_toolchain_usable(configfile, config):
> +async def is_toolchain_usable(configfile, config):
>       """Check if the toolchain is actually usable."""
>   
>       with open(configfile) as configf:
> @@ -180,9 +173,9 @@ def is_toolchain_usable(configfile, config):
>              'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
>              'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
>              'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
> -            proc = yield from asyncio.create_subprocess_exec(
> +            proc = await asyncio.create_subprocess_exec(
>                   'ldd', '--version', stdout=asyncio.subprocess.PIPE)
> -            ldd_version_output, _ = yield from proc.communicate()
> +            ldd_version_output, _ = await proc.communicate()
>               if proc.returncode:
>                   return False
>               glibc_version = ldd_version_output.decode().splitlines()[0].split()[-1]
> @@ -193,8 +186,7 @@ def is_toolchain_usable(configfile, config):
>       return True
>   
>   
> -@coroutine
> -def fixup_config(sysinfo, configfile):
> +async def fixup_config(sysinfo, configfile):
>       """Finalize the configuration and reject any problematic combinations
>   
>       This function returns 'True' when the configuration has been
> @@ -210,8 +202,7 @@ def fixup_config(sysinfo, configfile):
>   
>       BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
>   
> -    has_java = yield from sysinfo.has("java")
> -    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not has_java:
> +    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not await sysinfo.has("java"):
>           return False
>       # The ctng toolchain is affected by PR58854
>       if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
> @@ -654,8 +645,7 @@ def fixup_config(sysinfo, configfile):
>       return True
>   
>   
> -@coroutine
> -def gen_config(args):
> +async def gen_config(args):
>       """Generate a new random configuration
>   
>       This function generates the configuration, by choosing a random
> @@ -713,8 +703,7 @@ def gen_config(args):
>   
>       # Randomly enable BR2_REPRODUCIBLE 10% of times
>       # also enable tar filesystem images for testing
> -    has_diffoscope = yield from sysinfo.has("diffoscope")
> -    if has_diffoscope and randint(0, 10) == 0:
> +    if await sysinfo.has("diffoscope") and randint(0, 10) == 0:
>           configlines.append("BR2_REPRODUCIBLE=y\n")
>           configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
>   
> @@ -728,14 +717,13 @@ def gen_config(args):
>       with open(configfile, "w+") as configf:
>           configf.writelines(configlines)
>   
> -    proc = yield from asyncio.create_subprocess_exec(
> +    proc = await asyncio.create_subprocess_exec(
>           "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
> -    ret = yield from proc.wait()
> +    ret = await proc.wait()
>       if ret:
>           return ret
>   
> -    toolchain_usable = yield from is_toolchain_usable(configfile, toolchainconfig)
> -    if not toolchain_usable:
> +    if not await is_toolchain_usable(configfile, toolchainconfig):
>           return 2
>   
>       # Now, generate the random selection of packages, and fixup
> @@ -749,37 +737,33 @@ def gen_config(args):
>                     file=sys.stderr)
>               return 1
>           bounded_loop -= 1
> -        make_rand = [
> +        proc = await asyncio.create_subprocess_exec(
>               "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
>               "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
>               "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> -            "randpackageconfig" if args.toolchains_csv else "randconfig"
> -        ]
> -        proc = yield from asyncio.create_subprocess_exec(*make_rand)
> -        ret = yield from proc.wait()
> +            "randpackageconfig" if args.toolchains_csv else "randconfig")
> +        ret = await proc.wait()
>           if ret:
>               return ret
>   
> -        ret = yield from fixup_config(sysinfo, configfile)
> -        if ret:
> +        if await fixup_config(sysinfo, configfile):
>               break
>   
> -    proc = yield from asyncio.create_subprocess_exec(
> +    proc = await asyncio.create_subprocess_exec(
>           "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "olddefconfig")
> -    ret = yield from proc.wait()
> +    ret = await proc.wait()
>       if ret:
>           return ret
>   
> -    proc = yield from asyncio.create_subprocess_exec(
> +    proc = await asyncio.create_subprocess_exec(
>           "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "savedefconfig")
> -    ret = yield from proc.wait()
> +    ret = await proc.wait()
>       if ret:
>           return ret
>   
> -    proc = yield from asyncio.create_subprocess_exec(
> +    proc = await asyncio.create_subprocess_exec(
>           "make", "O=%s" % args.outputdir, "-C", args.buildrootdir, "dependencies")
> -    ret = yield from proc.wait()
> -    return ret
> +    return await proc.wait()
>   
>   
>   if __name__ == '__main__':
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
