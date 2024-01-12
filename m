Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6EAC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 18:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CDC160B38;
	Fri, 12 Jan 2024 18:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CDC160B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpSjN16s04sl; Fri, 12 Jan 2024 18:41:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C99A60BE3;
	Fri, 12 Jan 2024 18:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C99A60BE3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60CDA1BF83B
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3213440108
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3213440108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lzz1q5pObpDK for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 18:41:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 806A74037C
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 18:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 806A74037C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B648C0002;
 Fri, 12 Jan 2024 18:41:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOMT7-00CCIQ-1H;
 Fri, 12 Jan 2024 19:41:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
References: <20240105191710.1330461-1-abrodkin@synopsys.com>
Date: Fri, 12 Jan 2024 19:41:25 +0100
In-Reply-To: <20240105191710.1330461-1-abrodkin@synopsys.com> (Alexey Brodkin
 via buildroot's message of "Fri, 5 Jan 2024 11:17:10 -0800")
Message-ID: <8734v2xulm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] arch: Set max/common-page-size for
 libgcc & libstdc++
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Isaev <VVIsaev@gmail.com>, Pavel Kozlov <Pavel.Kozlov@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Alexey" == Alexey Brodkin via buildroot <buildroot@buildroot.org> writes:

 > With [1], [2] & [3] we made sure Buildroot packages get built with
 > proper MMU page size assumed. This was done nicely through insertion of
 > required flags into the toolchain wrapper so that there's no need to
 > pass these flags to each and every package separately - toolchain
 > wrapper used for real building has all set internally and so proper
 > flags are impleicitly used.

 > But there's yet another corner case which is not handled that way -
 > these are binaries or rather libraries which are being used as a part of
 > GCC compilation: libgcc_s.so.1 and libstdc++.so.

 > And so to make sure both the libraries get built properly we need to set
 > TARGET_CFLAGS (cures libgcc_s.so) & TARGET_LDFLAGS (cures libstdc++.so).

 > In case of ARM by defaut 64 KiB page size seems to be used, as w/o that
 > patch I see the following for BR2_ARM64_PAGE_SIZE_4K=y:
 ---------------------------> 8----------------------------
 > $ ./output/host/bin/aarch64-linux-readelf -l ./output/target/lib/libgcc_s.so.1

 > Elf file type is DYN (Shared object file)
 > Entry point 0x0
 > There are 6 program headers, starting at offset 64

 > Program Headers:
 >   Type           Offset             VirtAddr           PhysAddr
 >                  FileSiz            MemSiz              Flags  Align
 >   LOAD           0x0000000000000000 0x0000000000000000 0x0000000000000000
 >                  0x0000000000013d1c 0x0000000000013d1c  R E    0x10000
 >   LOAD           0x000000000001fd98 0x000000000002fd98 0x000000000002fd98
 >                  0x0000000000000438 0x00000000000005c8  RW     0x10000
 >   DYNAMIC        0x000000000001fdb8 0x000000000002fdb8 0x000000000002fdb8
 >                  0x0000000000000200 0x0000000000000200  RW     0x8

 > $ ./output/host/bin/aarch64-linux-readelf -l ./output/target/usr/lib/libstdc++.so.6.0.32

 > Elf file type is DYN (Shared object file)
 > Entry point 0x0
 > There are 7 program headers, starting at offset 64

 > Program Headers:
 >   Type           Offset             VirtAddr           PhysAddr
 >                  FileSiz            MemSiz              Flags  Align
 >   LOAD           0x0000000000000000 0x0000000000000000 0x0000000000000000
 >                  0x00000000001d3462 0x00000000001d3462  R E    0x10000
 >   LOAD           0x00000000001d5760 0x00000000001e5760 0x00000000001e5760
 >                  0x000000000000e528 0x0000000000012de8  RW     0x10000
 >   DYNAMIC        0x00000000001deef0 0x00000000001eeef0 0x00000000001eeef0
 >                  0x0000000000000240 0x0000000000000240  RW     0x8
 ---------------------------> 8----------------------------

 > Note alignment of 0x10000 in sections marked for loading.
 > And with the patch applied we get expected alignment of 0x1000 (4 KiB):
 ---------------------------> 8----------------------------
 > $ ./output/host/bin/aarch64-linux-readelf -l ./output/target/lib/libgcc_s.so.1

 > Elf file type is DYN (Shared object file)
 > Entry point 0x0
 > There are 6 program headers, starting at offset 64

 > Program Headers:
 >   Type           Offset             VirtAddr           PhysAddr
 >                  FileSiz            MemSiz              Flags  Align
 >   LOAD           0x0000000000000000 0x0000000000000000 0x0000000000000000
 >                  0x0000000000013d1c 0x0000000000013d1c  R E    0x1000
 >   LOAD           0x0000000000013d98 0x0000000000014d98 0x0000000000014d98
 >                  0x0000000000000438 0x00000000000005c8  RW     0x1000
 >   DYNAMIC        0x0000000000013db8 0x0000000000014db8 0x0000000000014db8
 >                  0x0000000000000200 0x0000000000000200  RW     0x8

 > $ ./output/host/bin/aarch64-linux-readelf -l ./output/target/usr/lib/libstdc++.so.6.0.32

 > Elf file type is DYN (Shared object file)
 > Entry point 0x0
 > There are 7 program headers, starting at offset 64

 > Program Headers:
 >   Type           Offset             VirtAddr           PhysAddr
 >                  FileSiz            MemSiz              Flags  Align
 >   LOAD           0x0000000000000000 0x0000000000000000 0x0000000000000000
 >                  0x00000000001d3462 0x00000000001d3462  R E    0x1000
 >   LOAD           0x00000000001d3760 0x00000000001d4760 0x00000000001d4760
 >                  0x000000000000e528 0x0000000000012de8  RW     0x1000
 >   DYNAMIC        0x00000000001dcef0 0x00000000001ddef0 0x00000000001ddef0
 >                  0x0000000000000240 0x0000000000000240  RW     0x8
 ---------------------------> 8----------------------------

 > What's nice, we're getting rid of a special handling of "-matomic"
 > as it's already a part of ARCH_TOOLCHAIN_WRAPPER_OPTS.

 > [1] https://git.buildroot.net/buildroot/commit/?id=3cc2c6d19ab2e1bb4634f26f9318da9b07df5fff
 > [2] https://git.buildroot.net/buildroot/commit/?id=dcb74db89e74e512e36b32cea6f574a1a1ca84c4
 > [3] https://git.buildroot.net/buildroot/commit/?id=5e52c28397b79f8c4c99552217cbe95202166626

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Signed-off-by: Vladimir Isaev <VVIsaev@gmail.com>
 > Signed-off-by: Pavel Kozlov <kozlov@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > ---

 > Changes in v2:

 >  * Instead of setting TARGET_{C|LD}FLAGS use
 >    ARCH_TOOLCHAIN_WRAPPER_OPTS for configuring GCC.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
