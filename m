From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Feb 2019 03:59:28 -0600
Subject: [Buildroot] [PATCH v4 0/3] OpenJDK: new package and tests
In-Reply-To: <20190204085610.66064-1-aduskett@gmail.com>
References: <20190204085610.66064-1-aduskett@gmail.com>
Message-ID: <CANQCQpaP=Uxvk7Y=87LBF6wJB-AaqVv__yWNFwrb7_NuTYGOxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,


On Mon, Feb 4, 2019 at 2:56 AM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
>
> This patch series adds OpenJDK and an updated testing framework to BuildRoot.
>
> A previous patch series for OpenJDK8 used the JDK Muricle page to download a
> tarball. Instead, what I have chosen to do is use the AdoptOpenJDK GitHub
> repository. This repository allows us to use the GitHub macro instead of trying
> to provide a nasty workaround when grabbing the source code.
>
> With this patch series, there are some quirks that I would like to detail:
>
> - The openjdk-bin package:
> From http://hg.openjdk.java.net/jdk10/jdk10/raw-file/tip/common/doc/building.html#boot-jdk-requirements
> "Paradoxically, building OpenJDK requires a pre-existing JDK. This is called
> the "boot JDK." The boot JDK does not have to be OpenJDK, though. If you are
> porting OpenJDK to a new platform, the chances are that there already exists
> another JDK for that platform that is usable as boot JDK.
>
> The rule of thumb is that the boot JDK for building JDK major version N should
> be a JDK of major version N-1, so for building JDK 9, a JDK 8 would be suitable
> as boot JDK."
>
> This paradox causes an issue because every distribution I have used comes with
> JDK8 by default. So there are two solutions that I could come up with:
> 1) Require the host-system to have JDK N-1
> 2) Grab the convenient and easy to install binaries from the AdoptOpenJDK
>    repository, and use those binaries as the boot-jdk.
>
> - JDK >= 10 requires X11, even if building a headless version.
>   It's unfortunate, but there isn't anything I cared to do about it.
>
> - Running "make install" installs the entire JDK to the target directory,
>   which is why INSTALL_TARGET is manual.
>
> - The OpenJDK package:
>
> - Depending on !BR2_SOFT_FLOAT
> From http://hg.openjdk.java.net/jdk10/jdk10/raw-file/tip/common/doc/building.html#building-for-armaarch64
> "Note that soft-float ABIs are no longer properly supported on OpenJDK."
> Yes, it compiles as of right now, but I don't want to have to help people with
> possible ASM java bugs because they wanted to use a processor without an FPU.
>
> - Requiring GLIBC
> OpenJDK could probably build against uClibc with a few patches, but I decided
> against going through the effort of doing so. My reasoning is that uClibc
> advertises itself as a small C library, however, at this time, OpenJDK comes in
> at over 100MB for a minimal install. So the few megabytes saved by using uClibc
> probably isn't going to be a concern for anybody wanting to use Java on their
> embedded environment.
>
> - Other thoughts:
> It is possible to use fine-grained make targets when building OpenJDK, check out
> http://hg.openjdk.java.net/jdk10/jdk10/raw-file/tip/common/doc/building.html#using-fine-grained-make-targets.
> Perhaps in the future, BuildRoot could have Java setup just like PHP or Python,
> with a large selection of modules to build? This fine-grained build could
> potentially save a massive amount of space.
>
> Perhaps in the future, a patch set that removes the X11/Alsa/cups dependencies
> can be added.
>
> In addition to the OpenJDK patches, Matt Webber, Daniel Leach and
> Ricardo Martincoski extended the testing framework to allow for a more
> flexible and comprehensive testing environment. The first of which is to test
> OpenJDK by running a simple "Hello world" application.
>

Romain, thought I'd mention we are working on a follow-on series which
uses Valentin's LLVM work to do Just In Time(JIT) for openJDK!

>
> Comments and critiques are always welcome!
>
> Adam
>
> Daniel J. Leach (1):
>   support/testing: openjdk hello world
>
> Adam Duskett (5):
>   openjdk-bin: new package
>   openjdk: new package
>
> Adam Duskett (3):
>   openjdk-bin: new package
>   openjdk: new package
>   openjdk-hello-world: new test
>
>  .gitlab-ci.yml                                |   1 +
>  DEVELOPERS                                    |   3 +
>  package/Config.in                             |   1 +
>  package/openjdk-bin/openjdk-bin.hash          |   6 +
>  package/openjdk-bin/openjdk-bin.mk            |  23 +++
>  package/openjdk/Config.in                     |  58 ++++++++
>  package/openjdk/openjdk.hash                  |   3 +
>  package/openjdk/openjdk.mk                    | 135 ++++++++++++++++++
>  .../package/br2-external/openjdk/Config.in    |   1 +
>  .../br2-external/openjdk/external.desc        |   1 +
>  .../package/br2-external/openjdk/external.mk  |   1 +
>  .../package/openjdk-hello-world/Config.in     |  26 ++++
>  .../openjdk-hello-world/HelloWorld.java       |   8 ++
>  .../openjdk-hello-world.mk                    |  18 +++
>  support/testing/tests/package/test_openjdk.py |  42 ++++++
>  15 files changed, 327 insertions(+)
>  create mode 100644 package/openjdk-bin/openjdk-bin.hash
>  create mode 100644 package/openjdk-bin/openjdk-bin.mk
>  create mode 100644 package/openjdk/Config.in
>  create mode 100644 package/openjdk/openjdk.hash
>  create mode 100644 package/openjdk/openjdk.mk
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/Config.in
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/external.desc
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/external.mk
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/Config.in
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/HelloWorld.java
>  create mode 100644 support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk
>  create mode 100644 support/testing/tests/package/test_openjdk.py
>
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
