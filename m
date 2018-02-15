From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 15 Feb 2018 14:41:02 +0100
Subject: [Buildroot] [RFC] testing: add python-crossbar tests
In-Reply-To: <1518701885-16545-1-git-send-email-yegorslists@googlemail.com>
References: <1518701885-16545-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <CAGm1_ku_EsWrA-qCxkgg6xe-HkdVLB=x_10BN2fNYDAcKk7eng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 15, 2018 at 2:38 PM,  <yegorslists@googlemail.com> wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> This test invokes "crossbar version" command, that checks
> all dependencies found in setup.py files and prints some
> system related information.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  .../testing/tests/package/test_python_crossbar.py  | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 support/testing/tests/package/test_python_crossbar.py
>
> diff --git a/support/testing/tests/package/test_python_crossbar.py b/support/testing/tests/package/test_python_crossbar.py
> new file mode 100644
> index 0000000..a67bdea
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_crossbar.py
> @@ -0,0 +1,27 @@
> +from tests.package.test_python import TestPythonBase
> +
> +class TestPythonCrossbar(TestPythonBase):
> +    def version_test(self, timeout=-1):
> +        cmd = self.interpreter + " -m crossbar version"
> +        _, exit_code = self.emulator.run(cmd, timeout)
> +        self.assertEqual(exit_code, 0)
> +
> +class TestPythonPy2Crossbar(TestPythonCrossbar):
> +    config = TestPythonBase.config + \
> +"""
> +BR2_PACKAGE_PYTHON=y
> +BR2_PACKAGE_PYTHON_CROSSBAR=y
> +"""
> +    def test_run(self):
> +        self.login()
> +        self.version_test(60)
> +
> +class TestPythonPy3Crossbar(TestPythonCrossbar):
> +    config = TestPythonBase.config + \
> +"""
> +BR2_PACKAGE_PYTHON3=y
> +BR2_PACKAGE_PYTHON_CROSSBAR=y
> +"""
> +    def test_run(self):
> +        self.login()
> +        self.version_test(60)

I've tried this test locally, but it always timeouts. Even if I
specify an hour as a timeout.

If a dependency is missing (like python-bitstring), then the test also
fails with an expected message, but if all dependencies are met, the
test doesn't return.

Any idea?

Yegor
