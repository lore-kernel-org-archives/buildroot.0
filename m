From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 15:12:44 +0100
Subject: [Buildroot] [PATCH 1/1] support/testing/: change python-gobject
 to use prebuilt kernel
In-Reply-To: <20200316153459.2291931-1-aduskett@gmail.com>
References: <20200316153459.2291931-1-aduskett@gmail.com>
Message-ID: <20200322151244.0cab0e9e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Mon, 16 Mar 2020 08:34:59 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> This change significantly reduces the ammount of time needed to run the
> test.
> 
> Select a cortext_a9 and a external linaro toolchain due to the need for a

cortext -> cortex

> glibc based toolchain, as the default TestPythonPackageBase.config toolchain
> is a uClibc toolchain.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

The idea is good, but I have some comment below.

> diff --git a/support/testing/tests/package/test_python_gobject.py b/support/testing/tests/package/test_python_gobject.py
> index a673d554a4..cf10e9ff67 100644
> --- a/support/testing/tests/package/test_python_gobject.py
> +++ b/support/testing/tests/package/test_python_gobject.py
> @@ -3,31 +3,24 @@ from tests.package.test_python import TestPythonPackageBase
>  
>  class TestPythonPy3Gobject(TestPythonPackageBase):
>      __test__ = True
> -    config = \
> +    config = TestPythonPackageBase.config + \

I don't think it makes much sense to re-use
TestPythonPackageBase.config. Indeed, what is does is:

    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
        """
        BR2_TARGET_ROOTFS_CPIO=y
        # BR2_TARGET_ROOTFS_TAR is not set
        """

and infra.basetest.BASIC_TOOLCHAIN_CONFIG only defines the toolchain
options.

So could instead just use a configuration that is completely defined
here ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
