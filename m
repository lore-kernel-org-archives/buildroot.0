From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 13 Jul 2011 15:32:50 +0200
Subject: [Buildroot] libiconv and BR2_ENABLE_LOCALE
Message-ID: <1310563970.2860.7.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

since our update to the latest buildroot environment, our Controller
device can't work with SMB shares any longer. Judging from the output,
there is a problem with iconv. It does not seem to be capable of doing
certain conversions that are needed here:

init_iconv: Attempting to replace with conversion from UTF-16LE to ASCII
init_iconv: Conversion from UTF-8 to CP850 not supported
init_iconv: Attempting to replace with conversion from ASCII to ASCII
init_iconv: Conversion from ASCII to CP850 not supported
init_iconv: Attempting to replace with conversion from ASCII to ASCII
init_iconv: Conversion from CP850 to UTF-16LE not supported
init_iconv: Attempting to replace with conversion from ASCII to UTF-16LE
init_iconv: Conversion from CP850 to UTF-8 not supported
init_iconv: Attempting to replace with conversion from ASCII to ASCII
init_iconv: Conversion from CP850 to ASCII not supported
init_iconv: Attempting to replace with conversion from ASCII to ASCII
init_iconv: Conversion from CP850 to UTF8 not supported
init_iconv: Attempting to replace with conversion from ASCII to ASCII
init_iconv: Conversion from CP850 to UTF-16BE not supported
init_iconv: Attempting to replace with conversion from ASCII to UTF-16BE

Now this used to work, so I had a closer look and found that we are not
using libiconv any longer. It appears that this is due to the following
change:


commit 2fae26486f86e9ed2b466ebc61a3521b60897a12
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Sat May 15 09:19:24 2010 +0200

    iconv: disallow selection when BR2_ENABLE_LOCALE is enabled
    
    A C library compiled with locale support already has an iconv()
    implementation. In that case, libiconv is useless. Therefore,
disallow
    the selection of libiconv when the configuration says that the
    toolchain has locale support.
    
    This fixes build issues similar to the one we had with gettext:
    libiconv headers are installed, but -liconv is not added because the
    ./configure script detects that the C library supports iconv.
    
    Signed-off-by: Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>


Now it looks to me that while uCLibC does indeed have an implementation
if iconv(), it is not a very capable one. I'd prefer to use libiconv
instead. What problems will we be facing if we revert this change and
configure buildroot to build libiconv and a toolchain with locale
support?


Regards,
Sven
