From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 04 Jan 2015 12:56:06 +0100
Subject: [Buildroot] [PATCH 09/10] package/dvb-app: handle static/shared
 only build
In-Reply-To: <20150102132503.7b9036cc@free-electrons.com>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>	<1419717508-11627-10-git-send-email-romain.naour@openwide.fr>
 <20150102132503.7b9036cc@free-electrons.com>
Message-ID: <54A92A56.7090903@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 02/01/2015 13:25, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Sat, 27 Dec 2014 22:58:27 +0100, Romain Naour wrote:
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  .../0003-handle-static-shared-only-build.patch     | 35 ++++++++++++++++++++++
>>  .../dvb-apps/0003-support-static-only-build.patch  | 20 -------------
>>  package/dvb-apps/dvb-apps.mk                       |  6 +++-
>>  3 files changed, 40 insertions(+), 21 deletions(-)
>>  create mode 100644 package/dvb-apps/0003-handle-static-shared-only-build.patch
>>  delete mode 100644 package/dvb-apps/0003-support-static-only-build.patch
> 
> Does not build with the following configuration:
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.11.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17=y
> BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
> BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_DVB_APPS=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> It gives:
> 
> CC dvbcfg_test
> arm-linux-gcc: error: ../../lib/libdvbcfg/libdvbcfg.a: Aucun fichier ou dossier de ce type
> ../../Make.rules:81: recipe for target 'dvbcfg_test' failed
> 
> Do you actually test your patches before sending them? I don't mind
> seeing corner cases being broken, but here it's the canonical case: a
> BR2_SHARED_LIBS=y build (which is the default) on a major architecture
> (ARM).

See patch 10/10

Usually, I test my patches before sending them, at least a build test.
But I can make mistakes, thanks for the review and testing.

In order to upstream the patch 0003-handle-static-shared-only-build.patch, I
reworked the logic.

Instead of enabling static/shared libraries with

ifeq ($(static),1)
libraries = $(lib_name).a
endif

ifeq ($(shared),1)
libraries += $(lib_name).so
endif

which require to set one of the two variables to build something, I renamed
these variable to disable static/shared libraries one by one:

ifeq ($(disable_static),)
libraries = $(lib_name).a
endif

ifeq ($(disable_shared),)
libraries += $(lib_name).so
endif

This preserves the original behavior.

Best regards,
Romain
