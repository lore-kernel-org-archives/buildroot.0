From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 10 Aug 2019 19:44:31 -0300
Subject: [Buildroot] Various runtime test failures on Gitlab CI
References: <20190810151945.5ed664ea@windsurf.home>
Message-ID: <5d4f48cf5dbc7_6ff23ff0b6092c5c9973b@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I will send a small series to fix the python-*, lua-* and perl-* tests.

On Sat, Aug 10, 2019 at 10:19 AM, Thomas Petazzoni wrote:

[snip]
>  - For tests.package.test_python_treq.TestPythonPy3Treq and
>    tests.package.test_python_treq.TestPythonPy2Treq, we're getting:
> 
> Traceback (most recent call last):
>   File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_python.py", line 125, in test_run
>     self.run_sample_scripts()
>   File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_python_treq.py", line 10, in run_sample_scripts
>     self.assertIn("Connection refused", output[0])
> AssertionError: 'Connection refused' not found in ":0: UserWarning: You do not have a working installation of the service_identity module: 'cannot import name 'verify_ip_address' from 'service_identity.pyopenssl' (/usr/lib/python3.7/site-packages/service_identity/pyopenssl.pyc)'.  Please install it from <https://pypi.python.org/pypi/service_identity> and make sure all of its dependencies are satisfied.  Without the service_identity module, Twisted can perform only rudimentary TLS client hostname verification.  Many valid certificate/hostname mappings may be rejected."

The new warning message from treq at runtime confuses the test. I will improve
the test code to ignore it.

>  - For tests.package.test_python_crossbar.TestPythonPy3Crossbar, we're
>    getting
> 
> Traceback (most recent call last):
>   File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_python.py", line 125, in test_run
>     self.run_sample_scripts()
>   File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_python.py", line 120, in run_sample_scripts
>     self.assertEqual(exit_code, 0)
> AssertionError: 1 != 0

python-autobahn now defaults to use msgpack when CPython is used. But it
also still supports umsgpack when the user explicitly selects it using an
environment variable.
python-crossbar selects python-u-msgpack on menuconfig.
I will change the test to explicitly use umsgpack.

>  - For tests.package.test_perl_io_socket_ssl.TestPerlIOSocketSSL,
>    tests.package.test_lua_http.TestLuajitHttp and
>    tests.package.test_lua_http.TestLuaHttp, we're getting:
> 
> ======================================================================
> ERROR: test_run (tests.package.test_perl_io_socket_ssl.TestPerlIOSocketSSL)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_perl_io_socket_ssl.py", line 21, in test_run
>     self.module_test("IO::Socket::SSL")
>   File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_perl.py", line 22, in module_test
>     _, exit_code = self.emulator.run(cmd)
>   File "/builds/buildroot.org/buildroot/support/testing/infra/emulator.py", line 109, in run
>     self.qemu.expect("# ", timeout=timeout)
>   File "/usr/lib/python2.7/dist-packages/pexpect/spawnbase.py", line 321, in expect
>     timeout, searchwindowsize, async)
>   File "/usr/lib/python2.7/dist-packages/pexpect/spawnbase.py", line 345, in expect_list
>     return exp.expect_loop(timeout)
>   File "/usr/lib/python2.7/dist-packages/pexpect/expect.py", line 107, in expect_loop
>     return self.timeout(e)
>   File "/usr/lib/python2.7/dist-packages/pexpect/expect.py", line 70, in timeout
>     raise TIMEOUT(msg)
> TIMEOUT: Timeout exceeded.

All of these need entropy and are currently using armv7 kernel. I will switch to
use armv5 builtin kernel that already provides entropy.


Regards,
Ricardo
