Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1C9C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E944741885;
	Fri, 12 Jul 2024 14:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KV2bH8gAxi5G; Fri, 12 Jul 2024 14:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E0B4417F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E0B4417F7;
	Fri, 12 Jul 2024 14:47:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B14521BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB6AB846A1
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ucWTJVv101RQ for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:47:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 89CED846A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89CED846A0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89CED846A0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:47:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so12928555e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720795622; x=1721400422;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FnKUEiB4jufyydRwBQBlPImAOieXB9i8n3R/eW0T0H0=;
 b=bq0+HRHe0JTuq+qeC1JAy4Gh3UIP3n1ruISHELoBpMKc77MdOOdSKp3S4a5TwWfIhB
 +QvhsEwXVf5AoAm4TtmPOQTLvTqvYOFNPamquo1iafXi5Hl9Wjz5nFO7teWE9sAE4rf1
 6dmPDU5Plgl8eIwLteJRfxSWH+VVYXDMCZ0py1WtU6F518rz3aN470MleoFf1BO9wH0G
 OrsW5DY3G/RP/g7zAGcKe/8gtZCqn8GU5AmuY0PvgrRW7d9W4+ZWs24o/QFgpJHLkZsu
 AA2Tvhovr3TrHB+50QiQi/mvpxx8yxxVE6okABnqVDvvcU6lMFOtM8pEeuHLR8nS78Gy
 FnsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdJSU7muFrcoMz0Xze3vkmVaffqdClf0Rv7XG/zcslSjP9bBa3uT72PxDyYfj4AAAf7CZ4n3mh5hq2k1iwlztHjwDArYCyLg==
X-Gm-Message-State: AOJu0YyyC0+u117mYdnWxz/wjoxzGANm7uqNy0lnPa8J2OPG+rAgRfmV
 NEd2MJEtyKey3zArFO9MC3VrvH4XAw2e36wBRZROfOmRZ2ah4qItBhVBFjytTKjp1LE+WpNLJYo
 hoks=
X-Google-Smtp-Source: AGHT+IEM/5S/UoTMSNQDURGqJaWLCcdKQQS/UrFFjg91ZOcar7Zla7X6Q5AGF41vVSITkHq3u7DACg==
X-Received: by 2002:a05:600c:4196:b0:426:5b52:84fb with SMTP id
 5b1f17b1804b1-4279dacef9amr26440885e9.7.1720795622290; 
 Fri, 12 Jul 2024 07:47:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2397easm25894515e9.6.2024.07.12.07.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 07:47:01 -0700 (PDT)
Message-ID: <f430f9e8-8ef4-4f89-8463-36dfc046d8b7@mind.be>
Date: Fri, 12 Jul 2024 16:46:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
 <20230101233653.487175-27-ricardo.martincoski@gmail.com>
Content-Language: en-GB
In-Reply-To: <20230101233653.487175-27-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720795622; x=1721400422; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FnKUEiB4jufyydRwBQBlPImAOieXB9i8n3R/eW0T0H0=;
 b=RkDk1TbPakoZ9GiEj+WerRXRC4HFSK70muLAgsN3cDbixw3cBwPRAihjfPrVlRmZWZ
 pd3zYU1+IMBY1h4MLvtiRJFLvKgPbSHJHQlW7Fn/FYGhVo+4TYHIBPgt7mIkYu94bxPE
 12XJdK4eZ0xqgxVhWE8in56Xr70k4Lyb0dczACrvBKOMauH2X/vYWqc4H1Dqtcxd9sih
 NKGjFCJTNcZetMym/mPqjNSaD7CbQ6d5wxgc2KQUv4X18ezML9p1+CL0a+HIlAJeocXm
 iYGHfzKo2sHFAVDkEEDSqFus6ZxDq9QRKPDBq07/eoeqYX73p9ppvF3saqGAciIrqtVg
 cKIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RkDk1TbP
Subject: Re: [Buildroot] [PATCH 26/29] utils/check-package: check linux-tools
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



