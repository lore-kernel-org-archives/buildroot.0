From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 09:14:38 +0200
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats:
 drop erroneous "break" in CVE.affects()
Message-ID: <20200828070942.29DC982134@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e631c314b1b8668886fea7659114054b1031e5dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 7d2779ecbb142b62f8913d30352b11058f922b2a
("support/script/pkg-stats: handle exception when version comparison
fails") erroneousy introduced a "break" within a try/expect block.

This break has the unfortunate consequence that every CVE that was
using the <= operator was skipped, and according to the current
CVE statistics, made us miss 74 CVEs out of 141 CVEs.

Here is for reference the complete list of CVEs we missed:

 - gnupg
   CVE-2006-3082
   CVE-2019-13050

 - jhead
   CVE-2020-6624
   CVE-2020-6625

 - patch
   CVE-2018-6952
   CVE-2019-20633

 - json-c
   CVE-2020-12762

 - git
   CVE-2018-1000110
   CVE-2018-1000182
   CVE-2019-1003010
   CVE-2020-2136

 - iperf2
   CVE-2016-4303

 - libtorrent
   CVE-2009-1760
   CVE-2016-5301

 - lua
   CVE-2020-15888
   CVE-2020-15889
   CVE-2020-15945
   CVE-2020-24342

 - openvpn
   CVE-2020-7224

 - smack
   CVE-2016-10027

 - bashtop
   CVE-2019-18276

 - links
   CVE-2008-3319

 - argus
   CVE-2011-3332

 - libraw
   CVE-2020-15503

 - netcat
   CVE-2008-5727
   CVE-2008-5728
   CVE-2008-5729
   CVE-2008-5730
   CVE-2008-5742
   CVE-2015-2214

 - subversion
   CVE-2017-1000085
   CVE-2018-1000111
   CVE-2020-2111

 - python
   CVE-2013-1753
   CVE-2015-5652
   CVE-2017-17522
   CVE-2017-18207
   CVE-2019-20907
   CVE-2019-9674

 - cereal
   CVE-2020-11104
   CVE-2020-11105

 - opencv
   CVE-2017-1000450
   CVE-2017-12597
   CVE-2017-12598
   CVE-2017-12599
   CVE-2017-12600
   CVE-2017-12601
   CVE-2017-12602
   CVE-2017-12603
   CVE-2017-12604
   CVE-2017-12605
   CVE-2017-12606
   CVE-2017-12862
   CVE-2017-12863
   CVE-2017-12864
   CVE-2019-15939

 - docker
   CVE-2015-1843
   CVE-2015-3627
   CVE-2015-3630
   CVE-2015-3631
   CVE-2016-3697
   CVE-2017-14992
   CVE-2019-16884

 - trousers
   CVE-2020-24330
   CVE-2020-24331
   CVE-2020-24332

 - libcroco
   CVE-2020-12825

 - libpupnp
   CVE-2020-13848

 - openjpeg
   CVE-2020-15389

 - flex
   CVE-2015-1773

 - libesmtp
   CVE-2019-19977

 - ed
   CVE-2015-2987

 - libmad
   CVE-2018-7263

 - grub
   CVE-2020-15705

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 303af2f588..e642147b98 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -383,7 +383,6 @@ class CVE:
                         continue
                     try:
                         affected = pkg_version <= cve_affected_version
-                        break
                     except TypeError:
                         return CVE_UNKNOWN
                     if affected:
