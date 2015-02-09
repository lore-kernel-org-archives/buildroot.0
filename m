From: Steve Kenton <skenton@ou.edu>
Date: Mon, 09 Feb 2015 11:50:40 -0600
Subject: [Buildroot] glibc  (and uClibc) and locale
In-Reply-To: <54D8C639.8080208@ou.edu>
References: <54D7F4F8.3040005@ou.edu>
 <20150209080931.147fac1c@free-electrons.com> <54D8C639.8080208@ou.edu>
Message-ID: <54D8F370.20003@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/09/2015 08:37 AM, Steve Kenton wrote:
>> This looks ok, but I am wondering how that would be done with the
>> uClibc and musl C libraries. Remember that we support three different C
>> libraries, so when we're doing a change to one of them, we always need
>> to check what needs to be done for the two other ones.
> OK, I'll take a look at the other two.

The locale program source for uClibc is in extra/local/programs/locale.c

However, attempting to build it the obvious way adding another line to the build
commands in the .mk file does not work

define UCLIBC_BUILD_CMDS
	$(UCLIBC_MAKE) -C $(@D) $(UCLIBC_MAKE_FLAGS) headers
	$(UCLIBC_MAKE) -C $(@D) $(UCLIBC_MAKE_FLAGS)
+	$(UCLIBC_MAKE) -C $(@D) $(UCLIBC_MAKE_FLAGS) extra/locale/programs/locale
	$(MAKE) -C $(@D)/utils \
		PREFIX=$(HOST_DIR) \
		HOSTCC="$(HOSTCC)" hostutils
endef

It gets a build error because of the TARGET_ABI (i386 in this example) inserted by the UCLIBC_MAKE_FLAGS
immediately before i386 extra/locale/programs/locale.c on the gcc command.

Could someone familiar with the uClibc build process give me a pointer how to proceed?

Thanks,

Steve Kenton


UCLIBC_MAKE_FLAGS = \
	ARCH="$(UCLIBC_TARGET_ARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS) $(TARGET_ABI)" \
	HOSTCC="$(HOSTCC)"

steve at Cube:/data/bcdist/test/buildroot-2015.02-rc1/output/build/uclibc-0.9.33.2$ make -n extra/locale/programs/locale
/data/bcdist/test/buildroot-2015.02-rc1/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc -include ./include/libc-symbols.h -Wall -Wstrict-prototypes -Wstrict-aliasing -funsigned-char -fno-builtin -fno-asm -std=gnu99 -m32 -march=i586
-fno-stack-protector -nostdinc -I./include -I./include -I. -I./libc/sysdeps/linux -I./libc/sysdeps/linux/i386  -Os -funit-at-a-time -fmerge-all-constants -fstrict-aliasing -fno-tree-loop-optimize -fno-tree-dominator-opts -fno-strength-reduce
-fomit-frame-pointer -m32 -mpreferred-stack-boundary=2 -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -DHAVE_FORCED_UNWIND -I./libpthread/nptl -I./libpthread/nptl -I./libpthread/nptl/sysdeps/unix/sysv/linux/i386/i586
-I./libpthread/nptl/sysdeps/unix/sysv/linux/i386 -I./libpthread/nptl/sysdeps/i386 -I./libpthread/nptl/sysdeps/i386 -I./libpthread/nptl/sysdeps/unix/sysv/linux -I./libpthread/nptl/sysdeps/unix/sysv/linux -I./libpthread/nptl/sysdeps/pthread
-I./libpthread/nptl/sysdeps/pthread/bits -I./libpthread/nptl/sysdeps/generic -I./ldso/ldso/i386 -I./ldso/include -I./libc/sysdeps/linux/common -I/data/bcdist/test/buildroot-2015.02-rc1/output/build/linux-headers-3.18.6/usr/include/ -isystem
/data/bcdist/test/buildroot-2015.02-rc1/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/4.8.4/include-fixed -isystem /data/bcdist/test/buildroot-2015.02-rc1/output/host/usr/lib/gcc/i586-buildroot-linux-uclibc/4.8.4/include -DNDEBUG
-D__USE_STDIO_FUTEXES__  -Wl,-EL -Wl,--sort-common -Wl,--sort-section=alignment -m32 -shared -Wl,--warn-common -Wl,--warn-once -Wl,-z,combreloc -Wl,-z,relro -Wl,-z,now -Wl,-z,defs  i386 extra/locale/programs/locale.c   -o extra/locale/programs/locale
steve at Cube:/data/bcdist/test/buildroot-2015.02-rc1/output/build/uclibc-0.9.33.2$
