From: Ossy <ossy1980@gmx.net>
Date: Mon, 16 Aug 2010 19:57:51 +0200
Subject: [Buildroot] Modifying boot scripts in buildroot's output
In-Reply-To: <29415478.post@talk.nabble.com>
References: <29415478.post@talk.nabble.com>
Message-ID: <4C697C1F.9050304@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 12.08.2010 09:16, schrieb JNY:
>
> I've noticed a slight problem with the boot scripts when I install my target
> with buildroot's output.  I know how to modify the scripts by hand after
> installing, but would prefer buildroot's output contain the modified
> scripts, so on installation, the scripts are correct.  I didn't (knowingly)
> configure these scripts, so I assume it's done in the background somewhere.
>
If this is a general problem for ALL target builds and prevent future 
rootfs from beeing bootable, you should describe your problem for the 
mailinglist. Maybe it should be fixed in the main target_skeleton.

But I assume, you like to override the default scripts of the "built-in" 
target_skeleton. My configuration looks like this:
ossy at debian-virtual:~/buildroot/buildroot-dev$ ll 
target/device/sheevaplug/SeagateDockStar/target_skeleton/
insgesamt 0
drwxr-xr-x  2 ossy ossy  19 18. Mai 22:19 bin
drwxr-xr-x  2 ossy ossy  19 18. Mai 22:19 boot
drwxr-xr-x  2 ossy ossy  19 18. Mai 22:19 config
drwxr-xr-x  2 ossy ossy  19 18. Mai 22:19 dev
drwxr-xr-x  7 ossy ossy 141  8. Aug 22:34 etc
drwxr-xr-x  2 ossy ossy  19 18. Mai 22:19 home
drwxr-xr-x  2 ossy ossy  19 18. Mai 22:19 lib
drwxr-xr-x  2 ossy ossy  19 18. Mai 22:19 mnt
drwxr-xr-x  2 ossy ossy  19 18. Mai 22:19 opt
drwxr-xr-x  2 ossy ossy  92 18. Mai 22:19 root
drwxr-xr-x  2 ossy ossy  19 18. Mai 22:19 sbin
drwxr-xr-x  2 ossy ossy  19 18. Mai 22:19 sys
drwxr-xr-x  2 ossy ossy  24 18. Mai 22:19 tmp
drwxr-xr-x  2 ossy ossy  19  6. Aug 22:14 usr
drwxr-xr-x 10 ossy ossy  94 18. Mai 22:19 var

ossy at debian-virtual:~/buildroot/buildroot-dev$ ls -la 
target/device/sheevaplug/SeagateDockStar/target_skeleton/bin/
insgesamt 4
drwxr-xr-x  2 ossy ossy   19 18. Mai 22:19 .
drwxr-xr-x 17 ossy ossy 4096 18. Mai 22:19 ..
-rw-r--r--  1 ossy ossy    0 18. Mai 22:19 .empty


All directories which to not differ from the default have such an 
".empty" stamp in it.
I wanted to modify the inittab in order to modify the default boot 
behaviour a bit. So I put MY modified inittab in:
ossy at debian-virtual:~/buildroot/buildroot-dev$ ls -la 
target/device/sheevaplug/SeagateDockStar/target_skeleton/etc/inittab
-rw-r--r-- 1 ossy ossy 1480  8. Aug 16:32 
target/device/sheevaplug/SeagateDockStar/target_skeleton/etc/inittab

I advised the buildroot mechanism to use a customised target skeleton:
ossy at debian-virtual:~/buildroot/buildroot-dev$ grep target_skeleton .config
BR2_ROOTFS_SKELETON_CUSTOM_PATH="$(BOARD_PATH)/target_skeleton"
(where board-path is target/device/sheevaplug/SeagateDockStar/ )

The resulting rootfs includes the default content where a .empty stamp 
is present, but it includes my modified inittab from 
target/device/sheevaplug/SeagateDockStar/target_skeleton/etc/.

Regards,
Marcus
