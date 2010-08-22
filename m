From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 22 Aug 2010 02:36:52 +0200
Subject: [Buildroot] Stuff for the next release (2010.11)
In-Reply-To: <20100821184657.6f49a80f@surf>
References: <20100821184657.6f49a80f@surf>
Message-ID: <1282437412.1242.128.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm joining Thomas to write a little about the work I'm doing on
Buildroot and that could be part of the next release (2010.11).

I started to work on package generation about 1 month ago
(http://potipota.net/cgi-bin/cgit.cgi/buildroot/log/?h=package-generation). The idea behind this is to generate a per package "tarball" of what is getting installed in the staging/target directories. This way, we could easily :
        * uninstall packages, by removing all files listed in the
        tarballs
        * generate packages in ipk (or whatever) format to easily update
        our rootfs ;)
After having been able to tarball some of the packages, I realized that
it won't work without important modifications about how we deal with
libtooled packages and more particulary with libraries compiled with
libtool. Indeed, to be able to cross compiled library with libtool, we
currently use 2 tricks :
        * a libtool patch to fix some cross compilation problems with
        libtool
        * we edit all .la files to replace the path to the libraries
        (ie. /usr/lib by $(STAGING_DIR)/usr/lib)
This second point is the main problem I'm facing to generate correct
tarballs at the moment, and it also led me to investigate the problem we
have with libtool.

I started to rework the way we work with libtool about 2 weeks ago
(http://potipota.net/cgi-bin/cgit.cgi/buildroot/log/?h=new-libtool-at-work).
Here is at quick list of impacts :
        * it is now required to run autoreconf on all the libtooled
        packages
        * we can get rid of adding -L$(STAGING_DIR)/lib -L
        $(STAGING_DIR)/usr/lib to LDFLAGS
        * the libtool patch isn't used anymore
At the moment I'm having something that work, but in a limited
configuration (with glibc external toolchains). The sum of modified code
is quite small at the moment, but it has a significant impact on a lot
of packages (everything using libtool, which means probably most of the
libraries). I will give an update later on the list to detail the
remaining problems.

All this stuff is in ugly/not-complete state at the moment, but I hope
to complete the libtool stuff pretty soon.

Regards,

-- 
Lionel Landwerlin
