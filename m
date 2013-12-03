From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Tue, 3 Dec 2013 16:41:22 -0600
Subject: [Buildroot] Bug in the grub patches
In-Reply-To: <1386108927-12612-1-git-send-email-yann.morin.1998@free.fr>
References: <1386108927-12612-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <OFA9DEB6A7.487A9EC5-ON86257C36.007BBF5E-86257C36.007CA347@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It looks like since (nov30) 9b3904543ca04c5d5fe5f6974539eed376de2290 the 
grub pkg now fails when build on a x86_64 for a x86 target.  While using 
an external glibc codesourcery_x86 201209 toolchain.

stage2.c:941:7: warning: value computed is not used [-Wunused-value]
stage2.c:942:7: warning: passing argument 1 of 'grub_strcpy' from 
incompatible pointer type [enabled by default]
In file included from stage2.c:20:0:
./shared.h:891:7: note: expected 'char *' but argument is of type 'char 
**'
stage2.c:942:7: warning: passing argument 2 of 'grub_strcpy' from 
incompatible pointer type [enabled by default]
In file included from stage2.c:20:0:
./shared.h:891:7: note: expected 'const char *' but argument is of type 
'char **'
stage2.c:944:7: warning: passing argument 1 of 'grub_strcpy' from 
incompatible pointer type [enabled by default]
In file included from stage2.c:20:0:
./shared.h:891:7: note: expected 'char *' but argument is of type 'char 
**'
stage2.c:944:7: warning: passing argument 2 of 'grub_strcpy' from 
incompatible pointer type [enabled by default]
In file included from stage2.c:20:0:
./shared.h:891:7: note: expected 'const char *' but argument is of type 
'char **'
tparm.c: In function 'tparam_internal':
tparm.c:464:16: warning: cast to pointer from integer of different size 
[-Wint-to-pointer-cast]
smp-imps.c:273:36: warning: cast from pointer to integer of different size 
[-Wpointer-to-int-cast]
smp-imps.c:273:1: error: initializer element is not constant
smp-imps.c: In function 'get_checksum':
smp-imps.c:294:16: warning: cast to pointer from integer of different size 
[-Wint-to-pointer-cast]
smp-imps.c: In function 'boot_cpu':

<snip>

disk_io.c: In function 'set_bootdev':
disk_io.c:1149:11: warning: cast to pointer from integer of different size 
[-Wint-to-pointer-cast]
disk_io.c: In function 'grub_open':
disk_io.c:1587:7: warning: cast to pointer from integer of different size 
[-Wint-to-pointer-cast]
disk_io.c:1598:7: warning: cast to pointer from integer of different size 
[-Wint-to-pointer-cast]
disk_io.c: In function 'grub_read':
disk_io.c:1697:40: warning: cast to pointer from integer of different size 
[-Wint-to-pointer-cast]
disk_io.c:1708:16: warning: cast to pointer from integer of different size 
[-Wint-to-pointer-cast]
disk_io.c:1716:16: warning: cast to pointer from integer of different size 
[-Wint-to-pointer-cast]
disk_io.c: Assembler messages:
disk_io.c:134: Error: incorrect register `%rax' used with `l' suffix
make[3]: *** [pre_stage2_exec-disk_io.o] Error 1
make[3]: Leaving directory 
`/accts/mlweber1/proj/br-continuous/cfgs/30-fis-x86-glibc-ext/build/grub-0.97/stage2'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory 
`/accts/mlweber1/proj/br-continuous/cfgs/30-fis-x86-glibc-ext/build/grub-0.97'
make[1]: *** [all] Error 2
make[1]: Leaving directory 
`/accts/mlweber1/proj/br-continuous/cfgs/30-fis-x86-glibc-ext/build/grub-0.97'
make: *** 
[/accts/mlweber1/proj/br-continuous/cfgs/30-fis-x86-glibc-ext/build/grub-0.97/.stamp_built] 
Error 2
make: Leaving directory `/accts/mlweber1/proj/br-continuous/buildroot'

This last error looks like a 32 vs 64bit issue.

I'm guessing the build for x86 on a x86_64 patches introduced this, but I 
haven't made it through all recent grub updates yet.

Thanks,
Matt Weber
mlweber1 at rockwellcollins.com
