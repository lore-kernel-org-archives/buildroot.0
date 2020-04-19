From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Apr 2020 00:34:22 +0200
Subject: [Buildroot] [PATCH v3,
 3/6] package/collectd: add DPDK_TELEMETRY option
In-Reply-To: <20200419211456.GD5035@scaer>
References: <20200415063008.2237470-1-fontaine.fabrice@gmail.com>
 <20200415063008.2237470-3-fontaine.fabrice@gmail.com>
 <20200419211456.GD5035@scaer>
Message-ID: <CAPi7W807VQqEY45t05LYZVULAFr3eBXmJBRugVL6xvYYUBVc4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le dim. 19 avr. 2020 ? 23:15, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> +Peter, +Thomas, +Arnout for your feedback below...
>
> On 2020-04-15 08:30 +0200, Fabrice Fontaine spake thusly:
> > DPDK support is available since version 5.11.0 and
> > https://github.com/collectd/collectd/commit/00cbd4d2c016a676db476ae66bbc58d6bf11a6a0
> >
> > It depends on jansson and is currently enabled by default raising the
> > following build failure on musl:
> >
> > src/dpdk_telemetry.c:43:10: fatal error: sys/unistd.h: No such file or directory
> >  #include <sys/unistd.h>
> >           ^~~~~~~~~~~~~~
> >
> > Fixes:
> >  - autobuild.buildroot.org/results/aafb8c72f147fefc7a988c45e4dc17de48b07a95
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...c-dpdk_telemetry.c-fix-build-on-musl.patch | 37 +++++++++++++++++++
> >  package/collectd/Config.in                    |  7 ++++
> >  package/collectd/collectd.mk                  |  5 +++
> >  3 files changed, 49 insertions(+)
> >  create mode 100644 package/collectd/0001-src-dpdk_telemetry.c-fix-build-on-musl.patch
> >
> [--SNIP--]
> > diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
> > index 24cdad7e1b..52b218e139 100644
> > --- a/package/collectd/collectd.mk
> > +++ b/package/collectd/collectd.mk
> > @@ -66,6 +66,7 @@ COLLECTD_CONF_OPTS += \
> >       $(if $(BR2_PACKAGE_COLLECTD_DF),--enable-df,--disable-df) \
> >       $(if $(BR2_PACKAGE_COLLECTD_DISK),--enable-disk,--disable-disk) \
> >       $(if $(BR2_PACKAGE_COLLECTD_DNS),--enable-dns,--disable-dns) \
> > +     $(if $(BR2_PACKAGE_COLLECTD_DPDK_TELEMETRY),--enable-dpdk_telemetry,--disable-dpdk_telemetry) \
> >       $(if $(BR2_PACKAGE_COLLECTD_DRBD),--enable-drbd,--disable-drbd) \
> >       $(if $(BR2_PACKAGE_COLLECTD_EMPTY_COUNTER),--enable-match_empty_counter,--disable-match_empty_counter) \
> >       $(if $(BR2_PACKAGE_COLLECTD_ENTROPY),--enable-entropy,--disable-entropy) \
> > @@ -156,6 +157,7 @@ COLLECTD_DEPENDENCIES = \
> >       $(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),libcurl yajl) \
> >       $(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
> >       $(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
> > +     $(if $(BR2_PACKAGE_COLLECTD_DPKD_TELEMETRY),jansson) \
> >       $(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
> >       $(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
> >       $(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
> > @@ -186,6 +188,9 @@ COLLECTD_DEPENDENCIES = \
> >  ifeq ($(BR2_PACKAGE_GRPC),y)
> >  COLLECTD_CONF_OPTS += --with-libgrpc++=$(STAGING_DIR)/usr
> >  endif
> > +ifeq ($(BR2_PACKAGE_JANSSON),y)
> > +COLLECTD_CONF_OPTS += --with-libjansson=$(STAGING_DIR)/usr
> > +endif
>
> This code is bugging me: it decorelates the --enable/disable options,
> the dependencies and the --with option.
>
> With this patch, this means that is jansoon is enabled, but DPDK
> telemetry is not, then we still pass --with-libjansson.
Indeed, but jansson is not only used by DPDK but also by the
capabilities plugin (fifth patch of the serie).
However, that's true that I could move the jansson dependency under
the BR2_PACKAGE_JANSSON block but as you pointed out I basically
mimicked the existing code.
>
> I think the $(if blabla,--enable-bla,--disable-bla) construct should be
> limited to thos options that do not require a dependency or another
> --with option. If it does, then we should revert to using the
> traditional conditional block:
>
>     ifeq ($(BR2_PACKAGE_COLLECTD_DPDK_TELEMETRY),y)
>     COLLECTD_DEPENDENCIES += jansson
>     COLLECTD_CONF_OPTS += --enable-dpdk_telemetry --with-libjansson=$(STAGING_DIR)/usr
>     else
>     COLLECTD_CONF_OPTS += --disable-dpdk_telemetr
>     endif
>
> I know you mimicked the existing code, but short of fixing it, could you
> please respin patches 3-6 with that in mind, pretty please? But first
> wait a bit for another maintainer to expres their opionion: Peter,
> Thomas, Arnout: what's your feeling?
>
> Regards,
> Yann E. MORIN.
>
> >  ifeq ($(BR2_PACKAGE_LIBCURL),y)
> >  COLLECTD_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
> >  endif
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
