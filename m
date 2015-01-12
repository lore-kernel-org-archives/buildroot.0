From: Steve Kenton <skenton@ou.edu>
Date: Mon, 12 Jan 2015 11:26:33 -0600
Subject: [Buildroot] [PATCH] dvdauthor : new package
In-Reply-To: <20150112163737.6739827b@free-electrons.com>
References: <54B317DE.9090105@ou.edu>	<20150112092800.08ce4350@free-electrons.com>	<54B3E959.2010504@ou.edu>
 <20150112163737.6739827b@free-electrons.com>
Message-ID: <54B403C9.8050207@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/12/2015 09:37 AM, Thomas Petazzoni wrote:

>> configure:5176: checking for freetype-config
>> configure:5192: found /usr/bin/freetype-config
> 
> Hu? This does not indicate a host dependency: it indicates that it's
> incorrectly using the host freetype-config, while it should be using
> the one in $(STAGING_DIR). Generally, this is solved by passing some
> ac_cv_path_<foo> variable.
OK, digging into this freetype-config does in fact exist at:

$ find . -type f -name freetype-config
./output/host/usr/i586-buildroot-linux-gnu/sysroot/usr/bin/freetype-config

But $PATH and arguments $* on entry to configure for dvdauthor are:

/data/bcdist/test/buildroot/output/host/bin:/data/bcdist/test/buildroot/output/host/sbin:/data/bcdist/test/buildroot/output/host/usr/bin:/data/bcdist/test/buildroot/output/host/usr/sbin:/bcdist/bin:/home/steve/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

--target=i586-buildroot-linux-gnu --host=i586-buildroot-linux-gnu --build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --localstatedir=/var --program-prefix= --disable-gtk-doc --disable-doc --disable-docs
--disable-documentation --with-xmlto=no --with-fop=no --disable-dependency-tracking --enable-ipv6 --disable-debug --disable-static --enable-shared

So for some reason 'usr/i586-buildroot-linux-gnu/sysroot/' is missing in the middle of the search paths inside of buildroot

How is $(STAGING_DIR) normally set/passed to configure? I could probably just force the correct freetype-config
but it looks like there is something deeper wrong and I'd rather get to the bottom and fix it "properly".

Thanks - Steve