On 02/01/2023 00:36, Ricardo Martincoski wrote:
> Each linux tool uses a fragment of a .mk file, named, for instance:
> package/linux-tools/linux-tool-cpupower.mk.in
> So currently check-package does not check these files.
> 
> Add the support in check-package script.
> At the same time, factor out a function to derive package prefix from
> the filename being checked, so the fix (calling os.path.splitext twice)
> can be applied in a single place.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Running on current master generates no warnings.
> ---
>   utils/check-package                  |  3 ++-
>   utils/checkpackagelib/lib_mk.py      | 28 ++++++++++---------
>   utils/checkpackagelib/test_lib_mk.py | 40 ++++++++++++++++++++++++++++
>   3 files changed, 57 insertions(+), 14 deletions(-)
> 
> diff --git a/utils/check-package b/utils/check-package
> index f64daed84c..6bd0c0b31f 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -61,6 +61,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
>   DO_NOT_CHECK_INTREE = re.compile(r"|".join([
>       r"boot/barebox/barebox\.mk$",
>       r"fs/common\.mk$",
> +    r"package/alchemy/atom.mk.in$",
>       r"package/doc-asciidoc\.mk$",
>       r"package/pkg-\S*\.mk$",
>       r"toolchain/helpers\.mk$",
> @@ -84,7 +85,7 @@ def get_lib_from_filename(fname):
>           return checkpackagelib.lib_config
>       if fname.endswith(".hash"):
>           return checkpackagelib.lib_hash
> -    if fname.endswith(".mk"):
> +    if fname.endswith(".mk") or fname.endswith(".mk.in"):
>           return checkpackagelib.lib_mk
>       if fname.endswith(".patch"):
>           return checkpackagelib.lib_patch
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index b0bd52bdf6..931fa39dda 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -21,6 +21,16 @@ continue_conditional = ["elif", "else"]
>   end_conditional = ["endif"]
>   
>   
> +def get_package_prefix_from_filename(filename):

  I added a docstring and a comment explaining the double splitext here.

  Applied to master, thanks.

  Regards,
  Arnout

> +    package = os.path.splitext(os.path.splitext(os.path.basename(filename))[0])[0]
> +    # linux tools do not use LINUX_TOOL_ prefix for variables
> +    package = package.replace("linux-tool-", "")
> +    # linux extensions do not use LINUX_EXT_ prefix for variables
> +    package = package.replace("linux-ext-", "")
> +    package_upper = package.replace("-", "_").upper()
> +    return package, package_upper
> +
> +
>   class Indent(_CheckFunction):
>       COMMENT = re.compile(r"^\s*#")
>       CONDITIONAL = re.compile(r"^\s*({})\s".format("|".join(start_conditional + end_conditional + continue_conditional)))
> @@ -179,12 +189,10 @@ class RemoveDefaultPackageSourceVariable(_CheckFunction):
>       packages_that_may_contain_default_source = ["binutils", "gcc", "gdb"]
>   
>       def before(self):
> -        package, _ = os.path.splitext(os.path.basename(self.filename))
> -        package_upper = package.replace("-", "_").upper()
> -        self.package = package
> +        self.package, package_upper = get_package_prefix_from_filename(self.filename)
>           self.FIND_SOURCE = re.compile(
>               r"^{}_SOURCE\s*=\s*{}-\$\({}_VERSION\)\.tar\.gz"
> -            .format(package_upper, package, package_upper))
> +            .format(package_upper, self.package, package_upper))
>   
>       def check_line(self, lineno, text):
>           if self.FIND_SOURCE.search(text):
> @@ -254,16 +262,10 @@ class TypoInPackageVariable(_CheckFunction):
>       VARIABLE = re.compile(r"^(define\s+)?([A-Z0-9_]+_[A-Z0-9_]+)")
>   
>       def before(self):
> -        package, _ = os.path.splitext(os.path.basename(self.filename))
> -        package = package.replace("-", "_").upper()
> -        # linux tools do not use LINUX_TOOL_ prefix for variables
> -        package = package.replace("LINUX_TOOL_", "")
> -        # linux extensions do not use LINUX_EXT_ prefix for variables
> -        package = package.replace("LINUX_EXT_", "")
> -        self.package = package
> -        self.REGEX = re.compile(r"(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
> +        _, self.package = get_package_prefix_from_filename(self.filename)
> +        self.REGEX = re.compile(r"(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(self.package))
>           self.FIND_VIRTUAL = re.compile(
> -            r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
> +            r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(self.package))
>           self.virtual = []
>   
>       def check_line(self, lineno, text):
> diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
> index 5f5663377b..d817cdece0 100644
> --- a/utils/checkpackagelib/test_lib_mk.py
> +++ b/utils/checkpackagelib/test_lib_mk.py
> @@ -3,6 +3,40 @@ import checkpackagelib.test_util as util
>   import checkpackagelib.lib_mk as m
>   
>   
> +get_package_prefix_from_filename = [
> +    ('linux extension',
> +     'linux/linux-ext-aufs.mk',
> +     ['aufs', 'AUFS']),
> +    ('linux tool',
> +     'package/linux-tools/linux-tool-gpio.mk.in',
> +     ['gpio', 'GPIO']),
> +    ('boot',
> +     'boot/binaries-marvell/binaries-marvell.mk',
> +     ['binaries-marvell', 'BINARIES_MARVELL']),
> +    ('toolchain',
> +     'toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk',
> +     ['toolchain-external-bootlin', 'TOOLCHAIN_EXTERNAL_BOOTLIN']),
> +    ('package, underscore, subfolder',
> +     'package/x11r7/xapp_bitmap/xapp_bitmap.mk',
> +     ['xapp_bitmap', 'XAPP_BITMAP']),
> +    ('package, starting with number',
> +     'package/4th/4th.mk',
> +     ['4th', '4TH']),
> +    ('package, long name',
> +     'package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk',
> +     ['perl-mojolicious-plugin-authentication', 'PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION']),
> +    ('package, case sensitive',
> +     'package/libeXosip2/libeXosip2.mk',
> +     ['libeXosip2', 'LIBEXOSIP2']),
> +    ]
> +
> +
> +@pytest.mark.parametrize('testname,filename,expected', get_package_prefix_from_filename)
> +def test_get_package_prefix_from_filename(testname, filename, expected):
> +    prefix_lower, prefix_upper = m.get_package_prefix_from_filename(filename)
> +    assert [prefix_lower, prefix_upper] == expected
> +
> +
>   Indent = [
>       ('ignore comment at beginning of line',
>        'any',
> @@ -496,6 +530,12 @@ TypoInPackageVariable = [
>        'OTHERS_VAR = \n',
>        [['any.mk:2: possible typo: OTHERS_VAR -> *ANY*',
>          'OTHERS_VAR = \n']]),
> +    ('linux tool',
> +     'package/linux-tools/linux-tool-cpupower.mk.in',
> +     'CPUPOWER_DEPENDENCIES =\n'
> +     'POWER_DEPENDENCIES +=\n',
> +     [['package/linux-tools/linux-tool-cpupower.mk.in:2: possible typo: POWER_DEPENDENCIES -> *CPUPOWER*',
> +       'POWER_DEPENDENCIES +=\n']]),
>       ]
>   
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
