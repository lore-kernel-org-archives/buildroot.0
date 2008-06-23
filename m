From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 23 Jun 2008 16:41:32 +0200
Subject: [Buildroot] cris
In-Reply-To: <20080623130323.GB8920@mx.loc>
References: <485A3396.80701@cetrtapot.si> <87iqw5dyyb.fsf@macbook.be.48ers.dk>
	<20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
	<20080620125720.GE12682@mx.loc> <485BAFF8.8090604@cetrtapot.si>
	<20080620141152.GG12682@mx.loc> <485F507D.5070801@cetrtapot.si>
	<20080623130323.GB8920@mx.loc>
Message-ID: <485FB61C.7080403@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Mon, Jun 23, 2008 at 09:27:57AM +0200, Hinko Kocevar wrote:
>> Bernhard Fischer wrote:
> 
>>>> +ifeq ($(BR2_ARCH),"cris")
>>>> +	 cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/linux/user.h $(LINUX_HEADERS_DIR)/include/linux
>>>> +	 cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/asm-cris/user.h $(LINUX_HEADERS_DIR)/include/asm
>>>> +	 cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/asm-cris/elf.h $(LINUX_HEADERS_DIR)/include/asm
>>>> +	 cp -a $(LINUX_HEADERS_UNPACK_DIR)/include/asm-cris/arch-v10 $(LINUX_HEADERS_DIR)/include/asm/arch
>>>> +	 sed -i -e "/^#include <asm\/page\.h>/d" $(LINUX_HEADERS_DIR)/include/asm/user.h
>>> as you can see this wouldn't work for v8 and generally should be fixed
>>> in the kernel (also fails with 2.6.git).
>> This problem is because include/asm-cris/Kbuild does not include the correct headers when the kernel source is not configured. Both include/asm-cris/arch-vXX directories are left behind when install_headers goes through header-y target. 
>>
>> I'll let Axis people sort it out (if ever), till then I guess we are stuck with the hack..
> 
> Yes, we'd need to use a prepared kernel ("archprepare"), which means
> dropping the one from tool_build and setting one up early in project_.
> 
> I currently don't have time to do this properly, perhaps you want to
> give it a try?

The axis devs responded with the solution that does not rely on the CONFIG_ETRAX_ARCH_Vxx but instead includes arch-v10 and arch-v32 dirs in header-y target. I guess it is OK to do so, since we might need headers for v10 and/or v32 CPUs. The only catch would be to make correct symlink to the desired arch-vxx directory.


diff --git a/include/asm-cris/Kbuild b/include/asm-cris/Kbuild
index 1745545..d5b6319 100644
--- a/include/asm-cris/Kbuild
+++ b/include/asm-cris/Kbuild
@@ -1,7 +1,7 @@
 include include/asm-generic/Kbuild.asm
 
-header-$(CONFIG_ETRAX_ARCH_V10) += arch-v10/
-header-$(CONFIG_ETRAX_ARCH_V32) += arch-v32/
+header-y += arch-v10/
+header-y += arch-v32/
 
 header-y += ethernet.h
 header-y += rtc.h


I think it is the correct path to take, but will still try to work out the best solution with the Axis devs later on..

Regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
