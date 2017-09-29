From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Sep 2017 10:17:58 +0200
Subject: [Buildroot] [PATCH 2/5] support/testing: indent ccache
	defconfig fragment
In-Reply-To: <20170929022713.2967-2-ricardo.martincoski@gmail.com>
References: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
 <20170929022713.2967-2-ricardo.martincoski@gmail.com>
Message-ID: <20170929081758.GD2899@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-09-28 23:27 -0300, Ricardo Martincoski spake thusly:
> Postpone the strip out of leading spaces in defconfig fragments from the
> __init__  to the setUp method. It allows test cases to post-process the
> defconfig in their own __init__ before calling the __init__ method from
> the base class.

Ideally, this should have been the very first patch in the series.

> Indent the only fragment in the tree that currently need this (in the
> ccache test case), taking advantage of
> "cf3cd4388a support/tests: allow properly indented config fragment".

And then that wcould have gone in the other patch without any issue.

Once you split and reorder the patches, you can add my:

    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Tested by hacking support/testing/infra/builder.py
>  @@ -30,2 +30,3 @@ class Builder(object):
>               raise SystemError("Cannot olddefconfig")
>  +        raise SystemError("Stop")
> and diffing the resulting *-build.log files against old ones: few empty
> lines are added/removed. Also tested diffing the resulting .config files
> against old ones: they are the same.
> 
> Warnings from flake8 change from 100 to 99.
> ---
>  support/testing/infra/basetest.py                | 4 ++--
>  support/testing/tests/toolchain/test_external.py | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index d205119b2c..c41852949a 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -42,8 +42,6 @@ class BRTest(unittest.TestCase):
>          self.testname = self.__class__.__name__
>          self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
>          self.emulator = None
> -        self.config = '\n'.join([line.lstrip() for line in
> -                                 self.config.splitlines()]) + '\n'
>          self.config += "BR2_JLEVEL={}\n".format(self.jlevel)
>  
>      def show_msg(self, msg):
> @@ -51,6 +49,8 @@ class BRTest(unittest.TestCase):
>                                      self.testname, msg)
>      def setUp(self):
>          self.show_msg("Starting")
> +        self.config = '\n'.join([line.lstrip() for line in
> +                                 self.config.splitlines()]) + '\n'
>          self.b = Builder(self.config, self.builddir, self.logtofile)
>  
>          if not self.keepbuilds:
> diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
> index 1bb5e9497b..ad2f56a20e 100644
> --- a/support/testing/tests/toolchain/test_external.py
> +++ b/support/testing/tests/toolchain/test_external.py
> @@ -232,10 +232,10 @@ class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
>  
>  class TestExternalToolchainCCache(TestExternalToolchainBuildrootuClibc):
>      extraconfig = \
> -"""
> -BR2_CCACHE=y
> -BR2_CCACHE_DIR="{builddir}/ccache-dir"
> -"""
> +        """
> +        BR2_CCACHE=y
> +        BR2_CCACHE_DIR="{builddir}/ccache-dir"
> +        """
>  
>      def __init__(self, names):
>          super(TestExternalToolchainBuildrootuClibc, self).__init__(names)
> -- 
> 2.13.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
