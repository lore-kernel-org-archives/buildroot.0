From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 26 May 2007 11:48:01 +0200
Subject: [Buildroot] mpfr error on cygwin for arm
In-Reply-To: <4657D933.8060109@gmail.com>
References: <4656F77D.30303@teamboyce.co.uk> <465737B9.8070008@gmail.com>
	<20070525200333.GT24585@aon.at> <4657D933.8060109@gmail.com>
Message-ID: <20070526094801.GC15885@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 25, 2007 at 11:52:35PM -0700, Tom wrote:
>Hi Bernhard and all,
>
>sorry if this thread is a little out of sequence, had problems with text 
>attachment.
>
>Bernhard Fischer wrote:
>>Before you report it to the mpfr folks, please paste the error here,
>>since i suspect that it could have to do something with the
>>binary/library name extensions, which (IIRC) we currently do not handle
>>at all (there's a bug somewhere about this, if memory serves me right).
>>
>
>You were right about extensions, below is the error as produced by
>buildroot-20050516 built, I just added -verbose for ld.
>It can not resolve the depency to libgmp.so, because cygwin ld assumes 
>libs to end in .a, .lib or .dll, and will append them to .so libs, which 
>thus can never be found.
>Can I help to add support for this?

Yes, you can.

Depending on the target, set
ifneq $($(findstring linux,$(BR2_GNU_BUILD_SUFFIX)),)
EXEEXT:=
LIBEXT:=.a
SHREXT:=.so
endif
ifneq $($(findstring apple,$(BR2_GNU_BUILD_SUFFIX)),)
EXEEXT:=.pear
LIBEXT:=.dunno
SHREXT:=.dylib
endif
ifneq $($(findstring cygwin,$(BR2_GNU_BUILD_SUFFIX)),)
EXEEXT:=.exe
LIBEXT:=.dunno
SHREXT:=.dll
endif
ifneq $($(findstring mingw,$(BR2_GNU_BUILD_SUFFIX)),)
EXEEXT:=.exe
LIBEXT:=.dunno
SHREXT:=.dll
endif

in the toplevel Makefile, before the
all: world
target, and use them accordingly.


While you're at it, it would be awesome if you could deal with this too:
We want to be able to select which flavour of lib is built (shared or
static) with a single config-option.
So, instead of changing all ".so" blindly to $(SHREXT), change it to
$(LIBTGTEXT) which is set either to

ifeq $($(BR2_DEFAULT_LIB_TARGET),shared)
LIBTGTEXT=$(SHREXT)
else
LIBTGTEXT=$(LIBEXT)
endif

below the newly added block i mentioned above.

TIA and cheers,
