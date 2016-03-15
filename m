From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:03:17 +0100
Subject: [Buildroot] [PATCH 1/2] norm: new package
In-Reply-To: <1457516142-7421-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 9 Mar 2016 06:35:41 -0300")
References: <1457516142-7421-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8737rr8km2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/Config.in                           |  1 +
 >  package/norm/0001-fix-bigendian-build.patch | 17 ++++++++++
 >  package/norm/Config.in                      | 15 +++++++++
 >  package/norm/norm.hash                      |  2 ++
 >  package/norm/norm.mk                        | 50 +++++++++++++++++++++++++++++
 >  5 files changed, 85 insertions(+)
 >  create mode 100644 package/norm/0001-fix-bigendian-build.patch
 >  create mode 100644 package/norm/Config.in
 >  create mode 100644 package/norm/norm.hash
 >  create mode 100644 package/norm/norm.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 433e9a3..24be023 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1153,6 +1153,7 @@ menu "Networking"
 >  	source "package/lksctp-tools/Config.in"
 >  	source "package/mongoose/Config.in"
 >  	source "package/neon/Config.in"
 > +	source "package/norm/Config.in"
 >  	source "package/nss-mdns/Config.in"
 >  	source "package/nss-pam-ldapd/Config.in"
 >  	source "package/omniorb/Config.in"

> +################################################################################
 > +#
 > +# norm
 > +#
 > +################################################################################
 > +
 > +NORM_VERSION = 1.5r6
 > +NORM_SITE = http://downloads.pf.itd.nrl.navy.mil/norm/archive
 > +NORM_SOURCE = src-norm-$(NORM_VERSION).tgz
 > +NORM_INSTALL_STAGING = YES
 > +NORM_LICENSE = NRL License
 > +NORM_LICENSE_FILES = LICENSE.TXT
 > +
 > +ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
 > +NORM_DEPENDENCIES += libnetfilter_queue
 > +endif
 > +
 > +define NORM_CONFIGURE_CMDS
 > +	(cd $(@D); \
 > +		$(TARGET_CONFIGURE_OPTS) \
 > +		./waf configure --prefix=/usr \

The package looks good - But waf is a python script, right? It got me
wondering if we should use our host-python or if we can rely on the
build host having all dependencies?

It seems like we have a mix:

package/glmark2/glmark2.mk:             $(HOST_DIR)/usr/bin/python2 ./waf configure $(GLMARK2_CONF_OPTS) \
package/glmark2/glmark2.mk:     cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python2 ./waf
package/glmark2/glmark2.mk:     cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python2 ./waf install --destdir=$(TARGET_DIR)
package/gstreamer1/gst1-imx/gst1-imx.mk:                $(HOST_DIR)/usr/bin/python2 ./waf configure $(GST1_IMX_CONF_OPTS)
package/gstreamer1/gst1-imx/gst1-imx.mk:                $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS)
package/gstreamer1/gst1-imx/gst1-imx.mk:                $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
package/jack2/jack2.mk:         $(HOST_DIR)/usr/bin/python2 ./waf configure \
package/jack2/jack2.mk: (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
package/jack2/jack2.mk: (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
package/jack2/jack2.mk: (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) \
package/libimxvpuapi/libimxvpuapi.mk:   $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python2 ./waf configure \
package/libimxvpuapi/libimxvpuapi.mk:   $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS)
package/libimxvpuapi/libimxvpuapi.mk:   $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) install
package/libimxvpuapi/libimxvpuapi.mk:   $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) install
package/samba4/samba4.mk:               ./buildtools/bin/waf configure \

E.G. everything else than samba4 uses host-python2.

-- 
Bye, Peter Korsgaard
