From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 9 Jul 2007 18:33:58 +0200
Subject: [Buildroot] $(TARGET_CONFIGURE_OPTS) $(MAKE) vs $(MAKE)
	$(TARGET_CONFIGURE_OPTS)
In-Reply-To: <f0528b5b0707090641j2bd8c39ap101012d7716ba67b@mail.gmail.com>
References: <20070707130132.GU4096@aon.at>
	<1183824383.19912.5.camel@elrond.sweden.atmel.com>
	<20070707172925.GV4096@aon.at>
	<1183837025.19912.17.camel@elrond.sweden.atmel.com>
	<20070707211606.GZ4096@aon.at>
	<05fb01c7c0e9$275c45a0$dcc4af0a@atmel.com>
	<20070709082550.GA19774@aon.at> <20070709092108.GA20627@aon.at>
	<20070709122041.GA30238@real.realitydiluted.com>
	<f0528b5b0707090641j2bd8c39ap101012d7716ba67b@mail.gmail.com>
Message-ID: <20070709163358.GA23895@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 09, 2007 at 03:41:35PM +0200, Julien Letessier wrote:
>I'm following the discussion and would like to make a point:
>all of this is irrelevant for packages that use the GNU auto* tools properly
>(i.e. a whole lot of packages).
>
>Their configure script uses the TARGET_CONFIGURE_OPTS to generate correct
>makefiles, and no flags should thereafter be passed to $(MAKE) directly (or
>they'll break).
>So IMO,
>  $(MAKE) -C $(FOO_DIR) $(TARGET_CONFIGURE_OPTS)
>will almost always break such a package. Even packages that just
>  $(MAKE) -C $(FOO_DIR) CC=$(TARGET_CC)
>break more often than not.

yes. we should not change stuff after the configure stage.
[]
>>> 2) CFLAGS are wrong as CXXFLAGS
>>>
>>So when compiling C++ code, and if I want the -Os and other options,
>>how do you suggest we pass them.

Unfortunately we will have to have TARGET_CXXFLAGS or filter out flags
from CFLAGS that are rejected by the CXX compiler. The latter is of
course ugly and will most likely not work reliably.
I do not see a viable alternative to TARGET_CXXFLAGS (or fortran, ada,
java, objc, you-name-it for that matter).
>>
>>> 3) since your change we end up using the default flags from the
>>> packages, which more often than not default to -O2. Let me refer you to
>>> options.c of gcc (or the respective docs for the gory details).
>>>
>>Thanks, I am able to read code.

yea, i know.
>>
>>> I am going to revert this change for now. What were you trying to
>>> do/solve?
>>>
>>A number of packages break unless the above is done. By overriding
>>CFLAGS in the top-level makefile, CFLAGS in packages themselves get
>>overridden and fail to build. Essentially if you do not like the
>>method above, then a bunch of packages will need to be changed in
>>order to work properly with CFLAGS be specified at the very top.

Patching the affected packages is cumbersome and complicates
maintenance. Just thinking loud.. what about patching the cross-compiler
to use -Os unconditionally for any or no -O? Not really nice either, i
fear. The native compiler would not be affected by this.

What do you think?
