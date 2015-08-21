From: universe II <universeii@gmx.de>
Date: Fri, 21 Aug 2015 13:26:43 +0200
Subject: [Buildroot] Add missing config to RPM target package
Message-ID: <55D70AF3.3050604@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,
building the RPM package for my remote target I found a misconfiguration 
of the .mk file.
If the regular expression package pcre is enabled in buildroot, rpm will 
use it. If not, nothing will be used and regular expression are not 
available, making rpm unusable. But rpm has the ability to use an 
internal pcre implementation if the external lib is not available. This 
needs to be correctly activated before building and then rpm works fine 
on the target. See the attached patch for more details.

Regards,
Andreas


diff -Naur a/package/rpm/rpm.mk b/package/rpm/rpm.mk
--- a/package/rpm/rpm.mk        2015-08-07 11:38:37.559148663 +0200
+++ b/package/rpm/rpm.mk        2015-08-21 11:13:31.679042077 +0200
@@ -34,7 +34,7 @@
  RPM_DEPENDENCIES += pcre
  RPM_CONF_OPTS += --with-pcre=external
  else
-RPM_CONF_OPTS += --with-pcre=none
+RPM_CONF_OPTS += --with-pcre=internal
  endif

  ifeq ($(BR2_PACKAGE_FILE),y)
