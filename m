From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 22 Apr 2020 13:15:59 -0700
Subject: [Buildroot] [PATCH 2/2] package/{openjdk,
 openjdk-bin}: add support for building either lts or latest
In-Reply-To: <20200422195704.GE5035@scaer>
References: <20200422192118.4039564-1-aduskett@gmail.com>
 <20200422192118.4039564-2-aduskett@gmail.com>
 <20200422195704.GE5035@scaer>
Message-ID: <CAFSsvmpWhNS2Ax9nZ3Bop9xCi_D7ST868--t+E7DhMZHK-44gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Wed, Apr 22, 2020 at 12:57 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Adam, All,
>
> On 2020-04-22 12:21 -0700, aduskett at gmail.com spake thusly:
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > As Java is used quite a bit in the enterprise world, having the option to
> > build the LTS version of OpenJDK is quite convenient and also a requirement
> > for many companies wanting to use Java.
> >
> > As such, there are three options:
> >   1) Continue only to support the latest version of OpenJDK.
> >   2) Downgrade our existing OpenJDK package from 14 to 11.
> >   3) Add an option to support either OpenJDK 11 or 14.
>
> We recently dropped such a choice from another major package, qt5,
> where we decided to only support the latest version as we do for
> basically all userland programs (with very little exceptions).
>
What I found in the logs about QT5 support is the following:
"As discussed during the FOSDEM2019 develop days, Qt 5.6 is very old (5.6.3
was released in September 2017, and 5.6.x became EOL in March 2019), so drop
it before the new Buildroot LTS release:"

So it seems like QT5.6 support was dropped not because of the two versions, but
because 5.6 was being EOLed and was quite old.

Just a thought.

Adam

> Adding back such a choice in another package does not got with this
> trend, though...
>
> So I'm deferring the decision for now untill there is more fedback than
> just "but this is LTS" and "but we need the latest".
>
> Note: the diff itself is not a problem, it loks sane enough. The problem
> really is the choice.
>
> Regards,
> Yann E. MORIN.
>
> > OpenJDK 11 and 14 currently have:
> >   - The same configure options.
> >   - The same license files and hashes for those license files.
> >   - The same dependencies.
> >   - The same method to build and install.
> >
> > As such, supporting both 11 and 14 is not only an easy option to add to
> > Buildroot, but also a nice feature for users who wish to use Java in an
> > embedded environment with a company that mandates the use of the LTS version.
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > ---
> >  package/openjdk-bin/openjdk-bin.hash |  3 +++
> >  package/openjdk-bin/openjdk-bin.mk   |  8 ++++++++
> >  package/openjdk/Config.in            | 14 ++++++++++++++
> >  package/openjdk/openjdk.hash         |  1 +
> >  package/openjdk/openjdk.mk           |  9 +++++++++
> >  5 files changed, 35 insertions(+)
> >
> > diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
> > index 52380f55ae..065eda0603 100644
> > --- a/package/openjdk-bin/openjdk-bin.hash
> > +++ b/package/openjdk-bin/openjdk-bin.hash
> > @@ -1,6 +1,9 @@
> >  # From https://github.com/AdoptOpenJDK/openjdk14-binaries/releases
> >  sha256  9ddf9b35996fbd784a53fff3e0d59920a7d5acf1a82d4c8d70906957ac146cd1  OpenJDK14U-jdk_x64_linux_hotspot_14.0.1_7.tar.gz
> >
> > +# From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
> > +sha256  ee60304d782c9d5654bf1a6b3f38c683921c1711045e1db94525a51b7024a2ca  OpenJDK11U-jdk_x64_linux_hotspot_11.0.7_10.tar.gz
> > +
> >  # Locally calculated
> >  sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
> >  sha256  a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb  legal/java.prefs/ASSEMBLY_EXCEPTION
> > diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
> > index ca8e11fe13..4d7043c831 100644
> > --- a/package/openjdk-bin/openjdk-bin.mk
> > +++ b/package/openjdk-bin/openjdk-bin.mk
> > @@ -4,11 +4,19 @@
> >  #
> >  ################################################################################
> >
> > +ifeq ($(BR2_OPENJDK_VERSION_11_X),y)
> > +HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.7
> > +HOST_OPENJDK_BIN_VERSION_MINOR = 10
> > +HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
> > +HOST_OPENJDK_BIN_SOURCE = OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
> > +HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
> > +else
> >  HOST_OPENJDK_BIN_VERSION_MAJOR = 14.0.1
> >  HOST_OPENJDK_BIN_VERSION_MINOR = 7
> >  HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
> >  HOST_OPENJDK_BIN_SOURCE = OpenJDK14U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
> >  HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
> > +endif
> >  HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
> >  HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
> >
> > diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
> > index 61294ec49f..3b27a7e03c 100644
> > --- a/package/openjdk/Config.in
> > +++ b/package/openjdk/Config.in
> > @@ -49,6 +49,20 @@ config BR2_PACKAGE_OPENJDK
> >
> >  if BR2_PACKAGE_OPENJDK
> >
> > +choice
> > +     prompt "openjdk version"
> > +     default BR2_OPENJDK_VERSION_11_X
> > +     help
> > +       Select the version of OpenJDK you wish to use.
> > +
> > +config BR2_OPENJDK_VERSION_11_X
> > +     bool "OpenJDK 11 (LTS)"
> > +
> > +config BR2_OPENJDK_VERSION_14_X
> > +     bool "OpenJDK 14 (Latest)"
> > +
> > +endchoice
> > +
> >  choice
> >       prompt "openjdk variant"
> >       default BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER if !BR2_powerpc
> > diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
> > index e453d12d1a..2279c8b971 100644
> > --- a/package/openjdk/openjdk.hash
> > +++ b/package/openjdk/openjdk.hash
> > @@ -1,3 +1,4 @@
> >  # Locally computed
> >  sha256  301203cbda9c40a5fc496b3299806995ac4833b39c6d2e8470fd85a35461afd4  jdk-14.0.1+7.tar.gz
> > +sha256  d105471d06568e4659c21518d1bf42b8ebab5c70539e9777d570549a98ed2a8a  jdk-11.0.7+10.tar.gz
> >  sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
> > diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> > index d33459db97..d16d6c09e2 100644
> > --- a/package/openjdk/openjdk.mk
> > +++ b/package/openjdk/openjdk.mk
> > @@ -4,11 +4,20 @@
> >  #
> >  ################################################################################
> >
> > +ifeq ($(BR2_OPENJDK_VERSION_11_X),y)
> > +OPENJDK_VERSION_MAJOR = 11.0.7
> > +OPENJDK_VERSION_MINOR = 10
> > +OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
> > +OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
> > +OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk11u/archive
> > +else
> >  OPENJDK_VERSION_MAJOR = 14.0.1
> >  OPENJDK_VERSION_MINOR = 7
> >  OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
> >  OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
> >  OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk14u/archive
> > +endif
> > +
> >  OPENJDK_LICENSE = GPL-2.0+ with exception
> >  OPENJDK_LICENSE_FILES = LICENSE
> >
> > --
> > 2.25.3
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
