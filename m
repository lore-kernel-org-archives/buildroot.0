From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 26 Sep 2018 09:20:25 +0200
Subject: [Buildroot] [PATCH 5/5] support/testing: add python-twisted
 tests
In-Reply-To: <20180926025514.2092-6-ricardo.martincoski@gmail.com>
References: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
 <20180926025514.2092-6-ricardo.martincoski@gmail.com>
Message-ID: <CAGm1_kvYAbwgrp42e_pV4o427GSf3Q52BACeWLY-kKcb5PLo3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 26, 2018 at 4:57 AM Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
>
> Use a minimal script to listen to a port and check using netstat.
>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Asaf Kahlon <asafka7@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

So basically the whole stuff is waiting till the Twisted project
would release a new version or we apply
https://github.com/twisted/twisted/pull/966

Yegor

> ---
> NOTICE that TestPythonPy3Twisted currently fails on master branch like this:
> Cannot compile usr/lib/python3.7/site-packages/twisted/conch/manhole.py
> Traceback (most recent call last):
>   File "/builds/RicardoMartincoski/buildroot/test-output/TestPythonPy3Twisted/host/lib/python3.7/py_compile.py", line 136, in compile
>     _optimize=optimize)
>   File "<frozen importlib._bootstrap_external>", line 763, in source_to_code
>   File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
>   File "usr/lib/python3.7/site-packages/twisted/conch/manhole.py", line 154
>     def write(self, data, async=False):
>                               ^
> SyntaxError: invalid syntax
> ---
>  .gitlab-ci.yml                                |  2 +
>  .../tests/package/test_python_twisted.py      | 54 +++++++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 support/testing/tests/package/test_python_twisted.py
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ab3493686d..4b8fee5f23 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -305,6 +305,8 @@ tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
>  tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
>  tests.package.test_python_incremental.TestPythonPy2Incremental: *runtime_test
>  tests.package.test_python_incremental.TestPythonPy3Incremental: *runtime_test
> +tests.package.test_python_twisted.TestPythonPy2Twisted: *runtime_test
> +tests.package.test_python_twisted.TestPythonPy3Twisted: *runtime_test
>  tests.package.test_python_txaio.TestPythonPy2Txaio: *runtime_test
>  tests.package.test_python_txaio.TestPythonPy3Txaio: *runtime_test
>  tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: *runtime_test
> diff --git a/support/testing/tests/package/test_python_twisted.py b/support/testing/tests/package/test_python_twisted.py
> new file mode 100644
> index 0000000000..88de30edee
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_twisted.py
> @@ -0,0 +1,54 @@
> +from tests.package.test_python import TestPythonBase
> +
> +TEST_SCRIPT = """
> +from twisted.internet import protocol, reactor, endpoints
> +class F(protocol.Factory):
> +    pass
> +endpoints.serverFromString(reactor, "tcp:1234").listen(F())
> +reactor.run()
> +"""
> +
> +
> +class TestPythonTwisted(TestPythonBase):
> +    def import_test(self):
> +        cmd = "printf '{}' > test.py".format(TEST_SCRIPT)
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +
> +        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 1)
> +
> +        cmd = self.interpreter + " test.py &"
> +        # give some time to setup the server
> +        cmd += "sleep 5"
> +        _, exit_code = self.emulator.run(cmd, timeout=10)
> +        self.assertEqual(exit_code, 0)
> +
> +        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +
> +
> +class TestPythonPy2Twisted(TestPythonTwisted):
> +    config = TestPythonBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON=y
> +        BR2_PACKAGE_PYTHON_TWISTED=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.import_test()
> +
> +
> +class TestPythonPy3Twisted(TestPythonTwisted):
> +    config = TestPythonBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_TWISTED=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.import_test()
> --
> 2.17.1
>
