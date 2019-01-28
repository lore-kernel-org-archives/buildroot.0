From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 28 Jan 2019 11:36:22 -0500
Subject: [Buildroot] [PATCH v2 0/2] OpenJDK: new package.
Message-ID: <20190128163624.107243-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

V2: Fixed the second patch name. Copy and paste is sometimes my enemy!

This patch series introduces BuildRoot to OpenJDK.

A previous patch series for OpenJDK8 used the JDK Muricle page to download a
tarball. Instead, what I have chosen to do is use the AdoptOpenJDK GitHub
repository. This repository allows us to use the GitHub macro instead of trying
to provide a nasty workaround when grabbing the source code.

With this patch series, there are some quirks that I would like to detail:

- The openjdk-bin package:
From http://hg.openjdk.java.net/jdk10/jdk10/raw-file/tip/common/doc/building.html#boot-jdk-requirements
"Paradoxically, building OpenJDK requires a pre-existing JDK. This is called
the "boot JDK." The boot JDK does not have to be OpenJDK, though. If you are
porting OpenJDK to a new platform, the chances are that there already exists
another JDK for that platform that is usable as boot JDK.

The rule of thumb is that the boot JDK for building JDK major version N should
be a JDK of major version N-1, so for building JDK 9, a JDK 8 would be suitable
as boot JDK."

This paradox causes an issue because every distribution I have used comes with
JDK8 by default. So there are two solutions that I could come up with:
1) Require the host-system to have JDK N-1
2) Grab the convenient and easy to install binaries from the AdoptOpenJDK
   repository, and use those binaries as the boot-jdk.

- JDK >= 10 requires X11, even if building a headless version.
  It's unfortunate, but there isn't anything I cared to do about it.

- Running "make install" installs the entire JDK to the target directory,
  which is why INSTALL_TARGET is manual. 

- Depending on !BR2_SOFT_FLOAT
From http://hg.openjdk.java.net/jdk10/jdk10/raw-file/tip/common/doc/building.html#building-for-armaarch64
"Note that soft-float ABIs are no longer properly supported on OpenJDK."
Yes, it will compile as of right now, but I don't want to have to help people with
possible ASM java bugs because they wanted to use a processor without an FPU.

- Requiring GLIBC
OpenJDK could probably build against uClibc with a few patches, but I decided
against going through the effort of doing so. My reasoning is that uClibc
advertises itself as a small C library, however, at this time, OpenJDK comes in
at over 100MB for a minimal install. So the few megabytes saved by using uClibc
probably isn't going to be a concern for anybody wanting to use Java on their
embedded environment.

- Other thoughts:
It is possible to use fine-grained make targets when building OpenJDK, check out
http://hg.openjdk.java.net/jdk10/jdk10/raw-file/tip/common/doc/building.html#using-fine-grained-make-targets.
Perhaps in the future, BuildRoot could have Java setup just like PHP or Python,
with a large selection of modules to build? This could potentially save a massive
amount of space.

Comments and critiques are always welcome!

Adam

Adam Duskett (2):
  openjdk-bin: new package
  OpenJDK is a free and open-source implementation of the Java Platform.
    This package provides the option to build a client or a server JVM
    interpreter.

 DEVELOPERS                           |   2 +
 package/Config.in                    |   1 +
 package/Config.in.host               |   1 +
 package/openjdk-bin/Config.in.host   |  12 +++
 package/openjdk-bin/openjdk-bin.hash |   6 ++
 package/openjdk-bin/openjdk-bin.mk   |  22 +++++
 package/openjdk/Config.in            |  54 ++++++++++
 package/openjdk/openjdk.hash         |   3 +
 package/openjdk/openjdk.mk           | 141 +++++++++++++++++++++++++++
 9 files changed, 242 insertions(+)
 create mode 100644 package/openjdk-bin/Config.in.host
 create mode 100644 package/openjdk-bin/openjdk-bin.hash
 create mode 100644 package/openjdk-bin/openjdk-bin.mk
 create mode 100644 package/openjdk/Config.in
 create mode 100644 package/openjdk/openjdk.hash
 create mode 100644 package/openjdk/openjdk.mk

-- 
2.20.1
