From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 23:14:48 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/brltty: fix build with expat
In-Reply-To: <20191013124550.18413-1-fontaine.fabrice@gmail.com>
References: <20191013124550.18413-1-fontaine.fabrice@gmail.com>
Message-ID: <20191016231448.238c3348@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yann, since there is some shell script sorcery involved below.

On Sun, 13 Oct 2019 14:45:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> tbl2hex is a host command line that is built with:
> 
> $(CC_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ $(TBL2HEX_OBJECTS) $(EXPAT_LIBS_FOR_BUILD) $(LDLIBS_FOR_BUILD)
> 
> It needs cldr.o which can depends on expat and is built through:
> 
> %.$B: $(SRC_DIR)/%.c
>        $(CC_FOR_BUILD) -DFOR_BUILD $(CFLAGS_FOR_BUILD) -o $@ -c $<
> 
> When cross-compiling, build fails because expat is not found on host:
> 
> gcc -DFOR_BUILD -I. -I. -I./../Programs -I../Programs -I../Headers -I./.. -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE  -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -D_XOPEN_SOURCE_EXTENDED -D_GNU_SOURCE -DHAVE_CONFIG_H -g -O2 -std=gnu99 -Wall -Werror=format-security -o cldr.build.o -c cldr.c
> cldr.c:31:10: fatal error: expat.h: No such file or directory
>  #include <expat.h>
>           ^~~~~~~~~
> 
> To fix this issue, add host-expat dependency as well as patch to add
> $(EXPAT_INCLUDES_FOR_BUILD) and set CC_FOR_BUILD, LD_FOR_BUILD,
> EXPAT_INCLUDES_FOR_BUILD and LDFLAGS_FOR_BUILD in brltty.mk
> CFLAGS_FOR_BUILD can't be overriden as it's used to set internal paths
> such as Headers
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/362cfb57e4a91a066493269d8078d931529ddf69
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I am sorry, but this is still not good, and is still too much of a
hack. I had a look at the brltty build system. Basically, the
./configure script that we call for the target will internally call
another ./configure but for the host, after setting CC, CFLAGS,
LDFLAGS, CXX and al. to their _FOR_BUILD counterparts.

This is done in the mk4build script:

   for variable in CC CFLAGS CXX CXXFLAGS LDFLAGS LDLIBS
   do
      unset "${variable}"
      variableForBuild="${variable}_FOR_BUILD"
      eval test '"${'"${variableForBuild}"'+set}"' != "set" || eval "${variable}"'="${'"${variableForBuild}"'}"'
   done

   "${sourceRoot}/configure" \
      --disable-api \
      --disable-gpm \
      --disable-iconv \
      --disable-icu \

The issue is that for some reason the magic "eval" stuff doesn't do its
job. Indeed, if I change the ${sourceRoot}/configure invocation to:

   CC=${CC_FOR_BUILD} \
   CFLAGS=${CFLAGS_FOR_BUILD} \
   CXX=${CXX_FOR_BUILD} \
   CXXFLAGS=${CXXFLAGS_FOR_BUILD} \
   LDFLAGS=${LDFLAGS_FOR_BUILD} \
   LDLIBS=${LDLIBS_FOR_BUILD} \
   "${sourceRoot}/configure" \
      --disable-api \
      --disable-gpm \

Then magically all the _FOR_BUILD variables are properly taken into
account (you can check the forbuild.log file, which is the equivalent
of config.log, but for running this internal ./configure invocation for
the host).

So, if we fix this, then magically the _FOR_BUILD variables that we
already pass to the ./configure invocation in autotools-package are
properly taken into account, all the way to the forbuild.mk file, which
will fix the expat build, without needing this hack of
EXPAT_INCLUDES_FOR_BUILD and passing again the _FOR_BUILD variables in
MAKE_OPTS.

Perhaps Yann can shed some light as to why the magic eval stuff doesn't
behave like it should.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
