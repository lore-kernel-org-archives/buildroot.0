From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Feb 2018 21:47:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/fakedate: fix libcec build error
In-Reply-To: <20180203201458.29713-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 3 Feb 2018 21:14:58 +0100")
References: <20180203201458.29713-1-bernd.kuhls@t-online.de>
Message-ID: <87o9l5242u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > This defconfig breaks building libcec:
 > BR2_x86_64=y
 > BR2_REPRODUCIBLE=y
 > BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 > BR2_TOOLCHAIN_BUILDROOT_CXX=y
 > BR2_PACKAGE_LIBCEC=y

 > with this error message:

 > In file included from /home/bernd/buildroot/output/build/libcec-4.0.2/src/libcec/CECClient.cpp:34:0:
 > /home/bernd/buildroot/output/build/libcec-4.0.2/src/libcec/env.h:92:19: warning: missing terminating " character
 >  #define LIB_INFO ("git revision: 2017.11+950-973b1fd, compiled on date: Warning: using $SOURCE_DATE_EPOCH instead of true time

 > The warning emitted by fakedate adds a line break to the output of the
 > date command. This output is stored by libcec configure into env.h to
 > be compiled into the resulting binary:

 > https://github.com/Pulse-Eight/libcec/blob/master/src/libcec/cmake/SetBuildInfo.cmake#L29

 > src/libcec/env.h contains these two lines:

 >  #define LIB_INFO ("git revision: 2017.11+950-973b1fd~dirty, compiled on date: Warning: using $SOURCE_DATE_EPOCH instead of true time
 >  Wed Jan 31 19:32:08 UTC 2018 by user at machine on Linux 4.14.16-amd64 (x86_64), features: P8_USB, DRM")

 > Removing the warning from fakedate fixes the build error.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/fakedate/fakedate | 1 -
 >  1 file changed, 1 deletion(-)

 > diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
 > index a64d9b9cdf..e83f1be279 100755
 > --- a/package/fakedate/fakedate
 > +++ b/package/fakedate/fakedate
 > @@ -43,7 +43,6 @@ if [ -n "$SOURCE_DATE_EPOCH" ]; then
 >          fi
 >      done
 >      if [ $FORCE_EPOCH -eq 1 ]; then
 > -        echo "date: Warning: using \$SOURCE_DATE_EPOCH instead of true time" >&2
 >          ARGS="-d @$SOURCE_DATE_EPOCH"

Hmm, it is a pity that exec_program also grabs stderr.

I'm not sure if we should really get rid of the warning, but OK - I
cannot think of other simple solutions.

There seems to be a lof of things in that cmake file breaking
reproducible builds though (hostname, username, uname), so maybe the
real fix is to make these things optional and disable when
BR2_REPRODUCIBLE is enabled.

-- 
Bye, Peter Korsgaard
