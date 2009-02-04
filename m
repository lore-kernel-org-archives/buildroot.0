From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 4 Feb 2009 22:49:21 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libeXosip2
References: <20090202072449.30556764CB@busybox.osuosl.org><87bptlgh4d.fsf@macbook.be.48ers.dk>
	<87tz7acqjg.fsf@macbook.be.48ers.dk>
Message-ID: <218F941249F34F48B7D7566B00C35169@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ulf> Log:
> ulf> Define OSIP_CFLAGS and OSIP_LIBS for libeXosip2
>
>
No email for a few days.

> ulf> Changeset:
> ulf> Modified: trunk/buildroot/package/libeXosip2/libeXosip2.mk
> ulf> ===================================================================
> ulf> --- trunk/buildroot/package/libeXosip2/libeXosip2.mk 2009-02-02 
> 07:22:19 UTC (rev 25217)
> ulf> +++ trunk/buildroot/package/libeXosip2/libeXosip2.mk 2009-02-02 
> 07:24:48 UTC (rev 25218)
> ulf> @@ -22,32 +22,19 @@
> ulf> (cd $(LIBEXOSIP2_DIR); rm -rf config.cache; \
> ulf> $(TARGET_CONFIGURE_OPTS) \
> ulf> $(TARGET_CONFIGURE_ARGS) \
> ulf> + OSIP_CFLAGS="$(TARGET_CFLAGS)" \
> ulf> + OSIP_LIBS="-L$(STAGING_DIR)/usr/lib -losip2 -losipparser2" \
>
> Peter> Aren't those things already provided in TARGET_CONFIGURE_* ?

It seems that libeXosip2 ignores CFLAGS and LIBS and uses the OSIP_ stuff.

libeXosip2 fails when building on OpenSuSE 11.0 for ARM.
Reason is that configure is trying to use host libraries.

While this problem at first sight would point at OpenSuSE I think that it is 
more complex.
I have previously seen in other packages that during configure something is 
tested,
inside the host files.
If the host has the same default as Buildroot, then the build can complete,
using buildroot directories, but if the host have other values then
the build goes wrong and the packaes fails to build.

The problem is not that OpenSuSE uses a different default.
It is that configure uses the host stuff in the first place.
>
> ulf> - --includedir=$(STAGING_DIR)/usr/include \
> ulf> - --oldincludedir=/usr/include \
>
> Peter> Why were these removed?

The build can complete without them (for ARM on OpenSuSE at least),
According to the principle of Occam's razor they then should not be present.

>

It certainly did not work without this

Best Regards
Ulf Samuelsson
