From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 17 May 2016 10:47:56 +0200
Subject: [Buildroot] [PATCH 3/4] cups: fix static linking problem
In-Reply-To: <1463235434-31134-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463235434-31134-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1463235434-31134-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CALdGskLAUYXKTz-4tZt69u5zGiH6yXpXo1K4auEnwAu6t1weyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Thanks for fixing this issue.  I had unfortunately parked it to focus on
more pressing issues.

The patch looks good, and fixes the build error.

Regards

Olivier

On 14 May 2016 at 16:17, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> In static linking configurations, cups fails to build due to the lack of
> Scrt1.o from uClibc toolchains. This Scrt1.o is only needed for PIE
> binaries. Since we don't really care about PIE binaries in the context
> of Buildroot, this commit solves the problem by patching cups to not
> generate a PIE binary.
>
> Fixes:
>
>
> http://autobuild.buildroot.net/results/445a401da2f63a6c43d7c166516287db6cc977ab/
>
> Cc: Olivier Schonken <olivier.schonken@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/cups/0004-remove-pie.patch | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 package/cups/0004-remove-pie.patch
>
> diff --git a/package/cups/0004-remove-pie.patch
> b/package/cups/0004-remove-pie.patch
> new file mode 100644
> index 0000000..3d81941
> --- /dev/null
> +++ b/package/cups/0004-remove-pie.patch
> @@ -0,0 +1,21 @@
> +Remove PIE flags from the build
> +
> +Generating a statically linked binary built with PIE requires the
> +Scrt1.o file, which isn't part of Buildroot uClibc toolchains. To
> +solve this, we simply disable the PIE flags.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +Index: b/Makedefs.in
> +===================================================================
> +--- a/Makedefs.in
> ++++ b/Makedefs.in
> +@@ -142,7 +142,7 @@
> + IPPFIND_MAN   =       @IPPFIND_MAN@
> + LDFLAGS               =       -L../cgi-bin -L../cups -L../filter
> -L../ppdc \
> +                       -L../scheduler @LDARCHFLAGS@ \
> +-                      @LDFLAGS@ @RELROFLAGS@ @PIEFLAGS@ $(OPTIM)
> ++                      @LDFLAGS@ @RELROFLAGS@ $(OPTIM)
> + LINKCUPS      =       @LINKCUPS@ $(LIBGSSAPI) $(DNSSDLIBS) $(LIBZ)
> + LINKCUPSIMAGE =       @LINKCUPSIMAGE@
> + LIBS          =       $(LINKCUPS) $(COMMONLIBS)
> --
> 2.7.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160517/d6d1fd0b/attachment.html>
