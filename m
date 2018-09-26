From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 26 Sep 2018 09:08:25 +0200
Subject: [Buildroot] [PATCH 2/5] support/testing: add python-txaio tests
In-Reply-To: <20180926025514.2092-3-ricardo.martincoski@gmail.com>
References: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
 <20180926025514.2092-3-ricardo.martincoski@gmail.com>
Message-ID: <CAGm1_ksYm8+ksTMAPaVAy5F0uub7_SSAhUVx_kHaosk8cTjoXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 26, 2018 at 4:57 AM Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
>
> Add a simple test case that imports the module to use with twisted in
> Python 2 and with asyncio in Python 3.
>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Asaf Kahlon <asafka7@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  .gitlab-ci.yml                                |  2 ++
>  .../tests/package/test_python_txaio.py        | 34 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 support/testing/tests/package/test_python_txaio.py
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 001ea43f72..609ea0cdb5 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -303,6 +303,8 @@ tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
>  tests.package.test_python_autobahn.TestPythonPy3Autobahn: *runtime_test
>  tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
>  tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
> +tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
> +tests.package.test_python_txaio.TestPythonPy3Txaio: *runtime_test
>  tests.package.test_rust.TestRust: *runtime_test
>  tests.package.test_rust.TestRustBin: *runtime_test
>  tests.package.test_syslog_ng.TestSyslogNg: *runtime_test
> diff --git a/support/testing/tests/package/test_python_txaio.py b/support/testing/tests/package/test_python_txaio.py
> new file mode 100644
> index 0000000000..af93e031b5
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_txaio.py
> @@ -0,0 +1,34 @@
> +from tests.package.test_python import TestPythonBase
> +
> +
> +class TestPythonPy2Txaio(TestPythonBase):
> +    config = TestPythonBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON=y
> +        BR2_PACKAGE_PYTHON_TXAIO=y
> +        BR2_PACKAGE_PYTHON_TWISTED=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        cmd = self.interpreter + " -c 'import txaio;"
> +        cmd += "txaio.use_twisted();"
> +        cmd += "f0 = txaio.create_future()'"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +
> +
> +class TestPythonPy3Txaio(TestPythonBase):
> +    config = TestPythonBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_TXAIO=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        cmd = self.interpreter + " -c 'import txaio;"
> +        cmd += "txaio.use_asyncio();"
> +        cmd += "f0 = txaio.create_future()'"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> --
> 2.17.1
>
