Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BF9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:34:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C49266108E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C49266108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9400140164;
	Mon, 18 Oct 2021 20:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAyXhKs2Ifki; Mon, 18 Oct 2021 20:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 735BB40474;
	Mon, 18 Oct 2021 20:34:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 077FE1BF27A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBA906078A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QE6yjKwW4QdH for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:34:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7050605BA
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:34:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c87d:8477:c454:3318])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id F09DB2003AE;
 Mon, 18 Oct 2021 22:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634589258;
 bh=sEUGNT2RgjYtVyCxjHuVjfTl5MEF0PjA3ar7hK8W2Jo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mdQuDCkjIIiY4R4zg7hhTKPR/cIfdMk/iU+TUs7Z5RJSS4BbXI79eAFUt4kfUVKb7
 fSoOM6aejCoKHAWvHoRhW4xVeQZYSIMgUBUMFH4k0JcUjm7Kf0mUo3Drq3gOU1nj0p
 gQ1Ilc3rryOTXdHdoORoeVJaXOCUe51wWe4CDxSFjaRypVEEDjTRMvsVfKUDsyL5qE
 +TkWXMrKZid+1jq0AJ0+kTQqyjQR/jgRSPEqfigBjWt8R+iSGQu0yviON8Mo4IyyS6
 v0PfJIOaFN9Yw4URSBwDhVVUdWcHFsIhdm7tSfkti2kXreQ975sRV/4cRqH0qlKtGf
 3ZxKTtJWOGPkw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Oct 2021 22:34:13 +0200
Date: Mon, 18 Oct 2021 22:34:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20211018203413.GV2400@scaer>
References: <20211018195822.2263226-1-arnout@mind.be>
 <20211018195822.2263226-2-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211018195822.2263226-2-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] treewide: fix flake8 error E741
 ambiguous variable name
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

Arnout, All,

On 2021-10-18 21:58 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> A recent update of flake8 in CI introduced a new check E741. It
> basically checks that variables are at least 3 characters long. Up to
> now, however, we have used shorter names in some places - all of them
> turn out to be "l" for a line of text.
> 
> Replace all those "l" variables with "line".
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1687009829
> partially:
> support/scripts/boot-qemu-image.py:47:21: E741 ambiguous variable name 'l'
> support/scripts/check-dotconfig.py:20:38: E741 ambiguous variable name 'l'
> support/scripts/size-stats:76:13: E741 ambiguous variable name 'l'
> support/testing/tests/core/test_bad_arch.py:17:32: E741 ambiguous variable name 'l'
> support/testing/tests/package/test_python_treq.py:10:30: E741 ambiguous variable name 'l'
> support/testing/tests/toolchain/test_external.py:30:42: E741 ambiguous variable name 'l'
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

It's not really treewide, as all the changes are located in support/, so
I've tweaked the title accordingly, and applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/boot-qemu-image.py                | 6 +++---
>  support/scripts/check-dotconfig.py                | 2 +-
>  support/scripts/size-stats                        | 4 ++--
>  support/testing/tests/core/test_bad_arch.py       | 2 +-
>  support/testing/tests/package/test_python_treq.py | 2 +-
>  support/testing/tests/toolchain/test_external.py  | 2 +-
>  6 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
> index 0d4ad825fc..fba1533bb7 100755
> --- a/support/scripts/boot-qemu-image.py
> +++ b/support/scripts/boot-qemu-image.py
> @@ -43,9 +43,9 @@ def main():
>          # In this case, spawn above will succeed at starting the wrapper
>          # start-qemu.sh, but that one will fail (exit with 127) in such
>          # a situation.
> -        exit = [int(l.split(' ')[1])
> -                for l in e.value.splitlines()
> -                if l.startswith('exitstatus: ')]
> +        exit = [int(line.split(' ')[1])
> +                for line in e.value.splitlines()
> +                if line.startswith('exitstatus: ')]
>          if len(exit) and exit[0] == 127:
>              print('qemu-start.sh could not find the qemu binary')
>              sys.exit(0)
> diff --git a/support/scripts/check-dotconfig.py b/support/scripts/check-dotconfig.py
> index f9a416b743..54fd6ae91e 100755
> --- a/support/scripts/check-dotconfig.py
> +++ b/support/scripts/check-dotconfig.py
> @@ -17,7 +17,7 @@ def main():
>  
>      # strip() to get rid of trailing \n
>      with open(configfile) as configf:
> -        configlines = [l.strip() for l in configf.readlines()]
> +        configlines = [line.strip() for line in configf.readlines()]
>  
>      defconfiglines = []
>      with open(defconfig) as defconfigf:
> diff --git a/support/scripts/size-stats b/support/scripts/size-stats
> index bf3d12a9b7..e4389e99b5 100755
> --- a/support/scripts/size-stats
> +++ b/support/scripts/size-stats
> @@ -73,8 +73,8 @@ def add_file(filesdict, relpath, abspath, pkg):
>  def build_package_dict(builddir):
>      filesdict = {}
>      with open(os.path.join(builddir, "build", "packages-file-list.txt")) as f:
> -        for l in f.readlines():
> -            pkg, fpath = l.split(",", 1)
> +        for line in f.readlines():
> +            pkg, fpath = line.split(",", 1)
>              # remove the initial './' in each file path
>              fpath = fpath.strip()[2:]
>              fullpath = os.path.join(builddir, "target", fpath)
> diff --git a/support/testing/tests/core/test_bad_arch.py b/support/testing/tests/core/test_bad_arch.py
> index 316231e28e..c96a7152af 100644
> --- a/support/testing/tests/core/test_bad_arch.py
> +++ b/support/testing/tests/core/test_bad_arch.py
> @@ -14,5 +14,5 @@ class DetectBadArchTest(infra.basetest.BRConfigTest):
>          if logf_path:
>              s = 'ERROR: architecture for "/usr/bin/foo" is'
>              with open(logf_path, "r") as f:
> -                lines = [l for l in f.readlines() if l.startswith(s)]
> +                lines = [line for line in f.readlines() if line.startswith(s)]
>              self.assertEqual(len(lines), 1)
> diff --git a/support/testing/tests/package/test_python_treq.py b/support/testing/tests/package/test_python_treq.py
> index d7a23829ea..307c9932b2 100644
> --- a/support/testing/tests/package/test_python_treq.py
> +++ b/support/testing/tests/package/test_python_treq.py
> @@ -7,7 +7,7 @@ class TestPythonTreq(TestPythonPackageBase):
>      def run_sample_scripts(self):
>          cmd = self.interpreter + " sample_python_treq.py"
>          output, exit_code = self.emulator.run(cmd, timeout=20)
> -        refuse_msgs = [1 for l in output if "Connection refused" in l]
> +        refuse_msgs = [1 for line in output if "Connection refused" in line]
>          self.assertGreater(sum(refuse_msgs), 0)
>          self.assertEqual(exit_code, 0)
>  
> diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
> index db62a84391..d22f38cedc 100644
> --- a/support/testing/tests/toolchain/test_external.py
> +++ b/support/testing/tests/toolchain/test_external.py
> @@ -27,7 +27,7 @@ class TestExternalToolchain(infra.basetest.BRTest):
>              self.assertFalse(has_broken_links(path))
>  
>          with open(os.path.join(self.builddir, ".config"), 'r') as configf:
> -            configlines = [l.strip() for l in configf.readlines()]
> +            configlines = [line.strip() for line in configf.readlines()]
>  
>          if "BR2_BINFMT_ELF=y" in configlines:
>              interp = infra.get_elf_prog_interpreter(self.builddir,
> -- 
> 2.31.1
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
