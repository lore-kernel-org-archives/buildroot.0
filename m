From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:12:15 +0200
Subject: [Buildroot] [PATCH v2] libv4l: fix missing libintl linking
In-Reply-To: <1445021011-31994-1-git-send-email-ps.report@gmx.net>
References: <1445021011-31994-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151017161215.00c6f073@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Fri, 16 Oct 2015 20:43:31 +0200, Peter Seiderer wrote:
> Add missing libintl linking to utils/dvb and utils/keytable (patch
> Makefile.am and do autoreconf with host-gettext dependency).
> 
> Patch submitted upstream (see [2]).
> 
> Add proper gettext dependency for v4l-utils option.
> 
> Fixes [1]:
>  dvb-format-convert.o: In function `parse_opt':
>  dvb-format-convert.c:(.text+0x46): undefined reference to `libintl_gettext'
> 
> [1] http://autobuild.buildroot.net/results/40a/40a12c0d1746dcc51e4f221eefbbf31bd427cac8
> [2] http://permalink.gmane.org/gmane.linux.drivers.video-input-infrastructure/95883
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - patch Makefile.am (instead of Makefile.in) and autoreconf
>     (suggested by Thomas Petazzoni)
> ---
>  ...-dvb-keytable-fix-missing-libintl-linking.patch | 54 ++++++++++++++++++++++
>  package/libv4l/Config.in                           |  1 +
>  package/libv4l/libv4l.mk                           |  7 +++
>  3 files changed, 62 insertions(+)
>  create mode 100644 package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch

Applied, thanks.

However, I looked at your upstream submission, and I think your commit
log is a bit too terse. A better explanation would have been:

"""
libv4l configure's script checks for the availability of gettext using
the AM_GNU_GETTEXT autoconf macro. This macro provides the LIBINTL
automake variable, which should be used at link time for any part of
the code that uses the gettext functionality (see
https://www.gnu.org/software/gettext/manual/html_node/AM_005fGNU_005fGETTEXT.html).

If LIBINTL is not used, then programs will properly link on systems
where the C library directly provides the gettext functionality (which
is the case on Linux systems that use the glibc C library). However, on
systems where the gettext functionality is provided by a separate
library, programs not linked with LIBINTL will fail to link due to
missing functions. For such systems, the gettext functions are provided
by the libintl library, itself part of gettext. An example of such
systems are uClibc-based Linux systems, for which the libv4l utils
currently fail to build due to this issue.

To fix this, this patch uses the LIBINTL automake variable where
appropriate.
"""

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
