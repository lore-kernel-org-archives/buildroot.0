From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Aug 2012 22:04:24 +0200
Subject: [Buildroot] [PATCH] Add package linux-pam
In-Reply-To: <CADiAo4+Ak_6ZLY0ND=ZYWz6wTsov4XnkpXvbK8ZSF-ukU7ALGw@mail.gmail.com>
References: <1344569575-25960-1-git-send-email-golubovsky@gmail.com>
 <20120810094139.12fbf1f2@skate>
 <CADiAo4+Ak_6ZLY0ND=ZYWz6wTsov4XnkpXvbK8ZSF-ukU7ALGw@mail.gmail.com>
Message-ID: <20120810220424.7aba837f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 10 Aug 2012 06:30:49 -0400,
Dmitry Golubovsky <golubovsky@gmail.com> a ?crit :

> > This line is not needed, please remove.
> 
> I removed it. However it is still there in few places:
> 
> $ grep -rl "INSTALL_TARGET = YES" package/
> package/libglib2/libglib2.mk
> package/libgtk2/libgtk2.mk

Patches welcome :-)

> And surely install to target is needed for PAM (security modules)

Installation to target is enabled by default. From
package/pkg-generic.mk:

$(2)_INSTALL_STAGING            ?= NO
$(2)_INSTALL_IMAGES             ?= NO
$(2)_INSTALL_TARGET             ?= YES

> > Instead of overriding LINUX_PAM_BUILD_CMDS, I would recommend using:
> >
> > LINUX_PAM_CONF_ENV += \
> >         CC="$(TARGET_CC) -lintl -lfl"
> 
> This gives me configure error "compiler cannot create executables" so
> I left this unchanged.

Try this instead:

ifeq ($(BR2_PACKAGE_LIBINTL),y)
LINUX_PAM_MAKE_OPT += LIBS=-lintl
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
