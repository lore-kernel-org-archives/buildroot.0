From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 11 Nov 2020 14:44:01 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-11-09
In-Reply-To: <20201110080945.75B8C20014@silver.osuosl.org>
References: <20201110080945.75B8C20014@silver.osuosl.org>
Message-ID: <92adfb91-080e-c2a5-6fc9-40561295abcf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 10/11/2020 ? 09:09, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Gitlab CI results for 2020-11-09
> ================================
> 
> Detail of runtime-test failures for master
> ------------------------------------------
> 
>              runtime-test |                        link to the job                        | orph?
> --------------------------+---------------------------------------------------------------+------
> ...lp32dGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837490395  | ORPH 

Sun RPC has been removed from Glibc 2.32, we need to remove
BR2_TOOLCHAIN_EXTERNAL_INET_RPC or take a look at libtirpc.

http://patchwork.ozlabs.org/project/buildroot/patch/20201002155931.1529915-2-romain.naour at gmail.com/

>      TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489852  | ORPH 

Fixed by:
https://git.buildroot.net/buildroot/commit/?id=f52a9835fa02b02db06ee4ce06708d7b2cdfcfb4

>        TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489854  | ORPH 
>           TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489855  | ORPH 
>                 TestRelro |
https://gitlab.com/buildroot.org/buildroot/-/jobs/837489856  | ORPH
>          TestRelroPartial |
https://gitlab.com/buildroot.org/buildroot/-/jobs/837489858  | ORPH
>               TestSspNone |
https://gitlab.com/buildroot.org/buildroot/-/jobs/837489859  | ORPH
>             TestSspStrong |
https://gitlab.com/buildroot.org/buildroot/-/jobs/837489860  | ORPH


Fixed by:
https://git.buildroot.net/buildroot/commit/?id=7b9762f4ab5bf21bdb1cf29cc833c5d4d1ec009d

>               TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489930  | ORPH 

Fixed by:
https://git.buildroot.net/buildroot/commit/?id=091e2aec683f2a28b3ef5f9014455b56167dc42b

> ...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489911  | ORPH 
> ...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489912  | ORPH 
> ...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489914  | ORPH 

Fixed by:
https://git.buildroot.net/buildroot/commit/?id=8d5076fdbab105c1efd41b8f88291a1215ebbe60

> ...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489915  | ORPH 

Fixed by:
https://git.buildroot.net/buildroot/commit/?id=1989a49feb47b3fbefec8d178b1aac1a1a2e6399

> ...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489917  | ORPH 

Fixed by:
https://git.buildroot.net/buildroot/commit/?id=14ed65e3a62999a7cef55c357b18789451522340

>     TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837490086  | ORPH 
>      TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837490110  | ORPH 

It's a python 3.9 regression with uclibc due to [1]

>>> import crypt
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.9/crypt.py", line 114, in <module>
  File "/usr/lib/python3.9/crypt.py", line 94, in _add_method
  File "/usr/lib/python3.9/crypt.py", line 82, in crypt
OSError: [Errno 0] Error

It seems that there is no Blowfish hashing in uClibc, so an exception is raised.

The exception handling seems not correct since the exception is raised.
        # Not all libc libraries support all encryption methods.
        if e.errno == errno.EINVAL:
            return False

[1]
https://github.com/python/cpython/commit/0d3fe8ae4961bf551e7d5e42559e2ede1a08fd7c

Testing with a glibc toolchain fail with a different error.

At least "import crypt" works but...

# python sample_python_crossbar.py

Traceback (most recent call last):
  File "/usr/lib/python3.9/site-packages/lmdb/__init__.py", line 42, in <module>
ImportError:
/usr/lib/python3.9/site-packages/lmdb/cpython.cpython-39-arm-linux-gnueabi.so:
undefined symbol: _Py_ForgetReference

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/lib/python3.9/distutils/spawn.py", line 75, in spawn
  File "/usr/lib/python3.9/subprocess.py", line 947, in __init__
  File "/usr/lib/python3.9/subprocess.py", line 1819, in _execute_child
FileNotFoundError: [Errno 2] No such file or directory:
'/home/naourr/buildroot/testsuite/TestPythonPy3Crossbar-glibc/host/bin/arm-linux-gcc'

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/usr/lib/python3.9/distutils/unixccompiler.py", line 117, in _compile
  File "/usr/lib/python3.9/distutils/ccompiler.py", line 910, in spawn
  File "/usr/lib/python3.9/distutils/spawn.py", line 81, in spawn
distutils.errors.DistutilsExecError: command
'/home/naourr/buildroot/testsuite/TestPythonPy3Crossbar-glibc/host/bin/arm-linux-gcc'
failed: No such file or directory

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/lib/python3.9/site-packages/cffi/ffiplatform.py", line 51, in _build
  File "/usr/lib/python3.9/distutils/dist.py", line 985, in run_command
  File "/usr/lib/python3.9/distutils/command/build_ext.py", line 343, in run
  File "/usr/lib/python3.9/distutils/command/build_ext.py", line 452, in
build_extensions
  File "/usr/lib/python3.9/distutils/command/build_ext.py", line 477, in
_build_extensions_serial
  File "/usr/lib/python3.9/distutils/command/build_ext.py", line 532, in
build_extension
  File "/usr/lib/python3.9/distutils/ccompiler.py", line 574, in compile
  File "/usr/lib/python3.9/distutils/unixccompiler.py", line 120, in _compile
distutils.errors.CompileError: command
'/home/naourr/buildroot/testsuite/TestPythonPy3Crossbar-glibc/host/bin/arm-linux-gcc'
failed: No such file or directory

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/root/sample_python_crossbar.py", line 5, in <module>
    crossbar.run(["version"])
  File "/usr/lib/python3.9/site-packages/crossbar/__init__.py", line 203, in run
  File "/usr/lib/python3.9/site-packages/crossbar/node/main.py", line 1291, in main
  File "/usr/lib/python3.9/site-packages/crossbar/node/main.py", line 469, in
_run_command_version
  File "/usr/lib/python3.9/site-packages/crossbar/node/main.py", line 425, in
_get_versions
  File "/usr/lib/python3.9/site-packages/lmdb/__init__.py", line 48, in <module>
  File "/usr/lib/python3.9/site-packages/lmdb/cffi.py", line 361, in <module>
  File "/usr/lib/python3.9/site-packages/cffi/api.py", line 468, in verify
  File "/usr/lib/python3.9/site-packages/cffi/verifier.py", line 104, in
load_library
  File "/usr/lib/python3.9/site-packages/cffi/verifier.py", line 201, in
_compile_module
  File "/usr/lib/python3.9/site-packages/cffi/ffiplatform.py", line 22, in compile
  File "/usr/lib/python3.9/site-packages/cffi/ffiplatform.py", line 58, in _build
cffi.VerificationError: CompileError: command
'/home/naourr/buildroot/testsuite/TestPythonPy3Crossbar-glibc/host/bin/arm-linux-gcc'
failed: No such file or directory

>        TestSysLinuxX86EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489848  | ORPH 
> TestSysLinuxX86LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489849  | ORPH 

Fixed by:
https://git.buildroot.net/buildroot/commit/?id=ddf40cffeab1552d350a07c26129c9e83239399c

Best regards,
Romain
