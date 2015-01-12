From: Steve Kenton <skenton@ou.edu>
Date: Mon, 12 Jan 2015 09:33:45 -0600
Subject: [Buildroot] [PATCH] dvdauthor : new package
In-Reply-To: <20150112092800.08ce4350@free-electrons.com>
References: <54B317DE.9090105@ou.edu>
 <20150112092800.08ce4350@free-electrons.com>
Message-ID: <54B3E959.2010504@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/12/2015 02:28 AM, Thomas Petazzoni wrote:
>> /data/bcdist/test/buildroot-2014.11/output/host/usr/include/libxml2/libxml/encoding.h:28:19: fatal error: iconv.h: No such file or directory
>>  #include <iconv.h>
> 
> This is a *host* header, so it shouldn't be included when building a
> target package.
> 
>>                    ^
>> compilation terminated.
>> make[3]: *** [readxml.o] Error 1
The build triggers lots of automatic reconfiguration, I guess it must be something on
the host side getting rebuilt then. I'll double check while I'm updating the patch.

>> +	depends on BR2_LARGEFILE && !BR2_PREFER_STATIC_LIB # libdvdread
> 
> BR2_PREFER_STATIC_LIB has been renamed to BR2_STATIC_LIBS. Please make
> sure to test your patches against the latest master, since this is
> where they will be applied.
OK

>> +# Note - Despite lack of a version bump the two line gentoo
>> +# patch to src/spuunmux.c against "stock" dvdauthor-0.7.1
>> +# -    if (setjmp(png_ptr->jmpbuf))
>> +# +    if (setjmp(png_jmpbuf(png_ptr)))
>> +# to allow use of libpng15/16 is already applied to downloadable
>> +# dvdauthor-0.7.1.tar.gz
> 
> This should go to the commit log.
Moved

> Also, does this means that your libpng12 patch is now unnecessary?
Yes, Gustavo Zacarias pointed that patch out to me and it indeed makes libpng12 unnecessary

>> +DVDAUTHOR_DEPENDENCIES = host-pkgconf host-libxml2 host-freetype libxml2 freetype libpng libdvdread
> 
> I'm a little bit surprised by the need for host-libxml2 and
> host-freetype, but I admittedly haven't looked in detail.
I added them because of host side configure problems:

checking for libxml - version >= 2.6.0... no
*** The xml2-config script installed by LIBXML could not be found

configure:5176: checking for freetype-config
configure:5192: found /usr/bin/freetype-config

This last one sent me on the wild goose chase for pnglib12 because
it let the Ubuntu environment leak into the buildroot configuration
