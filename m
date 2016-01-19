From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Tue, 19 Jan 2016 08:53:57 -0600
Subject: [Buildroot] [PATCH v3 2/4] package/dhcp: add bind configure
 options for cross compiling
In-Reply-To: <569D2768.9070208@mind.be>
References: <1453131741-1613-1-git-send-email-rdkehn@yahoo.com>
 <1453131741-1613-3-git-send-email-rdkehn@yahoo.com>
 <569D2768.9070208@mind.be>
Message-ID: <20160119145357.GA4492@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Jan 18, 2016 at 06:56:56PM +0100, Arnout Vandecappelle wrote:
> On 18-01-16 16:42, Doug Kehn wrote:
> > Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> > ---
> > Changes v2 -> v3
> >   - removed RFC tag
> > Changes v1 -> v2
> >   - no changes
> > ---
> >  package/dhcp/0001-bind-configure.patch | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 package/dhcp/0001-bind-configure.patch
> > 
> > diff --git a/package/dhcp/0001-bind-configure.patch b/package/dhcp/0001-bind-configure.patch
> > new file mode 100644
> > index 0000000..9a38f45
> > --- /dev/null
> > +++ b/package/dhcp/0001-bind-configure.patch
> > @@ -0,0 +1,19 @@
> > +add bind configure options for cross compiling
> > +
> > +Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> > +
> > +Index: dhcp-4.3.3-P1/bind/Makefile.in
> > +===================================================================
> > +--- dhcp-4.3.3-P1.orig/bind/Makefile.in
> > ++++ dhcp-4.3.3-P1/bind/Makefile.in
> > +@@ -30,7 +30,9 @@ bindconfig = --disable-kqueue --disable-
> > + 	--without-openssl --without-libxml2 --enable-exportlib \
> > + 	--with-gssapi=no --enable-threads=no @BINDCONFIG@ \
> > + 	--with-export-includedir=${binddir}/include \
> > +-	--with-export-libdir=${binddir}/lib
> > ++	--with-export-libdir=${binddir}/lib \
> > ++	--target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
> > ++	--build=$(GNU_HOST_NAME) --with-randomdev=/dev/urandom
> 
>  I think the --target, --host and --build parts are upstreamable.

Agree. I figured out that changing this to '--target=@target_alias@
--host=@host_alias@ --build=@build_alias@' is much cleaner. I will
clean this patch up.

> 
>  However, the --with-randomdev certainly is not upstreamable in its current
> form. It should probably use ac_cv_file__dev_random to decide.

Agree. dhcp configure has a BINDCONFIG environment variable that can
be used to set this (e.g. BINDCONFIG='--with-randomdev=/dev/random).
However, dhcp configure has BINDCONFIG hardcoded. An upstreamable
patch to dhcp configure resolves this.

> 
>  BTW we have a bit of an inconsistency here: in dhcp, we choose /dev/random but
> in bind we choose /dev/urandom.

Thanks.

> 
>  Note that if we call configure explicitly in a POST_CONFIGURE_HOOK, then this
> patch is not needed (although the --target, --host, --build stuff is of course
> still interesting to improve its cross-compilation support).

I don't think it is a good idea to call bind configure directly
since bind Makefile, which calls bind configure, has bind specific
configure parameters. Do you agree?

Regards,
...doug
