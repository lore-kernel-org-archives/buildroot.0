From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 23:18:52 +0200
Subject: [Buildroot] [PATCH v2 6/6] support/testing/tests/core: SSP &
 hardening flags
In-Reply-To: <20180717030420.12009-1-matthew.weber@rockwellcollins.com>
References: <20180717030420.12009-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180810231852.70f9a004@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Jul 2018 22:04:20 -0500, Matt Weber wrote:

> diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
> new file mode 100644
> index 0000000000..d3eb0941d3
> --- /dev/null
> +++ b/support/testing/tests/core/test_hardening.py
> @@ -0,0 +1,112 @@
> +import os
> +import subprocess
> +import json
> +
> +import infra.basetest
> +
> +HARD_DEFCONFIG = \
> +    """
> +    BR2_powerpc64=y
> +    BR2_powerpc_e5500=y
> +    BR2_TOOLCHAIN_EXTERNAL=y
> +    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +    BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2018.02-2.tar.bz2"
> +    BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> +    BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
> +    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> +    BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +    BR2_PACKAGE_LIGHTTPD=y
> +    BR2_PACKAGE_HOST_CHECKSEC=y
> +    # BR2_TARGET_ROOTFS_TAR is not set
> +    """
> +
> +
> +def checksec_run(builddir, target_file):
> +    cmd = ["host/bin/checksec", "--output", "json", "--file", target_file]

I'm even more confused now. I thought checksec didn't work in a
cross-compiled situation. Could you clarify ?

> +    ret = subprocess.check_output(cmd,
> +                                  stderr=open(os.devnull, "w"),
> +                                  cwd=builddir,
> +                                  env={"LANG": "C"})
> +    return ret

Perhaps this function should also do the json.loads and return only
out["file"] to avoid duplicating this everywhere in the below classes ?

Also, using inheritance would be better here:

class TestHardeningBase(infra.basetest.BRTest):
	config = """
... the base defconfig ...
"""

	checksec_files = ["usr/sbin/lighttpd", "bin/busybox"]

	def checksec_run(self, target_file):
		filepath = os.path.join(self.builddir, "target", target_file)
		...

class TestHardeningRelRo(TestHardeningBase):
	config = TestHardeningBase.config +
"""
...
"""

	def test_run():
		for f in checksec_files:
			out = self.checksec_run(f)
			self.assertEqual(out["relro"], "full")
			self.assertEqual(out["pie"], "yes")

and ditto for the other tests.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
