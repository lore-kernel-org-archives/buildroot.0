From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 7 May 2021 07:55:14 -0700
Subject: [Buildroot] [PATCH] package/openjdk: fully switch to Github,
 commonalise version scheme
In-Reply-To: <20210506194825.240441-1-yann.morin.1998@free.fr>
References: <20210506194825.240441-1-yann.morin.1998@free.fr>
Message-ID: <CAFSsvmpFkAEuxQWjSjyU7cMrzNsb2VKDF4j14zzbPkoCRZvdGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey All;

Just a bit of backstory for the original decision to keep the names the same.
I was trying to be nice and keep the same naming convention we were
already used to using.
I didn't think this would cause so much trouble! Thanks Arnout for the help!

Tested-by: Adam Duskett <Aduskett@gmail.com>

On Thu, May 6, 2021 at 12:48 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Commit 057e27029c98 (package/openjdk{, -bin}: bump latest to version
> 16.0.1+9) partially switched over to using the Github repository (which
> is the new official publication channel for OpenJDK).
>
> However, only the JDK16 was switched, because of concerns about a change
> in the hash of Github-generated archives for the JDK11, due to a missing
> Hg-related file on Github.
>
> But as Arnout put it:
>     There's a trivial workaround: drop OPENJDK_SOURCE = .... That way,
>     the tarball name becomes openjdk-... instead of jdk-... and it's a
>     different file.
>
> There is indeed no good reason to force a non-default filename for the
> archive, so we do drop it.
>
> As a consequence, we can fully switch over to Github for openjdk, using
> the new version scheme. Of course the hash changes, but it is a new
> file, so that's OK.
>
> The filename for the JDK16 changes, but the content does not change, so
> the hash does not change.
>
> For consistency, the version scheme is also applied to openjdk-bin. Even
> though it was already using Github, using that new version scheme also
> allows to commonalise the variables too. The archives are the exact
> same: no change in filename or content, so no hash to fixup.
>
> Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> cc: Adam Duskett <aduskett@gmail.com>
> ---
>  package/openjdk-bin/openjdk-bin.mk | 14 +++++---------
>  package/openjdk/openjdk.hash       |  4 ++--
>  package/openjdk/openjdk.mk         | 14 ++++----------
>  3 files changed, 11 insertions(+), 21 deletions(-)
>
> diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
> index e63278be76..b48155dc28 100644
> --- a/package/openjdk-bin/openjdk-bin.mk
> +++ b/package/openjdk-bin/openjdk-bin.mk
> @@ -7,18 +7,14 @@
>  ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
>  HOST_OPENJDK_BIN_VERSION_MAJOR = 16
>  HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_9
> +else
> +HOST_OPENJDK_BIN_VERSION_MAJOR = 11
> +HOST_OPENJDK_BIN_VERSION_MINOR = 0.11_9
> +endif
>  HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
>  HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
>  HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
> -else
> -# NOTE! When bumping the 11 version, be sure to switch to github,
> -# *and* commonalise the _VERSION, _SOURCE, and _SITE variables, above
> -HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.11
> -HOST_OPENJDK_BIN_VERSION_MINOR = 9
> -HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
> -HOST_OPENJDK_BIN_SOURCE = OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
> -HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
> -endif
> +
>  HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
>  HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
>
> diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
> index f96c638d40..ba6c4385e7 100644
> --- a/package/openjdk/openjdk.hash
> +++ b/package/openjdk/openjdk.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  3b3aca61fe2834322e51636d99bcd09c4abba7d8a2cde231dbcbcbdedf829baf  jdk-16.0.1+9.tar.gz
> -sha256  c8b9d92028f6e46d94bde65ebce3b593fdcc0d1ca1fa00482f38815ed37c92a1  jdk-11.0.11+9.tar.gz
> +sha256  3b3aca61fe2834322e51636d99bcd09c4abba7d8a2cde231dbcbcbdedf829baf  openjdk-16.0.1+9.tar.gz
> +sha256  55841c01dbe6606e0d5f88045fb2da02632ce3a2d9d9b25d030a06eadeee0f62  openjdk-11.0.11+9.tar.gz
>  sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index ec5b23314b..cbb975ca25 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
> @@ -7,18 +7,12 @@
>  ifeq ($(BR2_OPENJDK_VERSION_LATEST),y)
>  OPENJDK_VERSION_MAJOR = 16
>  OPENJDK_VERSION_MINOR = 0.1+9
> +else
> +OPENJDK_VERSION_MAJOR = 11
> +OPENJDK_VERSION_MINOR = 0.11+9
> +endif
>  OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
> -OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
>  OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
> -else
> -# NOTE! When bumping the 11 version, be sure to switch to github,
> -# *and* commonalise the _VERSION, _SOURCE, and _SITE variables, above
> -OPENJDK_VERSION_MAJOR = 11.0.11
> -OPENJDK_VERSION_MINOR = 9
> -OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
> -OPENJDK_SOURCE = jdk-$(OPENJDK_VERSION).tar.gz
> -OPENJDK_SITE = https://hg.openjdk.java.net/jdk-updates/jdk11u/archive
> -endif
>
>  OPENJDK_LICENSE = GPL-2.0+ with exception
>  OPENJDK_LICENSE_FILES = LICENSE
> --
> 2.25.1
>
