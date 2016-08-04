From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 18:37:32 +0200
Subject: [Buildroot] [PATCH] package/lshw: fix musl build
In-Reply-To: <1470327886-29273-1-git-send-email-romain.naour@gmail.com>
References: <1470327886-29273-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160804183732.7319a9c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Aug 2016 18:24:46 +0200, Romain Naour wrote:

> +diff --git a/src/core/dasd.cc b/src/core/dasd.cc
> +index 626b8a8..18d19c3 100644
> +--- a/src/core/dasd.cc
> ++++ b/src/core/dasd.cc
> +@@ -4,6 +4,7 @@
> + #include <glob.h>
> + #include <string.h>
> + #include <fcntl.h>
> ++#include <libgen.h>

Is this related?

> + #include <unistd.h>
> + #include <inttypes.h>
> + #include <sys/ioctl.h>
> +@@ -42,7 +43,7 @@ bool scan_dasd(hwNode & n)
> +   {
> +     for(dev_num=0;dev_num<devices.gl_pathc;dev_num++)
> +     {
> +-      dev_name = basename(devices.gl_pathv[dev_num]);
> ++      dev_name = basename(const_cast<char *>(devices.gl_pathv[dev_num]));

I'm not super familiar with C++ stuff, but why is this problem musl
specific? The basename() function is "char *basename(char *)"
regardless of the C library being used. What makes it error out with
musl and not with other C libraries?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
