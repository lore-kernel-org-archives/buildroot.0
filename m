From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Dec 2017 23:10:56 +0100
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: build fiptool
 separately with dependency on host-openssl
In-Reply-To: <20171217085553.27212-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 17 Dec 2017 09:55:53 +0100")
References: <20171217085553.27212-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87mv2f7klr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > ATF >= 1.3 builds a host program called fiptool, which creates

s/creates/uses/

> OpenSSL, so we need to build host-openssl. We could have made it an
 > optional dependency like U-Boot does, but since most ATF versions are
 > going to be >= 1.3 in the near future, we simply make host-openssl a
 > mandatory dependency.

 > However, the ATF build system is not very good, and you can't easily
 > pass flags that will affect the build of host programs. Therefore, we
 > take the approach of building fiptool separately before triggering the
 > real build process.

 > It would obviously be better to fix ATF itself, but as usual with
 > those bootloader packages, we fetch different versions depending on
 > the platform/configuration, making it difficult to use patches.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/44868961

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 13 +++++++++++++
 >  1 file changed, 13 insertions(+)

 > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
 > index e8d1c6205b..5085e6176b 100644
 > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
 > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
 > @@ -55,6 +55,18 @@ ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
 >  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
 >  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
 > +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-openssl
 > +# fiptool only exists in newer (>= 1.3) versions of ATF, so we build
 > +# it conditionally. We need to explicitly build it as it requires
 > +# OpenSSL, and therefore proper variables to find the host OpenSSL.

s/proper/needs to be passed proper/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
