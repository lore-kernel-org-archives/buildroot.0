From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 20 Oct 2018 17:22:58 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <996f7ba6-2a05-8a81-f3f8-75b179d40cd6@micronovasrl.com>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
 <996f7ba6-2a05-8a81-f3f8-75b179d40cd6@micronovasrl.com>
Message-ID: <9516634f-0d95-0edc-9cd6-80a6b0e4e1df@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 11/10/2018 13:02, Giulio Benetti ha scritto:
> Hello everybody,
> 
> Il 10/10/2018 17:48, Thomas Petazzoni ha scritto:
>>>        powerpc |           motion-release-4.1.1 | NOK | http://autobuild.buildroot.net/results/78061b61cfe3f42554a475c048d54dacacfe11d5 |
>>
>>
>> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libavutil.a(hwcontext_drm.o): In function `drm_device_create':
>> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/build/ffmpeg-3.4.4/libavutil/hwcontext_drm.c:50: undefined reference to `drmGetVersion'
>> /home/rclinux/rc-buildroot-test/scripts/instance-0/output/build/ffmpeg-3.4.4/libavutil/hwcontext_drm.c:63: undefined reference to `drmFreeVersion'
>>
>> Giulio, I believe you worked on this static linking problem between
>> ffmpeg and libdrm. What is the status of this ?

I've managed to fix it, I've submitted the patch:
https://patchwork.ozlabs.org/patch/985375/

Previous patch I've submitted was wrong, causing -ldrm to be linked both 
in static and shared build, because of adding -ldrm to Libs: instead of 
Libs.private in libavutil.pc.
But it's been upstreamed:
https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/c50dc77ac708e98d02da7c422a6b9cbf9f565aa5

After that I've tried to send a Revert:
https://patchwork.ffmpeg.org/patch/10696/
and re-submit this new patch:
https://patchwork.ffmpeg.org/patch/10697/
but they don't accept it:
http://ffmpeg.org/pipermail/ffmpeg-devel/2018-October/235283.html

I understand they only need a patch to improve the previous one, not the 
entire patch I've submitted to Buildroot.

Anyway, is it correct I've submitted a unique patch(the first I've 
listed) to Buildroot?

Otherwise I should submit 2 patches, the one already upstreamed:
https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/c50dc77ac708e98d02da7c422a6b9cbf9f565aa5
and the correction of it that I still have to send them.

Which is the better choice?
1 patch specific for Buildroot
or
2 patches, 1 already upstreamed and another to be upstreamed?

Sorry for my ignorance
Thanks in advance
Best Regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
