From: Andy Gibbs <andyg1001@hotmail.co.uk>
Date: Thu, 8 Jul 2010 08:23:02 +0200
Subject: [Buildroot] Crosstool/Buildroot integration issue
References: <BLU0-SMTP11A24568AF672F1DE458A4E7B30@phx.gbl>
	<201007071919.28956.yann.morin.1998__5616.15332630954$1278523238$gmane$org@anciens.enib.fr>
Message-ID: <BLU0-SMTP268B0C7201ABD2237ED50CE7B40@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, July 07, 2010 7:19 PM, Yann E. MORIN wrote:

>> Crosstool generates character set libraries in the 
>> 'sys-root/usr/lib/gconv'
>
> There's no sysrot/usr/lib/gconv in my uClibc-based toolchain! :-P
>

Yes, it may just be part of a glibc/eglibc toolchain (gcc 4.4.4 / eglibc 
2.10 in my case).

>> folder, but these are not being copied across into the target folder when
>> all the other libraries are copied.  These means that certain 
>> applications
>> that rely on these libraries don't function correctly.  It's a simple two
>> line patch to the bottom of ext-tool.mk:
> [--SNIp--]
>> + $(Q)cp -dr $(ARCH_SYSROOT_DIR)/usr/lib/gconv $(TARGET_DIR)/usr/lib
>
> Well, I'd rather we had something like:
> - in menuconfig:
>    () Additional dirs to copy from sysroot
>      Help:
>        This is a space-separated list of paths that you want to copy
>        from the sysroot to the target. Make the paths relative to the
>        sysroot. Example:
>          /usr/lib/gconv /usr/include

I think this would be a perfect way of providing the solution.  Especially 
since, as you noted, it may be that different toolchains have different 
library dependencies.

> - and in ext-tool.mk (to replace your changes, above):
>  $(Q)for d in $(BR_EXT_TOOL_DIRS_EXTRA); do \
>        if [ -d "$(ARCH_SYSROOT_DIR)$${d}" ]; then
>          mkdir -p "$(TARGET_DIR)$${d}"
>          cp -a "$${d}/." "$(TARGET_DIR)${d}/."
>        else
>          echo "No such directory '$${d}' whiel trying to copy from 
> sysroot"
>        fi
>      done
>

Can I suggest that it exits the make process on failure to find the 
directory, not just print the warning?  The reason is that there are a lot 
of messages, and it is difficult often to spot a problem if the make process 
doesn't end where an error occurs.

Its the same with the kernel's make modules step in buildroot -- this can 
fail and the buildroot process continues, leaving the target folder without 
kernel modules!  (In this case it was failing because prior to the 'make 
modules', buildroot calls 'make prepare' rather than 'make modules_prepare', 
plus for some reason the linux make was not building the dependencies for 
the modules, requiring an extra 'make arch/powerpc/lib/' in my case). 
Again, I only mention this in case someone trawling this list with a similar 
problem can find a solution here!

Cheers, and thanks again for all the good work!!

Andy
