From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Dec 2012 04:45:27 +0000 (UTC)
Subject: [Buildroot] [Bug 5768] New: Not able to build ALSA-Lib for static
	build
Message-ID: <bug-5768-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5768

           Summary: Not able to build ALSA-Lib for static build
           Product: buildroot
           Version: 2012.08
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: pankaj.dev at st.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When building ALSA-Lib for static build, there is a compilation faliure. Added
a patch(attached) inside "package/alsa-lib" directory to build properly.

Not able to log this bug in ALSA project, the web-site hangs. The bug also
exists in ALSA 1.0.26(latest) included in buildroot 2012.11

Changes are following :
--- a/modules/mixer/simple/sbasedl.c
+++ b/modules/mixer/simple/sbasedl.c
@@ -27,7 +27,11 @@
 #include <fcntl.h>
 #include <sys/ioctl.h>
 #include <math.h>
+#ifdef HAVE_LIBDL
 #include <dlfcn.h>
+#else
+#define RTLD_NOW  0
+#endif
 #include "config.h"
 #include "asoundlib.h"
 #include "mixer_abst.h"
--- a/src/mixer/simple_abst.c
+++ b/src/mixer/simple_abst.c
@@ -34,7 +34,12 @@
 #include <fcntl.h>
 #include <sys/ioctl.h>
 #include <math.h>
+#ifdef HAVE_LIBDL
 #include <dlfcn.h>
+#else
+#define RTLD_NOW  0
+#define RTLD_GLOBAL             8
+#endif 
 #include "config.h"
 #include "asoundlib.h"
 #include "mixer_simple.h"

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
