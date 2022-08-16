Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727EDC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 16:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B52819F3;
	Tue, 16 Aug 2022 16:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8B52819F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-frL7HDvl8l; Tue, 16 Aug 2022 16:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC35823C6;
	Tue, 16 Aug 2022 16:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC35823C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCFD91BF392
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 16:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 980EB823C6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 16:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 980EB823C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQCRTYhnoQyi for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 16:14:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB43481489
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB43481489
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 16:14:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e933:8a8a:6743:9483])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 90126780502;
 Tue, 16 Aug 2022 18:14:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 16 Aug 2022 18:14:10 +0200
Date: Tue, 16 Aug 2022 18:14:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220816161410.GP2775145@scaer>
References: <20220815204732.2220880-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815204732.2220880-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660666453;
 bh=paffYzxmV2R6pHrxqnGhQcYvB+n8NJs9PVlxcnlgv2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aXScg7rUIg/0PdSOzh1D9obG8g3Q5cFMZuBWFBJH1ihOZsHn7pYNCY38Dj1mCpBv7
 VwJ2mgFOKrpSPqkeQqvSsOf8kPZ0wCnkSaTxklmUeZr52gE5oCVJxiA4lxUaBtlEdC
 Bzxa8wldUJ0vr7B2I9Gf90dI4hJcp+7Hqjy11LX0KsNvczdmaiiQRuWlZVr5f960e+
 nCuC2igeY5zjl0ckj05lurJ+Md8YfBdITktBGycJVmxMCvYs+A6LugVdLaRlVl65/r
 nDCkxjVHcvrtKTOIwCi8nO+OzOdWYHocdru48noLPQ9qV2fCtAPiEyYb/o8XSuiMBv
 qCu2TY2pbHGsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aXScg7rU
Subject: Re: [Buildroot] [PATCH] support/testing/tests/fs/test_f2fs: fix
 test after f2fs-tools bump
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-15 22:47 +0200, Thomas Petazzoni via buildroot spake thusly:
> In commit
> 9267b0f14d3d5f4715bad444f44eae47d9d5627c ("package/f2fs-tools: bump to
> version 1.15.0"), f2fs-tools was bumped from 1.14.0 to 1.15.0.
> 
> It turns out that this version bump causes the output of dump.f2fs to
> slightly change.
> 
> In version 1.14.0, it looked like this:
> 
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: sector size = 512
> Info: total sectors = 262144 (128 MB)
> Info: MKFS version
>   "Linux version 5.4.0-124-generic (buildd@lcy02-amd64-089) (gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)) #140-Ubuntu SMP Thu Aug 4 02:23:37 UTC 2022"
> Info: FSCK version
>   from "Linux version 5.4.0-124-generic (buildd@lcy02-amd64-089) (gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)) #140-Ubuntu SMP Thu Aug 4 02:23:37 UTC 20
> 22"
>     to "Linux version 5.4.0-124-generic (buildd@lcy02-amd64-089) (gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)) #140-Ubuntu SMP Thu Aug 4 02:23:37 UTC 20
> 22"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: total FS sectors = 262144 (128 MB)
> Info: CKPT version = 70c101c3
> Info: checkpoint state = 181 :  trimmed nat_bits unmount
> 
> In version 1.15.0, it looked like this:
> 
> Info: MKFS version
>   "Linux version 5.4.0-124-generic (buildd@lcy02-amd64-089) (gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)) #140-Ubuntu SMP Thu Aug 4 02:23:37 UTC 2022"
> Info: FSCK version
>   from "Linux version 5.4.0-124-generic (buildd@lcy02-amd64-089) (gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)) #140-Ubuntu SMP Thu Aug 4 02:23:37 UTC 20
> 22"
>     to "Linux version 5.4.0-124-generic (buildd@lcy02-amd64-089) (gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)) #140-Ubuntu SMP Thu Aug 4 02:23:37 UTC 20
> 22"
> Info: superblock features = 0 :
> Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
> Info: Segments per section = 1
> Info: Sections per zone = 1
> Info: total FS sectors = 262144 (128 MB)
> Info: CKPT version = b89f8bb
> Info: checkpoint state = 181 :  trimmed nat_bits unmount
> 
> You will notice that the message "Info: total sectors = 262144 (128
> MB)" is no longer present, and only "Info: total FS sectors =
> 262144 (128 MB)" is not present.

OK, sneaky, sneaky, and I missed fixing the 'not' in that last
sentence...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Except our test case was precisely looking for this "Info: total
> sectors" string in the output, causing the test to fail.
> 
> We fix this by simply matching on "Info: total FS sectors" now.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/2884634814
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/testing/tests/fs/test_f2fs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
> index 2d05a86418..425fbe31ca 100644
> --- a/support/testing/tests/fs/test_f2fs.py
> +++ b/support/testing/tests/fs/test_f2fs.py
> @@ -30,7 +30,7 @@ class TestF2FS(infra.basetest.BRTest):
>          img = os.path.join(self.builddir, "images", "rootfs.f2fs")
>          out = infra.run_cmd_on_host(self.builddir, ["host/sbin/dump.f2fs", img])
>          out = out.splitlines()
> -        prop = dumpf2fs_getprop(out, "Info: total sectors")
> +        prop = dumpf2fs_getprop(out, "Info: total FS sectors")
>          self.assertEqual(prop, "262144 (128 MB)")
>  
>          kernel = os.path.join(self.builddir, "images", "zImage")
> -- 
> 2.37.2
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
