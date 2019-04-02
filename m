From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Apr 2019 22:56:57 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/libfuse: Install udev rules
 and set permissions
In-Reply-To: <20190315133033.5275-2-norbert.lange@andritz.com> (Norbert
 Lange's message of "Fri, 15 Mar 2019 14:30:30 +0100")
References: <20190315133033.5275-1-norbert.lange@andritz.com>
 <20190315133033.5275-2-norbert.lange@andritz.com>
Message-ID: <8736n0gm7a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:

 > This fixes some omissions from the installation.
 > Install the udev rules.

 > Tell buildroot about the fuse device.

 > Apply setuid permissions on the fusermount tool.

 > Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
 > ---
 >  package/libfuse/libfuse.mk | 13 ++++++++++++-
 >  1 file changed, 12 insertions(+), 1 deletion(-)

 > diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
 > index e8a79a3166..84027ebedb 100644
 > --- a/package/libfuse/libfuse.mk
 > +++ b/package/libfuse/libfuse.mk
 > @@ -14,11 +14,22 @@ LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 >  LIBFUSE_CONF_OPTS = \
 >  	--disable-example \
 >  	--enable-lib \
 > -	--enable-util
 > +	--enable-util \
 > +	UDEV_RULES_PATH=/lib/udev/rules.d
 
 >  define LIBFUSE_INSTALL_TARGET_CMDS
 >  	cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
 >  	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
 > +	mkdir -p $(TARGET_DIR)/lib/udev/rules.d
 > +	cp $(STAGING_DIR)/lib/udev/rules.d/*-fuse.rules $(TARGET_DIR)/lib/udev/rules.d

It would have been nicer to only do this if (e)udev was enabled. I've
sent a patch to do so:

https://patchwork.ozlabs.org/patch/1074963/

-- 
Bye, Peter Korsgaard
