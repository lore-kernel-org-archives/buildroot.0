From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 23:33:38 +0200
Subject: [Buildroot] [PATCH v1] package/bcm2835: bump version to 1.65
In-Reply-To: <20200602204941.21984-1-ps.report@gmx.net>
References: <20200602204941.21984-1-ps.report@gmx.net>
Message-ID: <20200602233338.05744983@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tue,  2 Jun 2020 22:49:41 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - disable doxygen documentation gneration using ac_cv_prog_DOXYGEN

Is this related to the version bump? Or would the existing 1.63 version
be potentially affected by a doxygen build issue? If that's the case,
we want a separate patch which fixes this, so that we can backport.

> +ifeq ($(BR2_PACKAGE_LIBCAP),y)
> +BCM2835_DEPENDENCIES = libcap
> +BCM2835_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DBCM2835_HAVE_LIBCAP"

So, this again illustrates how wonderful the RPi ecosystem is.

 (1) They don't use configure.ac to check for libcap, even though they
     already have all the autotools machinery in place to do that.

 (2) They ask to define BCM2835_HAVE_LIBCAP manually, but then look at
     the code:

#ifdef BCM2835_HAVE_LIBCAP
#include <sys/capability.h>
static int bcm2835_has_capability(cap_value_t capability)
{
    int ok = 0;
    cap_t cap = cap_get_proc();
    if (cap)
    {
        cap_flag_value_t value;
        if (cap_get_flag(cap,capability,CAP_EFFECTIVE,&value) == 0 && value == CAP_SET)
            ok = 1;
       cap_free(cap);
    }
    return ok;
}
#endif

So far, so good: if BCM2835_HAVE_LIBCAP is defined, a new function
bcm2835_has_capability() is implemented.

Then, let's continue to the only place where this function is used:

#ifdef BCM2835_HAVE_LIBCAP2
        || bcm2835_has_capability(CAP_SYS_RAWIO)
#endif

It is under a different BCM2835_HAVE_LIBCAP2 define. I don't even see
how this can work. Has someone really tested this?

I'm sorry, but this new libcap dependency feels like a joke :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
