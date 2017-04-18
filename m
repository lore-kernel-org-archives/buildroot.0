From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 20:03:50 +0200
Subject: [Buildroot] [PATCH 1/1] spidev_test: Select version based on
 toolchain
In-Reply-To: <20170418150938.14088-1-joeri.barbarien@gmail.com>
References: <20170418150938.14088-1-joeri.barbarien@gmail.com>
Message-ID: <154608cd-d798-1f88-ec5f-241891ff0c87@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Joeri,

 Good idea, but I have a few remarks below. Care to fix up and resubmit?

On 18-04-17 17:09, Joeri Barbarien wrote:
> From: Joeri Barbarien <joeri.barbarien@nokia.com>
> 
> spidev_test has further evolved after kernel version 3.15, which
> is the most recent version that could be built in this package.
> This change allows to build the version of spidev_test corresponding
> to the toolchain's kernel header version. In this way, when building with
> a newer toolchain, we are able to benefit from the added functionality
> offered by newer versions of the tool.
> 
> Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
> ---
>  package/spidev_test/spidev_test.hash |  3 +++
>  package/spidev_test/spidev_test.mk   | 27 ++++++++++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/package/spidev_test/spidev_test.hash b/package/spidev_test/spidev_test.hash
> index 6871288..ab91a93 100644
> --- a/package/spidev_test/spidev_test.hash
> +++ b/package/spidev_test/spidev_test.hash
> @@ -1,3 +1,6 @@
>  # Locally calculated
>  sha256 80471c330d8c0bf5ba6479c434a54a54bdd2dc59a703b9c76c2541ec04cfb8c3  spidev_test.c?id=v3.0
>  sha256 57fa6c534e0b7b4d234075e18bc89e2f3c9fc4ecc27e80f349a8057708e0de46  spidev_test.c?id=v3.15
> +sha256 7af6f126248a479985a7e67238ed477c1dc20fab1453fab2f4a7e0db79d219c2  spidev_test.c?id=v4.1
> +sha256 94ec2ef4c7977f82aed43952ec6f5dfe472d879590ada8707bf841c24af8cc68  spidev_test.c?id=v4.5
> +sha256 b5918394f79f6ff3ceed20de063a6f7c49e20aee0d7bd91ec73c9e1ce9e4269a  spidev_test.c?id=v4.9
> diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
> index 50e7a30..33bca74 100644
> --- a/package/spidev_test/spidev_test.mk
> +++ b/package/spidev_test/spidev_test.mk
> @@ -7,12 +7,37 @@
>  # v3.15+ requires SPI_TX_QUAD/SPI_RX_QUAD to build
>  # Normally kernel headers can't be newer than kernel so switch based on that.
>  # If you need quad-pumped spi support you need to upgrade your toolchain.
> +
> +
> +# Build the version corresponding to the toolchain kernel headers version.
> +# Note that the contents of spidev_test.c does not change between the
> +# versions referenced below.
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9),y)
> +SPIDEV_TEST_VERSION = v4.9

 Is it possible to build e.g. spidev_test from v4.9 with kernel headers v3.15?
If yes, then there is no need to have these intermediate versions, you can just do

ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
SPIDEV_TEST_VERSION = v4.10
else
SPIDEV_TEST_VERSION = v3.0
endif

 We just want the latest version. In fact, for headers < 3.15 we could have used
v3.14 instead of v3.0, but there are no changes between those two versions.


> +else
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5),y)

 If you do need to keep multiple versions, put the else ifeq on one line. That
way you need only one endif at the end.

 Regards,
 Arnout

> +SPIDEV_TEST_VERSION = v4.5
> +else
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1),y)
> +SPIDEV_TEST_VERSION = v4.1
> +else
>  ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
>  SPIDEV_TEST_VERSION = v3.15
>  else
>  SPIDEV_TEST_VERSION = v3.0
>  endif
> -SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi
> +endif
> +endif
> +endif
> +
> +# Location of spidev_test.c changes from v4.5 onwards.
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5),y)
> +SPIDEV_TEST_PATH=tools/spi
> +else
> +SPIDEV_TEST_PATH=Documentation/spi
> +endif
> +
> +SPIDEV_TEST_SITE = http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/$(SPIDEV_TEST_PATH)
>  SPIDEV_TEST_SOURCE = spidev_test.c?id=$(SPIDEV_TEST_VERSION)
>  SPIDEV_TEST_LICENSE = GPL-2.0
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
