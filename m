From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Feb 2017 15:48:09 +0100
Subject: [Buildroot] [PATCHv2 1/1] Added keepalived
In-Reply-To: <1486542692-26969-1-git-send-email-apalos@gmail.com> (Ilias
 Apalodimas's message of "Wed, 8 Feb 2017 10:31:32 +0200")
References: <1486542692-26969-1-git-send-email-apalos@gmail.com>
Message-ID: <877f50pwly.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ilias" == Ilias Apalodimas <apalos@gmail.com> writes:

 > Changelog: 
 >  - Added keepalived on DEVELOPERS file
 >  - Fix package dependecies as proposed(MMU support)
 >  - Added keepalived.hash

Thanks for the update. This changelog should not be part of the git
commit, so it should go after the --- line.

 > +++ b/package/keepalived/keepalived.mk
 > @@ -0,0 +1,13 @@
 > +################################################################################
 > +#
 > +# keepalived
 > +#
 > +################################################################################
 > +
 > +KEEPALIVED_VERSION = 1.3.2
 > +KEEPALIVED_SITE = http://www.keepalived.org/software
 > +KEEPALIVED_DEPENDENCIES = popt openssl
 > +KEEPALIVED_LICENSE = GPLv2+
 > +KEEPALIVED_LICENSE_FILES = COPYING
 > +
 > +$(eval $(autotools-package))

This looks good, but a quick look at the configure script shows that it
uses pkg-config so you should most likely depend on host-pkgconf and
there are a number of optional dependencies that we do have in Buildroot
(E.G. dbus, glib, ipset, libnl, netsnmp, ..) that should either be
enabled/disabled depending on if those packages are enabled or
forcefully disabled to ensure reproducable builds.

Can you look into that please?

-- 
Bye, Peter Korsgaard
