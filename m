From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 31 Oct 2015 19:28:13 +0100
Subject: [Buildroot] [PATCH v1] valgrind: bump version to 3.11.0
In-Reply-To: <20151031154728.00a37bcc@free-electrons.com>
References: <1446293156-1583-1-git-send-email-ps.report@gmx.net>
 <20151031154728.00a37bcc@free-electrons.com>
Message-ID: <20151031192813.1fd6673a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 31 Oct 2015 15:47:28 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> 
> Applied, thanks. Could you have a look at the build failures that occur
> with musl ? See
> http://autobuild.buildroot.org/results/7b0/7b048ba58918f0a08498c61327fcf35a85a84837/build-end.log.
> 

The configure scripts failed with:

checking the glibc version... unsupported version 
configure: error: Valgrind requires glibc version 2.2 or later

The glibc version is detected by the following code

if test x$ac_cv_header_features_h = xyes; then
  rm -f conftest.$ac_ext
  cat <<_ACEOF >conftest.$ac_ext
#include <features.h>
#if defined(__GNU_LIBRARY__) && defined(__GLIBC__) && defined(__GLIBC_MINOR__)
glibc version is: __GLIBC__ __GLIBC_MINOR__
#endif
_ACEOF
  GLIBC_VERSION="`$CPP -P conftest.$ac_ext | $SED -n 's/^glibc version is: //p' | $SED 's/ /./g'`"
fi


and there are special cases for darwin, bionic and solaris.

Musl detection is not easy because there is no __MUSL__ macro defined (by design see [1]).
(Any easy alternative suggestions for a check?)

There is a openwrt patch for this problem, basically disabling the glibc version check (see [2]),
and some other minor tweaks.

Take this patch for buildroot? Or disable valgrind for musl for the moment?

The patch works basically, but there are no suppression files for musl, triggering
a lot of basic messages (false positives(?)), see e.g. [3]...

Regards,
Peter

[1] http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_there_no_MUSL_macro_.3F
[2] https://dev.openwrt.org/browser/trunk/package/devel/valgrind/patches/200-musl_fix.patch
[3] http://www.openwall.com/lists/musl/2013/06/16/7

> Thanks!
> 
> Thomas
