From: Patrick McNeil <patrick@phidgets.com>
Date: Tue, 9 Dec 2008 10:31:22 -0700
Subject: [Buildroot] root image only works properly if built from scratch
Message-ID: <B8BA7A55-1142-4F67-8CAA-47D714DAA536@phidgets.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using arm920t, oabi, buildroot svn24232

Everything works fine in the filesystem if I build from scratch, but  
if I do nothing more then run make a second time, something strange  
happens.

uClibc and it's libraries gets rebuilt, as well as the on board  
version of gcc, here is the diff between the two root filesystems:


Binary files ../root_full_good/lib/libcrypt-0.9.30.so and  
project_build_arm/phidget_sbc/root/lib/libcrypt-0.9.30.so differ
Binary files ../root_full_good/lib/libcrypt.so.0 and project_build_arm/ 
phidget_sbc/root/lib/libcrypt.so.0 differ
Binary files ../root_full_good/lib/libc.so.0 and project_build_arm/ 
phidget_sbc/root/lib/libc.so.0 differ
Binary files ../root_full_good/lib/libm-0.9.30.so and  
project_build_arm/phidget_sbc/root/lib/libm-0.9.30.so differ
Binary files ../root_full_good/lib/libm.so.0 and project_build_arm/ 
phidget_sbc/root/lib/libm.so.0 differ
Binary files ../root_full_good/lib/libpthread-0.9.30.so and  
project_build_arm/phidget_sbc/root/lib/libpthread-0.9.30.so differ
Binary files ../root_full_good/lib/libpthread.so.0 and  
project_build_arm/phidget_sbc/root/lib/libpthread.so.0 differ
Binary files ../root_full_good/lib/libthread_db-0.9.30.so and  
project_build_arm/phidget_sbc/root/lib/libthread_db-0.9.30.so differ
Binary files ../root_full_good/lib/libthread_db.so.1 and  
project_build_arm/phidget_sbc/root/lib/libthread_db.so.1 differ
Binary files ../root_full_good/lib/libuClibc-0.9.30.so and  
project_build_arm/phidget_sbc/root/lib/libuClibc-0.9.30.so differ
Binary files ../root_full_good/usr/bin/arm-linux-uclibc-gcc and  
project_build_arm/phidget_sbc/root/usr/bin/arm-linux-uclibc-gcc differ
Binary files ../root_full_good/usr/bin/arm-linux-uclibc-gcc-4.2.4 and  
project_build_arm/phidget_sbc/root/usr/bin/arm-linux-uclibc-gcc-4.2.4  
differ
Binary files ../root_full_good/usr/bin/cc and project_build_arm/ 
phidget_sbc/root/usr/bin/cc differ
Binary files ../root_full_good/usr/bin/cpp and project_build_arm/ 
phidget_sbc/root/usr/bin/cpp differ
Binary files ../root_full_good/usr/bin/gcc and project_build_arm/ 
phidget_sbc/root/usr/bin/gcc differ
diff -ur ../root_full_good/usr/bin/gccbug project_build_arm/ 
phidget_sbc/root/usr/bin/gccbug
--- ../root_full_good/usr/bin/gccbug	2008-12-08 13:20:58.000000000 -0700
+++ project_build_arm/phidget_sbc/root/usr/bin/gccbug	2008-12-08  
14:53:18.000000000 -0700
@@ -349,7 +349,7 @@
  target: arm-unknown-linux-uclibc
  __EOF__
        cat >> $file << \__EOF__
