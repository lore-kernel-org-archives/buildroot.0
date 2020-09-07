From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 21:28:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix build with
 uclibc
In-Reply-To: <20200907182922.133312-1-fontaine.fabrice@gmail.com>
References: <20200907182922.133312-1-fontaine.fabrice@gmail.com>
Message-ID: <20200907212823.618e6553@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Sep 2020 20:29:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix a build failure with ltp-testsuite in version 20200515
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fb0a67b15482e76b379b4b4d9c43b45bb0fccae1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-fanotify.h-fix-build-with-uclibc.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/ltp-testsuite/0001-fanotify.h-fix-build-with-uclibc.patch

I have applied as a simple and immediate fix, but the real fix is to
add this missing define in uClibc.

Indeed the man page of name_to_handle_at() is pretty clear:

       It is the caller's responsibility to allocate the structure with a size
       large enough to hold the handle returned in f_handle.  Before the call,
       the  handle_bytes  field should be initialized to contain the allocated
       size for f_handle.  (The constant MAX_HANDLE_SZ, defined in  <fcntl.h>,
       specifies  the  maximum  expected  size for a file handle.  It is not a
       guaranteed upper limit as future filesystems may require  more  space.)
       Upon  successful  return,  the handle_bytes field is updated to contain
       the number of bytes actually written to f_handle.

So, this MAX_HANDLE_SZ should be defined by the C library. uClibc-ng
defines struct file_handle, but does not define MAX_HANDLE_SZ, which is
not good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
