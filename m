From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 17 Jun 2018 17:11:36 -0400
Subject: [Buildroot] [PATCH 0/9] qt5: install missing examples
In-Reply-To: <20180617224837.33949a3a@windsurf>
References: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
 <20180617144442.3fc03f6e@windsurf>
 <20180617200551.l2kb6yky7w3mfacg@archlinux>
 <20180617224837.33949a3a@windsurf>
Message-ID: <20180617211136.soa74rty7nxqjs7h@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Jun 17, 2018 at 10:48:37PM +0200, Thomas Petazzoni wrote:
> > (...)
> > 
> > There is INSTALL_ROOT variable which looks to be equivalent to DESTDIR.
> 
> Yes, but no. The problem is that with the way things are currently
> setup, if you set INSTALL_ROOT to /foo/bar and STAGING_DIR
> is /home/thomas/buildroot/output/staging, then Qt5 stuff will be
> installed in:
> 
> 	/foo/bar/home/thomas/buildroot/output/staging
> 
> Which is obviously wrong. And I believe the fact that it does this is
> due to:
> 
>                 -sysroot $(STAGING_DIR) \
> 
> when configuring Qt5. Some research is needed to see if a better
> solution is possible :-)
>

I will have a look to that. I have started a fresh build with few
modifications on pathes.

I think it is because of the prefix in qt.conf.in which is sed to
$(HOST_DIR).

	[Paths]
	Prefix=@@HOST_DIR@@
	...
	Libraries=/usr/lib
	...
	Binaries=/usr/bin
	...

I will see.

> > Also, I was thinking about a qmake-package or a qt5module-package.
> 
> A qmake-package infrastructure might make sense. But beware of Qt4/Qt5
> compatibility. But to me, fixing the first problem is much more
> important/useful.
>

For sure...  My first run is to rewrite all <qt5modules>_INSTALL_TARGET
(if possible) using:

	$(MAKE) -C ... install INSTALL_ROOT=$(TARGET_DIR)

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
