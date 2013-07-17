From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jul 2013 13:36:21 +0200
Subject: [Buildroot] [PATCH v2] icecast: new package
In-Reply-To: <20130717102510.GA24544@localhost>
References: <1374055607-24500-1-git-send-email-elezegarcia@gmail.com>
 <20130717121905.36d0e71f@skate> <20130717102510.GA24544@localhost>
Message-ID: <20130717133621.27460f0b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Wed, 17 Jul 2013 07:25:11 -0300, Ezequiel Garcia wrote:

> Mmm... okay, I'll try AC_TRY_LINK. The AC_CHECK_HEADERS *need* to be removed
> because they produce a very silly error:
> 
> as_fn_error $? "cannot run test program while cross compiling"

Nah, that doesn't make sense. An AC_CHECK_HEADERS check should work
just fine in cross-compilation mode. The test that is showing this
error is the AC_RUN_IFELSE(), which obviously cannot work in
cross-compilation mode.

From the generated configure script included in the icecast 2.3.3
tarball (fat comments added by me).

##############################################
# This part is the AC_CHECK_HEADERS for curl.h
##############################################

curl_ok="yes"

xt_curl_CPPFLAGS="$CPPFLAGS"
xt_curl_LIBS="$LIBS"
CPPFLAGS="$CPPFLAGS $CURL_CFLAGS"
LIBS="$CURL_LIBS $LIBS"
for ac_header in curl/curl.h
do :
  ac_fn_c_check_header_mongrel "$LINENO" "curl/curl.h" "ac_cv_header_curl_curl_h" "$ac_includes_default"
if test "x$ac_cv_header_curl_curl_h" = xyes; then :
  cat >>confdefs.h <<_ACEOF
#define HAVE_CURL_CURL_H 1
_ACEOF

else
  curl_ok="no"
fi

##############################################
# This part is the AC_RUN_IFELSE
##############################################

{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for libcurl" >&5
$as_echo_n "checking for libcurl... " >&6; }
if test "$curl_ok" = "yes"
then
    if test "$cross_compiling" = yes; then :
  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
as_fn_error $? "cannot run test program while cross compiling
See \`config.log' for more details" "$LINENO" 5; }
else
  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
/* end confdefs.h.  */

#include <curl/curl.h>
int main()
{
    return 0;
}

_ACEOF
if ac_fn_c_try_run "$LINENO"; then :

else
  curl_ok="no"
fi
rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
  conftest.$ac_objext conftest.beam conftest.$ac_ext
fi

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
