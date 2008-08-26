From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 26 Aug 2008 17:49:32 +0200
Subject: [Buildroot] Static Library Building - On/Off/Configurable?
In-Reply-To: <1219743160.9701.5.camel@lnx32dtp04>
References: <1219743160.9701.5.camel@lnx32dtp04>
Message-ID: <20080826154932.GA21377@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 26, 2008 at 10:32:40AM +0100, Daniel Laird wrote:
>All,
>
>Currently many of the packages that are in buildroot have a setting of
>--enable-static
>
>This takes extra compile time and seems somewhat unnecessary.  It means
>that it is not very configurable. (default on)
>What are peoples opinion on using the following:
>
>ifeq ($(BR2_PREFER_STATIC_LIB),y)
>	OPT_STATIC = --enable-static
>endif
>
>This could be added(not quite like above but similar) to
>Makefile.autotools.in, 
>I believe that --enable-static is a default parameter to configure
>scripts so that should be safe, its just it would mean a central
>'switch' to enable static compilation and would make things a lot
>simpler.

That was the plan, yes.
When i added this knob, Makefile.autotools.in did not exist yet and IIRC
it was not tailored yet to honour PREFER_STATIC.

As you will (or maybe already have) noticed, a bit of work would be
needed to deal with the non-autotools.in'ed packages since several of
them have hardcoded ".a" and ".so" targets.

We maintain variables (unless somebody removed them in the meantime) for
proper names of libs for the host ("Setup the proper filename extensions
for the host" in the toplevel Makefile). Such a block should be added
and used for the target, too:
ifneq ($(findstring linux-,$(BR2_GNU_TARGET_SUFFIX)),)
TGT_EXEEXT:=
TGT_LIBEXT:=.a
TGT_SHREXT:=.so
endif
Perhaps somebody wants to add apple-uclib_orange_eabi or the like in the
future, that single ifneq doesn't cost much.
I'm willing to help to review such a patch..

The idea was that this knob could be used to:

PREFER_STATIC=y:
===============
_no_ output for find $(TARGET_DIR)/ -name "*.so"
likewise for $(BUILD_DIR)
Turning off the dynamic lib loader in uClibc would be a bit rough, i
wouldn't force this on the users, they can turn it off if they really
want and know what they do. Test builds/boots with ldso off may help,
readelf and cross-ldd are your friends.


PREFER_STATIC=n:
===============
_no_ output for find $(TARGET_DIR)/ -name "*.a"
likewise for $(BUILD_DIR).
