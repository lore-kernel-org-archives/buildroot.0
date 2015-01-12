From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Jan 2015 00:03:52 +0100
Subject: [Buildroot] [PATCH 2/2] package/libftdi: fix libftdi.pc
In-Reply-To: <1421097965-15600-2-git-send-email-s.martin49@gmail.com>
References: <1421097965-15600-1-git-send-email-s.martin49@gmail.com>
 <1421097965-15600-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20150112230352.GB1879@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-01-12 22:26 +0100, Samuel Martin spake thusly:
> This patch fixes libftdi pkg-config module, so that packages linking
> against libftdi correctly have all needed CFLAGS and LIBS defined,
> especially when running a static build.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/e90/e90b4d5ad79d99487f21c9d18581e8eba7034501/
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

This does indeed fix the autobuild failure.

However (as discussed on IRC), the real fix is a bit more involved, as
our current libftdi is 0.19, but openocd requires 0.20:

    configure: WARNING: You need a newer libftdi version (0.20 or later)
    [...]
    MPSSE mode of FTDI based devices        no

But as you said, this is material for a further patch. So:

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...di.pc.in-requires-libusb-fix-static-build.patch | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/libftdi/0002-libftdi.pc.in-requires-libusb-fix-static-build.patch
> 
> diff --git a/package/libftdi/0002-libftdi.pc.in-requires-libusb-fix-static-build.patch b/package/libftdi/0002-libftdi.pc.in-requires-libusb-fix-static-build.patch
> new file mode 100644
> index 0000000..7b0d9c7
> --- /dev/null
> +++ b/package/libftdi/0002-libftdi.pc.in-requires-libusb-fix-static-build.patch
> @@ -0,0 +1,25 @@
> +From c0d957b08b46385da570d8ff2f728369822ad2c1 Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Mon, 12 Jan 2015 22:10:49 +0100
> +Subject: [PATCH] libftdi.pc.in: requires libusb (fix static build)
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +---
> + libftdi.pc.in | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libftdi.pc.in b/libftdi.pc.in
> +index 2061b91..95eb491 100644
> +--- a/libftdi.pc.in
> ++++ b/libftdi.pc.in
> +@@ -6,6 +6,7 @@ includedir=@includedir@
> + Name: libftdi
> + Description: Library to program and control the FTDI USB controller
> + Requires:
> ++Requires.private: libusb
> + Version: @VERSION@
> + Libs: -L${libdir} -lftdi -lusb
> + Cflags: -I${includedir}
> +-- 
> +2.2.1
> +
> -- 
> 2.2.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
