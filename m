From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 6 May 2021 22:16:15 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libtomcrypt: add pkgconfig
 support
In-Reply-To: <02a2bf67-f5a4-611b-6cc8-289675ce26e5@mind.be>
References: <20210502105038.19483-1-ps.report@gmx.net>
 <02a2bf67-f5a4-611b-6cc8-289675ce26e5@mind.be>
Message-ID: <20210506221615.748aafa0@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Tue, 4 May 2021 22:18:53 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 02/05/2021 12:50, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Changes v1 -> v2:
> >   - use libtomcrypt provided libtomcrypt.pc.in template file
> > ---
> >  package/libtomcrypt/libtomcrypt.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
> > index fccd4b051c..3d166a6854 100644
> > --- a/package/libtomcrypt/libtomcrypt.mk
> > +++ b/package/libtomcrypt/libtomcrypt.mk
> > @@ -27,6 +27,10 @@ define LIBTOMCRYPT_INSTALL_STAGING_CMDS
> >  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" \
> >  		PREFIX=/usr NODOCS=1 INSTALL_USER=$(shell id -u) \
> >  		INSTALL_GROUP=$(shell id -g) install
> > +	sed -e 's,^prefix=.*,prefix=/usr,' \
> > +		-e 's,^Version:.*,Version: $(LIBTOMCRYPT_VERSION),' \
> > +		$(@D)/libtomcrypt.pc.in \
> > +		> $(STAGING_DIR)/usr/lib/pkgconfig/libtomcrypt.pc
>
>  What about the option of using makefile.unix so we don't have to do this ourselves?
>

Quick compare (with additional line breaks):

- makefile:

.../host/bin/x86_64-buildroot-linux-gnu-gcc
	-I./src/headers/
	-Wall -Wsign-compare -Wshadow
	-DLTC_SOURCE
	-Wextra -Wsystem-headers -Wbad-function-cast -Wcast-align -Wstrict-prototypes
	-Wpointer-arith -Wdeclaration-after-statement -Wwrite-strings -Wno-type-limits
	-O3 -funroll-loops -fomit-frame-pointer -DGIT_VERSION=\"1.18.2\"
	-I./src/headers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
	-Os -g2  -DLTC_SOURCE -DLTM_DESC -fPIC -c src/ciphers/aes/aes.c -o src/ciphers/aes/aes.o


- makefile.unix:

.../host/bin/x86_64-buildroot-linux-gnu-gcc
	-Isrc/headers -Itests -DLTC_SOURCE
	-I./src/headers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
	-Os -g2  -DLTC_SOURCE -DLTM_DESC -fPIC -c src/ciphers/aes/aes.c -o src/ciphers/aes/aes.o

Seems to cut down a lot of warning flags (and an overwritten optimize flag), but
seems to miss the version define...

>  I've kept the patch as New in patchwork in case you don't see that as feasible.

Will give the makefile.unix a try (and see if the install works as expected)...

Regards,
Peter

>
>  Regards,
>  Arnout
>
> >  endef
> >
> >  $(eval $(generic-package))
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
