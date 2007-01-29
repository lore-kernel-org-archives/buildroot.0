From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon, 29 Jan 2007 14:21:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070129222159.31EEE485AB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-29 14:21:57 -0800 (Mon, 29 Jan 2007)
New Revision: 17650

Log:
fix patch


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-new_dst_rules.patch


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-new_dst_rules.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-new_dst_rules.patch	2007-01-29 22:12:53 UTC (rev 17649)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.28-new_dst_rules.patch	2007-01-29 22:21:57 UTC (rev 17650)
@@ -1,11 +1,13 @@
 --- uClibc/libc/misc/time/time.c	(revision 16488)
 +++ uClibc/libc/misc/time/time.c	(working copy)
-@@ -155,6 +155,20 @@
+@@ -157,6 +157,22 @@
  #define TZNAME_MAX _POSIX_TZNAME_MAX
  #endif
  
 +#if defined (L_tzset) || defined (L_localtime_r) || defined(L_strftime) || \
-+    defined(L__time_mktime) || defined(L__time_mktime_tzi)
++	 defined(L__time_mktime) || defined(L__time_mktime_tzi) || \
++	 ((defined(L_strftime) || defined(L_strftime_l)) && \
++	  defined(__UCLIBC_HAS_XLOCALE__))
 +
 +void _time_tzset (int);
 +
@@ -21,16 +23,16 @@
  /**********************************************************************/
  /* The era code is currently unfinished. */
  /*  #define ENABLE_ERA_CODE */
-@@ -544,7 +558,7 @@
+@@ -532,7 +548,7 @@
  {
- 	TZLOCK;
+ 	__UCLIBC_MUTEX_LOCK(_time_tzlock);
  
 -	tzset();
 +	_time_tzset(*timer < new_rule_starts);
  
  	__time_localtime_tzi(timer, result, _time_tzinfo);
  
-@@ -968,7 +982,8 @@
+@@ -956,7 +972,8 @@
  	unsigned char mod;
  	unsigned char code;
  
@@ -40,7 +42,7 @@
  
  	lvl = 0;
  	p = format;
-@@ -1650,7 +1665,9 @@
+@@ -1644,7 +1661,9 @@
  	6,  0,  0,					/* Note: overloaded for non-M non-J case... */
  	0, 1, 0,					/* J */
  	',', 'M',      '4', '.', '1', '.', '0',
@@ -51,7 +53,7 @@
  };
  
  #define TZ    vals
-@@ -1658,6 +1675,7 @@
+@@ -1652,6 +1671,7 @@
  #define RANGE (vals + 7)
  #define RULE  (vals + 11 - 1)
  #define DEFAULT_RULES (vals + 22)
@@ -59,7 +61,7 @@
  
  /* Initialize to UTC. */
  int daylight = 0;
-@@ -1782,6 +1800,11 @@
+@@ -1774,6 +1794,11 @@
  
  void tzset(void)
  {
@@ -71,7 +73,7 @@
  	register const char *e;
  	register char *s;
  	long off;
-@@ -1904,7 +1927,15 @@
+@@ -1896,7 +1921,15 @@
  	} else {					/* OK, we have dst, so get some rules. */
  		count = 0;
  		if (!*e) {				/* No rules so default to US rules. */
@@ -88,7 +90,7 @@
  		}
  
  		do {
-@@ -2238,6 +2269,8 @@
+@@ -2230,6 +2263,8 @@
  		--d;
  	}
  
