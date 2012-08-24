From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 24 Aug 2012 09:59:29 +0200
Subject: [Buildroot] [PATCH] gpsd: Fix lacking simplejson module error at
	build
In-Reply-To: <20120822200615.42118e87@skate>
References: <20120822200615.42118e87@skate>
Message-ID: <1345795169-20220-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---

Thomas,

Would something like this make more sense to you ?

Maxime

 .../gpsd-05-fix-leapsecond-script-python2.5.patch  |   71 ++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/gpsd/gpsd-05-fix-leapsecond-script-python2.5.patch

diff --git a/package/gpsd/gpsd-05-fix-leapsecond-script-python2.5.patch b/package/gpsd/gpsd-05-fix-leapsecond-script-python2.5.patch
new file mode 100644
index 0000000..8866b81
--- /dev/null
+++ b/package/gpsd/gpsd-05-fix-leapsecond-script-python2.5.patch
@@ -0,0 +1,71 @@
+the json module was added with python2.6, so a regular python 2.5
+machine will lack this module and won't probably have the simplejson
+module imported by the leapsecond.py script.
+
+Since the only function used is the isotime function, which is
+self-contained and quite trivial, only copy this function into the
+leapsecond script to avoid the import of the gps.misc module, which
+needs simplejson.
+
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ leapsecond.py |   27 ++++++++++++++++++++++++---
+ 1 file changed, 24 insertions(+), 3 deletions(-)
+
+diff --git a/leapsecond.py b/leapsecond.py
+index 2059f6c..cdacdb4 100755
+--- a/leapsecond.py
++++ b/leapsecond.py
+@@ -24,7 +24,6 @@
+ # BSD terms apply: see the file COPYING in the distribution root for details.
+ #
+ import os, urllib, re, random, time, calendar, math, sys
+-import gps.misc
+ 
+ __locations = [
+     (
+@@ -48,6 +47,28 @@ __locations = [
+ # between times it might change, in seconds since Unix epoch GMT.
+ __cachepath = "/var/run/leapsecond"
+ 
++def isotime(s):
++    "Convert timestamps in ISO8661 format to and from Unix time."
++    if type(s) == type(1):
++        return time.strftime("%Y-%m-%dT%H:%M:%S", time.gmtime(s))
++    elif type(s) == type(1.0):
++        date = int(s)
++        msec = s - date
++        date = time.strftime("%Y-%m-%dT%H:%M:%S", time.gmtime(s))
++        return date + "." + repr(msec)[3:]
++    elif type(s) == type("") or type(s) == type(u""):
++        if s[-1] == "Z":
++            s = s[:-1]
++        if "." in s:
++            (date, msec) = s.split(".")
++        else:
++            date = s
++            msec = "0"
++        # Note: no leap-second correction!
++        return calendar.timegm(time.strptime(date, "%Y-%m-%dT%H:%M:%S")) + float("0." + msec)
++    else:
++        raise TypeError
++
+ def retrieve():
+     "Retrieve current leap-second from Web sources."
+     random.shuffle(__locations)	# To spread the load
+@@ -261,10 +282,10 @@ if __name__ == '__main__':
+             print unix_to_rfc822(float(val))
+             raise SystemExit, 0
+         elif (switch == '-I'):  # Compute Unix time from ISO8601 date
+-            print gps.misc.isotime(val)
++            print isotime(val)
+             raise SystemExit, 0
+         elif (switch == '-O'):  # Compute ISO8601 date from Unix time
+-            print gps.misc.isotime(float(val))
++            print isotime(float(val))
+             raise SystemExit, 0
+ 
+         print "Current leap second:", retrieve()
+-- 
+1.7.9.5
+
-- 
1.7.9.5
