From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 5 Apr 2021 23:08:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/cifs-utils: add missing python
 dependencies
In-Reply-To: <20210403145221.GA2252@scaer>
References: <20210403132349.2220750-1-fontaine.fabrice@gmail.com>
 <20210403145221.GA2252@scaer>
Message-ID: <20210405230810.78ad41b4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice, Yann,

On Sat, 3 Apr 2021 16:52:21 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Fabrice, All,
>
> On 2021-04-03 15:23 +0200, Fabrice Fontaine spake thusly:
> > Add missing python dependencies which have been forgotten when bumping
> > to version 6.12 in commit b5dede7d1a03ab2b8caa0a8e79b09c8df6c62fe4
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/acdbf7c58ec8ae648f8048bc75650dcdcdca6285

This autobuild failure points to an libffi error...., quick search of the last
autobuild mails did not show an an cifs-utils error (or I did not find it), which
failure is this commit fixing?

> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/cifs-utils/Config.in | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/package/cifs-utils/Config.in b/package/cifs-utils/Config.in
> > index 0e61243de4..55829e3dc2 100644
> > --- a/package/cifs-utils/Config.in
> > +++ b/package/cifs-utils/Config.in
> > @@ -18,9 +18,16 @@ if BR2_PACKAGE_CIFS_UTILS
> >
> >  config BR2_PACKAGE_CIFS_UTILS_SMBTOOLS
> >  	bool "smbtools"
> > +	depends on BR2_USE_WCHAR # python
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # python
> > +	depends on !BR2_STATIC_LIBS # python
>
> We select python3, not python, so the added dependencies are because of
> python3, not python.
>
> Comments fixed accordingly, and patch applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> >  	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON # runtime

If this commit is fixing an error (and there is a build time dependency on
python) than, this comment 'runtime' is no longer valid...

Regards,
Peter


> >  	help
> >  	  Install the smb tools smbinfo and smb2-quota (python
> >  	  implementations).
> >
> > +comment "smbtools needs a toolchain w/ wchar, threads, dynamic library"
> > +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> > +		BR2_STATIC_LIBS
> > +
> >  endif
> > --
> > 2.30.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