-configured with: /home/patrick/sbc/buildroot/buildroot-svn24232/ 
toolchain_build_arm/gcc-4.2.4/configure --prefix=/usr --build=i386-pc- 
linux-gnu --host=arm-linux-uclibc --target=arm-linux-uclibc --enable- 
languages=c --with-gxx-include-dir=/usr/include/c++ --disable- 
__cxa_atexit --with-gnu-ld --enable-shared --disable-nls --enable- 
threads --disable-multilib --with-tune=arm920t --with-cpu=arm920t
+configured with: /home/patrick/sbc/buildroot/buildroot-svn24232/ 
toolchain_build_arm/gcc-4.2.4/configure --prefix=/usr --build=i386-pc- 
linux-gnu --host=arm-linux-uclibc --target=arm-linux-uclibc --enable- 
languages=c --with-gxx-include-dir=/usr/include/c++ --disable- 
__cxa_atexit --with-gnu-ld --enable-shared --disable-nls --enable- 
threads --disable-multilib --with-tune=arm920t --with-cpu=arm920t :  
(reconfigured) /home/patrick/sbc/buildroot/buildroot-svn24232/ 
toolchain_build_arm/gcc-4.2.4/configure --prefix=/usr --build=i386-pc- 
linux-gnu --host=arm-linux-uclibc --target=arm-linux-uclibc --enable- 
languages=c --with-gxx-include-dir=/usr/include/c++ --disable- 
__cxa_atexit --with-gnu-ld --enable-shared --disable-nls --enable- 
threads --disable-multilib --with-tune=arm920t --with-cpu=arm920t
  __EOF__
        cat >> $file << __EOF__
  >Description:
