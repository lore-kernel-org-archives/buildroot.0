From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Jan 2015 21:32:48 +0000 (UTC)
Subject: [Buildroot] [Bug 7802] host-python build hangs compiling
	getbuildinfo.o
In-Reply-To: <bug-7802-163@https.bugs.busybox.net/>
References: <bug-7802-163@https.bugs.busybox.net/>
Message-ID: <20150116213248.7BCFF800AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7802

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-01-16 21:32:47 UTC ---
Here is the quick patch I came up with:

diff --git a/package/python/python.mk b/package/python/python.mk
index 4a3e71c..5791d4b 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -40,7 +40,9 @@ HOST_PYTHON_CONF_OPTS +=      \
 # This is needed because libpython may be installed at the same time that
 # python is called.
 HOST_PYTHON_CONF_ENV += \
-       LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags"
+       LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
+       ac_cv_prog_HAS_HG=/bin/false \
+       ac_cv_prog_SVNVERSION=/bin/false

 # Building host python in parallel sometimes triggers a "Bus error"
 # during the execution of "./python setup.py build" in the
@@ -130,7 +132,9 @@ PYTHON_CONF_ENV += \
        ac_cv_have_long_long_format=yes \
        ac_cv_file__dev_ptmx=yes \
        ac_cv_file__dev_ptc=yes \
-       ac_cv_working_tzset=yes
+       ac_cv_working_tzset=yes \
+       ac_cv_prog_HAS_HG=/bin/false \
+       ac_cv_prog_SVNVERSION=/bin/false

 PYTHON_CONF_OPTS += \
        --without-cxx-main      \

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
