From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Oct 2019 14:43:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: fix nfs-utils_env.sh
 path
In-Reply-To: <20191004101646.5801a3ee@windsurf>
References: <20191003140410.45651-1-james.hilliard1@gmail.com>
 <20191004101646.5801a3ee@windsurf>
Message-ID: <CADvTj4qg4CffhdG8bd-tLxU7vp-K5713UF+uVO0wku92WOfFjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 4, 2019 at 10:16 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Thu,  3 Oct 2019 08:04:10 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Per upstream commit bf12e1fa9f48e8ee91a2869e69484c70595b5160
> > https://cdn.kernel.org/pub/linux/utils/nfs-utils/1.3.4/1.3.4-Changelog
> >
> > Currently nfs-utils_env.sh is installed in a
> > directory that is own by systemd. They requested
> > via https://bugzilla.redhat.com/show_bug.cgi?id=1303113
> > to move the script into /usr/libexec/nfs-utils
> >
> > As such we must update the installation path for nfs-utils_env.sh.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/nfs-utils/nfs-utils.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> > index 9d3e5e7563..cb2caa03f0 100644
> > --- a/package/nfs-utils/nfs-utils.mk
> > +++ b/package/nfs-utils/nfs-utils.mk
> > @@ -93,7 +93,7 @@ define NFS_UTILS_INSTALL_INIT_SYSTEMD
> >               $(TARGET_DIR)/etc/systemd/system/remote-fs.target.wants/nfs-client.target
> >
> >       $(INSTALL) -D -m 0755 package/nfs-utils/nfs-utils_env.sh \
> > -             $(TARGET_DIR)/usr/lib/systemd/scripts/nfs-utils_env.sh
> > +             $(TARGET_DIR)/usr/libexec/nfs-utils/nfs-utils_env.sh
>
> If I get it correctly looking at upstream commit
> bf12e1fa9f48e8ee91a2869e69484c70595b5160, this script is only used from
> nfs-config.service, and we are not installing nfs-config.service. So
> what is the impact ?
The package itself handles nfs-config.service installation so we do use it.
See:
http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=blob;f=systemd/Makefile.am;h=03f96e93dccf814f7c8aee5cc9a78083231fefb3;hb=188354e57dd8476e66ce30d647180a106da29b88#l8
>
> Also, could you indicate if this issue is applicable to 2019.02.x,
> 2019.05.x and 2019.08.x ? I guess it depends on which version of
> nfs-utils is currently shipped in those branches, and whether they have
> bf12e1fa9f48e8ee91a2869e69484c70595b5160 or not.
It was broken by buildroot commit 06445ee36dee49555599bc9c963201bce237ab64
so anything before that should be fine.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
