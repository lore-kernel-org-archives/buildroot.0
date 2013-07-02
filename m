From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 2 Jul 2013 14:36:51 +0100
Subject: [Buildroot] [PATCH] Makefile: Symlink lib32 to lib for
	MIPS64/n32
In-Reply-To: <51D26C51.8070108@mind.be>
References: <1372675884-963-1-git-send-email-markos.chandras@gmail.com>
 <51D26C51.8070108@mind.be>
Message-ID: <CAG2jQ8j2iucPz356Wkz8=xSOQ=QC2u_7ebZZimRhycBGu4_nvg@mail.gmail.com>
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
>

Is this preferred?

+ifeq ($(BR2_MIPS_NABI64)$(BR2_aarch64)$(BR2_sh64)$(BR2_x86_64),)
+       ln -sfn lib $(TARGET_DIR)/lib32; \
+               ln -sfn lib $(TARGET_DIR)/usr/lib32;
+endif

--
Regards,
Markos Chandras
