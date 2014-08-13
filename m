From: yuvaraj.patil at wipro.com <yuvaraj.patil@wipro.com>
Date: Wed, 13 Aug 2014 08:33:30 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140813101514.384e1435@free-electrons.com>
References: <20140813063010.CD21010118A@stock.ovh.net>
 <20140813101514.384e1435@free-electrons.com>
Message-ID: <C89D20716E201D428CB114157FC1F4E380F2C035@BLR-SJP-MBX-1.wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

>>       bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/d06ebe23cfdd1130e68c8e67c7aafee94dc7361d/
> libiconv issue.

I am not able to reproduce this issue ( I cloned the latest buildroot mainline and build).

Thanks
Yuvaraj Patil

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Thomas Petazzoni
Sent: Wednesday, August 13, 2014 1:45 PM
To: buildroot at uclibc.org; Nathaniel Roach; Fran?ois Perrad; Gustavo Zacarias
Subject: [Buildroot] Analysis of build failures

Hello,

On Wed, 13 Aug 2014 08:30:10 +0200 (CEST), Thomas Petazzoni wrote:

>        arm |     bandwidthd-v2.0.1-auto-r07 | NOK | http://autobuild.buildroot.net/results/024fadb7a8983c0ed35e8a098cfefccd25b3ecd0/
>        arm |     bandwidthd-v2.0.1-auto-r07 | NOK | http://autobuild.buildroot.net/results/b84759b4b2b4473386fb209b6b4d4e18e203ec17/
>        arm |     bandwidthd-v2.0.1-auto-r07 | NOK | http://autobuild.buildroot.net/results/e287acf032330c7b0ef4262e7eb365ca45382221/
>        arm |     bandwidthd-v2.0.1-auto-r07 | NOK | http://autobuild.buildroot.net/results/4ae2406feb33eb81b45bcf87c74f62290bbe00fe/

Nathaniel, you're the one who contributed bandwidthd. Can you look at the above build issues?

>       bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/d06ebe23cfdd1130e68c8e67c7aafee94dc7361d/

libiconv issue.

>        arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/df6a24a38daca37bf9c39c7433bf9ccdbb1cd59c/
>        arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/e9ea4f1ac8c4cac3373265ffe6d02a70103fa061/
>        arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/991084a6e188acec47b0545475a3010d8a8f6a57/
>        sh4 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/6734897dc8a86a770dcbc8bd9e231c4407b2c3a8/
>    powerpc |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/bb48fe8347a86de9d2d59c44d24dc88c87103c81/
>        arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/08ee72809a4ce2e4b451a299dd24582d05224967/
> microblazeel |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/252a7858a85555e4e276744128aa015cafd7f252/
>    powerpc |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/d112a15d70ba0e253e96fe9e11122fbe57b1e365/

Don't bother look at this one: it's /dev/shm not mounted in the autobuilders. I fixed this problem manually some time ago, but the autobuilder server was rebooted a few days ago, and therefore /dev/shm is not mounted. I need to fix my scripts.

>        arm |                 keyutils-1.5.5 | NOK | http://autobuild.buildroot.net/results/d432983faeec51ac59343714178b84f00b11e705/

Tries to build a shared library in a BR2_PREFER_STATIC_LIB=y build.

>       sh4a |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/10f5acf7b6aab1d5de6dcd73192ab964b15d7f93/

When linking against libcrypto.a, forgets to pass -ldl.

>       bfin |                  libebml-1.2.2 | NOK | http://autobuild.buildroot.net/results/1c75b276b7ed9683ddf3ec35cc3ccf66f69b00c5/

Tries to build a shared library in a pure static context (bfin-uclinux).

>     mipsel | ltrace-0896ce554f80afdcba81... | NOK | 
> http://autobuild.buildroot.net/results/09f9b2c8a8f21bfd53628d813b62f01
> 95aa686c6/

Problem known and already reported upstream by Vicente.

>        arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/94fbaeb1cf72671b50f52cf25e7003ed41d070e6/

Known compiler issue, I need to add an exception to the autobuilders.

>        arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/e466773fbfce77ac8e89150b96620607e045cf13/

This has been causing a good number of build issues. Fran?ois, is there something we can do to fix this?

>       bfin |                procps-ng-3.3.9 | NOK | http://autobuild.buildroot.net/results/f24aa16857e91fb6b03f9ac7ab0442fedcab8546/

Patch sent by Yuvaraj Patil <yuvaraj.patil@wipro.com>.

>      nios2 |                 rtorrent-0.9.3 | NOK | http://autobuild.buildroot.net/results/d27ca54295d5757d7c935a2c3d90c64ed81d6d32/

fallocate64() issue. We need to disable rtorrent on NIOS II for now, it seems.

>       bfin |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/3e16d8c9ae3b77393e082c3dd9b7b3de9aa040c0/

Patch sent by Yuvaraj Patil <yuvaraj.patil@wipro.com>.

>        arm |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/4662d63c69d244174b431c2e8615a65e0c7b7828/

Unusual issue, seems really specific to Thrift. Gustavo, maybe?

Thanks,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com _______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
