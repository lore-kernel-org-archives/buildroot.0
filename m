From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 22:48:37 +0200
Subject: [Buildroot] [PATCH 0/9] qt5: install missing examples
In-Reply-To: <20180617200551.l2kb6yky7w3mfacg@archlinux>
References: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
 <20180617144442.3fc03f6e@windsurf>
 <20180617200551.l2kb6yky7w3mfacg@archlinux>
Message-ID: <20180617224837.33949a3a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Sun, 17 Jun 2018 16:05:51 -0400, Ga?l PORTAY wrote:

> > However, I am not super happy with how we install Qt5 packages right
> > now. What we do is:
> >  
> 
> I am not happy too; and I was already thinking about improving that.

Great.

> >  - Staging installation: "make install", with no DESTDIR or anything
> >    similar
> > 
> >  - Target installation: manual copy.
> > 
> > Ideally, I'd prefer if we could do:
> > 
> >  - Staging installation: make DESTDIR=$(STAGING_DIR) install
> >  - Target installation: make DESTDIR=$(TARGET_DIR) install
> > 
> > Unfortunately, this doesn't work as-is, because the $(STAGING_DIR)
> > location is hardcoded at Qt configure time, so it doesn't work
> > immediately to do separate installation for staging and target. I know
> > Arnout briefly looked into this during the last Buildroot hackathon.
> 
> There is INSTALL_ROOT variable which looks to be equivalent to DESTDIR.

Yes, but no. The problem is that with the way things are currently
setup, if you set INSTALL_ROOT to /foo/bar and STAGING_DIR
is /home/thomas/buildroot/output/staging, then Qt5 stuff will be
installed in:

	/foo/bar/home/thomas/buildroot/output/staging

Which is obviously wrong. And I believe the fact that it does this is
due to:

                -sysroot $(STAGING_DIR) \

when configuring Qt5. Some research is needed to see if a better
solution is possible :-)

> Also, I was thinking about a qmake-package or a qt5module-package.

A qmake-package infrastructure might make sense. But beware of Qt4/Qt5
compatibility. But to me, fixing the first problem is much more
important/useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
