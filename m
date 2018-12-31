From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 31 Dec 2018 20:10:31 +0000
Subject: [Buildroot] [PATCH v2] libp11: Add new package for OpenSSL
 PKCS#11 engine
In-Reply-To: <CA+-urNQc0mDN=iMiM--O3Ts7Z1jZewSvZYx0G_NT4JCHaobpSQ@mail.gmail.com>
References: <20181207181314.24051-1-tpiepho@impinj.com>
 <CA+-urNQc0mDN=iMiM--O3Ts7Z1jZewSvZYx0G_NT4JCHaobpSQ@mail.gmail.com>
Message-ID: <1546287030.12415.10.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2018-12-28 at 23:36 -0600, Frank Hunleth wrote:
> Hi Trent,
> 
> I was about to submit libp11 and then saw your patch, so thanks for submitting.
> 
> The commit title should be "libp11: new package".

I see the imperative form is much less common, 100 vs 1604.  I wanted
to add the engine bit, since the package name, libp11, sounds like a
library for pkcs11.  Which exists, but no one uses that.  It's really
about the openssl engine.

> > 
> I'm not sure what official BR policy is, but it seems that most
> github-hosted packages use the github helper:
> 
> LIBP11_VERSION = libp11-0.4.9
> LIBP11_SITE = $(call github,OpenSC,libp11,$(LIBP11_VERSION))
> 
> and then you'll need
> 
> LIBP11_AUTORECONF = YES

I didn't want to use that, since the github macro didn't produce the
official release tarball.  Hence the need for autoreconf.  I was under
the impression buildroot policy was to prefer an official release
package vs a git repository tag.

> 
> > +LIBP11_DEPENDENCIES = openssl
> > +LIBP11_INSTALL_STAGING = YES
> > +LIBP11_LICENSE = LGPLv2.1
> 
> It looks like the license is "LGPL-2.1+"

Yes, you're right, I failed to update this.  I added this package back
in 2017 and up to buildroot 2017.02 the license string was
"LGLPv2.1(+?)".

> > +LIBP11_LICENSE_FILES = COPYING
> > +
> > +ifeq ($(BR2_PACKAGE_P11_KIT),y)
> > +LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
> > +endif
> > +
> > +HOST_LIBP11_DEPENDENCIES = host-openssl
> 
> I've tested this on device and with OpenSSL 1.1.0 (not OpenSSL 1.0.2
> which is currently in BR master). That combination works well. I'm
> hopeful that the OpenSSL 1.1.0 patches can be integrated. When that
> happens,
> 
> Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
> 
> > 
