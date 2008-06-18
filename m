From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 18 Jun 2008 01:12:51 -0300
Subject: [Buildroot] Problems building nbd.
Message-ID: <d6cda7730806172112l67de57b4s3d5923bda024c8f1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   It seams that newer nbd (Allows mounting block devices from the
network) needs glib to compile, as confirmed by a post from a at their
own mailing list
(http://sourceforge.net/mailarchive/message.php?msg_id=20070817120341.GA12011%40country.grep.be)

   So, I tried adding glib support to buildroot, but there seams to be
some obstacles on the way:

  First, it fails configure. The package seams to try to detect some
unusual things about the target system, such as stack grow direction.
One can provide configure with a variable that will make it pass, but
then again, the value of this variable might be system dependent.
Thus, I'm not sure how to proceed. It seams that an AVR32 value would
be  glib_cv_stack_grows=no but I don't know if it holds true for all
buildroot supported platforms.

  Googling about the problem, I found that OpenEmbedded has platform
specific files with such variables set. AFAIK we don't have such
feature.

  The other option to fix nbd would be to downgrade to something below
2.8, but then we would still be unable to support the next package
that requires glib.

  Any thoughts?

  I'm appending my glibc.mk for reference at the end.

Kind Regards,
   Thiago A. Correa

#############################################################
#
# glib
#
#############################################################
GLIB_VERSION = 2.17.2
GLIB_SOURCE = glib-$(GLIB_VERSION).tar.bz2
GLIB_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/2.17
GLIB_AUTORECONF = YES
GLIB_INSTALL_STAGING = NO
GLIB_INSTALL_TARGET = YES

GLIB_CONF_OPT = glib_cv_stack_grows=no glib_cv_uscore=no \
                ac_cv_func_posix_getpwuid_r=yes \
                ac_cv_func_posix_getgrgid_r=yes \
                ac_cv_func_setpgrp_void=yes

GLIB_DEPENDENCIES = uclibc gettext

$(eval $(call AUTOTARGETS,package,glib))
