From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 15:19:45 +0200
Subject: [Buildroot] Various runtime test failures on Gitlab CI
Message-ID: <20190810151945.5ed664ea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, Fran?ois, Yegor, Yann,

The last Gitlab CI pipeline on master
(https://gitlab.com/buildroot.org/buildroot/pipelines/75533041/failures)
shows a number of failures in our runtime tests.

Here are the failing tests:

  tests.package.test_python_treq.TestPythonPy3Treq
  tests.package.test_python_treq.TestPythonPy2Treq
  tests.package.test_python_crossbar.TestPythonPy3Crossbar
  tests.package.test_perl_io_socket_ssl.TestPerlIOSocketSSL
  tests.package.test_lua_http.TestLuajitHttp
  tests.package.test_lua_http.TestLuaHttp
  tests.init.test_systemd.TestInitSystemSystemdRwFull

And now, the details of the build failures:

 - For tests.package.test_python_treq.TestPythonPy3Treq and
   tests.package.test_python_treq.TestPythonPy2Treq, we're getting:

Traceback (most recent call last):
  File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_python.py", line 125, in test_run
    self.run_sample_scripts()
  File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_python_treq.py", line 10, in run_sample_scripts
    self.assertIn("Connection refused", output[0])
AssertionError: 'Connection refused' not found in ":0: UserWarning: You do not have a working installation of the service_identity module: 'cannot import name 'verify_ip_address' from 'service_identity.pyopenssl' (/usr/lib/python3.7/site-packages/service_identity/pyopenssl.pyc)'.  Please install it from <https://pypi.python.org/pypi/service_identity> and make sure all of its dependencies are satisfied.  Without the service_identity module, Twisted can perform only rudimentary TLS client hostname verification.  Many valid certificate/hostname mappings may be rejected."

 - For tests.package.test_python_crossbar.TestPythonPy3Crossbar, we're
   getting

Traceback (most recent call last):
  File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_python.py", line 125, in test_run
    self.run_sample_scripts()
  File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_python.py", line 120, in run_sample_scripts
    self.assertEqual(exit_code, 0)
AssertionError: 1 != 0

 - For tests.package.test_perl_io_socket_ssl.TestPerlIOSocketSSL,
   tests.package.test_lua_http.TestLuajitHttp and
   tests.package.test_lua_http.TestLuaHttp, we're getting:

======================================================================
ERROR: test_run (tests.package.test_perl_io_socket_ssl.TestPerlIOSocketSSL)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_perl_io_socket_ssl.py", line 21, in test_run
    self.module_test("IO::Socket::SSL")
  File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_perl.py", line 22, in module_test
    _, exit_code = self.emulator.run(cmd)
  File "/builds/buildroot.org/buildroot/support/testing/infra/emulator.py", line 109, in run
    self.qemu.expect("# ", timeout=timeout)
  File "/usr/lib/python2.7/dist-packages/pexpect/spawnbase.py", line 321, in expect
    timeout, searchwindowsize, async)
  File "/usr/lib/python2.7/dist-packages/pexpect/spawnbase.py", line 345, in expect_list
    return exp.expect_loop(timeout)
  File "/usr/lib/python2.7/dist-packages/pexpect/expect.py", line 107, in expect_loop
    return self.timeout(e)
  File "/usr/lib/python2.7/dist-packages/pexpect/expect.py", line 70, in timeout
    raise TIMEOUT(msg)
TIMEOUT: Timeout exceeded.


 - For tests.init.test_systemd.TestInitSystemSystemdRwFull, we're
   getting:

Traceback (most recent call last):
  File "/builds/buildroot.org/buildroot/support/testing/tests/init/test_systemd.py", line 157, in test_run
    self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
  File "/builds/buildroot.org/buildroot/support/testing/tests/init/base.py", line 38, in start_emulator
    self.emulator.login()
  File "/builds/buildroot.org/buildroot/support/testing/infra/emulator.py", line 92, in login
    raise SystemError("System does not boot")
SystemError: System does not boot

Could you have a look and fix those issues ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
