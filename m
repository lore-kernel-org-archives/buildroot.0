From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Aug 2013 23:42:22 +0200
Subject: [Buildroot] [PATCH v3] toolchain-external: fix lib64 symlinks
In-Reply-To: <1377212375-22871-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 23 Aug 2013 00:59:35 +0200")
References: <1376340548-14050-1-git-send-email-s.martin49@gmail.com>
 <1377212375-22871-1-git-send-email-arnout@mind.be>
Message-ID: <87bo4iizep.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: Samuel Martin <s.martin49@gmail.com>
 Arnout> * Always link lib64 or lib32 to lib
 Arnout> * Only copy the architecture's lib directory to staging
 Arnout> * Also cleanup a couple of mkdirs (concerning some 'lib' directories).

 Arnout> Before this patch:
 Arnout> --
 Arnout> $ ls -ld host/usr/x86_64-buildroot-linux-gnu/sysroot/{,usr/}lib* target/{usr/,}lib*
 Arnout> drwxr-xr-x 2 samuel users 4.0K Aug 12 22:26 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib/
 Arnout> drwxr-xr-x 2 samuel users 4.0K Aug 12 22:27 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib64/
 Arnout> drwxr-xr-x 5 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/
 Arnout> drwxr-xr-x 5 samuel users 4.0K Aug 12 22:27 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/
 Arnout> drwxr-xr-x 3 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/libexec/
 Arnout> drwxr-xr-x 2 samuel users 4.0K Aug 12 22:27 target/lib/
 Arnout> lrwxrwxrwx 1 samuel users    3 Aug 12 22:27 target/lib64 -> lib/
 Arnout> drwxr-xr-x 2 samuel users 4.0K Aug 12 22:27 target/usr/lib/
 Arnout> lrwxrwxrwx 1 samuel users    3 Aug 12 22:27 target/usr/lib64 -> lib/

 Arnout> $ find . -type l -xtype l # find broken symlinks
 Arnout> find: `./host/usr/x86_64-buildroot-linux-gnu/sysroot/lib64/lib': Too many levels of symbolic links
 Arnout> find: `./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/lib': Too many levels of symbolic links
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_files.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_nis.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_compat.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_nisplus.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libutil.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libthread_db.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libcidn.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libcrypt.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libm.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_hesiod.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnsl.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/librt.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_db.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libanl.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libBrokenLocale.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libnss_dns.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libresolv.so
 Arnout> ./host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libdl.so
 Arnout> ./target/etc/resolv.conf
 Arnout> ./target/dev/log
 Arnout> --

 Arnout> After this patch:
 Arnout> --
 Arnout> $ ls -ld host/usr/x86_64-buildroot-linux-gnu/sysroot/{,usr/}lib* target/{usr/,}lib*
 Arnout> drwxr-xr-x 2 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib/
 Arnout> lrwxrwxrwx 1 samuel users    5 Aug 12 22:36 host/usr/x86_64-buildroot-linux-gnu/sysroot/lib64 -> lib/
 Arnout> drwxr-xr-x 5 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/
 Arnout> lrwxrwxrwx 1 samuel users    5 Aug 12 22:36 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64 -> lib/
 Arnout> drwxr-xr-x 3 samuel users 4.0K Oct 30  2012 host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/libexec/
 Arnout> drwxr-xr-x 2 samuel users 4.0K Aug 12 22:36 target/lib/
 Arnout> lrwxrwxrwx 1 samuel users    3 Aug 12 22:36 target/lib64 -> lib/
 Arnout> drwxr-xr-x 2 samuel users 4.0K Aug 12 22:36 target/usr/lib/
 Arnout> lrwxrwxrwx 1 samuel users    3 Aug 12 22:36 target/usr/lib64 -> lib/

 Arnout> $ find . -type l -xtype l # find broken symlinks
 Arnout> ./target/etc/resolv.conf
 Arnout> ./target/dev/log
 Arnout> --

 Arnout> Fixes http://autobuild.buildroot.net/results/23fb6b1479d2b5906b72c9437b06ab4700ff246d/

 Arnout> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---
 Arnout> Tested with a couple of 32-bit and 64-bit MIPS Sourcery toolchains, and with
 Arnout> the x86_64 Sourcery toolchain. Should still be tested with a MIPS64/n32
 Arnout> toolchain, and with Linaro.

 Arnout> I didn't check if it actually fixes the referenced autobuild error...
 Arnout> But since my x86_64 allyesconfig passes cppcms that failed before, I
 Arnout> guess it's OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
