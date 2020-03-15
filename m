From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 11:34:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/gupnp: disable introspection
In-Reply-To: <CAFSsvmruUz+YB=mef43KTWTP_ffJbP4eXX_iK-jE1QXvbE2AsQ@mail.gmail.com>
References: <20200311193410.69589-1-fontaine.fabrice@gmail.com>
 <CAFSsvmq1PdEHT-zNqMG_nh2VnUJdQEVBYny6H9pR12FTaDU0nw@mail.gmail.com>
 <CAPi7W81w=vJyfh3YJ4BTbe82qt49HTDepWCQdZid5Zbm7_OVOw@mail.gmail.com>
 <CAFSsvmruUz+YB=mef43KTWTP_ffJbP4eXX_iK-jE1QXvbE2AsQ@mail.gmail.com>
Message-ID: <20200315103431.GA19677@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-12 13:05 -0700, Adam Duskett spake thusly:
> Hey Fabrice;
> 
> Actually my patch set does indeed fix these issues! GOI has two issues:
> 
> 1) host-goi does not build typelib or gir files.
> 2) goi does not work with meson projects.
> 
> My patch set fixes both of these issues, and I have tested extensively with
> every package I could find in Buildroot currently.
> 
> Some packages I tested GOI with include:
> libsecret
> gssdp
> gtk3
> libsoup
> gstreamer1
> 
> All of them work fine with my patch set applied.

So I took your word for it, and explictly enabled goi in gssdp with the
following patch:

    diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
    index 4589517691..0b78a174cd 100644
    --- a/package/gssdp/gssdp.mk
    +++ b/package/gssdp/gssdp.mk
    @@ -13,8 +13,9 @@ GSSDP_LICENSE_FILES = COPYING
     GSSDP_INSTALL_STAGING = YES
     GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
     GSSDP_CONF_OPTS = \
    -	-Dexamples=false \
    -	-Dintrospection=false
    +	-Dexamples=false
    +
    +GSSDP_DEPENDENCIES += gobject-introspection host-vala
     
     ifeq ($(BR2_PACKAGE_LIBGTK3),y)
     GSSDP_DEPENDENCIES += libgtk3

host-vala is needed because gssdp wants to use vapigen, which is a vala
tool.

I then applied your v5 [0] of said series, and used this defconfig:

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    BR2_PACKAGE_PYTHON3=y
    BR2_PACKAGE_GUPNP=y
    BR2_PACKAGE_GOBJECT_INTROSPECTION=y
    # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
    # BR2_TARGET_ROOTFS_TAR is not set

