From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 May 2016 09:38:06 +0200
Subject: [Buildroot] [PATCH 21/34] hddtemp: add
In-Reply-To: <1462002570-14706-21-git-send-email-gilles.chanteperdrix@xenomai.org>
 (Gilles Chanteperdrix's message of "Sat, 30 Apr 2016 09:49:17 +0200")
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-21-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <87futrn0kh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org> writes:

 > ---
 >  package/Config.in            |  1 +
 >  package/hddtemp/Config.in    |  8 ++++++++
 >  package/hddtemp/hddtemp.hash |  2 ++
 >  package/hddtemp/hddtemp.mk   | 19 +++++++++++++++++++
 >  4 files changed, 30 insertions(+)
 >  create mode 100644 package/hddtemp/Config.in
 >  create mode 100644 package/hddtemp/hddtemp.hash
 >  create mode 100644 package/hddtemp/hddtemp.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index bdc3063..76665e6 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1458,6 +1458,7 @@ comment "Utilities"
 >  	source "package/file/Config.in"
 >  	source "package/gnupg/Config.in"
 >  	source "package/gnupg2/Config.in"
 > +	source "package/hddtemp/Config.in"

I think this should rather go under "Hardware handling" like
smartmontools or hdparm.


 >  	source "package/inotify-tools/Config.in"
 >  	source "package/lockfile-progs/Config.in"
 >  	source "package/logrotate/Config.in"
 > diff --git a/package/hddtemp/Config.in b/package/hddtemp/Config.in
 > new file mode 100644
 > index 0000000..0d28250
 > --- /dev/null
 > +++ b/package/hddtemp/Config.in
 > @@ -0,0 +1,8 @@
 > +config BR2_PACKAGE_HDDTEMP
 > +	bool "hddtemp"
 > +	help
 > +	  hddtemp is a small utility that gives you the temperature of your
 > +	  hard drive by reading S.M.A.R.T. informations, for drives that
 > +	  support this feature. 

It also uses iconv (to figure out how to print a degrees celsius sign,
gaah), so you need to add:

       select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

And add it to HDDTEMP_DEPENDENCIES. A quick test shows that it forgets
to link with it, so it needs some help:

ifeq ($(BR2_PACKAGE_LIBICONV),y)
HDDTEMP_DEPENDENCIES += libiconv
HDDTEMP_CONF_ENV += LIBS="-liconv"
endif

It also needs a small patch to build without gettext as it
unconditionally calls:

  setlocale (LC_ALL, "");
  bindtextdomain (PACKAGE, LOCALEDIR);
  textdomain (PACKAGE);

Those needs to be inside #ifdef ENABLE_NLS conditionals.

And finally there's code in backtrace.c that breaks when building with
uClibc on i386 (as uClibc also defines __GLIBC__ for compatibility but
doesn't provide backtrace functionality by default):

#if defined(__i386__) && defined(__GLIBC__)

These patches should preferably be upstreamed, but as the latest (beta!)
release is 10 years old by now, the project seems pretty dead.

The savannah status is also listed as Orphaned/Unmaintained.


 > +
 > +	  http://www.guzu.net/linux/hddtemp.php
 > diff --git a/package/hddtemp/hddtemp.hash b/package/hddtemp/hddtemp.hash
 > new file mode 100644
 > index 0000000..c308989
 > --- /dev/null
 > +++ b/package/hddtemp/hddtemp.hash
 > @@ -0,0 +1,2 @@
 > +# Locally calculated after checking pgp signature
 > +sha256	618541584054093d53be8a2d9e81c97174f30f00af91cb8700a97e442d79ef5b  hddtemp-0.3-beta15.tar.bz2
 > diff --git a/package/hddtemp/hddtemp.mk b/package/hddtemp/hddtemp.mk
 > new file mode 100644
 > index 0000000..a51548d
 > --- /dev/null
 > +++ b/package/hddtemp/hddtemp.mk
 > @@ -0,0 +1,19 @@
 > +################################################################################
 > +#
 > +# hddtemp
 > +#
 > +################################################################################
 > +
 > +HDDTEMP_VERSION = 0.3-beta15
 > +HDDTEMP_SOURCE = hddtemp-$(HDDTEMP_VERSION).tar.bz2
 > +HDDTEMP_SITE = http://download.savannah.gnu.org/releases/hddtemp
 > +HDDTEMP_LICENSE = GPLv2

The source files contain the "(at your option) any later version"
wording, so this should be GPLv2+


> +HDDTEMP_LICENSE_FILES = GPL-2
 > +
 > +define HDDTEMP_REMOVE_MAN
 > +	rm -rf $(TARGET_DIR)/usr/man
 > +endef

Like Thomas mentioned, this is already taken care of in target-finalize.


The big question is how to handle hddtemp.db?

The tarball doesn't contain the file, so hddtemp doesn't do anything
sensible:

sudo ./target/usr/sbin/hddtemp /dev/sda
hddtemp: can't open /usr/share/misc/hddtemp.db: No such file or directory

The file is available on the upstream website, but it is not versioned -
So that is not suitable for Buildroot:

http://www.guzu.net/linux/hddtemp.db

Either we:

- Convince upstream to version this file (and preferably include it in
  the tarball) - But as the project seems dead this might be hard

- Apply the Debian patch which includes (an older version of?)
  hddtemp.db. Notice that Debian also patches various things in the
  code, so please check that the changes make sense in the context of
  Buildroot:
  http://http.debian.net/debian/pool/main/h/hddtemp/hddtemp_0.3-beta15-52.diff.gz

- We include hddtemp.db in package/hddtemp. It isn't really nice, but
  the file is relatively small (29K)

Given the missing hddtemp.db, how have you tested this package?

-- 
Bye, Peter Korsgaard
