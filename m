From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 3 Jan 2015 23:53:24 +0100
Subject: [Buildroot] [PATCH] package/libwebsock: fix build when openssl
	is disabled
In-Reply-To: <20150103220547.7e2661e2@free-electrons.com>
References: <1420240800-9736-1-git-send-email-s.martin49@gmail.com>
 <20150103220547.7e2661e2@free-electrons.com>
Message-ID: <CAHXCMML+Xhr5zm2SF74SCjJLsB-rPtfyFc5GK+jUcDtv5dx5=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 3, 2015 at 10:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Sat,  3 Jan 2015 00:20:00 +0100, Samuel Martin wrote:
>
>> +diff --git a/configure.ac b/configure.ac
>> +index fc1cadc..dacd4f4 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -48,6 +48,10 @@ AS_IF([test "x$have_ssl" = "xyes"],
>> +     [AS_IF([test "x$with_ssl" = "xyes"],
>> +             [AC_MSG_ERROR([SSL support requested but not found])
>> +     ])])
>> ++AS_IF([test "x$have_ssl" != "xyes"],
>> ++    [
>> ++            AC_DEFINE([WEBSOCK_HAVE_SSL], [0], [Disable SSL support])
>> ++    ])
>
> I'm sorry but this is not the right fix. Autoconf always uses undefined
> vs. defined as a way of testing whether a feature is available.
>
> The right fix seems rather to be something like:
>
> diff --git a/src/websock.h b/src/websock.h
> index 1bbd410..690c41d 100644
> --- a/src/websock.h
> +++ b/src/websock.h
> @@ -17,6 +17,7 @@
>   * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
>   */
>
> +#include "config.h"
>  #include "websock_config.h"
>
>  //this bit hides differences between systems on big-endian conversions
> diff --git a/src/websock_config.h.in b/src/websock_config.h.in
> index a25472b..eba8f31 100644
> --- a/src/websock_config.h.in
> +++ b/src/websock_config.h.in
> @@ -4,6 +4,5 @@
>  #define WEBSOCK_PACKAGE_STRING @WEBSOCK_PACKAGE_STRING@
>  #define WEBSOCK_PACKAGE_VERSION @WEBSOCK_PACKAGE_VERSION@
>  #define WEBSOCK_PACKAGE_NAME @WEBSOCK_PACKAGE_NAME@
> -#define WEBSOCK_HAVE_SSL @WEBSOCK_HAVE_SSL@
>
>  #endif
>
> Basically, the problem is that websock_config.h.in defines
> WEBSOCK_HAVE_SSL unconditionally. When SSL is not available, it remains
> defined to @WEBSOCK_HAVE_SSL@ in the resulting websock_config.h, which
> means that for the rest of the code, WEBSOCK_HAVE_SSL is indeed defined.
>
> The fix is to get rid of this stupid line in websock_config.h.in, and
> instead make the code use config.h, which properly defines
> WEBSOCK_HAVE_SSL only when SSL is available.
>
> Could you do some testing with the above patch (I did some minimal
> amount of testing, and it seemed to work), and resubmit a new version?
>
> In the mean time, I'll mark your patch as Changes Requested in patchwork.
>
> Thanks!

Thanks a lot Thomas.
I was not sure about the way I did the fixed. I'll work on it.

Regards,

-- 
Samuel
