From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Mar 2012 08:48:31 +0100
Subject: [Buildroot] [PATCH] target-finalize: Also copy .so files if
 BR2_HAVE_DEVFILES is enabled
In-Reply-To: <1330563031-20637-1-git-send-email-arnout@mind.be>
References: <201203010030.08802.arnout@mind.be>
 <1330563031-20637-1-git-send-email-arnout@mind.be>
Message-ID: <20120301084831.26403240@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Le Thu,  1 Mar 2012 00:50:31 +0000,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> If BR2_HAVE_DEVFILES is enabled, target-finalizes copies the static
> libraries from STAGING_DIR to TARGET_DIR.  However, there may also
> be .so files that are not present on the target (because only the
> versioned .so.x file is present).  In particular, this is the case
> for libc.so.  So copy these ones as well.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I was going to ack the patch, but I have a little comment about it.
Some packages seem to always install the .so symlink, some packages seem
to not install the .so symlink (but most seem to do). So maybe instead
of forcefully copying those .so files back to $(O)/target when
BR2_HAVE_DEVFILES is selected, we should settle on what packages should
do with their .so files in order to have a coherent thing.

See this partial output from a random build (which has
BR2_HAVE_DEVFILES *not* set):

lrwxrwxrwx 1 test test      19 Jan  2 13:08 target/usr/lib/libarchive.so -> libarchive.so.2.8.4
lrwxrwxrwx 1 test test      19 Jan  2 13:08 target/usr/lib/libarchive.so.2 -> libarchive.so.2.8.4
-rwxr-xr-x 1 test test  175012 Jan  2 13:17 target/usr/lib/libarchive.so.2.8.4
lrwxrwxrwx 1 test test      23 Jan  2 13:08 target/usr/lib/libart_lgpl_2.so -> libart_lgpl_2.so.2.3.21
lrwxrwxrwx 1 test test      23 Jan  2 13:08 target/usr/lib/libart_lgpl_2.so.2 -> libart_lgpl_2.so.2.3.21
-rwxr-xr-x 1 test test   86316 Jan  2 13:17 target/usr/lib/libart_lgpl_2.so.2.3.21
lrwxrwxrwx 1 test test      22 Jan  2 13:03 target/usr/lib/libcairo.so -> libcairo.so.2.10800.10
lrwxrwxrwx 1 test test      22 Jan  2 13:03 target/usr/lib/libcairo.so.2 -> libcairo.so.2.10800.10
-rwxr-xr-x 1 test test  210204 Jan  2 13:17 target/usr/lib/libcairo.so.2.10800.10
lrwxrwxrwx 1 test test      19 Jan  2 13:08 target/usr/lib/libconfuse.so -> libconfuse.so.0.0.0
lrwxrwxrwx 1 test test      19 Jan  2 13:08 target/usr/lib/libconfuse.so.0 -> libconfuse.so.0.0.0
-rwxr-xr-x 1 test test   34956 Jan  2 13:17 target/usr/lib/libconfuse.so.0.0.0

And this bizarre case:

-rwxr-xr-x 1 test test   76196 Jan  2 13:17 target/usr/lib/libslang.so
lrwxrwxrwx 1 test test      11 Jan  2 13:15 target/usr/lib/libslang.so.1 -> libslang.so

So maybe all packages *should* always install the .so file (be it a
symbolic link or the libc.so linker script), and then:

 * When BR2_HAVE_DEVFILES is not set, we get rid of those .so symbolic
   links

 * When BR2_HAVE_DEVFILES is set, we keep them

That's just a proposal here, other options would be fine with me as
well. It's just that the fact most packages already install the .so
symlink *and* we re-do it in target-finalize when BR2_HAVE_DEVFILES is
set looks confusing.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
