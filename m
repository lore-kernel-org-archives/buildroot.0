From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  9 Mar 2015 23:14:49 +0100
Subject: [Buildroot] [PATCH 0/3] Cleanup trailing slashed from FOO_SITE
Message-ID: <1425939292-14719-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this small patch set cleans up the form of FOO_SITE variables by removing all
trailing slashes.

Those slashes are useless and potentially armful, which led to introducing a
workaround to strip them:

    commit 1cbffbd015106ea90fe49e27433375769dc1035b
    Author: Shawn J. Goff <shawn7400@gmail.com>
    Date:   Fri Apr 12 09:40:30 2013 +0000

        eliminate double slashes caused by FOO_SITE ending in a slash
    
        When a FOO_SITE variable ends in a slash and gets joined with a
        FOO_SOURCE variable like $(FOO_SITE)/$(FOO_SOURCE), the resulting URI
        has a double slash. While double-slashes are fine in unix paths, they
        are reserved in URIs - the part following '//' must be an authority.
    
        Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
        Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

This series removes all these slashes and the workaround, and updates the
manual which is currently suggesting an incorrect URL.

This work has been inspired by this comment from Arnout Vandecappelle:
>> > +else
>> > +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
>> > +	    $(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE:/=)/$$($(2)$($(PKG)_SITE:/=)_ACTUAL_SOURCE_TARBALL))
> 
>  I think the $($(PKG)_SITE:/=) construct was just introduced because for some
> packages, the _SITE ends with a / and that should be stripped, and we were too
> lazy to fix the packages. Hm, looks like all the the external toolchain _SITEs
> end with a /...
(source: https://patchwork.ozlabs.org/patch/424980/)


Luca Ceresoli (3):
  manual: download: remove trailing slash from package FOO_SITE
  Remove trailing slash from all package site URLs
  Download: remove trailing slash cleanups for SITE URLs

 docs/manual/adding-packages-generic.txt            |  2 +-
 linux/linux.mk                                     |  2 +-
 package/autoconf-archive/autoconf-archive.mk       |  2 +-
 package/bmon/bmon.mk                               |  2 +-
 package/dos2unix/dos2unix.mk                       |  2 +-
 package/freeradius-client/freeradius-client.mk     |  2 +-
 package/gengetopt/gengetopt.mk                     |  2 +-
 package/geoip/geoip.mk                             |  2 +-
 package/hicolor-icon-theme/hicolor-icon-theme.mk   |  2 +-
 package/libevdev/libevdev.mk                       |  2 +-
 package/libiscsi/libiscsi.mk                       |  2 +-
 package/libnice/libnice.mk                         |  2 +-
 package/libphidget/libphidget.mk                   |  2 +-
 package/libseccomp/libseccomp.mk                   |  2 +-
 package/libzip/libzip.mk                           |  2 +-
 package/lightning/lightning.mk                     |  2 +-
 package/lxc/lxc.mk                                 |  2 +-
 package/mono/mono.mk                               |  2 +-
 package/monolite/monolite.mk                       |  2 +-
 package/mpdecimal/mpdecimal.mk                     |  2 +-
 package/patchelf/patchelf.mk                       |  2 +-
 package/perl/perl.mk                               |  2 +-
 package/phidgetwebservice/phidgetwebservice.mk     |  2 +-
 package/pkg-generic.mk                             |  6 +--
 package/python-django/python-django.mk             |  2 +-
 package/python-netifaces/python-netifaces.mk       |  2 +-
 package/python-pam/python-pam.mk                   |  2 +-
 package/python-six/python-six.mk                   |  2 +-
 package/python-twisted/python-twisted.mk           |  2 +-
 .../python-zope-interface/python-zope-interface.mk |  2 +-
 package/qt5cinex/qt5cinex.mk                       |  2 +-
 package/slang/slang.mk                             |  2 +-
 package/smcroute/smcroute.mk                       |  2 +-
 package/tslib/tslib.mk                             |  2 +-
 package/uclibc/uclibc.mk                           |  2 +-
 package/ustr/ustr.mk                               |  2 +-
 package/wine/wine.mk                               |  2 +-
 toolchain/toolchain-external/toolchain-external.mk | 60 +++++++++++-----------
 38 files changed, 69 insertions(+), 69 deletions(-)

-- 
1.9.1
