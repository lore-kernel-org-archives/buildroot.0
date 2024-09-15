Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09643C35FE1
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 01:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98E1284331;
	Sun, 15 Sep 2024 01:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GT_PyHclJae5; Sun, 15 Sep 2024 01:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BBBF84360
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BBBF84360;
	Sun, 15 Sep 2024 01:24:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 718A51BF28F
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 01:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6112684360
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 01:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyna1XGeuA9Y for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 01:24:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59CCE84331
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59CCE84331
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59CCE84331
 for <buildroot@busybox.net>; Sun, 15 Sep 2024 01:24:57 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1spe0U-0006KB-CB
 for buildroot@busybox.net; Sun, 15 Sep 2024 03:24:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sun, 15 Sep 2024 01:24:46 -0000 (UTC)
Message-ID: <vc5d0u$n98$1@ciao.gmane.io>
References: <vc23rg$llm$1@ciao.gmane.io> <20240914094334.1228db8e@windsurf>
User-Agent: slrn/1.0.3 (Linux)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: Re: [Buildroot] Upgrading buildroot and rootfs/kernel compatibility
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
Cc: buildroot@uclibc.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024-09-14, Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

>>    With the linaro-7.3.1-2018.05 toolchain, the rootfs builds cleanly
>>    and the resulting image appears to work, though it's about 20%
>>    larger than before with the same set of packages selected.  Is that
>>    sort of size increase typical? (I know, it depends on the
>>    packages.)
>
> A 20% increase obviously seems like a lot. Is this only with this
> toolchain, or also with the ARM 13.2 toolchain above?

I don't have detailed size info for the ARM toolchain (yet), but I've
gathered some data for the three Linaro toolchain cases:

 * 2020.02.07  linaro-6.3.1-2017.02
 * 2020.02.06  linaro-7.3.1-2018.05
 * 2024.02.06  linaro-7.3.1-2018.05

 $ du -s target-2020-old target-2020-new target-2024
 13060       target-2020-old
 13304       target-2020-new
 17048       target-2024

Looking at the individual file sizes for the BR 2020 builds, most of
them shrank when switching from gcc 6.3.1 to 7.3.1:

File                                                    6.3.1      7.3.1   Diff
-------------------------------------                  ------     ------   ----
bin/busybox                                            740624     740328    -0%
....
lib/libm-2.23.so                                       431620     439712     2%
lib/libnsl-2.23.so                                      63364      55072   -13%
lib/libnss_dns-2.23.so                                  22060      13760   -38%
lib/libnss_files-2.23.so                                34412      30232   -12%
lib/libpthread-2.23.so                                 115588     106716    -8%
lib/libresolv-2.23.so                                   63216      50868   -20%
lib/librt-2.23.so                                       30676      22388   -27%
....
usr/bin/nano                                           115028     112492    -2%
usr/bin/opkg                                            21364      18764   -12%
usr/bin/opkg-check-config                                1887       1887     0%
usr/bin/rz                                              48708      44316    -9%
usr/bin/scp                                             91660      83420    -9%
usr/bin/sftp                                           132720     124480    -6%
usr/bin/ssh                                            612140     599804    -2%
....
usr/lib/libform.so.6.1                                  48180      43076   -11%
usr/lib/libjson-c.so.5.1.0                              54192      46788   -14%
usr/lib/libmbedcrypto.so.2.16.8                        303460     290352    -4%
usr/lib/libmbedtls.so.2.16.8                           168340     161876    -4%
usr/lib/libmbedx509.so.2.16.8                          113080     108312    -4%
usr/lib/libmenu.so.6.1                                  28364      22076   -22%
usr/lib/libncurses.so.6.1                              214100     208344    -3%
usr/lib/libopkg.so.1.0.0                               151340     143260    -5%
usr/lib/libpanel.so.6.1                                 17388       9412   -46%
usr/lib/libssl.so.1.1                                  413112     403644    -2%
usr/lib/libz.so.1.2.11                                  77900      71188    -9%

