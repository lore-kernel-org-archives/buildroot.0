From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 7 Sep 2017 15:27:24 +0200
Subject: [Buildroot] [PATCH v2] testing: add python-cryptography tests
In-Reply-To: <1504790742-27831-1-git-send-email-yegorslists@googlemail.com>
References: <1504790742-27831-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <CAGm1_kum3-8hb6ehmBS-6T=Bo-qWEnhamytvwqReA47hEVpSQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 7, 2017 at 3:25 PM,  <yegorslists@googlemail.com> wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v1 -> v2:
>   - rename test file to have only '_' delimiters (suggested by Ricardo Martincoski)
>   - use intermediate class to avoid duplicate code (suggested by Ricardo Martincoski)
>
>  .gitlab-ci.yml                                     |  2 ++
>  .../tests/package/test_python_cryptography.py      | 31 ++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 support/testing/tests/package/test_python_cryptography.py
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index b44c935..091b016 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -250,6 +250,8 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
>  tests.package.test_ipython.TestIPythonPy3: *runtime_test
>  tests.package.test_python.TestPython2: *runtime_test
>  tests.package.test_python.TestPython3: *runtime_test
> +tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
> +tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
>  tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
>  tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
>  tests.toolchain.test_external.TestExternalToolchainCCache: *runtime_test
> diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
> new file mode 100644
> index 0000000..b60152d
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_cryptography.py
> @@ -0,0 +1,31 @@
> +import os
> +
> +from tests.package.test_python import TestPythonBase
> +
> +class TestPythonCryptography(TestPythonBase):
> +    def fernet_test(self, timeout=-1):
> +        cmd = self.interpreter + " -c 'from cryptography.fernet import Fernet;"
> +        cmd += "key = Fernet.generate_key();"
> +        cmd += "f = Fernet(key)'"
> +        _, exit_code = self.emulator.run(cmd, timeout)
> +        self.assertEqual(exit_code, 0)
> +
> +class TestPythonPy2Cryptography(TestPythonCryptography):
> +    config = TestPythonBase.config + \
> +"""
> +BR2_PACKAGE_PYTHON=y
> +BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
> +"""
> +    def test_run(self):
> +        self.login()
> +        self.fernet_test(40)
> +
> +class TestPythonPy3Cryptography(TestPythonCryptography):
> +    config = TestPythonBase.config + \
> +"""
> +BR2_PACKAGE_PYTHON3=y
> +BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
> +"""
> +    def test_run(self):
> +        self.login()
> +        self.fernet_test(40)
> --
> 2.1.4

Following patch [1] is required for error less execution in Python 2
environment.

[1] http://patchwork.ozlabs.org/patch/810953/

Yegor
