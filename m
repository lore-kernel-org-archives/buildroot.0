From: Pawel Sikora <sikor6@gmail.com>
Date: Tue, 21 Mar 2017 16:57:50 +0100
Subject: [Buildroot] [PATCH 3/3] xenomai: enable SMP in configuration
	options
In-Reply-To: <228d4c07-8def-1653-8de5-26ac4b139fb6@mind.be>
References: <20170320233349.14057-1-sikor6@gmail.com>
 <20170320233349.14057-3-sikor6@gmail.com>
 <228d4c07-8def-1653-8de5-26ac4b139fb6@mind.be>
Message-ID: <CAKfV1CYz9nxSA54vu-VsshhAHwgomv=78JLA=b1+LN7B6RtcLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Completely agree, corrected patch:

http://lists.busybox.net/pipermail/buildroot/2017-March/187474.html

including adding option in Config.in and checking it in xenomai.mk

Tested in runtime on Zybo Zynq-7000 with/without config enabled.

Behaves as expected on kernel with SMP:

without smp enabled:
# xeno-test
Started child 95: /bin/sh /usr/bin/xeno-test-run-wrapper /usr/bin/xeno-test
+ echo 0
+ testdir=/usr/bin
+ /usr/bin/smokey --run
   0"000.000| BUG in xenomai_init(): [main] running non-SMP libraries on
SMP kernel?
              build with --enable-smp or disable check with --no-sanity

with smp enabled:
# xeno-test
Started child 95: /bin/sh /usr/bin/xeno-test-run-wrapper /usr/bin/xeno-test
+ echo 0
+ testdir=/usr/bin
+ /usr/bin/smokey --run
arith OK
bufp skipped (no kernel support)
cpu_affinity skipped (no kernel support)
iddp skipped (no kernel support)
leaks OK
net_packet_dgram skipped (no kernel support)
net_packet_raw skipped (no kernel support)
net_udp skipped (no kernel support)
...

Kind Regards,
Pawel

2017-03-21 10:08 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:

>
>
> On 21-03-17 00:33, sikor6 at gmail.com wrote:
> > From: Pawel Sikora <sikor6@gmail.com>
> >
> > Add --enable-smp to XENOMAI_CONF_OPTS, so kernel and xenomai
> > userpace libs both support it.
>
>  This is not good, because xenomai is still used a lot on uniprocessors as
> well.
> Ideally, we'd check linux .config if SMP is enabled or not - but
> unfortunately
> that's not an option since Xenomai userspace can be built without building
> a kernel.
>
>  I think the only option here is to add a Config.in symbol to allow the
> user to
> select SMP.
>
>  Unless you can verify that enabling SMP unconditionally is not a problem,
> i.e.
> that it doesn't give overhead (extra latency) on a uniprocessor. But then I
> wonder why it would be an option in Xenomai...
>
>  Regards,
>  Arnout
>
> >
> > Signed-off-by: Pawel Sikora <sikor6@gmail.com>
> > ---
> >  package/xenomai/xenomai.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> > index 28875b944..37ec68526 100644
> > --- a/package/xenomai/xenomai.mk
> > +++ b/package/xenomai/xenomai.mk
> > @@ -21,7 +21,7 @@ XENOMAI_INSTALL_STAGING = YES
> >  XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
> >  XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
> >
> > -XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/
> --disable-doc-install
> > +XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/
> --disable-doc-install --enable-smp
> >
> >  define XENOMAI_REMOVE_DEVFILES
> >       for i in xeno-config xeno-info wrap-link.sh ; do \
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170321/8f89a51f/attachment.html>
