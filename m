From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Nov 2013 23:17:28 +0100
Subject: [Buildroot] problem to configure to make helloworld program and
 helloworld module be compiled and added to the tartget with a local
 external source
In-Reply-To: <A6242A8294D64D7AB6880414BDC9F71C@NKDELL>
References: <A6242A8294D64D7AB6880414BDC9F71C@NKDELL>
Message-ID: <528BE378.7030107@mind.be>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

On 19/11/13 17:59, Nils Koehler wrote:
> rm -f /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/helloworld-1.0/.stamp_rsynced
> rm -f /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/helloworld-1.0/.stamp_built
> rm -f /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/helloworld-1.0/.stamp_staging_installed
> rm -f /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/helloworld-1.0/.stamp_target_installed
> rm -f /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/helloworld-1.0/.stamp_images_installed
> rm -f /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/helloworld-1.0/.stamp_host_installed
> [7m>>> helloworld 1.0 Syncing from source dir /home/koehler/Desktop/Kernel/helloworld-1.0/[27m
> rsync -au --cvs-exclude --include core /home/koehler/Desktop/Kernel/helloworld-1.0// /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/helloworld-1.0
> [7m>>> helloworld 1.0 Building[27m
> /usr/bin/make -j2 CC="/home/koehler/Desktop/Kernel/buildroot-2013.08/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc" LD="/home/koehler/Desktop/Kernel/buildroot-2013.08/output/host/usr/bin/i586-buildroot-linux-uclibc-ld" -C /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/helloworld-1.0 all
> make[1]: Betrete Verzeichnis '/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/helloworld-1.0'

  Looks like your helloworld package is indeed built.

> /usr/bin/make -C /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/linux-3.10.17 M=$PWD modules
> make[2]: Betrete Verzeichnis '/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/linux-3.10.17'
>    Building modules, stage 2.
>    MODPOST 2 modules
> WARNING: "apic" [/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/helloworld-1.0/misc_loop_drv.ko] undefined!
> make[2]: Verlasse Verzeichnis '/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/linux-3.10.17'
> make[1]: Verlasse Verzeichnis '/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/helloworld-1.0'
> [7m>>> helloworld 1.0 Installing to target[27m
> #    /usr/bin/install -D -m 0755 /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/helloworld-1.0/helloworld.so* /home/koehler/Desktop/Kernel/buildroot-2013.08/output/target/usr/lib
> #    /usr/bin/install -d -m 0755 /home/koehler/Desktop/Kernel/buildroot-2013.08/output/target/etc/foo.d

  This is not at all consistent with the helloworld.mk file you posted 
earlier... It looks like somewhere, you have HELLOWORLD_TARGET_CMDS is 
defined as two install commands that are commented out...

  Anyway, if you're building a module, you probably want the install 
commands to be

$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) M=$(@D) modules_install


[snip]
> [7m>>>   Generating root filesystem image rootfs.cpio[27m
> if [ ! -e /home/koehler/Desktop/Kernel/buildroot-2013.08/output/target/init ]; then ln -sf sbin/init /home/koehler/Desktop/Kernel/buildroot-2013.08/output/target/init; fi
> rm -f/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_fakeroot.fs
> rm -f /home/koehler/Desktop/Kernel/buildroot-2013.08/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
> echo "chown -R 0:0/home/koehler/Desktop/Kernel/buildroot-2013.08/output/target" >> /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_fakeroot.fs
> cat system/device_table.txt system/device_table_dev.txt >/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_device_table.txt
> printf '\n \n \n \n #/dev/foo  c  666  0  0  42  0  -  -  -\n \n \n' >> /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_device_table.txt
> printf '/bin/busybox			 f 4755	0 0 - - - - -\n/usr/share/udhcpc/default.script f 755  0 0 - - - - -\n \n \n \n #    /bin/foo  f  4755  0  0  -  -  -  -  -\n \n \n' >> /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_device_table.txt

  This is pretty fishy... the commented-out /dev/foo and /bin/foo 
definitions are completely different from what you posted earlier. Maybe 
another hint that you have another file that defines HELLOWORLD_DEVICES 
and HELLOWORLD_PERMISSIONS?

> echo "/home/koehler/Desktop/Kernel/buildroot-2013.08/output/host/usr/bin/makedevs -d/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_device_table.txt /home/koehler/Desktop/Kernel/buildroot-2013.08/output/target" >> /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_fakeroot.fs
> printf '\n \n \n \n #    foo -1 helloworld -1 * - - - LibFoo daemon\n \n \n' >/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_users_table.txt

  The <PKG>_USERS definition doesn't support comments, that's why you get 
those errors below. Just remove the HELLOWORLD_USERS definition 
completely if you don't need it.


  Regards,
  Arnout

> /home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_users_table.txt /home/koehler/Desktop/Kernel/buildroot-2013.08/output/target >> /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_fakeroot.fs
> /home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers: Zeile 363: [: helloworld: Ganzzahliger Ausdruck erwartet.
> /home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers: Zeile 370: [: helloworld: Ganzzahliger Ausdruck erwartet.
> /home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers: Zeile 394: [: foo: Ganzzahliger Ausdruck erwartet.
> /home/koehler/Desktop/Kernel/buildroot-2013.08/support/scripts/mkusers: Zeile 402: [: foo: Ganzzahliger Ausdruck erwartet.
> echo "	cd/home/koehler/Desktop/Kernel/buildroot-2013.08/output/target && find . | cpio --quiet -o -H newc > /home/koehler/Desktop/Kernel/buildroot-2013.08/output/images/rootfs.cpio" >> /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_fakeroot.fs
> chmod a+x/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_fakeroot.fs
> /home/koehler/Desktop/Kernel/buildroot-2013.08/output/host/usr/bin/fakeroot -- /home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_fakeroot.fs
> rootdir=/home/koehler/Desktop/Kernel/buildroot-2013.08/output/target
> table='/home/koehler/Desktop/Kernel/buildroot-2013.08/output/build/_device_table.txt'
> cp support/misc/target-dir-warning.txt /home/koehler/Desktop/Kernel/buildroot-2013.08/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
