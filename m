From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2014 10:52:34 +0200
Subject: [Buildroot] [PATCH v2] libv4l: Bump version to 1.0.1
In-Reply-To: <1404594460-17564-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 (Ezequiel Garcia's message of "Sat, 5 Jul 2014 18:07:40 -0300")
References: <1404594460-17564-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <87ha2psii5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > Quite some work has been done from 0.8.3 to 1.0.1, and as a result
 > this commit is very intrusive. The biggest change is the move to an
 > autotools package.

 > Then, the options that enable utilities individually have been deprecated
 > and moved to Config.in.legacy. Instead, we introduce new option to select
 > either all the utilities. This change loses granularity in favor of
 > maintainability.

 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > ---
 > Changes from v1:
 >   * Addressed Thomas' comments: removed the JPEG option and fixed the
 >     menu comment.

 > Changes from RFC v1:
 >  * Moved to PATCH as suggested by Thomas
 >  * Added a required dependency on toolchain C++ support
 >  * Added support to enable/disable JPEG support
 >  * Changed packages description based on v4l-utils.spec

 >  Config.in.legacy                                   | 40 ++++++++++++++
 >  package/libv4l/Config.in                           | 62 +++++-----------------
 >  ...1-fixup-lfs-mismatch-in-preload-libraries.patch | 44 +++++++++++++++
 >  package/libv4l/libv4l-01-largefile.patch           | 39 --------------
 >  .../libv4l-02-use-openat-when-available.patch      | 34 ------------
 >  package/libv4l/libv4l.mk                           | 46 ++++++----------
 >  6 files changed, 113 insertions(+), 152 deletions(-)
 >  create mode 100644 package/libv4l/libv4l-0001-fixup-lfs-mismatch-in-preload-libraries.patch
 >  delete mode 100644 package/libv4l/libv4l-01-largefile.patch
 >  delete mode 100644 package/libv4l/libv4l-02-use-openat-when-available.patch

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index a2c7846..dc93f86 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -128,6 +128,46 @@ config BR2_PACKAGE_PROCPS
 >  	help
 >  	  The procps package has been replaced by the equivalent procps-ng.
 
 > +config BR2_PACKAGE_LIBV4L_DECODE_TM6000

I'm wondering if it wouldn't be better to rename the package to
V4L_UTILS like upstream and put it under hardware handling - But ok,
that can be done later.

 > +++ b/package/libv4l/libv4l.mk
 > @@ -4,42 +4,26 @@
 >  #
 >  ################################################################################
 
 > -LIBV4L_VERSION = 0.8.9
 > +LIBV4L_VERSION = 1.0.1
 >  LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 >  LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
 >  LIBV4L_INSTALL_STAGING = YES
 > -LIBV4L_MAKE_OPTS = PREFIX=/usr
 > -LIBV4L_DEPENDENCIES = jpeg

The configure script uses pkg-config, so we need to add host-pkgconf. It
also needs argp handling, so we need to select and use argp-standalone
when building on uClibc.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
