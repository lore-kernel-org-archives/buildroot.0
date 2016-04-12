From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Apr 2016 23:30:22 +0200
Subject: [Buildroot] [PATCH] gutenprint: fix host installation
In-Reply-To: <a465019a350db47bb0f8527a628f5df0ef74eecd.1460480190.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 12 Apr 2016 19:56:30 +0300")
References: <a465019a350db47bb0f8527a628f5df0ef74eecd.1460480190.git.baruch@tkos.co.il>
Message-ID: <87egaaldld.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Set DESTDIR to avoid installation attempt into build host directories.
 > Fixes:
 > http://autobuild.buildroot.net/results/bca/bca299631949c7699682af41e3f1373dd10866ed/
 > http://autobuild.buildroot.net/results/294/294dfc02ee95caaac4be9fd632c399bb2c7d3f83/
 > http://autobuild.buildroot.net/results/8ce/8ce0c14d92f34245a87758db60c618916be48586/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Hmm, this sounds fishy. DESTDIR is normally only needed when the
installation directory is different from where the files will be used at
runtime (E.G. like for our target installation). Host-gutenprint should
be configured to install and run in HOST_DIR, so if you pass
DESTDIR=$(HOST_DIR) the files ends up in $(HOST_DIR)/$(HOST_DIR)/usr/..

The error sounds more like it misdetects the location of (host-)cups. We
do pass --without-cups to the configure script though, so I wonder why
it still wants to install cups files.

Care to take a 2nd look?

> ---
 >  package/gutenprint/gutenprint.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
 > index 7e3024d400af..2ee411f66cc3 100644
 > --- a/package/gutenprint/gutenprint.mk
 > +++ b/package/gutenprint/gutenprint.mk
 > @@ -69,6 +69,8 @@ HOST_GUTENPRINT_CONF_OPTS = \
 >  	--disable-testpattern \
 >  	--without-cups
 
 > +HOST_GUTENPRINT_INSTALL_OPTS = DESTDIR=$(HOST_DIR) install
 > +
 >  # Needed by autoreconf
 >  define GUTENPRINT_CREATE_M4_DIR
 >  	mkdir -p $(@D)/m4local
 > -- 
 > 2.8.0.rc3

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
