From: Rick Taylor <rick@tropicalstormsoftware.com>
Date: Thu, 17 Jul 2014 12:21:54 +0000
Subject: [Buildroot] [PATCH 1/1] Add $$(PKG)_AUTORECONF_ENV argument to
	autotools package
Message-ID: <38A5475DE83986499AEACD2CFAFC3F9801148D7154@tss-server1.home.tropicalstormsoftware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for your prompt reply, I was unsure whether I had formatted the patch correctly in the email.

In house, we use a little M4 magic in our configure.ac files to insert subversion version numbers into the AC_INIT stanza of our libraries:

AC_INIT(libfoo,[1.0.]m4_esyscmd([if test "x$SVN_SITE" != "x"; then svn info $SVN_SITE -rHEAD | grep '^Last Changed Rev: ' | awk '{printf "%s",$4}'; else svnversion -n | sed 's/:/-/'; fi]))

Because of the way autotools works, the m4_esyscmd() is only executed when the autoreconf tool is run, not just autoconf.

Because we use an environment variable in the script, we need some mechanism of ensuring it is set correctly when autoreconf is run by buildroot, by putting the following in libfoo.mk:

LIBFOO_VERSION = HEAD
LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
LIBFOO_SITE = http://svn_url/foo
LIBFOO_SITE_METHOD = svn
LIBFOO_AUTORECONF = YES
LIBFOO_AUTORECONF_ENV = SVN_SITE=$(LIBFOO_SITE)
$(eval $(autotools-package))

I hope that's clear?

I'm not sure how useful other people will find this, but we have been using it heavily since version 2013.08.

I haven't aggressively tested it against buildroot master I'm afraid as we have a load of extra infrastructure around buildroot so we stick to full releases, and we are just evaluating 2014.05.

I shall update the docs/manual/adding-packages-autotools.txt and resubmit the patches.

Many thanks,

Rick Taylor
