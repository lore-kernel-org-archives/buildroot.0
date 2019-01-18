From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:13:23 +0100
Subject: [Buildroot] [PATCH] package/dhcpdump: fix build at -O2
In-Reply-To: <20181227151012.22996-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 27 Dec 2018 16:10:11 +0100")
References: <20181227151012.22996-1-thomas.petazzoni@bootlin.com>
Message-ID: <87y37i3y8c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Since commit aa556e2035c023d4328185a46e15df532e566067
 > ("utils/genrandconfig: test with BR2_OPTIMIZE_2=y"), we are doing
 > builds at -O2 instead of -Os. This has unveiled an issue in the
 > strsep.c file:

 > strsep.c:65:23: error: register name not specified for 'delim'
 >   register const char *delim;

 > This strsep.c compatibility code is compiled in if HAVE_STRSEP is not
 > defined, but dhcpdump does not use any kind of configure script to
 > detect the availability of strsep(). Therefore by default, it gets
 > compiled in, and the "register" specifier used for some variable
 > declarations in strsep.c cause build issues at -O2.

 > A previous commit in Buildroot from
 > c2a7f0d6051f71f3bb9d83b574d70814339e4b95 ("dhcpdump: Fix strsep()
 > feature test"), attempted to fix this problem by changing the test on
 > HAVE_STRSEP by a test on _BSD_SOURCE.

 > Unfortunately, _BSD_SOURCE is not meant to be tested: it's a feature
 > macro that is meant to be *defined* by some code to tell the C library
 > headers to expose (or not) some given functionality.

 > So instead, we basically revert commit
 > c2a7f0d6051f71f3bb9d83b574d70814339e4b95 by dropping the patch, and
 > pass -DHAVE_STRSEP in the CFLAGS when building dhcpdump.

 > Fixes:

 >   http://autobuild.buildroot.net/results/7231170d3d3e3637f02382c1a0a96009b0527618/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
