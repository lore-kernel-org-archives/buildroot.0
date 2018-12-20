From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Dec 2018 13:16:38 -0600
Subject: [Buildroot] [RFC] GIT hashes using git-describe string instead of a
 raw string
Message-ID: <CANQCQpae6ntyP87nwJvVpjT4eEBFVGQMpMJwAcGEyuQ=37+54Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'd like to propose updating the guidance in the manual for packages
where the _VERSION could be set to a GIT hash (github helper and GIT
site method).

The specific case I'm looking to address is where a previous tag
exists but a release hasn't occurred since some needed changes merged.
My goal is to improve the output of legal info and a future CPE
security inventory (cpe-info) reporting to have version strings which
don't require as much manual analysis.  Plus having a more readable
version reduces the tracking of any "exact version" analysis results
being kept seperate from the build.   (An additional benefit is that
this helps the tracking of new software versions as we can identify
the previous version easier [1].)

The suggestion is similar to what was done for the glibc package to
get a official release + fixes using "git describe".  The user would
run that command against a clone of the package and use the output as
the version for either the github helper or a GIT site method based
package.  It won't work in cases where a previous tag doesn't exist
but it would help for stable projects between release cycles.

For example with libssh2 we're at
8b870ad771cbd9cd29edbb3dbb0878e950f868ab and I arbitraily picked 24
digits of the hash to represent the exact version along with the new
tag info below.

# git describe --abbrev=24 8b870ad771cbd9cd29edbb3dbb0878e950f868ab
libssh2-1.8.0-88-g8b870ad771cbd9cd29edbb3d

The output after the -g is all that's used for finding the version
when downloading or checking out.  So we can drop the libssh2- and use
the rest as the new version of libssh2.  So this package is 88 commits
after the 1.8.0 release on hash 8b870ad771cbd9cd29edbb3d.

------------------------------------------------------------------------
Example legal-info after update vs everything being
8b870ad771cbd9cd29edbb3dbb0878e950f868ab
------------------------------------------------------------------------
"libssh2",
"1.8.0-88-g8b870ad771cbd9cd29edbb3d",
"BSD",
"COPYING",
"libssh2-1.8.0-88-g8b870ad771cbd9cd29edbb3d.tar.gz",
"https://github.com/libssh2/libssh2/archive/1.8.0-88-g8b870ad771cbd9cd29edbb3d",
.......

------------------------------------------------------------------------
Package .mk/.hash updates (github helper example, similar works for
GIT site method)
------------------------------------------------------------------------
  --- a/package/libssh2/libssh2.hash
  +++ b/package/libssh2/libssh2.hash
  @@ -1,3 +1,3 @@
   # Locally calculated
  -sha256 ec2b32b44ae5f8fe094f663f63953fb31314de838eb36e8c47e5a89137b5a1bc
 libssh2-8b870ad771cbd9cd29edbb3dbb0878e950f868ab.tar.gz
  +sha256 ec2b32b44ae5f8fe094f663f63953fb31314de838eb36e8c47e5a89137b5a1bc
 libssh2-1.8.0-88-g8b870ad.tar.gz
   sha256 e15ed284a15e80115467d6d7f030f0d89d8fabbecd78fb6e0f861f0cfc128fd9
 COPYING
  --- a/package/libssh2/libssh2.mk
  +++ b/package/libssh2/libssh2.mk
  @@ -4,7 +4,7 @@
   #
   ################################################################################

  -LIBSSH2_VERSION = 8b870ad771cbd9cd29edbb3dbb0878e950f868ab
  +LIBSSH2_VERSION = 1.8.0-88-g8b870ad
   LIBSSH2_SITE = $(call github,libssh2,libssh2,$(LIBSSH2_VERSION))
   LIBSSH2_LICENSE = BSD
   LIBSSH2_LICENSE_FILES = COPYING

I've also prototyped a different approach where I leave the current
raw hash versions intact and used a make target in the pkg-infra to
gather similar information from the GIT clones we now cache, however
that because rather complex quick and required a distclean to make
sure GIT clones were being used vs cached packages (ie. like if you
use a primary site to cache pkgs).  We'd also have to convert packages
from github helpers to GIT site methods in order to provide the extra
version information.


Thoughts?  Wanted to get feedback before I send other a patchset to
update the manual and the right changes in some packages.

Matt


[1] release-monitoring.org addition to pkg-stats
http://patchwork.ozlabs.org/patch/890236/