And the build fails:

    2020-03-15 11:08:24 [20/21] Generating gssdp-1.0.vapi with a custom command.
    2020-03-15 11:08:24 FAILED: vala/gssdp-1.0.vapi 
    2020-03-15 11:08:24 /home/ymorin/dev/buildroot/O/host/bin/vapigen --quiet --library=gssdp-1.0 --directory=/home/ymorin/dev/buildroot/O/build/gssdp-1.0.3/build/vala --pkg=gio-2.0 --pkg=libsoup-2.4 --metadatadir=/home/ymorin/dev/buildroot/O/build/gssdp-1.0.3/vala /home/ymorin/dev/buildroot/O/build/gssdp-1.0.3/build/libgssdp/GSSDP-1.0.gir
    2020-03-15 11:08:24 error: Package `GObject-2.0' not found in specified Vala API directories or GObject-Introspection GIR directories
    2020-03-15 11:08:24 error: Package `Gio-2.0' not found in specified Vala API directories or GObject-Introspection GIR directories
    2020-03-15 11:08:24 error: Package `Soup-2.4' not found in specified Vala API directories or GObject-Introspection GIR directories
    2020-03-15 11:08:26 [21/21] Generating GSSDP-1.0.typelib with a custom command.
    2020-03-15 11:08:26 ninja: build stopped: subcommand failed.
    2020-03-15 11:08:26 make[1]: *** [package/pkg-generic.mk:269: /home/ymorin/dev/buildroot/O/build/gssdp-1.0.3/.stamp_built] Error 1
    2020-03-15 11:08:26 make: *** [Makefile:23: _all] Error 2

So I had a deeper look in the patches from Fabrice, and I noticed
soemthing we must fix before we can enable goi  with those packages. For
example, for gupnp:

    Couldn't find include 'GSSDP-1.0.gir' (search path:
        '['/nvmedata/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0',
          '..', 
          '/nvmedata/autobuild/instance-0/output-1/host/share',
          'gir-1.0',
          '/nvmedata/autobuild/instance-0/output-1/host/share/gir-1.0',
          '/usr/share/gir-1.0'
        ]')

Notice how there is a host path leaking in there: /usr/share/gir-1.0
There are similar paths in the other reports by Fabrice, btw...

So, maybe your builds did succeed because you do have the needed files
there on your machines, but for me, they are totally missing, and the
build fails.

That non-withstanding, I spent quite sometime this morning working on,
and trying to understand your v5. I haven't pushed it yet, but I'll
probably respin a repacement series shortly...

In the meantime, I'd be happy to take any build test (or better yet,
runtime test) that demonstrate GOI and proves your fixes are working.

I am sorry if I am putting some burden on you with such requests, but as
you can see above, we're not entirely done with GOI, and I could not
validate here your assertion that it works (be sure that makes me sad).

Finaly, as we've discused a few days ago on IRC, disabling introspection
in thos epackages is not a gression: introspection was not possible
before, so explicitly disabling it can't be a regression; at the very
least, it maintians a status quo. And enabling it does not simply look
like adding the proper dependencies, even with your series: it seems
really more involved than that.

Even if we now explicitly disable introspection inthose packages, an
interested party can come up with patches in the future.

So I am very tempted to take Fabrice's patches to explicitly disable
introspection for those packages where it was so far left to chance.
I'll wait a bit more until the end of the day (UTC+1) to get more
feedback about that...

Regards,
Yann E. MORIN.

> Also, I made a new patch set just a few minutes ago along with a bump
> to libglib2 and goi.
> https://patchwork.ozlabs.org/project/buildroot/list/?series=164047
> https://patchwork.ozlabs.org/project/buildroot/list/?series=164050
> https://patchwork.ozlabs.org/project/buildroot/list/?series=164052
> 
> Thanks!
> 
> Adam
> 
> On Thu, Mar 12, 2020 at 11:20 AM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > Adam, all,
> >
> > Le jeu. 12 mars 2020 ? 18:31, Adam Duskett <aduskett@gmail.com> a ?crit :
> > >
> > > Frabrice, all;
> > >
> > >
> > > I disagree with this patch set.
> > > I have a patch set that has been sitting for a few weeks now that
> > > allows introspection to work with meson packages:
> > > https://patchwork.ozlabs.org/project/buildroot/list/?series=161028
> > gupnp (and libgtk3 as well as gdk-pixbuf) are autotools packages and
> > not meson packages. From my understanding, your patchset does not fix
> > those. Am I right?
> > Concerning gupnp, I tried to switch it to meson in August 2019 but I
> > had to revert this change due to meson's subproject feature for guul
> > being completely broken on static build with meson.
> > It seems that the issue is now fixed thanks to
> > https://github.com/mesonbuild/meson/pull/5936 so I could try, again,
> > to use meson with gupnp.
> > However, we'll still have to convert libgtk3 and gdk-pixbuf to meson.
> > >
> > > If we apply this patchset first, then we should set this package (and
> > > it's dependencies) to check for goi and enable or disable
> > > introspection conditionally.
> > >
> > > On Wed, Mar 11, 2020 at 12:33 PM Fabrice Fontaine
> > > <fontaine.fabrice@gmail.com> wrote:
> > > >
> > > > Build fails if gobject-introspection is built before gupnp:
> > > >
> > > >  GISCAN   GUPnP-1.0.gir
> > > > Couldn't find include 'GSSDP-1.0.gir' (search path: '['/nvmedata/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '..', '/nvmedata/autobuild/instance-0/output-1/host/share', 'gir-1.0', '/nvmedata/autobuild/instance-0/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')
> > > >
> > > > Fixes:
> > > >  - http://autobuild.buildroot.org/results/ea91dab1d9a59c1aefa481c316115558a6f6e8f8
> > > >
> > > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > > ---
> > > >  package/gupnp/gupnp.mk | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
> > > > index 29305f0b4b..27486b09fa 100644
> > > > --- a/package/gupnp/gupnp.mk
> > > > +++ b/package/gupnp/gupnp.mk
> > > > @@ -12,5 +12,6 @@ GUPNP_LICENSE = LGPL-2.0+
> > > >  GUPNP_LICENSE_FILES = COPYING
> > > >  GUPNP_INSTALL_STAGING = YES
> > > >  GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
> > > > +GUPNP_CONF_OPTS = --disable-introspection
> > > >
> > > >  $(eval $(autotools-package))
> > > > --
> > > > 2.25.1
> > > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot at busybox.net
> > > > http://lists.busybox.net/mailman/listinfo/buildroot
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
