From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Feb 2019 09:01:08 +0100
Subject: [Buildroot] [PATCH 1/3] runc: depend on linux headers >= 3.11
 for O_TMPFILE
In-Reply-To: <20190219223530.15956-1-christian@paral.in>
References: <20190219223530.15956-1-christian@paral.in>
Message-ID: <20190220090108.6e2d1e9a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Tue, 19 Feb 2019 14:35:28 -0800
Christian Stewart <christian@paral.in> wrote:

> Add dependency on headers >= 3.11. O_TMPFILE, required by runc, was not
> available until this version.
> 
> Fixes:
> 
> http://autobuild.buildroot.net/results/63e9d88ae5177541be463f1e2aafec59aa410479

I don't see how it can fix this build issue, because the defconfig for
this failure has:

BR2_TOOLCHAIN_HEADERS_AT_LEAST="3.12"

so it *is* using kernel headers more recent than 3.11.

I had a look at your build issue following your e-mail yesterday, and
indeed O_TMPFILE was added in the kernel headers in 3.11, but
apparently having 3.11 kernel headers is not sufficient. I suppose some
code is also needed in the C library, and because the toolchain used by
this configuration has an old glibc, it doesn't have everything needed
for O_TMPFILE.

So, your patch is OK in the sense that indeed >= 3.11 is needed, but it
is wrong in the sense that it is not going to fix the build issue
you're pointing to.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
