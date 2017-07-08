From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Jul 2017 20:54:08 +0200
Subject: [Buildroot] [PATCH v5 1/1] libressl: new package
In-Reply-To: <20170706144050.9554-1-aduskett@codeblue.com> (Adam Duskett's
 message of "Thu, 6 Jul 2017 10:40:50 -0400")
References: <20170706144050.9554-1-aduskett@codeblue.com>
Message-ID: <87wp7ivjxr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Libressl is a fork of openssl from OpenSSL in 2014.  Its goal is to
 > modernize the OpenSSL codebase, improve security, and apply best
 > practice development processes.

 > Right now, libressl is API compatible with OpenSSL 1.0.1, but does not
 > yet include all new APIs from OpenSSL 1.0.2 and later.

 > Signed-off-by: Adam Duskett <aduskett@codeblue.com>
 > ---
 > Changes v4 -> v5:
 >   - Removed LIBRESSL_INSTALL_TARGET_CMDS from libressl.mk (Thomas)

 > Changes v3 -> v4:
 >   - Removed libssl virtual package. (Arnout)
 >   - Re-added Config.in (Arnout)
 >   - Moved libressl to right before OpenSSL in package/config.in with
 >     a explanation as to why it breaks alphabetical ordering. (Arnout)
 >   - Added depends on !BR2_PACKAGE_OPENSSL in Config.in (Arnout)
 >   - Changed capitalized letters to lowercase in libressl.mk (Arnout)
 >   - Removed libssl specific syntax in Config.in and libressl.mk
 >   - Added LIBRESSL_INSTALL_TARGET_CMDS in libressl.mk
 >     Without this, all the header files and man-pages are installed to the
 >     target filing system.  This is undesired behavior. Instead, running
 >     ?install-exec? will only install the libraries to the target filing system.

 > Changes v2 -> v3:
 >   - Moved this patch to the end of the series. (Thomas)
 >   - Removed Config.in thanks to the new libssl. (Thomas)
 >   - Dropped host-autotools-package for now. (Arnout)

 > Changes v1 -> v2:
 >   - Changed from github to openbsd ftp. This is a all-in-one tarball
 >     that negates having to use the POST_PATCH_HOOKS. (Thomas)
 >   - Added 0001-remove-test-z-DESTDIR-from-ltmain.patch, this allows
 >     ltmain.sh to be patched with buildroot-libtool-v2.4.patch, which
 >     removes the need for a call to autogen.sh.
 >   - Changed sha256sum to reflect new tarball.
 >   - Changed Locally computed to openbsd ftp hash list in hash file. (Arnout)
 >   - Added DEVELOPERS changes to this patch. (Thomas)
 >   - Fixed formatting in commit message. (Thomas)
 >   - Removed "and scripts" from Config.in (Arnout)

 >  DEVELOPERS                                         |  1 +
 >  package/Config.in                                  |  2 ++
 >  .../0001-remove-test-z-DESTDIR-from-ltmain.patch   | 28 ++++++++++++++++++++++
 >  package/libressl/Config.in                         | 20 ++++++++++++++++
 >  package/libressl/libressl.hash                     |  2 ++
 >  package/libressl/libressl.mk                       | 20 ++++++++++++++++
 >  6 files changed, 73 insertions(+)
 >  create mode 100644 package/libressl/0001-remove-test-z-DESTDIR-from-ltmain.patch
 >  create mode 100644 package/libressl/Config.in
 >  create mode 100644 package/libressl/libressl.hash
 >  create mode 100644 package/libressl/libressl.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index c409f28..c997500 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -34,6 +34,7 @@ F:	package/audit/
 >  F:	package/checkpolicy/
 >  F:	package/gstreamer1/gst1-vaapi/
 >  F:	package/janus-gateway/
 > +F:	package/libressl/
 >  F:	package/libselinux/
 >  F:	package/libsemanage/
 >  F:	package/libsepol/
 > diff --git a/package/Config.in b/package/Config.in
 > index 46c78a0..4e5a7fe 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -988,6 +988,8 @@ menu "Crypto"
 >  	source "package/libuecc/Config.in"
 >  	source "package/mbedtls/Config.in"
 >  	source "package/nettle/Config.in"
 > +	#libressl is a openssl replacement.
 > +	source "package/libressl/Config.in"
 >  	source "package/openssl/Config.in"

It would imho have been nicer to list libressl after openssl, but this
looks odd in menuconfig as it thinks it is a sub option of openssl
(because on the depends on), so I've left it there after adding a space
between '#' and 'libressl' and dropping the trailing dot.

Committed, thanks.

-- 
Bye, Peter Korsgaard
