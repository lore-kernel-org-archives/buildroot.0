From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 21:58:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/brltty: fix build with expat
In-Reply-To: <20190929084004.21350-1-fontaine.fabrice@gmail.com>
References: <20190929084004.21350-1-fontaine.fabrice@gmail.com>
Message-ID: <20191012215836.1e6aad19@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 29 Sep 2019 10:40:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> tbl2hex is a host command line that is built with:
> 
> TBL2HEX_OBJECTS_FOR_BUILD = tbl2hex.$(O_FOR_BUILD) $(PROGRAM_OBJECTS_FOR_BUILD) dataarea.$(O_FOR_BUILD) ttb_compile.$(O_FOR_BUILD) ttb_native.$(O_FOR_BUILD) atb_compile.$(O_FOR_BUILD) ctb_compile.$(O_FOR_BUILD) cldr.$(O_FOR_BUILD)
> TBL2HEX_OBJECTS = $(TBL2HEX_OBJECTS_FOR_BUILD:.$(O_FOR_BUILD)=.$B)
> 
> tbl2hex$(X_FOR_BUILD): $(TBL2HEX_OBJECTS)
> $(CC_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ $(TBL2HEX_OBJECTS) $(EXPAT_LIBS_FOR_BUILD) $(LDLIBS_FOR_BUILD)
> 
> So build fails if expat is enabled on target but not found on host:
> 
> gcc -DFOR_BUILD -I. -I. -I./../Programs -I../Programs -I../Headers -I./.. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE -DHAVE_CONFIG_H -g -O2 -std=gnu99 -Wall -Werror=format-security -o cldr.build.o -c cldr.c
> cldr.c:31:10: fatal error: expat.h: No such file or directory
>  #include <expat.h>
>           ^~~~~~~~~

Did you really test this patch on a system where expat was not
installed system-wide ? Because I did, and building host-expat before
building brltty doesn't solve the build issue, I still get:

cldr.c:31:19: fatal error: expat.h: No such file or directory
compilation terminated.

And this is quite expected if you look at the build command line:

gcc -DFOR_BUILD -I. -I. -I./../Programs -I../Programs -I../Headers -I./.. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE -DHAVE_CONFIG_H -g -O2 -std=gnu99 -Wall -Werror=format-security -o cldr.build.o -c cldr.c

There's nowhere a -I flag that points to $(HOST_DIR)/include. I guess
it at least needs passing some CFLAGS_FOR_BUILD or something like that.

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
