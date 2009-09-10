From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 10 Sep 2009 19:57:29 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <20090830110318.GD7953@mx.loc>
References: <BD79186B4FD85F4B8E60E381CAEE190901C550E7@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C55101@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C552DE@mi8nycmail19.Mi8.com>
	<20090825190153.GA29206@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901C55435@mi8nycmail19.Mi8.com>
	<87fxbemhjh.fsf@macbook.be.48ers.dk>
	<BD79186B4FD85F4B8E60E381CAEE190901C554E3@mi8nycmail19.Mi8.com>
	<20090827074957.GB19075@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901C558CA@mi8nycmail19.Mi8.com>
	<20090830110318.GD7953@mx.loc>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901CBED29@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Well, I spent the last three weeks trying to get the CodeSourcery G++ Lite
2009q1-203 multilib toolchain to work with buildroot.  I have reached the
end of what I can do to get it to work.

I'm in the process of building my own external toolchain with crosstool-ng.
Hopefully I will have better success with that.

I just wanted to summarize what I found trying to get this to work in case
someone else wants to figure out the issues.  Some of this may be a bit
wordy since I'm composing this from memory ;-).

---

1) The wrong library files get copied to the target directory.

The multilib toolchain has subdirectories for the various libraries that
it supports.  In the CodeSourcery 2009q1-203 case the supported systems
are:

	ARMv5T - Little-Endian, Soft-Float, GLIBC
	Command-line option(s): default
	Sysroot subdirectory: ./
	Dynamic linker: lib/ld-linux.so.3

	ARMv4T - Little-Endian, Soft-Float, GLIBC
	Command-line option(s): -march=armv4t
	Sysroot subdirectory: armv4t/
	Dynamic linker: lib/ld-linux.so.3

	ARMv7-A Thumb-2 - Little-Endian, Soft-Float, GLIBC
	Command-line option(s): -mthumb -march=armv7-a
	Sysroot subdirectory: thumb2/
	Dynamic linker: lib/ld-linux.so.3

The current external toolchain support calls the compiler with the -v option
and then greps out the --with-sysroot string to figure out where the
SYSROOT_DIR is located.  Unfortunately this directory is the location of the
default libraries that the compiler was created with.

To correctly get the location for the desired system libraries the compiler
can be called with the -print-sysroot option and the correct -march= option
for the system (~ is my home directory):

$ $ arm-none-linux-gnueabi-gcc -print-sysroot -march=armv4t
~/CodeSourcery/Sourcery_G++_Lite/bin/../arm-none-linux-gnueabi/libc
$ arm-none-linux-gnueabi-gcc -print-sysroot -march=armv4t
~/CodeSourcery/Sourcery_G++_Lite/bin/../arm-none-linux-gnueabi/libc/armv4t
$ arm-none-linux-gnueabi-gcc -print-sysroot -mthumb -march=armv7-a
~/CodeSourcery/Sourcery_G++_Lite/bin/../arm-none-linux-gnueabi/libc/thumb2

This gives the correct files for the target but I haven't figured out what
is needed to copy to the staging directory.  I think everything in the
sysroot needs to be copied but I haven't been able to get a bootable system
to work it all out.

2) A lot of the packages don't correctly use TARGET_CFLAGS as setup in
   package/Makefile.in.

This causes all sorts of problems.  The default libraries are for ARMv5T,
I need the -march=armv4t in order to correctly create code for my processor
(ep93xx).  Since the packages are not using the TARGET_CFLAGS the code
gets compiled then linked as armv5t which of course will not run correctly.

I was able to get the compiler to work correctly at one point but still had
problems with the linker.  I verified this by doing a clean "make V=1" and
then examining all the output.  I would see the -march=armv4t in all the
compile steps but it was missing in some of the link steps.  I think this 
was happening due to the following in TARGET_CONFIGURE_OPTS:

		AR="$(TARGET_AR)" \
		AS="$(TARGET_AS)" \
		LD="$(TARGET_LD)" \
		NM="$(TARGET_NM)" \
		CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
		GCC="$(TARGET_CC) $(TARGET_CFLAGS)" \
		CPP="$(TARGET_CPP) $(TARGET_CFLAGS)" \
		CXX="$(TARGET_CXX) $(TARGET_CXXFLAGS)" \
		FC="$(TARGET_FC) $(TARGET_FCFLAGS)" \

If the package build used CC (or equiv.) for the link it would get the
necessary flags.  But if it used LD, no flags.

Then there are the packages that just use CROSS=$(TARGET_CROSS).  For
those packages none of the flags are getting passed.

Also, I'm not sure having the $(TARGET_CFLAGS) directly in CC, GCC, etc.
is correct.  At one point I got an error during the ./configure for one
of the packages due to a -V option passed to the compiler.  I think this
had something to due with determining the version of the compiler.  It
appears that the -V option must come at the start of the command line
with gcc.  Of course this could also be a problem with the ./configure
stuff.

3) Package libraries end up in the wrong directory in $(STAGING_DIR).

At one point I manually copied all the sysroot stuff into $(STAGING_DIR)
and the correct libraries for my system to $(TARGET_DIR).  But when I
started the build I ran into problems with some of the external libraries
(libusb for instance).  The error message was something about not locating
the library files.

I tried finding the libusb library and it was in $(STAGING_DIR)/lib and
not in $(STAGING_DIR)/armv4t/lib which is where the linker's path is
setup when the -march=armv4t option is used.

I manually moved the library files to $(STAGING_DIR)/armv4t/lib then
restarted the build.  This time the library file was located but when
the build tried to link the files I got an error message about the
library being incompatible.  I assume this was because the library was
compiled for armv5t an not armv4t.  This was probably due to the
problem listed above.

---

I hope this helps someone in trying to work out the external multilib
toolchain support.  I see that Thomas Petrazzoni is currently working on
some buildroot cleanup.  If any of that cleanup involves the external
toolchain support hopefully this information will help.

Regards,
Hartley
