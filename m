From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  2 Aug 2009 14:48:48 +0000 (UTC)
Subject: [Buildroot] [Bug 529] New: util-linux doesn't find headers and
 include libs correctly
Message-ID: <bug-529-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=529

              Host: Ubuntu 9.0.4 Server 32 Bit
            Target: i686
             Build: i686
           Summary: util-linux doesn't find headers and include libs
                    correctly
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d.albano at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=561)
 --> (https://bugs.busybox.net/attachment.cgi?id=561)
my config

Hi,

util-linux search for libintl, needs some headers, like zlib.h and blkid.h. The
last one is in e2fsprogs package, i'll open a bug for that attaching a patch to
add header export to staging dir.

Actually, to let to util-linux to compile, i've applied this little hack
diff --git a/package/util-linux/util-linux.mk
b/package/util-linux/util-linux.mk
index 7f0d740..db3af41 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -49,12 +49,14 @@ $(UTIL-LINUX_DIR)/.configured: $(UTIL-LINUX_DIR)/.unpacked
        )
        touch $(UTIL-LINUX_DIR)/.configured

-$(UTIL-LINUX_BINARY): $(UTIL-LINUX_DIR)/.configured
+$(UTIL-LINUX_BINARY): e2fsprogs-staging-headers $(UTIL-LINUX_DIR)/.configured
        $(MAKE) \
                -C $(UTIL-LINUX_DIR) \
                ARCH=$(ARCH) \
                CC=$(TARGET_CC) \
                OPT="$(TARGET_CFLAGS)" \
+               CFLAGS="$(TARGET_CFLAGS)" \
+               LDFLAGS="$(TARGET_LDFLAGS) -lintl" \
                HAVE_SLANG="NO"

I've added -lintl to ldflags force linking, without it, after fixing headers
error, compilation fails with:
/home/daniele/Development/OPBXA/buildroot-git/../targets/i686-opbxa-linux-gnu//bin/i686-opbxa-linux-gnu-gcc
 -O3 -pipe -O3  --sysroot
/home/daniele/Development/OPBXA/buildroot-git/build_i686/staging_dir/ 
--sysroot /home/daniele/Development/OPBXA/buildroot-git/build_i686/staging_dir/
-o mkfs  mkfs.o
mkfs.o: In function `main':
mkfs.c:(.text+0x59): undefined reference to `libintl_bindtextdomain'
mkfs.c:(.text+0x65): undefined reference to `libintl_textdomain'
mkfs.c:(.text+0x187): undefined reference to `libintl_gettext'
mkfs.c:(.text+0x264): undefined reference to `libintl_gettext'
mkfs.c:(.text+0x29f): undefined reference to `libintl_gettext'
mkfs.c:(.text+0x2d0): undefined reference to `libintl_gettext'
collect2: ld returned 1 exit status
make[3]: *** [mkfs] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory
`/home/daniele/Development/OPBXA/buildroot-git/build_i686/util-linux-2.13-pre7/disk-utils'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/daniele/Development/OPBXA/buildroot-git/build_i686/util-linux-2.13-pre7'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/daniele/Development/OPBXA/buildroot-git/build_i686/util-linux-2.13-pre7'
make: ***
[/home/daniele/Development/OPBXA/buildroot-git/build_i686/util-linux-2.13-pre7/misc-utils/chkdupexe]
Error 2

I've attached my config


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
