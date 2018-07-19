From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 19 Jul 2018 22:48:25 +0200
Subject: [Buildroot] [RFC v2 1/4] meson: bump version to 0.47.1
In-Reply-To: <20180719060053.GA10375@itchy>
References: <20180717191605.19263-1-ps.report@gmx.net>
 <20180717202311.GA29739@itchy> <20180718221640.03319bc8@gmx.net>
 <20180719060053.GA10375@itchy>
Message-ID: <20180719224825.36f2de7e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Thu, 19 Jul 2018 08:00:53 +0200, Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

> On 2018-07-18 22:16, Peter Seiderer wrote:
> > Hello Eric,
> >
> > On Tue, 17 Jul 2018 22:23:11 +0200, Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
> >  
> > > Hi!
> > >
> > > On 2018-07-17 21:16, Peter Seiderer wrote:  
> > > > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > > > ---
> > > > Notes:
> > > > Hash not checked against the pgp signature, tried
> > > > 	$ gpg --verify meson-0.47.1.tar.gz.asc meson-0.47.1.tar.gz
> > > >   gpg: Signature made Di 10 Jul 2018 23:28:12 CEST
> > > >   gpg:                using RSA key 95181F4EED14FDF4E41B518D3BF4693BFEEB9428
> > > >   gpg: Can't check signature: No public key
> > > >
> > > > Any advice which public key is used to sign the meson package?  
> > >
> > > I check the signature as follows:
> > >
> > > ```
> > > $ gpg --recv-keys 3BF4693BFEEB9428
> > > $ gpg --verify meson-0.47.1.tar.gz.asc meson-0.47.1.tar.gz
> > > gpg: Signature made Tue Jul 10 23:28:12 2018 CEST using RSA key ID
> > > FEEB9428
> > > gpg: Good signature from "Jussi Pakkanen <jpakkane@gmail.com>"
> > > gpg: WARNING: This key is not certified with a trusted signature!
> > > gpg:          There is no indication that the signature belongs to the
> > > owner.
> > > Primary key fingerprint: 9518 1F4E ED14 FDF4 E41B  518D 3BF4 693B FEEB
> > > 9428
> > > ```
> > >
> > > BTW, shouldn't a signed-off-by line be added to the refreshed patch? I
> > > was about to send this package bump, so I can send mine if you want.  
> >
> > Which Signed-off-by line do you think is missing? Sorry for the double
> > effort, will send an updated version of the patch series soon (some
> > fixes for libdrm conversion), maybe better send a Reviewed-by to
> > my patch?  
> 
> Sorry, I misread your patch. I thought it refreshed the
> Buildroot-specific patch for fixing RPATH, whereas it removed it. See
> commit 7a23af4773665d2ee40e2d4e525746ebe38456dd for details.
> 
> This specific patch applies to 0.46.1 but not to 0.47.1, as the function
> to modify is not in mesonbuild/scripts/meson_install.py anymore, but in
> mesonbuild/minstall.py:
> 
> ```
> From cb5af88b1102ea8379323f95b9588c0bef71f175 Mon Sep 17 00:00:00 2001
> From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Date: Sat, 14 Jul 2018 11:18:45 +0200
> Subject: [PATCH] Only fix RPATH if install_rpath is not empty
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  mesonbuild/minstall.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
> index 4615b6dd..dd476ea8 100644
> --- a/mesonbuild/minstall.py
> +++ b/mesonbuild/minstall.py
> @@ -440,6 +440,14 @@ class Installer:
>                  try:
>                      depfixer.fix_rpath(outname, install_rpath, final_path,
>                                         install_name_mappings, verbose=False)
> +                    # Buildroot check-host-rpath script expects RPATH
> +                    # But if install_rpath is empty, it will stripped.
> +                    # So, preserve it in this case
> +                    if install_rpath:
> +                        depfixer.fix_rpath(outname, install_rpath, final_path,
> +                                           install_name_mappings, verbose=False)
> +                    else:
> +                        print("Skipping RPATH fixing")
>                  except SystemExit as e:
>                      if isinstance(e.code, int) and e.code == 0:
>                          pass
> --
> 2.14.4
> ```
> 
> If Buildroot does not complain on RPATH when generating a new image if
> this patch is missing, then no need for it and the Signed-off-by line
> ;-)

No RPATH complains here, additional checked via:

	$ ./support/scripts/check-host-rpath meson .../host

Please double check after the meson update without the RPATH patch...

> 
> I'll happily review your updated version.

Many Thanks in advance ;-), just sent out an new patch series version...

Regards,
Peter

> 
> Regards,
> 
> --
> ELB
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
