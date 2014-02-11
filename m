From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Feb 2014 08:57:05 -0300
Subject: [Buildroot] [PATCHv2 0/4] Samba4 package
Message-ID: <1392119829-31535-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes for v2:
depend on !BR2_PACKAGE_SAMBA as recommended by Arnout & Thomas.
Add comments to samba4 package as mentioned by Samuel Martin.
Make the samba(3) description useful and rename patches.

This patchset adds a samba 4.1.x package to buildroot.

Samba 4.1.x uses the waf build system which isn't very cross-compile
friendly, and also some tests are formulated in a way that isn't
cross-build friendly either by needing to run them.

For this reason the samba4 build system includes a way to define
answers for many of the tests, but this support isn't complete
and some tests still want to be executed.

Samba 3.6.x is being kept because 4.1.x has a bigger footprint, changes
usage in some tools (swat has been dropped for example), has more
toolchain dependencies and there may be validation issues for users
as well.
Samba 4.1.x also requires a proper answers file for each architecture,
and at the moment i've only tested for ARM and PowerPC so only those
architectures are supported to begin with. To add support for another
architecture basically copy one of the cache files to the proper name,
enable it in Config.in and adjust endianess and all of the "size of"
answers. I'm in the process of automating the sizeof and endianess
answers within the samba build system to make them cross friendly
to simplify the answers file to just one generic linux variant.
The 3.6.x branch is still security supported for the forseeable future.

I'm currently working with samba upstream to solve many of these
issues but this will probably happen with the yet unreleased
4.2 branch only.

The python patch is a backport from the 3.4 branch to avoid using
a runtime python for python-config (a pure shell implementation).

Heimdal patches are all upstream.


Gustavo Zacarias (4):
  python: fixup python-config script
  heimdal: new package
  samba4: new package
  samba: update description and rename patches

 package/Config.in                                  |   1 +
 .../heimdal/heimdal-0001-add-roken-h-process.patch | 195 ++++++++++++++++++++
 package/heimdal/heimdal-0002-use-Getopt-Std.patch  |  30 +++
 package/heimdal/heimdal-0003-vendor.patch          |  19 ++
 package/heimdal/heimdal-0004-compile_et.patch      |  28 +++
 package/heimdal/heimdal.mk                         |  30 +++
 .../python/python-2.7-017-fix-python-config.patch  | 205 +++++++++++++++++++++
 package/samba/Config.in                            |   6 +-
 ....patch => samba-0001-fix-smbd-libs-avahi.patch} |   0
 ...addrinfo.patch => samba-0002-getaddrinfo.patch} |   0
 package/samba4/Config.in                           |  24 +++
 package/samba4/S91smb                              |  56 ++++++
 package/samba4/arm-cache.txt                       |  65 +++++++
 package/samba4/powerpc-cache.txt                   |  65 +++++++
 ...-0001-build-don-t-execute-tests-summary.c.patch |  67 +++++++
 ...ld-don-t-execute-statfs-and-f_fsid-checks.patch |  31 ++++
 ...003-build-find-FILE_OFFSET_BITS-via-array.patch |  54 ++++++
 ...uild-allow-some-python-variable-overrides.patch |  45 +++++
 ...amba4-0005-builtin-heimdal-external-tools.patch |  42 +++++
 package/samba4/samba4.mk                           | 111 +++++++++++
 20 files changed, 1071 insertions(+), 3 deletions(-)
 create mode 100644 package/heimdal/heimdal-0001-add-roken-h-process.patch
 create mode 100644 package/heimdal/heimdal-0002-use-Getopt-Std.patch
 create mode 100644 package/heimdal/heimdal-0003-vendor.patch
 create mode 100644 package/heimdal/heimdal-0004-compile_et.patch
 create mode 100644 package/heimdal/heimdal.mk
 create mode 100644 package/python/python-2.7-017-fix-python-config.patch
 rename package/samba/{samba-fix-smbd-libs-avahi.patch => samba-0001-fix-smbd-libs-avahi.patch} (100%)
 rename package/samba/{samba-getaddrinfo.patch => samba-0002-getaddrinfo.patch} (100%)
 create mode 100644 package/samba4/Config.in
 create mode 100644 package/samba4/S91smb
 create mode 100644 package/samba4/arm-cache.txt
 create mode 100644 package/samba4/powerpc-cache.txt
 create mode 100644 package/samba4/samba4-0001-build-don-t-execute-tests-summary.c.patch
 create mode 100644 package/samba4/samba4-0002-build-don-t-execute-statfs-and-f_fsid-checks.patch
 create mode 100644 package/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch
 create mode 100644 package/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch
 create mode 100644 package/samba4/samba4-0005-builtin-heimdal-external-tools.patch
 create mode 100644 package/samba4/samba4.mk

-- 
1.8.3.2
