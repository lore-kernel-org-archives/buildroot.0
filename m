From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 17:43:39 +0100
Subject: [Buildroot] [PATCH 2/3] package/lvm2: optional systemd
 integration
In-Reply-To: <20200204141648.9826-1-p.debruijn@unilogic.nl> (Pascal de
 Bruijn's message of "Tue, 4 Feb 2020 15:16:48 +0100")
References: <20200204141648.9826-1-p.debruijn@unilogic.nl>
Message-ID: <87v9omi9qc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pascal" == Pascal de Bruijn <p.debruijn@unilogic.nl> writes:

 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
 > ---
 >  package/lvm2/Config.in | 7 +++++++
 >  package/lvm2/lvm2.mk   | 6 ++++++
 >  2 files changed, 13 insertions(+)

 > diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
 > index de5b972..0f9e86e 100644
 > --- a/package/lvm2/Config.in
 > +++ b/package/lvm2/Config.in
 > @@ -47,6 +47,13 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
 >  comment "lvm2 application library needs a glibc or uClibc toolchain"
 >  	depends on BR2_TOOLCHAIN_USES_MUSL
 
 > +config BR2_PACKAGE_LVM2_SYSTEMD
 > +	bool "install systemd integration"
 > +	depends on BR2_PACKAGE_SYSTEMD
 > +	select BR2_PACKAGE_LVM2_APP_LIBRARY
 > +	help
 > +	  Install systemd generator and services.
 > +

Why would we want a user selectable option for this and not just
automatically do that if systemd and app-library are enabled?

 >  endif
 
 >  comment "lvm2 needs a toolchain w/ threads, dynamic library"
 > diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
 > index 43370b0..9847f96 100644
 > --- a/package/lvm2/lvm2.mk
 > +++ b/package/lvm2/lvm2.mk
 > @@ -54,6 +54,12 @@ else
 >  LVM2_CONF_OPTS += --disable-applib
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_LVM2_SYSTEMD),y)
 > +LVM2_DEPENDANCIES += systemd

Typo.

 > +LVM2_CONF_OPTS += --enable-lvmetad

What is lvmetad? What is the relation to systemd?


-- 
Bye, Peter Korsgaard
