From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Dec 2016 09:31:09 +0100
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.21
In-Reply-To: <20161226192948.GA11926@waldemar-brodkorb.de>
References: <20161226192948.GA11926@waldemar-brodkorb.de>
Message-ID: <20161229093109.404db8da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Dec 2016 20:29:48 +0100, Waldemar Brodkorb wrote:
> Remove all patches as they are upstream.
> Remove MALLOC_GLIBC_COMPAT and UCLIBC_HAS_OBSTACK as they got removed.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I believe this update breaks the libglib build. The new uclibc-ng
version provides its own libiconv implementation. And interestingly,
all the libglib failures of the last days occur only with the uClibc
internal toolchain configurations (on powerpc, arm, xtensa and arc).
And they all fail with:

  gconvert.c:25:19: fatal error: iconv.h: No such file or directory

So it seems like the configure script detects that the C library
provides iconv_open() and therefore assumes it provides the iconv
implementation. But then later fails because there's no iconv.h.

Note: this is a very quick analysis, the problem may be more
complicated. But it clearly points at the latest uClibc-ng bump.

Full list of build failures:

   http://autobuild.buildroot.net/?reason=libglib2-2.50.2&step=250

It started failing at commit b575baeb, which is exactly one commit
after the uclibc-ng bump to 1.0.21.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
