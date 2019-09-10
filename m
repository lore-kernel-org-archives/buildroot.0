From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 10 Sep 2019 07:29:39 -0300
Subject: [Buildroot] [PATCH v2] package/nfs-utils: enable IPv6 if
 libtirpc is selected
In-Reply-To: <9c8666a8-6dc4-8747-7580-588eb574f52e@mind.be>
References: <6a13e0d0-9beb-99f0-436d-5a9d6fd7feb5@mind.be>
 <20190909235607.31990-1-unixmania@gmail.com>
 <9c8666a8-6dc4-8747-7580-588eb574f52e@mind.be>
Message-ID: <CAJ4jsaefMaEjAuJiqjtkNSNtGQJ=g4UP9xVg786+PE93JpHzkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 10, 2019 at 4:06 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 10/09/2019 01:56, unixmania at gmail.com wrote:
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > IPv6 requires libtirpc but we don't want to select BR2_PACKAGE_LIBTIRPC
> > inconditionally because it increases the size of system so enable IPv6
>
>  unconditionally
>
> > only if libtirpc is already selected.
> >
> > Fixes: https://bugs.busybox.net/show_bug.cgi?id=10806
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
> > ---
> > CC: nathan.renniewaldock at gmail.com
> > CC: Peter Seiderer <ps.report@gmx.net>
> > CC: Arnout Vandecappelle <arnout@mind.be>
> > CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > --
> > Changes v1->v2
>
>  This is v3, actually... v1 did the same as here (but without the
> --enable-ipv6), v2 selected LIBTIRPC unconditionally.
>
> > - Do not select libtirpc inconditionally
> > ---
> >  package/nfs-utils/nfs-utils.mk | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> > index dc20942f71..3d5f5412cf 100644
> > --- a/package/nfs-utils/nfs-utils.mk
> > +++ b/package/nfs-utils/nfs-utils.mk
> > @@ -19,7 +19,6 @@ NFS_UTILS_CONF_OPTS = \
> >       --disable-nfsv41 \
> >       --disable-gss \
> >       --disable-uuid \
> > -     --disable-ipv6 \
> >       --without-tcp-wrappers \
> >       --with-statedir=/run/nfs \
> >       --with-rpcgen=internal
> > @@ -51,11 +50,12 @@ else
> >  NFS_UTILS_CONF_OPTS += --disable-caps
> >  endif
> >
> > +# IPv6 requires libtirpc
>
>  Just to be sure: IPv6 really requires libtirpc, so the RPC implementation in
> glibc is not enough?
>
>  Assuming that this is the case:
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>
>  Finally, a small nitpick remark: it would be good to update the Config.in help
> text with this information. E.g.:
>
>           The NFS Linux kernel server.
> +
> +         For IPv6 support, select the libtirpc package.
>
>
>  Regards,
>  Arnout
>
> >  ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
> > -NFS_UTILS_CONF_OPTS += --enable-tirpc
> > +NFS_UTILS_CONF_OPTS += --enable-tirpc --enable-ipv6
> >  NFS_UTILS_DEPENDENCIES += libtirpc
> >  else
> > -NFS_UTILS_CONF_OPTS += --disable-tirpc
> > +NFS_UTILS_CONF_OPTS += --disable-tirpc --disable-ipv6
> >  endif
> >
> >  define NFS_UTILS_INSTALL_FIXUP
> >

2019-09-10T07:22:05 configure: error: '--enable-ipv6' requires TIRPC support.

Quite frankly this is a foolish discussion since nfs-utils selects
rpcbind which in its turn selects libtirpc. Anyway, your project, your
rules...

-- 
Carlos Santos <unixmania@gmail.com>
