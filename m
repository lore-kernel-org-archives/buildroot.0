From: Mark Hawthorne <markhawthorne172@gmail.com>
Date: Tue, 10 Jul 2018 18:43:14 -0500
Subject: [Buildroot] How to deal configure file getting wrong include path
Message-ID: <CAEEV9O1YdQyWb6sBpgfs=Vu2ZmMvyBrdjTzJvMbKHizADKbcvQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a tricky package situation that I'm not sure how to properly handle.

I added a package to build spatialite. Spatialite depends on the geos
library. At build time, the geos library generates a script called
geos-config which can be used to query the installation location for the
geos header files and libraries. Geos determines these locations at build
time using $exec and $exec_prefix and hard-codes them into the geos-config
file. The include path becomes "/usr/include". This is correct from the
perspective of the embedded target. However, the configure script for
spatialite queries the geos-config script to determine if the geos headers
exist. Instead of looking in the staging directory, it looks in the
directory returned by geos-config, i.e "/usr/include". The path should be
"buildroot/output/staging/usr/include"

Is there a clean way to solve this problem in buildroot or do I need to
patch around the geos-config step in the configure file?

https://www.gaia-gis.it/fossil/libspatialite/index

################################################################################
#
# libspatialite
#
################################################################################

LIBSPATIALITE_VERSION = 4.3.0a
LIBSPATIALITE_SOURCE = libspatialite-$(LIBSPATIALITE_VERSION).tar.gz
LIBSPATIALITE_SITE = http://www.gaia-gis.it/gaia-sins
LIBSPATIALITE_INSTALL_STAGING = YES
LIBSPATIALITE_INSTALL_TARGET = YES
LIBSPATIALITE_CONF_OPTS = --disable-shared
LIBSPATIALITE_DEPENDENCIES = libproj libfreexl sqlite geos libxml2

$(eval $(autotools-package))
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180710/5d9ec72b/attachment.html>
