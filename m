From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 7 Feb 2016 00:24:26 +0100
Subject: [Buildroot] [PATCH v2 17/18] ejabberd: bump to version 16.01
In-Reply-To: <1454443064-14269-18-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-18-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56B680AA.9040003@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank, All,

Le 02/02/2016 20:57, Frank Hunleth a ?crit :
> As part of the upgrade, updated patches from Debian were used where
> appropriate. All patches were converted to git format.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  ...001-remove-dependencies-from-rebar-config.patch | 83 ++++++++++++++++++++++
>  package/ejabberd/0001-remove-deps.patch            | 22 ------
>  package/ejabberd/0002-disable-rebar-deps.patch     | 76 --------------------
>  .../0002-remove-make-targets-for-deps.patch        | 74 +++++++++++++++++++
>  package/ejabberd/0003-disable-test.patch           | 27 -------
>  .../0003-remove-checking-erlang-version.patch      | 30 ++++++++
>  package/ejabberd/0004-correct-include.patch        | 56 +++++++++++++++
>  package/ejabberd/0004-disable-version-check.patch  | 20 ------
>  .../0005-disable-ERLANG_DEPRECATED_CHECK.patch     | 27 +++++++
>  package/ejabberd/0005-fix-includes.patch           | 45 ------------
>  ...006-disable-erlang-deprecated-types-check.patch | 20 ------
>  ...ns.patch => 0006-fix-install-permissions.patch} | 41 +++++------
>  ...jabberdctl.patch => 0007-fix-ejabberdctl.patch} | 21 ++++--
>  package/ejabberd/Config.in                         |  5 +-
>  package/ejabberd/ejabberd.hash                     |  6 +-
>  package/ejabberd/ejabberd.mk                       |  2 +-
>  16 files changed, 313 insertions(+), 242 deletions(-)
>  create mode 100644 package/ejabberd/0001-remove-dependencies-from-rebar-config.patch
>  delete mode 100644 package/ejabberd/0001-remove-deps.patch
>  delete mode 100644 package/ejabberd/0002-disable-rebar-deps.patch
>  create mode 100644 package/ejabberd/0002-remove-make-targets-for-deps.patch
>  delete mode 100644 package/ejabberd/0003-disable-test.patch
>  create mode 100644 package/ejabberd/0003-remove-checking-erlang-version.patch
>  create mode 100644 package/ejabberd/0004-correct-include.patch
>  delete mode 100644 package/ejabberd/0004-disable-version-check.patch
>  create mode 100644 package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch
>  delete mode 100644 package/ejabberd/0005-fix-includes.patch
>  delete mode 100644 package/ejabberd/0006-disable-erlang-deprecated-types-check.patch
>  rename package/ejabberd/{0007-fix-install-permissions.patch => 0006-fix-install-permissions.patch} (73%)
>  rename package/ejabberd/{0008-fix-ejabberdctl.patch => 0007-fix-ejabberdctl.patch} (56%)
> 

[snip]

You need to add your Sob line in each patch you add in package/ejabberd.

> +
> diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
> index 7b4e99b..7add8c6 100644
> --- a/package/ejabberd/Config.in
> +++ b/package/ejabberd/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_EJABBERD
>  	bool "ejabberd"
>  	depends on BR2_PACKAGE_ERLANG
> +	depends on BR2_INSTALL_LIBSTDCPP # required for erlang-p1-stringprep
>  	select BR2_PACKAGE_ERLANG_LAGER
>  	select BR2_PACKAGE_ERLANG_P1_CACHE_TAB
>  	select BR2_PACKAGE_ERLANG_P1_ICONV
> @@ -18,5 +19,5 @@ config BR2_PACKAGE_EJABBERD
>  
>  	  http://www.ejabberd.im
>  
> -comment "ejabberd needs erlang"
> -	depends on !BR2_PACKAGE_ERLANG
> +comment "ejabberd needs erlang and a toolchain w/ C++"
> +	depends on !BR2_PACKAGE_ERLANG || !BR2_INSTALL_LIBSTDCPP

This part must be in erlang-p1-stringprep patch bump.

> diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
> index b027183..ea85d1c 100644
> --- a/package/ejabberd/ejabberd.hash
> +++ b/package/ejabberd/ejabberd.hash
> @@ -1,4 +1,4 @@
> -# From https://www.process-one.net/downloads/ejabberd/15.11/ejabberd-15.11.tgz.md5
> -md5 a6997b88d44c5a5acff45bb1d938d0f3 ejabberd-15.11.tgz
> +# From https://www.process-one.net/downloads/ejabberd/15.11/ejabberd-16.01.tgz.md5
> +md5 5e525c25c8f04287217b8a9522d7c942 ejabberd-16.01.tgz
>  # Locally computed
> -sha256 01044b5a25f9f8dda8c60726698bd27d650751b810e5bfa23f9bb49ba20e946a ejabberd-15.11.tgz
> +sha256 e2cc479d5870539b2e6756690b227969c88a541d464d1fc6e1cbf7270ad7d681 ejabberd-16.01.tgz
> diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
> index 841c911..a3aad35 100644
> --- a/package/ejabberd/ejabberd.mk
> +++ b/package/ejabberd/ejabberd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EJABBERD_VERSION = 15.11
> +EJABBERD_VERSION = 16.01
>  EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
>  EJABBERD_SITE = https://www.process-one.net/downloads/ejabberd/$(EJABBERD_VERSION)
>  EJABBERD_LICENSE = GPLv2+ with OpenSSL exception
> 
It would be great if you add a comment about these lines (patch 0003)
EJABBERD_USE_AUTOCONF = YES
EJABBERD_AUTORECONF = YES

Best regards,
Romain
