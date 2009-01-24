From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 24 Jan 2009 11:27:48 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: multimedia/mpg123
Message-ID: <20090124112748.D8336769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-24 11:27:47 +0000 (Sat, 24 Jan 2009)
New Revision: 25004

Log:
Make toolchain configration to fix mpg123 global and move to Makefile

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/multimedia/mpg123/Config.in
   trunk/buildroot/package/multimedia/mpg123/mpg123-0.66-arm-unroll.patch


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-01-24 10:31:32 UTC (rev 25003)
+++ trunk/buildroot/package/Makefile.in	2009-01-24 11:27:47 UTC (rev 25004)
@@ -88,6 +88,14 @@
 TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
+# Handle bug fixes in toolchain
+ifeq ($(BR2_arm),y)
+ifeq ($(BR2_GCC_VERSION_4_3_2),y)
+# Removes segment violation in mpg123.
+TARGET_CFLAGS+=-DARM_UNROLL_FIX
+endif
+endif
+
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 
 # else it's an external toolchain

Modified: trunk/buildroot/package/multimedia/mpg123/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/mpg123/Config.in	2009-01-24 10:31:32 UTC (rev 25003)
+++ trunk/buildroot/package/multimedia/mpg123/Config.in	2009-01-24 11:27:47 UTC (rev 25004)
@@ -11,6 +11,3 @@
 	default y
 	depends on BR2_PACKAGE_ALSA_LIB
 
-config BR2_PACKAGE_MPG123_ARM_UNROLL_FIX
-	bool
-	default y if BR2_arm && BR2_GCC_VERSION_4_3_2

Modified: trunk/buildroot/package/multimedia/mpg123/mpg123-0.66-arm-unroll.patch
===================================================================
--- trunk/buildroot/package/multimedia/mpg123/mpg123-0.66-arm-unroll.patch	2009-01-24 10:31:32 UTC (rev 25003)
+++ trunk/buildroot/package/multimedia/mpg123/mpg123-0.66-arm-unroll.patch	2009-01-24 11:27:47 UTC (rev 25004)
@@ -5,7 +5,7 @@
  
  }
  
-+#if	defined(MPG123_ARM_UNROLL_FIX)
++#if	defined(ARM_UNROLL_FIX)
 +static int	al_table_get_d_out;
 +void al_table_get_d(struct al_table * al)
 +{
@@ -28,7 +28,7 @@
          if ( (ba=*bita++) ) 
          {
            k=(alloc2 = alloc1+ba)->bits;
-+#if	defined(MPG123_ARM_UNROLL_FIX)
++#if	defined(ARM_UNROLL_FIX)
 +	  al_table_get_d(alloc2);
 +	  d1 = al_table_get_d_out;
 +          if( (d1) < 0) 
@@ -42,7 +42,7 @@
        if ( (ba=*bita++) )
        {
          k=(alloc2 = alloc1+ba)->bits;
-+#if	defined(MPG123_ARM_UNROLL_FIX)
++#if	defined(ARM_UNROLL_FIX)
 +	al_table_get_d(alloc2);
 +	d1 = al_table_get_d_out;
 +        if( (d1) < 0)
@@ -60,7 +60,7 @@
  static int pretab1[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};
  static int pretab2[22] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
 -
-+#if	defined(MPG123_ARM_UNROLL_FIX)
++#if	defined(ARM_UNROLL_FIX)
 +extern int arm_funroll_data;
 +extern void arm_funroll_fix(short *val);
 +#endif
@@ -71,7 +71,7 @@
              step = 3;
            }
          }
-+#if	defined(MPG123_ARM_UNROLL_FIX)
++#if	defined(ARM_UNROLL_FIX)
 +	{
 +	    register short *val = h->table;
 +	    REFRESH_MASK;
@@ -104,7 +104,7 @@
              v = gr_info->pow2gain[((*scf++) + (*pretab++)) << shift];
  
          }
-+#if	defined(MPG123_ARM_UNROLL_FIX)
++#if	defined(ARM_UNROLL_FIX)
 +	{
 +	    register short *val = h->table;
 +	    REFRESH_MASK;
@@ -789,7 +789,7 @@
 +
 +static int pretab1[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};
 +static int pretab2[22] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
-+#if	defined(MPG123_ARM_UNROLL_FIX)
++#if	defined(ARM_UNROLL_FIX)
 +extern int arm_funroll_data;
 +extern void arm_funroll_fix(short *val);
 +#endif
@@ -1081,7 +1081,7 @@
 +            v = gr_info->pow2gain[((*scf++) + (*pretab++)) << shift];
 +
 +        }
-+#if	defined(MPG123_ARM_UNROLL_FIX)
++#if	defined(ARM_UNROLL_FIX)
 +	{
 +	    register short *val = h->table;
 +	    REFRESH_MASK;
@@ -1171,7 +1171,7 @@
 +      register short *val = h->table,a;
 +
 +      REFRESH_MASK;
-+#if	defined(MPG123_ARM_UNROLL_FIX)
++#if	defined(ARM_UNROLL_FIX)
 +	do {
 +		arm_funroll_fix(val); val++;
 +		a = arm_funroll_data;
