From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 2 Jul 2013 12:04:35 +0100
Subject: [Buildroot] [PATCH] Makefile: Symlink lib32 to lib for
	MIPS64/n32
In-Reply-To: <51D26C51.8070108@mind.be>
References: <1372675884-963-1-git-send-email-markos.chandras@gmail.com>
 <51D26C51.8070108@mind.be>
Message-ID: <CAG2jQ8irfbxmye7Kf+t=FwSrA=aOVRm6WmP627D-r9ZcQJ1uzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 2 July 2013 06:59, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07/01/13 12:51, Markos Chandras wrote:
>>
>> From: Markos Chandras <markos.chandras@imgtec.com>
>>
>> gcc hardcodes the uClibc interpreter for MIPS64/n32 as follows:
>> (gcc-4.7.3, gcc/config/mips/linux64.h):
>> define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
>>
>> However, buildroot always creates the $(TARGET_DIR)/lib and
>> $(TARGET_DIR)/usr/lib directories, therefore for consinstency
>> reasons, we create a lib32->lib symlink to fix the interpreter
>> problems for MIPS64/n32.
>
>
>  I would say we do it for all 32-bit platforms. If people feel they can't
> afford the overhead of two additional inodes in their rootfs, they can still
> remove the link in a post-build script.

I wouldn't mind doing the symlink for the following architectures:

!mips64/n64 && !x86_64 && !sparc64. It's probably harmless.
Do I forget another architecture?

>> +ifeq ($(BR2_MIPS_NABI32),y)
>> +       pushd $(TARGET_DIR) > /dev/null 2>&1; \
>> +               ln -sfn lib lib32; \
>> +               ln -sfn lib usr/lib32; \
>
>
>  No need for the pushd/popd; just:
>
>         ln -sfn lib $(TARGET_DIR)/lib32
>         ln -sfn lib $(TARGET_DIR)/usr/lib32
>

Thanks. I will fix that in v2

--
Regards,
Markos Chandras
