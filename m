From: Ruttmann <ruttmann@bartels.de>
Date: Wed, 18 Mar 2009 05:47:14 -0700 (PDT)
Subject: [Buildroot]  generating gdb for the target
Message-ID: <22556796.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,
i had some difficulties in using the GDB on the target. The first message
was "Sorry Dave, i can't do that, unknown symbol format elf32-i386"
After some research i found the advice that the readelf.o object is missing,
so the debugger isn't able to read the object file.
In the gdb/config.log i found the test "checking for ELF support in BFD"
which fails because of an unresolved symbol to __lxstat in libiberty.

The base problem was the library include order: the gdb want's to link
against it's own libiberty.a but the order is
<buildroot>/build_i386/staging_dir/lib
<buildroot>/build_i386/staging_dir/usr/lib
../bfd
../libiberty
so the libiberty.a from <buildroot>/build_i386/staging_dir/usr/lib is used
which is linked against the libc of the host system.

After moving the local directories before the staging directories by
modifying the <buildroot>/toolchain_build_i386/gdb-6.8/gdb/configure, the
"checking for ELF support in BFD" was successful, the readelf.o was included
and gdb works like a dream on the target.

Hope this helps someone, maybe the gdb developers can change the library
order or the buildroot team can create a patch to do that.
-- 
View this message in context: http://www.nabble.com/generating-gdb-for-the-target-tp22556796p22556796.html
Sent from the BuildRoot mailing list archive at Nabble.com.
