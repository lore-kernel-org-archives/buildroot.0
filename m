From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 05 Sep 2017 23:31:22 -0300
Subject: [Buildroot] [RFC] testing: add python-cryptography tests
References: <20170904071500.3858-1-yegorslists@googlemail.com>
Message-ID: <59af5dfae6364_331f1091a18551a0@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Looks good. I would like to propose some changes but before you resend let's
hear what you and others think about 1) and 2) below.

On Mon, Sep 04, 2017 at 04:15 AM, wrote:

[snip
> +++ b/.gitlab-ci.yml
> @@ -250,6 +250,8 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
>  tests.package.test_ipython.TestIPythonPy3: *runtime_test
>  tests.package.test_python.TestPython2: *runtime_test
>  tests.package.test_python.TestPython3: *runtime_test
> +tests.package.test_python-cryptography.TestPythonPy2Cryptography: *runtime_test
> +tests.package.test_python-cryptography.TestPythonPy3Cryptography: *runtime_test
>  tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
>  tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
>  tests.toolchain.test_external.TestExternalToolchainCCache: *runtime_test

Are you aware of 'make .gitlab-ci.yml'?
It generates the list always in a reproducible way (using LC_ALL=C). You don't
need to change it by hand.

> diff --git a/support/testing/tests/package/test_python-cryptography.py b/support/testing/tests/package/test_python-cryptography.py
> new file mode 100644
> index 000000000..0b1d1f366
> --- /dev/null
> +++ b/support/testing/tests/package/test_python-cryptography.py

1) I propose to merge this file into the existing test_python.py

The rationale is:
For the long term:
As I see, the test infra is used to detect regressions. It is important for both
the basic features and also for the complex scenarios (like the dependencies of
this package). But I don't expect to see tests added to every single package or
python package (it would take a very long time to run all those tests), so this
file probably will not grow too much and we can keep the tests together.
For the short run:
We avoid for now to deal with filenames with '-' as they can generate more
code. If for instance test_python.py was named test_python-base.py you could
not easily import it.
You clearly used the same "old" code style as in test_python.py. If you merge
the files no reviewer will ask you to fix the 7 code style warnings that
flake8 generates or to use the new indented style for configs (to follow
cf3cd4388a support/tests: allow properly indented config fragment). Of course,
if you are willing to send a 2 patch series, first adapting the current
file to the PEP8 + indented config and then adding your test, it would be great.
If not, it can be done later. I can send a code style series if people don't
disagree it is useful.

> @@ -0,0 +1,39 @@
> +import os
> +
> +from tests.package.test_python import TestPythonBase
> +
> +class TestPythonPy2Cryptography(TestPythonBase):
> +    config = TestPythonBase.config + \
> +"""
> +BR2_PACKAGE_PYTHON=y
> +BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
> +"""
> +    def fernet_test(self, timeout=-1):
> +        """Test Fernet."""

This comment is not really needed.

> +        cmd = self.interpreter + " -c 'from cryptography.fernet import Fernet;"
> +        cmd += "key = Fernet.generate_key();"
> +        cmd += "f = Fernet(key)'"
> +        _, exit_code = self.emulator.run(cmd, timeout)
> +        self.assertEqual(exit_code, 0)
> +
> +    def test_run(self):
> +        self.login()
> +        self.fernet_test(40)
> +
> +class TestPythonPy3Cryptography(TestPythonBase):
> +    config = TestPythonBase.config + \
> +"""
> +BR2_PACKAGE_PYTHON3=y
> +BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
> +"""
> +    def fernet_test(self, timeout=-1):
> +        """Test Fernet."""
> +        cmd = self.interpreter + " -c 'from cryptography.fernet import Fernet;"
> +        cmd += "key = Fernet.generate_key();"
> +        cmd += "f = Fernet(key)'"
> +        _, exit_code = self.emulator.run(cmd, timeout)
> +        self.assertEqual(exit_code, 0)

2) to avoid duplicate code I suggest something like this:
class TestPythonCryptography(TestPythonBase):
    def fernet_test(self, timeout=-1):
...
class TestPythonPy2Cryptography(TestPythonCryptography):
    config = TestPythonBase.config + \
...
    def test_run(self):
...
class TestPythonPy3Cryptography(TestPythonCryptography):
    config = TestPythonBase.config + \
...
    def test_run(self):
...

> +
> +    def test_run(self):
> +        self.login()
> +        self.fernet_test(40)
> -- 

And also a question concerning the runtime:

For the Python 3 test, all went well.
But for Python 2 there are some scary messages on the log
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/31298616/artifacts/download
 ERROR:root:code for hash md5 was not found.
 Traceback (most recent call last):
   File "usr/lib/python2.7/hashlib.py", line 147, in <module>
   File "usr/lib/python2.7/hashlib.py", line 97, in __get_builtin_constructor
 ValueError: unsupported hash type md5
and the same messages repeat for sha1, sha224, sha256, sha384 and sha512.

But I run your tests using -k, then I entered the qemu using the command in the
first line of TestPythonPy2Cryptography-run.log, then I called its Python shell
and I could do this:
 >>> from cryptography.fernet import Fernet
 [scary messages]
 >>> key = Fernet.generate_key()
 >>> f = Fernet(key)
 >>> token = f.encrypt(b"buildroot")
 >>> token
 'gAAAAAAAAAAuQ0Tj9azF8nIU2bmXXE07WOCSm0naDpdDAOQ0KhWCR2VrxeAoaTWx8gxP_pNVGLY_hLjFuY7vFI1D2dtKh6PKrg=='
 >>> f.decrypt(token)
 'buildroot'

So I suppose the test you created is testing enough.
Could you (that knows more then me about the package) confirm it is OK to get
these messages?

If you think testing for the output of the command is needed to determine
fail/pass, see TestNoTimezone. I didn't tested but I guess assertRegexpMatches
and assertNotRegexpMatches can be helpful.

Regards,
Ricardo
