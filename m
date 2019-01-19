From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 16:33:14 +0100
Subject: [Buildroot] [git commit] package/libsndfile: add upstream
 post-1.0.28 security fixes
Message-ID: <20190119153718.4604881796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45014da2b780e303433e9a7099fa3ef25b248bad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerabilities:

CVE-2017-14634: In libsndfile 1.0.28, a divide-by-zero error exists in the
function double64_init() in double64.c, which may lead to DoS when playing a
crafted audio file

CVE-2017-17456: The function d2alaw_array() in alaw.c of libsndfile
1.0.29pre1 may lead to a remote DoS attack (SEGV on unknown address
0x000000000000), a different vulnerability than CVE-2017-14245

CVE-2017-17457: The function d2ulaw_array() in ulaw.c of libsndfile
1.0.29pre1 may lead to a remote DoS attack (SEGV on unknown address
0x000000000000), a different vulnerability than CVE-2017-14246

CVE-2018-13139: A stack-based buffer overflow in psf_memset in common.c in
libsndfile 1.0.28 allows remote attackers to cause a denial of service
(application crash) or possibly have unspecified other impact via a crafted
audio file.  The vulnerability can be triggered by the executable
sndfile-deinterleave

CVE-2018-19661: An issue was discovered in libsndfile 1.0.28.  There is a
buffer over-read in the function i2ulaw_array in ulaw.c that will lead to a
denial of service

CVE-2018-19662: An issue was discovered in libsndfile 1.0.28.  There is a
buffer over-read in the function i2alaw_array in alaw.c that will lead to a
denial of service

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...it-Check-psf-sf.channels-against-upper-bo.patch | 39 +++++++++
 ...heck-MAX_CHANNELS-in-sndfile-deinterleave.patch | 36 ++++++++
 ...-a-ulaw-fix-multiple-buffer-overflows-432.patch | 96 ++++++++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/package/libsndfile/0001-double64_init-Check-psf-sf.channels-against-upper-bo.patch b/package/libsndfile/0001-double64_init-Check-psf-sf.channels-against-upper-bo.patch
