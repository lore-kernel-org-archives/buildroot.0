From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 13 Apr 2020 12:31:11 -0500
Subject: [Buildroot] [[RFC]] RFC: switch selinux to use project release
 date instead of version
In-Reply-To: <20200413172958.55199-1-matthew.weber@rockwellcollins.com>
References: <20200413172958.55199-1-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpYikSTJhYZjB279bMNWJnn4+Ww4mpknc8cPHL2VeG=Emg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 13, 2020 at 12:29 PM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
>  - example shows conversion of libselinux and libsepol using version
>  - adapts patch paths and legal-info path changes

Forgot to also mention the reason for this is to align with release
monitoring version tracking of the selinux project.
https://release-monitoring.org/project/01717/

>
> NOTE requires first applying http://patchwork.ozlabs.org/project/buildroot/patch/20200204103322.428413-1-aduskett at gmail.com/
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/libselinux/0001-fix-musl-build.patch              | 6 +++---
>  ...ot-use-PYCEXT-and-rely-on-the-installed-file-nam.patch | 8 ++++----
>  ...3-fix-building-against-musl-and-uclibc-libraries.patch | 8 ++++----
>  package/libselinux/libselinux.hash                        | 8 ++++----
>  package/libselinux/libselinux.mk                          | 8 +++++---
>  package/libsepol/libsepol.mk                              | 4 ++--
>  6 files changed, 22 insertions(+), 20 deletions(-)
>
> diff --git a/package/libselinux/0001-fix-musl-build.patch b/package/libselinux/0001-fix-musl-build.patch
> index 44189e6400..dbe88b4fc2 100644
> --- a/package/libselinux/0001-fix-musl-build.patch
> +++ b/package/libselinux/0001-fix-musl-build.patch
> @@ -14,10 +14,10 @@ completely written from scratch, and non-optimal.
>  Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  [Updated for 3.0]
>  Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> -diff --git a/src/booleans.c b/src/booleans.c
> +diff --git a/libselinux/src/booleans.c b/libselinux/src/booleans.c
>  index ffa8d26..8569002 100644
> ---- a/src/booleans.c
> -+++ b/src/booleans.c
> +--- a/libselinux/src/booleans.c
> ++++ b/libselinux/src/booleans.c
>  @@ -65,6 +65,14 @@ int security_get_boolean_names(char ***names, int *len)
>                 goto bad;
>         }
> diff --git a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
> index d2acbc2b7d..9b021c34ed 100644
> --- a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
> +++ b/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
> @@ -20,13 +20,13 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  [Refreshed for 3.0]
>  Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>  ---
> - src/Makefile | 3 +--
> + libselinux/src/Makefile | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> -diff --git a/src/Makefile b/src/Makefile
> +diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
>  index 4b6a4d4..7b14ef1 100644
> ---- a/src/Makefile
> -+++ b/src/Makefile
> +--- a/libselinux/src/Makefile
> ++++ b/libselinux/src/Makefile
>  @@ -15,7 +15,6 @@ INCLUDEDIR ?= $(PREFIX)/include
>   PYINC ?= $(shell $(PKG_CONFIG) --cflags $(PYPREFIX))
>   PYLIBS ?= $(shell $(PKG_CONFIG) --libs $(PYPREFIX))
> diff --git a/package/libselinux/0003-fix-building-against-musl-and-uclibc-libraries.patch b/package/libselinux/0003-fix-building-against-musl-and-uclibc-libraries.patch
> index 21cac0f153..19e9ee68b1 100644
> --- a/package/libselinux/0003-fix-building-against-musl-and-uclibc-libraries.patch
> +++ b/package/libselinux/0003-fix-building-against-musl-and-uclibc-libraries.patch
> @@ -10,13 +10,13 @@ to fail.
>  Add the FTS_LDLIBS variable to the LDLIBS variable in utils/Makefile to fix
>  compiling against uClibc and musl.
>  ---
> - libselinux/utils/Makefile | 2 +-
> + libselinux/libselinux/utils/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/utils/Makefile b/utils/Makefile
> +diff --git a/libselinux/utils/Makefile b/libselinux/utils/Makefile
>  index 36150638..a5632b7c 100644
> ---- a/utils/Makefile
> -+++ b/utils/Makefile
> +--- a/libselinux/utils/Makefile
> ++++ b/libselinux/utils/Makefile
>  @@ -45,7 +45,7 @@ endif
>
>   override CFLAGS += -I../include -D_GNU_SOURCE $(DISABLE_FLAGS) $(PCRE_CFLAGS)
> diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
> index d1b4210483..8ec2cbb9f1 100644
> --- a/package/libselinux/libselinux.hash
> +++ b/package/libselinux/libselinux.hash
> @@ -1,5 +1,5 @@
> -# From: https://github.com/SELinuxProject/selinux/wiki/Releases
> -sha256 2ea2b30f671dae9d6b1391cbe8fb2ce5d36a3ee4fb1cd3c32f0d933c31b82433 libselinux-3.0.tar.gz
> -
> +# Generated locally as upstream releases in artifact
> +# files under a overall YYYYMMDD dated selinux release
> +sha256 4cc134210d8cca6c410b7b8c91993e10c6d5b077102ed27e6976bb6d9e483f0d libselinux-20191204.tar.gz
>  # Hash for license file
> -sha256 86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364 LICENSE
> +sha256 86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364 libselinux/LICENSE
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index 5f87b5bc90..6b004e34be 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -4,15 +4,17 @@
>  #
>  ################################################################################
>
> -LIBSELINUX_VERSION = 3.0
> -LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
> +LIBSELINUX_VERSION = 20191204
> +LIBSELINUX_SITE = $(call github,SELinuxProject,selinux,$(LIBSELINUX_VERSION))
>  LIBSELINUX_LICENSE = Public Domain
> -LIBSELINUX_LICENSE_FILES = LICENSE
> +LIBSELINUX_LICENSE_FILES = libselinux/LICENSE
>
>  LIBSELINUX_DEPENDENCIES = $(BR2_COREUTILS_HOST_DEPENDENCY) libsepol pcre
>
>  LIBSELINUX_INSTALL_STAGING = YES
>
> +LIBSELINUX_SUBDIR = $(@D)/$(LIBSELINUX_NAME)
> +
>  # Set SHLIBDIR to /usr/lib so it has the same value than LIBDIR, as a result
>  # we won't have to use a relative path in 0002-revert-ln-relative.patch
>  LIBSELINUX_MAKE_OPTS = \
> diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
> index 62b0744aa3..d8d8bdae86 100644
> --- a/package/libsepol/libsepol.mk
> +++ b/package/libsepol/libsepol.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -LIBSEPOL_VERSION = 2.9
> -LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/20190315
> +LIBSEPOL_VERSION = $(LIBSELINUX_VERSION)
> +LIBSEPOL_SITE = $(call github,SELinuxProject,selinux,$(LIBSELINUX_VERSION))
>  LIBSEPOL_LICENSE = LGPL-2.1+
>  LIBSEPOL_LICENSE_FILES = COPYING
>
> --
> 2.17.1
>


-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

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


ALPHA BRAVO COLLINS | Aerospace Redefined

         __ l __

 \- - - -o-(_)-o- - - -/
