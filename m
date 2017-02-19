From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 22:15:01 +0100
Subject: [Buildroot] [PATCH] libnss: workaround for microblaze ld bug
In-Reply-To: <20170218214001.GA342@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Sat, 18 Feb 2017 22:40:02 +0100")
References: <20170218214001.GA342@waldemar-brodkorb.de>
Message-ID: <87k28lsx0q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Add a workaround for a microblaze specific ld bug to avoid
 > segfault.

 > Fixes:
 >   http://autobuild.buildroot.net/results/638a65453879777a0d5bdb29231034cd261b41c0

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 >  package/libnss/libnss.mk | 10 ++++++++++
 >  1 file changed, 10 insertions(+)

 > diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
 > index 4a40b0a..5683ffc 100644
 > --- a/package/libnss/libnss.mk
 > +++ b/package/libnss/libnss.mk
 > @@ -13,6 +13,16 @@ LIBNSS_DEPENDENCIES = libnspr sqlite zlib
 >  LIBNSS_LICENSE = MPLv2.0
 >  LIBNSS_LICENSE_FILES = nss/COPYING
 
 > +# --gc-sections triggers binutils ld segfault
 > +# https://sourceware.org/bugzilla/show_bug.cgi?id=21180
 > +ifeq ($(BR2_microblaze),y)
 > +define LIBNSS_PRECONFIGURE
 > +	sed -i 's:-Wl,--gc-sections::g' $(@D)/nss/coreconf/Linux.mk
 > +endef
 > +
 > +LIBNSS_PRE_CONFIGURE_HOOKS += LIBNSS_PRECONFIGURE

Renamed to LIBNSS_DROP_GC_SECTIONS and committed, thanks!

-- 
Bye, Peter Korsgaard
