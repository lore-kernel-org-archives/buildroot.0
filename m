From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 5 Aug 2017 22:14:32 +0200
Subject: [Buildroot] [PATCH] gdb: add fix for gdb 7.12 and gdb 8.0 build
 on noMMU platforms
In-Reply-To: <20170805142342.027e1232@windsurf>
References: <20170803071548.2876-1-thomas.petazzoni@free-electrons.com>
 <4a2a10bc-9516-ddb6-b9b6-9c67038a8339@smile.fr>
 <20170805142342.027e1232@windsurf>
Message-ID: <e98b4eda-35ac-a83b-c49a-324b196eb9a9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 05/08/2017 ? 14:23, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Fri, 4 Aug 2017 22:43:26 +0200, Romain Naour wrote:
> 
>>> ../nat/linux-ptrace.c: In function 'int linux_fork_to_function(gdb_byte*, int (*)(void*))':
>>> ../nat/linux-ptrace.c:273:29: error: invalid conversion from 'void*' to 'gdb_byte* {aka unsigned char*}' [-fpermissive]
>>>        child_stack = xmalloc (STACK_SIZE * 4);
>>>
>>> The patch has already been merged upstream, as of commit
>>> ffce45d2243e5f52f411e314fc4e1a69f431a81f, and will therefore be part
>>> of future gdb releases.  
>>
>> What's the arch/config are you using?
> 
> This was happening on m68k Coldfire, if i remember correctly.
> 
>> It's seems no toolchain able to build gdb on noMMU case are present in the
>> autobuilder.
> 
> We have a m68k Coldfire configuration in the autobuilders. However, the
> pre-built toolchain is built without BR2_PTHREAD_DEBUG, and therefore
> the target gdb is never built because it depends on
> BR2_TOOLCHAIN_HAS_THREADS_DEBUG.

I got an error with gdbserver 8.0 with a m68k toolchain build today on master.

In file included from build-gnulib-gdbserver/import/stdint.h:556:0,
                 from ../common/common-defs.h:55,
                 from ../common/buffer.c:20:
/home/naourr/toolchains/nommu/host/m68k-buildroot-uclinux-uclibc/include/c++/6.4.0/cwchar:58:5:
erreur : conflicting declaration ? typedef struct rpl_mbstate_t rpl_mbstate_t ?
   } mbstate_t;
     ^
build-gnulib-gdbserver/import/wchar.h:486:13: note : previous declaration as
? typedef int rpl_mbstate_t ?
 typedef int rpl_mbstate_t;
             ^~~~~~~~~~~~~

The toolchain used the following defconfig:
BR2_m68k=y
BR2_m68k_cf5208=y
BR2_PTHREAD_DEBUG=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

gdbserver now require wchar support ?

Also I had to apply [1] to avoid the link issue when thread_db.h is included.

[1] http://patchwork.ozlabs.org/patch/798191/

Best regards,
Romain

> 
> Best regards,
> 
> Thomas
> 
