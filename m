From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sun, 11 Sep 2016 17:49:01 +0200
Subject: [Buildroot] [PATCH 2/2] openal: Use upstream patch to detect
	run-time NEON support
In-Reply-To: <1473608941-24674-1-git-send-email-nerv@dawncrow.de>
References: <1473608941-24674-1-git-send-email-nerv@dawncrow.de>
Message-ID: <1473608941-24674-2-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 .../0003-Check-for-run-time-NEON-support.patch     | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/openal/0003-Check-for-run-time-NEON-support.patch

diff --git a/package/openal/0003-Check-for-run-time-NEON-support.patch b/package/openal/0003-Check-for-run-time-NEON-support.patch
new file mode 100644
index 0000000..abef66a
--- /dev/null
+++ b/package/openal/0003-Check-for-run-time-NEON-support.patch
@@ -0,0 +1,63 @@
+upstream commit a52cfc804813aef8e4b304e20cf843fa6907af6c
+together with the fix from commit c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1
+Author: Chris Robinson <chris.kcat@gmail.com>
+Date:   Wed Sep 7 09:57:40 2016 -0700
+
+    Check for run-time NEON support by reading /proc/cpuinfo
+
+    Less than ideal since documentations warn it may not list 'neon' even if it's
+    really supported. However, the "proper" APIs to check for NEON extensions don't
+    seem to exist in my toolchain.
+
+diff --git a/Alc/helpers.c b/Alc/helpers.c
+index 9b6c789..4ffda46 100644
+--- a/Alc/helpers.c
++++ b/Alc/helpers.c
+@@ -32,6 +32,7 @@
+ #include <time.h>
+ #include <errno.h>
+ #include <stdarg.h>
++#include <ctype.h>
+ #ifdef HAVE_MALLOC_H
+ #include <malloc.h>
+ #endif
+@@ -227,8 +227,37 @@ void FillCPUCaps(ALuint capfilter)
+ #endif
+ #endif
+ #ifdef HAVE_NEON
+-    /* Assume Neon support if compiled with it */
+-    caps |= CPU_CAP_NEON;
++    FILE *file = fopen("/proc/cpuinfo", "rt");
++    if(!file)
++        ERR("Failed to open /proc/cpuinfo, cannot check for NEON support\n");
++    else
++    {
++        char buf[256];
++        while(fgets(buf, sizeof(buf), file) != NULL)
++        {
++            char *str;
++
++            if(strncmp(buf, "Features\t:", 10) != 0)
++                continue;
++
++            TRACE("Got features string:%s\n", buf+10);
++
++            str = buf;
++            while((str=strstr(str, "neon")) != NULL)
++            {
++                if(isspace(*(str-1)) && (str[4] == 0 || isspace(str[4])))
++                {
++                    caps |= CPU_CAP_NEON;
++                    break;
++                }
++                str++;
++            }
++            break;
++        }
++
++        fclose(file);
++        file = NULL;
++    }
+ #endif
+ 
+     TRACE("Extensions:%s%s%s%s%s%s\n",
-- 
2.7.4
