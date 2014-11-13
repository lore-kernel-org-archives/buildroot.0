From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Nov 2014 20:31:46 +0000 (UTC)
Subject: [Buildroot] [Bug 7646] strftime on datetime not works on python3.
In-Reply-To: <bug-7646-163@https.bugs.busybox.net/>
References: <bug-7646-163@https.bugs.busybox.net/>
Message-ID: <20141113203146.034C3B1290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7646

--- Comment #11 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-13 20:31:45 UTC ---
Here is a quick patch that tells Python3 to not use wcsftime() on uClibc, and
it fixes the problem for me:

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2c1ef2a..e242835 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -107,6 +107,10 @@ PYTHON3_CONF_ENV += \
        ac_cv_file__dev_ptc=yes \
        ac_cv_working_tzset=yes

+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+PYTHON3_CONF_ENV += ac_cv_func_wcsftime=no
+endif
+
 PYTHON3_CONF_OPTS += \
        --without-ensurepip     \
        --without-cxx-main      \

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
