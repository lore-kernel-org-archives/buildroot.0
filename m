From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Sep 2014 11:10:18 +0200
Subject: [Buildroot] [PATCH 1/1] tiff: ensure directory exists before
	installing to it
In-Reply-To: <1410488467-2093-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Thu, 11 Sep 2014 22:21:07 -0400")
References: <1410488467-2093-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87oau4ysjp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > Also, don't ignore errors during installation.
 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>


 > ---
 >  package/tiff/tiff.mk |    3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
 > index 8d2e087..c61894b 100644
 > --- a/package/tiff/tiff.mk
 > +++ b/package/tiff/tiff.mk
 > @@ -76,7 +76,8 @@ ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
 >  endif
 
 >  define TIFF_INSTALL_TARGET_CMDS
 > -	-cp -a $(@D)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
 > +	mkdir -p $(TARGET_DIR)/usr/lib/
 > +	cp -a $(@D)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/

Hmm, so what happens with a BR2_PREFER_STATIC_LIB=y build?

>>> tiff 4.0.3 Installing to target
mkdir -p /home/peko/source/buildroot/output/target/usr/lib/
cp -a /home/peko/source/buildroot/output/build/tiff-4.0.3/libtiff/.libs/libtiff.so* /home/peko/source/buildroot/output/target/usr/lib/
cp: cannot stat ?/home/peko/source/buildroot/output/build/tiff-4.0.3/libtiff/.libs/libtiff.so*?: No such file or directory
package/pkg-generic.mk:228: recipe for target '/home/peko/source/buildroot/output/build/tiff-4.0.3/.stamp_target_installed' failed
make: *** [/home/peko/source/buildroot/output/build/tiff-4.0.3/.stamp_target_installed] Error 1

Not good. Why are we not just using 'make install' and removing whatever
binaries / extras we don't want like we do for other packages?

-- 
Bye, Peter Korsgaard
