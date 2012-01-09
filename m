From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 9 Jan 2012 11:17:05 -0600
Subject: [Buildroot] [PATCH] Static build changes
In-Reply-To: <20120109090404.74b2733b@skate>
References: <F9C551623D2CBB4C9488801D14F864C60E4498@ex-mb1.corp.adtran.com>
 <20120109090404.74b2733b@skate>
Message-ID: <201201091117.07744.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon January 9 2012, Thomas Petazzoni wrote:
> Hello,
> 
> Le Tue, 20 Dec 2011 16:11:54 +0000,
> ANDY KENNEDY <ANDY.KENNEDY@adtran.com> a ?crit :
> 
> > In the system I am building, we want to use all static applications in
> > place of using eglibc for the target.  I prefer to use uClibC for
> > busybox, and the applications you see above.  To prevent from having
> > dynamically linked applications, without having installed libraries, I
> > have modified these to either not install the application (in the case
> > of uClibC installing ldconfig, libgcrypt installing iconv, etc), or
> > build the target binary static.  In the case of a couple of libraries,
> > the install was modified to prevent the libraries from being installed
> > to the target when all that is needed is for another application being
> > installed.
> 
> Many of the modifications to the various packages look very similar.
> Isn't it possible to factorize those needed flags and options at the
> package infrastructure level somehow?
> 
> The modifications that I see are:
> 
>  * Adding -static to the LDFLAGS
> 
>  * Adding --enable-static --disable-shared in the configuration options
>    for autotools packages, which I think is useless because it's
>    already done at the end of package/Makefile.in
> 
>  * Using _INSTALL_TARGET=NO for libraries. This shouldn't be needed: if
>    the shared variant is not built, the static variant will be
>    installed on the target, then removed by target-finalize
> 
> For sure, there will probably be things that remain at the individual
> package level, but I'd like to see some reflection on what needs to be
> factorized at the package infrastructure level, especially for
> autotools packages that have a relatively well standardized behaviour.
>

Probably need to include provisions for -static-libgcc and -static-libstdc++ 
also to control the selection of how the compiler generated stuff is loaded.
http://gcc.gnu.org/onlinedocs/gcc/Link-Options.html

Mike
> Regards,
> 
> Thomas
