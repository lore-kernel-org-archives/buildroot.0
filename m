From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Jul 2021 02:18:40 -0600
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: enable nfsv4/nfsv4.1
 support
In-Reply-To: <853651D2-0E36-42AA-B225-CDBC5B06842D@benettiengineering.com>
References: <20210713031413.1057793-1-james.hilliard1@gmail.com>
 <853651D2-0E36-42AA-B225-CDBC5B06842D@benettiengineering.com>
Message-ID: <CADvTj4pdAmg3icorf6nzQjEeRnfndg8tSUNd0jcX1DW9Fs-kSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 13, 2021 at 2:03 AM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> Hello James,
>
> > Il giorno 13 lug 2021, alle ore 05:14, James Hilliard <james.hilliard1@gmail.com> ha scritto:
> >
> > ?Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > package/nfs-utils/Config.in    | 10 ++++++++++
> > package/nfs-utils/nfs-utils.mk |  9 +++++++--
> > 2 files changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
> > index da563db0f1..b736f6c973 100644
> > --- a/package/nfs-utils/Config.in
> > +++ b/package/nfs-utils/Config.in
> > @@ -14,6 +14,16 @@ config BR2_PACKAGE_NFS_UTILS
> >
> > if BR2_PACKAGE_NFS_UTILS
> >
> > +config BR2_PACKAGE_NFS_UTILS_NFSV4
> > +    bool "NFSv4/NFSv4.1"
> > +    depends on !BR2_STATIC_LIBS # keyutils, lvm2
> > +    select BR2_PACKAGE_KEYUTILS
> > +    select BR2_PACKAGE_LIBEVENT
> > +    select BR2_PACKAGE_LVM2
> > +    select BR2_PACKAGE_SQLITE
> > +    help
> > +      Enable NFSv4/NFSv4.1 support
> > +
> > config BR2_PACKAGE_NFS_UTILS_RPCDEBUG
> >    bool "rpcdebug"
> >    help
> > diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> > index c384e939d8..2598f0908b 100644
> > --- a/package/nfs-utils/nfs-utils.mk
> > +++ b/package/nfs-utils/nfs-utils.mk
> > @@ -16,8 +16,6 @@ NFS_UTILS_AUTORECONF = YES
> > NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
> >
> > NFS_UTILS_CONF_OPTS = \
> > -    --disable-nfsv4 \
> > -    --disable-nfsv41 \
>
> Is this ^^^ what prevents uuid.h build error?

No idea, have some background on that issue?

>
> Giulio
>
> >    --disable-gss \
> >    --disable-uuid \
> >    --enable-tirpc \
> > @@ -46,6 +44,13 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
> > NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_NFSD) += usr/sbin/exportfs \
> >    usr/sbin/rpc.mountd usr/sbin/rpc.nfsd usr/lib/systemd/system/nfs-server.service
> >
> > +ifeq ($(BR2_PACKAGE_NFS_UTILS_NFSV4),y)
> > +NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-nfsv41
> > +NFS_UTILS_DEPENDENCIES += keyutils libevent lvm2 sqlite
> > +else
> > +NFS_UTILS_CONF_OPTS += --disable-nfsv4 --disable-nfsv41
> > +endif
> > +
> > ifeq ($(BR2_PACKAGE_LIBCAP),y)
> > NFS_UTILS_CONF_OPTS += --enable-caps
> > NFS_UTILS_DEPENDENCIES += libcap
> > --
> > 2.25.1
> >
>
