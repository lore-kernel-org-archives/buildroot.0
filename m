From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 22:27:06 +0100
Subject: [Buildroot] [PATCH] kmod: workaround for microblaze ld bug
In-Reply-To: <20170218214054.GA361@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Sat, 18 Feb 2017 22:40:54 +0100")
References: <20170218214054.GA361@waldemar-brodkorb.de>
Message-ID: <87fuj9swgl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Add a workaround for a microblaze specific ld bug to avoid
 > segfault.

 > Fixes:
 >   http://autobuild.buildroot.net/results/aef1b915ffd3e5678af8682727c22c5618edfd89

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 >  package/kmod/kmod.mk | 10 ++++++++++
 >  1 file changed, 10 insertions(+)

 > diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
 > index 7492b92..2524bcd 100644
 > --- a/package/kmod/kmod.mk
 > +++ b/package/kmod/kmod.mk
 > @@ -15,6 +15,16 @@ HOST_KMOD_DEPENDENCIES = host-pkgconf
 >  KMOD_LICENSE = LGPLv2.1+ (library)
 >  KMOD_LICENSE_FILES = libkmod/COPYING
 
 > +# --gc-sections triggers binutils ld segfault
 > +# https://sourceware.org/bugzilla/show_bug.cgi?id=21180
 > +ifeq ($(BR2_microblaze),y)
 > +define KMOD_PRECONFIGURE
 > +	sed -i 's:-Wl,--gc-sections::g' $(@D)/configure

Patching the generated configure script is quite icky. We can just tell
the configure script that --gc-sections aren't supported, so I've
changed it to do:

KMOD_CONF_ENV += cc_cv_LDFLAGS__Wl___gc_sections=false

And committed, thanks.

-- 
Bye, Peter Korsgaard
