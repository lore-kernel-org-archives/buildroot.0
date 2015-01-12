From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 19:32:38 +0100
Subject: [Buildroot] [PATCH] dvdauthor : new package
In-Reply-To: <54B403C9.8050207@ou.edu>
References: <54B317DE.9090105@ou.edu>
 <20150112092800.08ce4350@free-electrons.com>
 <54B3E959.2010504@ou.edu>
 <20150112163737.6739827b@free-electrons.com>
 <54B403C9.8050207@ou.edu>
Message-ID: <20150112193238.01e9bf95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Mon, 12 Jan 2015 11:26:33 -0600, Steve Kenton wrote:

> OK, digging into this freetype-config does in fact exist at:
> 
> $ find . -type f -name freetype-config
> ./output/host/usr/i586-buildroot-linux-gnu/sysroot/usr/bin/freetype-config
> 
> But $PATH and arguments $* on entry to configure for dvdauthor are:
> 
> /data/bcdist/test/buildroot/output/host/bin:/data/bcdist/test/buildroot/output/host/sbin:/data/bcdist/test/buildroot/output/host/usr/bin:/data/bcdist/test/buildroot/output/host/usr/sbin:/bcdist/bin:/home/steve/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
> 
> --target=i586-buildroot-linux-gnu --host=i586-buildroot-linux-gnu --build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --localstatedir=/var --program-prefix= --disable-gtk-doc --disable-doc --disable-docs
> --disable-documentation --with-xmlto=no --with-fop=no --disable-dependency-tracking --enable-ipv6 --disable-debug --disable-static --enable-shared
> 
> So for some reason 'usr/i586-buildroot-linux-gnu/sysroot/' is missing in the middle of the search paths inside of buildroot
> 
> How is $(STAGING_DIR) normally set/passed to configure? I could probably just force the correct freetype-config
> but it looks like there is something deeper wrong and I'd rather get to the bottom and fix it "properly".

No, there is nothing deeper wrong. The PATH is correct. It's just that
we need to explicitly pass the path to freetype-config to dvdauthor's
configure script.

You have to do something like:

DVDAUTHOR_CONF_ENV = \
	ac_cv_prog_FREETYPECONFIG=$(STAGING_DIR)/usr/bin/freetype-config

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