Binary files ../root_full_good/usr/lib/gcc/arm-linux-uclibc/4.2.4/ 
libgcc.a and project_build_arm/phidget_sbc/root/usr/lib/gcc/arm-linux- 
uclibc/4.2.4/libgcc.a differ
Binary files ../root_full_good/usr/lib/gcc/arm-linux-uclibc/4.2.4/ 
libgcc_eh.a and project_build_arm/phidget_sbc/root/usr/lib/gcc/arm- 
linux-uclibc/4.2.4/libgcc_eh.a differ
Binary files ../root_full_good/usr/lib/gcc/arm-linux-uclibc/4.2.4/ 
libgcov.a and project_build_arm/phidget_sbc/root/usr/lib/gcc/arm-linux- 
uclibc/4.2.4/libgcov.a differ
Binary files ../root_full_good/usr/lib/libc.a and project_build_arm/ 
phidget_sbc/root/usr/lib/libc.a differ
Binary files ../root_full_good/usr/lib/libc_pic.a and  
project_build_arm/phidget_sbc/root/usr/lib/libc_pic.a differ
Binary files ../root_full_good/usr/lib/libcrypt.a and  
project_build_arm/phidget_sbc/root/usr/lib/libcrypt.a differ
Binary files ../root_full_good/usr/lib/libcrypt_pic.a and  
project_build_arm/phidget_sbc/root/usr/lib/libcrypt_pic.a differ
Binary files ../root_full_good/usr/lib/libcrypt.so and  
project_build_arm/phidget_sbc/root/usr/lib/libcrypt.so differ
Binary files ../root_full_good/usr/lib/libdl.a and project_build_arm/ 
phidget_sbc/root/usr/lib/libdl.a differ
Binary files ../root_full_good/usr/lib/libdl_pic.a and  
project_build_arm/phidget_sbc/root/usr/lib/libdl_pic.a differ
Only in project_build_arm/phidget_sbc/root/usr/lib: libfakeroot.a
Only in project_build_arm/phidget_sbc/root/usr/lib: libfakeroot.la
Binary files ../root_full_good/usr/lib/libgomp.a and project_build_arm/ 
phidget_sbc/root/usr/lib/libgomp.a differ
Binary files ../root_full_good/usr/lib/libiberty.a and  
project_build_arm/phidget_sbc/root/usr/lib/libiberty.a differ
Binary files ../root_full_good/usr/lib/libm.a and project_build_arm/ 
phidget_sbc/root/usr/lib/libm.a differ
Binary files ../root_full_good/usr/lib/libm_pic.a and  
project_build_arm/phidget_sbc/root/usr/lib/libm_pic.a differ
Binary files ../root_full_good/usr/lib/libm.so and project_build_arm/ 
phidget_sbc/root/usr/lib/libm.so differ
Binary files ../root_full_good/usr/lib/libmudflap.a and  
project_build_arm/phidget_sbc/root/usr/lib/libmudflap.a differ
Binary files ../root_full_good/usr/lib/libmudflapth.a and  
project_build_arm/phidget_sbc/root/usr/lib/libmudflapth.a differ
Binary files ../root_full_good/usr/lib/libnsl.a and project_build_arm/ 
phidget_sbc/root/usr/lib/libnsl.a differ
Binary files ../root_full_good/usr/lib/libnsl_pic.a and  
project_build_arm/phidget_sbc/root/usr/lib/libnsl_pic.a differ
Binary files ../root_full_good/usr/lib/libpthread.a and  
project_build_arm/phidget_sbc/root/usr/lib/libpthread.a differ
Binary files ../root_full_good/usr/lib/libpthread_pic.a and  
project_build_arm/phidget_sbc/root/usr/lib/libpthread_pic.a differ
Binary files ../root_full_good/usr/lib/libpthread.so and  
project_build_arm/phidget_sbc/root/usr/lib/libpthread.so differ
Binary files ../root_full_good/usr/lib/libresolv.a and  
project_build_arm/phidget_sbc/root/usr/lib/libresolv.a differ
Binary files ../root_full_good/usr/lib/libresolv_pic.a and  
project_build_arm/phidget_sbc/root/usr/lib/libresolv_pic.a differ
Binary files ../root_full_good/usr/lib/librt.a and project_build_arm/ 
phidget_sbc/root/usr/lib/librt.a differ
Binary files ../root_full_good/usr/lib/librt_pic.a and  
project_build_arm/phidget_sbc/root/usr/lib/librt_pic.a differ
Binary files ../root_full_good/usr/lib/libssp.a and project_build_arm/ 
phidget_sbc/root/usr/lib/libssp.a differ
Binary files ../root_full_good/usr/lib/libssp_nonshared.a and  
project_build_arm/phidget_sbc/root/usr/lib/libssp_nonshared.a differ
Binary files ../root_full_good/usr/lib/libthread_db.a and  
project_build_arm/phidget_sbc/root/usr/lib/libthread_db.a differ
Binary files ../root_full_good/usr/lib/libthread_db_pic.a and  
project_build_arm/phidget_sbc/root/usr/lib/libthread_db_pic.a differ
Binary files ../root_full_good/usr/lib/libthread_db.so and  
project_build_arm/phidget_sbc/root/usr/lib/libthread_db.so differ
Binary files ../root_full_good/usr/lib/libutil.a and project_build_arm/ 
phidget_sbc/root/usr/lib/libutil.a differ
Binary files ../root_full_good/usr/lib/libutil_pic.a and  
project_build_arm/phidget_sbc/root/usr/lib/libutil_pic.a differ
Binary files ../root_full_good/usr/lib/libz.a and project_build_arm/ 
phidget_sbc/root/usr/lib/libz.a differ
Binary files ../root_full_good/usr/lib/uclibc_nonshared.a and  
project_build_arm/phidget_sbc/root/usr/lib/uclibc_nonshared.a differ
Binary files ../root_full_good/usr/libexec/gcc/arm-linux-uclibc/4.2.4/ 
cc1 and project_build_arm/phidget_sbc/root/usr/libexec/gcc/arm-linux- 
uclibc/4.2.4/cc1 differ


If I run gdb in the new filesystem, I get the following error after  
the 'run' command (for debugging of only some programs):

gdb: can't resolve symbol '__ashldi3'

where in the original filesystem, it was working properly. GDB just  
quits in this case, with whatever it was debugging continuing to run.


--
Patrick McNeil
Lead Developer | Phidgets Inc.
patrick at phidgets.com | www.phidgets.com
--
If there's one thing worse than a program that doesn't work when it  
should, it's a program that does work when it shouldn't.
-Bob Archer

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081209/d3985575/attachment-0001.htm 