new file mode 100644
index 0000000000..59ba8f85f6
--- /dev/null
+++ b/package/libsndfile/0001-double64_init-Check-psf-sf.channels-against-upper-bo.patch
@@ -0,0 +1,39 @@
+From 85c877d5072866aadbe8ed0c3e0590fbb5e16788 Mon Sep 17 00:00:00 2001
+From: Fabian Greffrath <fabian@greffrath.com>
+Date: Thu, 28 Sep 2017 12:15:04 +0200
+Subject: [PATCH] double64_init: Check psf->sf.channels against upper bound
+
+This prevents division by zero later in the code.
+
+While the trivial case to catch this (i.e. sf.channels < 1) has already
+been covered, a crafted file may report a number of channels that is
+so high (i.e. > INT_MAX/sizeof(double)) that it "somehow" gets
+miscalculated to zero (if this makes sense) in the determination of the
+blockwidth. Since we only support a limited number of channels anyway,
+make sure to check here as well.
+
+CVE-2017-14634
+
+Closes: https://github.com/erikd/libsndfile/issues/318
+Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/double64.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/double64.c b/src/double64.c
+index b318ea86..78dfef7f 100644
+--- a/src/double64.c
++++ b/src/double64.c
+@@ -91,7 +91,7 @@ int
+ double64_init	(SF_PRIVATE *psf)
+ {	static int double64_caps ;
+ 
+-	if (psf->sf.channels < 1)
++	if (psf->sf.channels < 1 || psf->sf.channels > SF_MAX_CHANNELS)
+ 	{	psf_log_printf (psf, "double64_init : internal error : channels = %d\n", psf->sf.channels) ;
+ 		return SFE_INTERNAL ;
+ 		} ;
+-- 
+2.11.0
+
diff --git a/package/libsndfile/0002-Check-MAX_CHANNELS-in-sndfile-deinterleave.patch b/package/libsndfile/0002-Check-MAX_CHANNELS-in-sndfile-deinterleave.patch
new file mode 100644
index 0000000000..3b828de6ac
--- /dev/null
+++ b/package/libsndfile/0002-Check-MAX_CHANNELS-in-sndfile-deinterleave.patch
@@ -0,0 +1,36 @@
+From aaea680337267bfb6d2544da878890ee7f1c5077 Mon Sep 17 00:00:00 2001
+From: "Brett T. Warden" <brett.t.warden@intel.com>
+Date: Tue, 28 Aug 2018 12:01:17 -0700
+Subject: [PATCH] Check MAX_CHANNELS in sndfile-deinterleave
+
+Allocated buffer has space for only 16 channels. Verify that input file
+meets this limit.
+
+Fixes #397
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ programs/sndfile-deinterleave.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/programs/sndfile-deinterleave.c b/programs/sndfile-deinterleave.c
+index 53660310..225b4d54 100644
+--- a/programs/sndfile-deinterleave.c
++++ b/programs/sndfile-deinterleave.c
+@@ -89,6 +89,13 @@ main (int argc, char **argv)
+ 		exit (1) ;
+ 		} ;
+ 
++	if (sfinfo.channels > MAX_CHANNELS)
++	{	printf ("\nError : Input file '%s' has too many (%d) channels. Limit is %d.\n",
++			argv [1], sfinfo.channels, MAX_CHANNELS) ;
++		exit (1) ;
++		} ;
++
++
+ 	state.channels = sfinfo.channels ;
+ 	sfinfo.channels = 1 ;
+ 
+-- 
+2.11.0
+
diff --git a/package/libsndfile/0003-a-ulaw-fix-multiple-buffer-overflows-432.patch b/package/libsndfile/0003-a-ulaw-fix-multiple-buffer-overflows-432.patch
new file mode 100644
index 0000000000..536bad2678
--- /dev/null
+++ b/package/libsndfile/0003-a-ulaw-fix-multiple-buffer-overflows-432.patch
@@ -0,0 +1,96 @@
+From 8ddc442d539ca775d80cdbc7af17a718634a743f Mon Sep 17 00:00:00 2001
+From: Hugo Lefeuvre <hle@owl.eu.com>
+Date: Mon, 24 Dec 2018 06:43:48 +0100
+Subject: [PATCH] a/ulaw: fix multiple buffer overflows (#432)
+
+i2ulaw_array() and i2alaw_array() fail to handle ptr [count] = INT_MIN
+properly, leading to buffer underflow. INT_MIN is a special value
+since - INT_MIN cannot be represented as int.
+
+In this case round - INT_MIN to INT_MAX and proceed as usual.
+
+f2ulaw_array() and f2alaw_array() fail to handle ptr [count] = NaN
+properly, leading to null pointer dereference.
+
+In this case, arbitrarily set the buffer value to 0.
+
+This commit fixes #429 (CVE-2018-19661 and CVE-2018-19662) and
+fixes #344 (CVE-2017-17456 and CVE-2017-17457).
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/alaw.c | 9 +++++++--
+ src/ulaw.c | 9 +++++++--
+ 2 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/src/alaw.c b/src/alaw.c
+index 063fd1a2..4220224c 100644
+--- a/src/alaw.c
++++ b/src/alaw.c
+@@ -19,6 +19,7 @@
+ #include	"sfconfig.h"
+ 
+ #include	<math.h>
++#include	<limits.h>
+ 
+ #include	"sndfile.h"
+ #include	"common.h"
+@@ -326,7 +327,9 @@ s2alaw_array (const short *ptr, int count, unsigned char *buffer)
+ static inline void
+ i2alaw_array (const int *ptr, int count, unsigned char *buffer)
+ {	while (--count >= 0)
+-	{	if (ptr [count] >= 0)
++	{	if (ptr [count] == INT_MIN)
++			buffer [count] = alaw_encode [INT_MAX >> (16 + 4)] ;
++		else if (ptr [count] >= 0)
+ 			buffer [count] = alaw_encode [ptr [count] >> (16 + 4)] ;
+ 		else
+ 			buffer [count] = 0x7F & alaw_encode [- ptr [count] >> (16 + 4)] ;
+@@ -346,7 +349,9 @@ f2alaw_array (const float *ptr, int count, unsigned char *buffer, float normfact
+ static inline void
+ d2alaw_array (const double *ptr, int count, unsigned char *buffer, double normfact)
+ {	while (--count >= 0)
+-	{	if (ptr [count] >= 0)
++	{	if (!isfinite (ptr [count]))
++			buffer [count] = 0 ;
++		else if (ptr [count] >= 0)
+ 			buffer [count] = alaw_encode [lrint (normfact * ptr [count])] ;
+ 		else
+ 			buffer [count] = 0x7F & alaw_encode [- lrint (normfact * ptr [count])] ;
+diff --git a/src/ulaw.c b/src/ulaw.c
+index e50b4cb5..b6070ade 100644
+--- a/src/ulaw.c
++++ b/src/ulaw.c
+@@ -19,6 +19,7 @@
+ #include	"sfconfig.h"
+ 
+ #include	<math.h>
++#include	<limits.h>
+ 
+ #include	"sndfile.h"
+ #include	"common.h"
+@@ -827,7 +828,9 @@ s2ulaw_array (const short *ptr, int count, unsigned char *buffer)
+ static inline void
+ i2ulaw_array (const int *ptr, int count, unsigned char *buffer)
+ {	while (--count >= 0)
+-	{	if (ptr [count] >= 0)
++	{	if (ptr [count] == INT_MIN)
++			buffer [count] = ulaw_encode [INT_MAX >> (16 + 2)] ;
++		else if (ptr [count] >= 0)
+ 			buffer [count] = ulaw_encode [ptr [count] >> (16 + 2)] ;
+ 		else
+ 			buffer [count] = 0x7F & ulaw_encode [-ptr [count] >> (16 + 2)] ;
+@@ -847,7 +850,9 @@ f2ulaw_array (const float *ptr, int count, unsigned char *buffer, float normfact
+ static inline void
+ d2ulaw_array (const double *ptr, int count, unsigned char *buffer, double normfact)
+ {	while (--count >= 0)
+-	{	if (ptr [count] >= 0)
++	{	if (!isfinite (ptr [count]))
++			buffer [count] = 0 ;
++		else if (ptr [count] >= 0)
+ 			buffer [count] = ulaw_encode [lrint (normfact * ptr [count])] ;
+ 		else
+ 			buffer [count] = 0x7F & ulaw_encode [- lrint (normfact * ptr [count])] ;
+-- 
+2.11.0
+
