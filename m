From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Aug 2009 08:32:49 +0000 (UTC)
Subject: [Buildroot] [Bug 569] New: Alsa-utils build fails
Message-ID: <bug-569-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=569

              Host: i686
            Target: i686
             Build: x86_64
           Summary: Alsa-utils build fails
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fpasch at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Building alsa-utils for i686 on a x86_64 machine fails while linking alsamixer
because the linker uses the wrong ncurses-lib.

I've seen those alsa-utils-1.0.18-acs_map.patch.<ARCH> patches, but for x86
this approach fails...

The problem is, that alsa-configure uses the script ncurses5-config from host
to obtain the paths to ncurses-lib.

Perhaps a better workaround than those acs_maps-patches could be to define the
correct ncurses5-config:

--- 1/package/multimedia/alsa-utils/alsa-utils.mk
+++ 2/package/multimedia/alsa-utils/alsa-utils.mk
@@ -25,6 +25,7 @@
        (cd $(ALSA_UTILS_DIR); rm -f config.cache; \
                $(TARGET_CONFIGURE_OPTS) \
                $(TARGET_CONFIGURE_ARGS) \
+               ac_cv_prog_ncurses5_config=$(STAGING_DIR)/bin/ncurses5-config \
                CFLAGS="$(TARGET_CFLAGS)" \
                LDFLAGS="$(TARGET_LDFLAGS)" \
                ./configure \


Simon Pasch


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
