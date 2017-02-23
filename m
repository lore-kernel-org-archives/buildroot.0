From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 23:39:05 +0100
Subject: [Buildroot] libuv dependency in cmake ?
Message-ID: <20170223233905.244d6c74@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

In commit 1ffcf364b6e9894a876dc581a090f87685945412, you bumped cmake to
3.7.0, and in the process added a dependency on libuv.

However, our target cmake package only builds the ctest program, which
apparently doesn't use the libuv library:

$ readelf -d output/target/usr/bin/ctest 

Dynamic section at offset 0x3684a4 contains 27 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libexpat.so.1]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libarchive.so.13]
 0x00000001 (NEEDED)                     Shared library: [libjsoncpp.so.11]
 0x00000001 (NEEDED)                     Shared library: [libcurl.so.4]
 0x00000001 (NEEDED)                     Shared library: [libstdc++.so.6]
 0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

So it seems like we are building libuv for no reason. Is there
something we can do about this?

This is particularly annoying because I'm going to add a
BR2_TOOLCHAIN_HAS_SYNC_4 dependency on BR2_PACKAGE_LIBUV, which I would
have to propagate to the target cmake package for consistency... but
actually it's useless because the target cmake package doesn't really
use libuv.

I've CC'ed Samuel, who knows the CMake build system quite well I believe.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
