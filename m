From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Apr 2019 23:05:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/libressl: bump to version 2.9.1
In-Reply-To: <20190425164619.29273-1-aduskett@gmail.com>
References: <20190425164619.29273-1-aduskett@gmail.com>
Message-ID: <20190425230541.5ded26e9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Apr 2019 12:46:19 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> LibreSSL 2.9.1 now has a test that requires libtls.a, however, when building a
> shared library only build, the --disable-static flag is passed to libressl,
> which prevents the building of libtls.a.
> 
> With libtls.a not being built, the following error occurs:
> libressl-2.9.1/tls/.libs/libtls.a', needed by 'handshake_table'.  Stop.
> 
> There are three options to fix this:
> 1) Stick with autotools, and provide a patch that removes building anything in
>    the tests folder.

Or use libtls.la instead of libtls.a. Unfortunately that doesn't work
because their test cases use some internal symbols of their libraries,
which are not exported in the shared libraries. By linking directly to
the static variant, there is no symbol visibility mechanism, and
therefore they can access all symbols.

So, indeed, it's not that easy, and using the CMake build system makes
sense.

So: applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
