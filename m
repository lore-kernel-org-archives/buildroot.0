From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 May 2015 15:21:40 +0200
Subject: [Buildroot] [PATCH 1/1] fcgiwrap: new package
In-Reply-To: <1432657468-17210-1-git-send-email-thomas.claveirole@green-communications.fr>
 (Thomas Claveirole's message of "Tue, 26 May 2015 18:24:28 +0200")
References: <1432657468-17210-1-git-send-email-thomas.claveirole@green-communications.fr>
Message-ID: <87twuyw3yz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Claveirole <thomas.claveirole@green-communications.fr> writes:

 > Add package fcgiwrap from https://nginx.localdomain.pl/wiki/FcgiWrap
 > fcgiwrap is a simple server for running CGI applications over
 > FastCGI. It hopes to provide clean CGI support to Nginx (and other web
 > servers that may need it).

 > Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
 >  package/Config.in            |  1 +
 >  package/fcgiwrap/Config.in   | 10 ++++++++++
 >  package/fcgiwrap/fcgiwrap.mk | 19 +++++++++++++++++++
 >  3 files changed, 30 insertions(+)
 >  create mode 100644 package/fcgiwrap/Config.in
 >  create mode 100644 package/fcgiwrap/fcgiwrap.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index e0c2e2a..188ff0d 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1168,6 +1168,7 @@ endif
 >  	source "package/ejabberd/Config.in"
 >  	source "package/ethtool/Config.in"
 >  	source "package/faifa/Config.in"
 > +	source "package/fcgiwrap/Config.in"
 >  	source "package/fmc/Config.in"
 >  	source "package/foomatic-filters/Config.in"
 >  	source "package/fping/Config.in"
 > diff --git a/package/fcgiwrap/Config.in b/package/fcgiwrap/Config.in
 > new file mode 100644
 > index 0000000..a5c15a0
 > --- /dev/null
 > +++ b/package/fcgiwrap/Config.in
 > @@ -0,0 +1,10 @@
 > +config BR2_PACKAGE_FCGIWRAP
 > +	bool "fcgiwrap"
 > +	depends on BR2_USE_MMU # Transitive dependency from libfcgi.
 > +	select BR2_PACKAGE_LIBFCGI
 > +	help
 > +	  fcgiwrap is a simple server for running CGI applications
 > +	  over FastCGI. It hopes to provide clean CGI support to Nginx
 > +	  (and other web servers that may need it).
 > +
 > +	  https://nginx.localdomain.pl/wiki/FcgiWrap

FYI, the trac instance at that location seems to have some database
issues.

Thanks, but it doesn't work here:

>>> fcgiwrap 1.1.0 Autoreconfiguring
configure.ac:32: error: possibly undefined macro: AC_DEFINE
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
autoreconf: /home/peko/source/buildroot/output/host/usr/bin/autoconf failed with exit status: 1
package/pkg-generic.mk:146: recipe for target '/home/peko/source/buildroot/output/build/fcgiwrap-1.1.0/.stamp_configured' failed

From a quick look it seems like you are missing a dependency on
host-pkgconf. With that added autoreconf works, but configure fails to
detect libfcgi when linking statically because you are passing LIBS=-lm
to it.

With that fixed, linking fails as LDFLAGS (and hence your -lm) comes
before -lfcgi, so I guess you should add LDLIBS='-lfcgi -lm' to
_MAKE_OPTS instead.

Care to fix these issues and resend? Thanks!

-- 
Bye, Peter Korsgaard
