From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 23:19:49 +0100
Subject: [Buildroot] [git commit] package/ntp: add CPE ID variables
Message-ID: <20210114220107.6AE76877A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9c830c0d5fc4c8581823e4aff957494881f4272
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:ntp:ntp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Antp%3Antp

The specification of the version needs to be reworked a little
bit. Indeed, versions look like 4.2.8p15. For the download, we need to
extract 4.2 as the folder is named ntp-4.2. However, for the CPE ID we
need to extract 4.2.8 and p15 into two separate fields.

So, we set:

NTP_VERSION_MAJOR = 4.8
NTP_VERSION_MINOR = 2
NTP_VERSION_POINT = 15

and construct the version:

NTP_VERSION = $(NTP_VERSION_MAJOR).$(NTP_VERSION_MINOR)p$(NTP_VERSION_POINT)

Note that the choice of "point" comes from
http://support.ntp.org/bin/view/Main/ReleaseNumberingScheme, which
states "The letter p followed by an increasing number indicates a
Point (i.e. incremental) Release.".

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ntp/ntp.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index f82eeae9b4..0b412a35ce 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,11 +5,16 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p15
+NTP_VERSION_MINOR = 8
+NTP_VERSION_POINT = 15
+NTP_VERSION = $(NTP_VERSION_MAJOR).$(NTP_VERSION_MINOR)p$(NTP_VERSION_POINT)
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent
 NTP_LICENSE = NTP
 NTP_LICENSE_FILES = COPYRIGHT
+NTP_CPE_ID_VENDOR = ntp
+NTP_CPE_ID_VERSION = $(NTP_VERSION_MAJOR).$(NTP_VERSION_MINOR)
+NTP_CPE_ID_VERSION_MINOR = p$(NTP_VERSION_POINT)
 NTP_CONF_ENV = ac_cv_lib_md5_MD5Init=no POSIX_SHELL=/bin/sh
 NTP_CONF_OPTS = \
 	--with-shared \
