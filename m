From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 15:15:11 +0200
Subject: [Buildroot] [PATCH 1/4] support/testing: add tests for musl and
 uclibc toolchains
In-Reply-To: <20170702134107.11488-2-thomas.petazzoni@free-electrons.com>
References: <20170702134107.11488-1-thomas.petazzoni@free-electrons.com>
 <20170702134107.11488-2-thomas.petazzoni@free-electrons.com>
Message-ID: <c95e13ce-db7d-7b2e-7417-823492e39a0b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-07-17 15:41, Thomas Petazzoni wrote:
> These tests simply build a system with musl and uclibc toolchains, and
> boot them under qemu. It allows to minimally validate that our support
> for musl/uclibc external toolchains is working. We already had some
> tests covering glibc toolchains, so we can now easily test that all
> three C libraries are supported.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 When we have the in-tree config fragments for the autobuilder toolchains, these
should be used instead of hardcoding. For now however (after your fix):

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
> This commit is part of the series, as I've written/used those tests to
> validate that things are still working correctly with all of glibc,
> uclibc and musl toolchains.
> ---
>  support/testing/tests/toolchain/test_external.py | 75 ++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
> index 0b15d48..f975c56 100644
> --- a/support/testing/tests/toolchain/test_external.py
> +++ b/support/testing/tests/toolchain/test_external.py
> @@ -154,3 +154,78 @@ BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
>                             kernel="builtin",
>                             options=["-initrd", img])
>          self.emulator.login()
> +
> +class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
> +    config = BASIC_CONFIG + \
> +"""
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-444-g6c704ba.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_11=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> +BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +"""
> +    toolchain_prefix = "arm-linux"
> +
> +    def test_run(self):
> +        TestExternalToolchain.common_check(self)
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", img])
> +        self.emulator.login()
> +
> +class TestExternalToolchainCtngMusl(TestExternalToolchain):
> +    config = BASIC_CONFIG + \
> +"""
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_ARM_ENABLE_VFP=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://prout.org/arm-ctng-linux-musleabihf.tar.xz"
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-ctng-linux-musleabihf"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> +BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +"""
> +    toolchain_prefix = "arm-ctng-linux-musleabihf"
> +
> +    def test_run(self):
> +        TestExternalToolchain.common_check(self)
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", img])
> +        self.emulator.login()
> +
> +class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
> +    config = BASIC_CONFIG + \
> +"""
> +BR2_arm=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-444-g6c704ba.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> +BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> +BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> +# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> +BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +"""
> +    toolchain_prefix = "arm-linux"
> +
> +    def test_run(self):
> +        TestExternalToolchain.common_check(self)
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", img])
> +        self.emulator.login()
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
