From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 19:41:48 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing/tests/package/: runtime
 test
In-Reply-To: <20191026144101.30599-2-nicolas.carrier@orolia.com>
References: <20191026144101.30599-1-nicolas.carrier@orolia.com>
 <20191026144101.30599-2-nicolas.carrier@orolia.com>
Message-ID: <20191026194148.2007d479@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicolas,

On Sat, 26 Oct 2019 14:41:21 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> This patch implements a simple test in which a dummy file system image
> is created, then `bmaptool create` and `bmaptool copy` are used to copy
> it to another file.
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

The title should be: support/testing/tests/package/test_bmap_tools: new test

Also, please add an entry in the DEVELOPERS file for those two new
files you are doing. This will make sure you get notified when there is
a failure of your test in our CI.

> diff --git a/support/testing/tests/package/test_bmap_tools.py b/support/testing/tests/package/test_bmap_tools.py
> new file mode 100644
> index 0000000000..02bd4634d4
> --- /dev/null
> +++ b/support/testing/tests/package/test_bmap_tools.py
> @@ -0,0 +1,54 @@
> +import os
> +import sys
> +import infra
> +
> +from infra.basetest import BRTest
> +from abc import ABC, abstractproperty

I don't think we really need this, it's not used anywhere else.

> +
> +class AbstractBmapToolsTest(BRTest, ABC):

Name this just:

class TestBmapTools(infra.basetest.BRTest)

> +    __test__ = False
> +    sample_script = "tests/package/sample_bmap_tools.sh"
> +

Maybe this empty line is not really needed.

BTW, did you run flake8 on your Python code to make sure it is
compliant with Buildroot's Python coding style ?

> +    copy_script = 'tests/package/copy-sample-script-to-target.sh'
> +    config = f'''
> +        {infra.basetest.BASIC_TOOLCHAIN_CONFIG}

I didn't know about this syntax. I don't think we're using it
elsewhere, but that's OK for me, this syntax is quite nice.

> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_PACKAGE_BMAP_TOOLS=y
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="{infra.filepath(copy_script)}"
> +        BR2_ROOTFS_POST_SCRIPT_ARGS="{infra.filepath(sample_script)}"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_UTIL_LINUX=y
> +        BR2_PACKAGE_UTIL_LINUX_FALLOCATE=y
> +        BR2_PACKAGE_E2FSPROGS=y
> +        BR2_PACKAGE_UTIL_LINUX_LIBUUID=y
> +        '''
> +
> +    def __init__(self, names):
> +        super(AbstractBmapToolsTest, self).__init__(names)
> +        self.config += f"BR2_PACKAGE_PYTHON{self.python_version}=y"

I don't think you need this.

> +    @abstractproperty
> +    def python_version(self):
> +        pass

or this.

> +
> +    def login(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +    def test_run(self):
> +        print(self.config, file=sys.stderr)
> +        self.login()
> +        cmd = f"/root/{os.path.basename(self.sample_script)}"
> +        _, exit_code = self.emulator.run(cmd, timeout=10)
> +        self.assertEqual(exit_code, 0)
> +
> +class TestPy2BmapTools(AbstractBmapToolsTest):
> +    __test__ = True
> +    python_version = ""

Just do this:

class TestBmapToolsPython2(TestBmapTools):
	__test__ = True
	config = TestBmapTools.config + \
	"""
	BR2_PACKAGE_PYTHON=y
	"""

and ditto for Python 3.x of course. See test_python_treq.py for an
example of how we are doing it.

I understand what you're proposing is a different way of doing the same
thing, we really value consistency across the code base. So we want a
given thing to always be done the same way.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