However, the additon of two new files (below) when using 7.3.1 more
than offset those file size decreases so that the total size of the
target filesystem is larger when switching from 6.3.1 to 7.3.1.

lib/libgfortran.so.4.0.0                                          502652
lib/libgomp.so.1.0.0                                              120768

Why those two new library files appeared when switching toolchains is
another question...


When switching from BR 2020 to BR 2024 (both usng linaro 7.3.1), the
size increases from 13304k to 17048k (+28%). Almost all compiled files
are larger. But, none of the packages are the same version in the 2020
and 2024 builds.  I assume some of the size increase is due to new
protocols, features, etc.  Size never decreases as the version
increases.

It would be interesting to add a couple packages that are the same
version in 2020 and 2024 to see what the difference is betwewn -Os and
-O2.  Or is it easy to change that flag in the 2024 build to match the
2020 build?


File                                                   BR2020     BR2024   Diff
-------------------------------------                  ------     ------   ----

bin/busybox                                            740328     853668    15%
....
usr/bin/nano                                           112492     140876    25%
usr/bin/opkg                                            18764      18588    -1%
usr/bin/opkg-check-config                                1887       1887     0%
usr/bin/rz                                              44316      60344    36%
usr/bin/scp                                             83420     185940   123%
usr/bin/sftp                                           124480     194112    56%
usr/bin/ssh                                            599804     812788    36%
usr/bin/ssh-add                                        280000     361936    29%
usr/bin/ssh-agent                                      267720     349640    31%
usr/bin/ssh-copy-id                                     10658      13078    23%
usr/bin/ssh-keygen                                     362028     476692    32%
usr/bin/ssh-keyscan                                    345636     427600    24%
usr/bin/sz                                              48424      68548    42%
usr/lib/libarchive.so.13.4.2                           531864     615740    16%
usr/lib/libcrypto.so.1.1                              1915160    3221128    68%
usr/lib/libform.so.6.1                                  43076      46832     9%
usr/lib/libjson-c.so.5.1.0                              46788      54728    17%
usr/lib/libmbedcrypto.so.2.16.8                        290352     374116    29%
usr/lib/libmbedtls.so.2.16.8                           161876     177360    10%
usr/lib/libmbedx509.so.2.16.8                          108312     111892     3%
usr/lib/libmenu.so.6.1                                  22076      25928    17%
usr/lib/libncurses.so.6.1                              208344     264020    27%
usr/lib/libopkg.so.1.0.0                               143260     174528    22%
usr/lib/libpanel.so.6.1                                  9412       9324    -1%
usr/lib/libssl.so.1.1                                  403644     762852    89%
usr/lib/libz.so.1.2.11                                  71188      79164    11%
....
usr/sbin/flash_erase                                    26096      38260    47%
usr/sbin/flash_lock                                      9596      34160   256%
usr/sbin/flash_unlock                                    9600      34164   256%
usr/sbin/flashcp                                         9632      38264   297%
usr/sbin/mtd_debug                                       9640      38256   297%
usr/sbin/mtdinfo                                        34292      42352    24%
usr/sbin/nanddump                                       30196      38260    27%
usr/sbin/nandtest                                        9636      13680    42%
usr/sbin/nandwrite                                      30192      42356    40%
usr/sbin/sshd                                          632696     845796    34%
usr/sbin/ubiattach                                      22016      50568   130%
usr/sbin/ubiblock                                       17868      21872    22%
usr/sbin/ubicrc32                                        9612       9584    -0%
usr/sbin/ubidetach                                      21984      25984    18%
usr/sbin/ubiformat                                      54868      71088    30%
usr/sbin/ubihealthd                                                21880
usr/sbin/ubimkvol                                       22036      50584   130%
usr/sbin/ubinfo                                         26108      54660   109%
usr/sbin/ubinize                                        26156      58784   125%
usr/sbin/ubirename                                      17852      21820    22%
usr/sbin/ubirmvol                                       17884      25980    45%
usr/sbin/ubirsvol                                       22028      50576   130%





_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
