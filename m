From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Nov 2019 11:14:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: enable systemd services
In-Reply-To: <20191101055531.GA6022@x230> (Petr Vorel's message of "Fri, 1 Nov
 2019 06:55:31 +0100")
References: <20191101024422.102466-1-james.hilliard1@gmail.com>
 <20191101055531.GA6022@x230>
Message-ID: <87mudfhpiw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

Hi,

 > Maybe simplify IPUTILS_CONF_OPTS (diff to your patch)?

 > +++ package/iputils/iputils.mk
 > @@ -46,17 +46,17 @@ IPUTILS_DEPENDENCIES += linux-headers
 >  else
 >  IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
 >  # BUILD_NINFOD=true and USE_CRYPTO=none cannot be combined
 > -IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 >  IPUTILS_NO_NINFOD = y
 >  endif
 
 >  # ninfod requires <pthread.h>
 >  ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 > -IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 >  IPUTILS_NO_NINFOD = y
 >  endif
 
 >  ifneq ($(IPUTILS_NO_NINFOD),y)
 > +IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 > +
 >  define IPUTILS_INSTALL_SERVICE_NINFOD
 >  	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 >  	ln -sf ../../../../lib/systemd/system/ninfod.service \

This doesn't make sense. With this you diable ninfod (by passing
BUILD_NINFOD=false) AND install the service file.

-- 
Bye, Peter Korsgaard
