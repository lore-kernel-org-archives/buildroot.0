From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 10 Nov 2018 00:16:01 -0200
Subject: [Buildroot] [PATCH v3 0/8] default runtime test case for python
 packages
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181110021609.14684-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series creates a standard runtime test case for python packages and is
based on ideas from Thomas and Arnout.

The sample scripts that run on the target (fixture for the test case) are stored
in a separate file (so it becomes more readable than inline in the test case).
For the time being, they are stored on support/testing.
Those sample scripts are copied by the default test case to the target image in
build time. The test infra builds the image, and the default test case logs in
the target, checks the script is in the rootfs and calls the Python interpreter
passing the sample script.

Patch 1 adds the new class with common logic to copy the sample script and
execute it.

Patches 2 to 7 change one by one the 6 current test cases for python packages
to use the new class.
Since the sample scripts are now stored on separate files they are automatically
picked by the check-flake8 job on GitLab CI, so I formatted them to comply to
flake8 (only empty lines or adding "# noqa" for the script that only imports the
module but don't use it).

Patch 8 refreshes a test case that Yegor created for python-crossbar.

All python test cases on Gitlab CI:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/36090843

Changes v2 -> v3:
  - back to v1 but without any tricks and using a separate class;
  - fix typo when using super() TestPythonBase -> TestPythonPackageBase,
    in v2 it ended up calling the same method, but it is wrong;
  - don't use a hack, use __test__ = False from nose2 to declare a class
    that looks like a test case but is not a test case, as consequence
    all classes that inherits from it and are test cases must set
    __test__ = True;
  - add docstring;
  - refresh patches changing each test case;
  - in the python-twisted test, get the config from immediate parent class;
  - in the python-crossbar test, move test script to a separate file;

Changes v1 -> v2:
  - do not reuse TestPython2 and TestPython3 for two entirely separate things:
    (Thomas)
    - As a base class for testing individual Python packages;
    - As test cases for the Python interpreter itself;
  - use a better class hierarchy (Thomas). I did this in various patches (1, 2,
    3, 4, 11) trying to make the review easier.
  - with the new class hierarchy the trick that allows the defconfig to be
    changed by each test case without explicitly naming the class that contains
    the base defconfig is moved from every test case to the new base class;
  - new patch to the series, resending a patch from Yegor;

Regards,
Ricardo

Ricardo Martincoski (7):
  support/testing: create default test case for python packages
  support/testing: use TestPythonPackageBase for python-autobahn
  support/testing: use TestPythonPackageBase for python-cryptography
  support/testing: use TestPythonPackageBase for python-incremental
  support/testing: use TestPythonPackageBase for python-twisted
  support/testing: use TestPythonPackageBase for python-txaio
  support/testing: use TestPythonPackageBase for python-txtorcon

Yegor Yefremov (1):
  testing: add python-crossbar tests

 .gitlab-ci.yml                                |  1 +
 .../package/copy-sample-script-to-target.sh   |  7 +++
 .../tests/package/sample_python_autobahn.py   |  1 +
 .../tests/package/sample_python_crossbar.py   |  3 +
 .../package/sample_python_cryptography.py     |  3 +
 .../package/sample_python_incremental.py      |  3 +
 .../tests/package/sample_python_twisted.py    |  9 +++
 .../package/sample_python_txaio_asyncio.py    |  3 +
 .../package/sample_python_txaio_twisted.py    |  3 +
 .../tests/package/sample_python_txtorcon.py   |  1 +
 support/testing/tests/package/test_python.py  | 56 +++++++++++++++++++
 .../tests/package/test_python_autobahn.py     | 29 +++-------
 .../tests/package/test_python_crossbar.py     | 14 +++++
 .../tests/package/test_python_cryptography.py | 33 ++++-------
 .../tests/package/test_python_incremental.py  | 33 ++++-------
 .../tests/package/test_python_twisted.py      | 35 ++++--------
 .../tests/package/test_python_txaio.py        | 30 +++-------
 .../tests/package/test_python_txtorcon.py     | 31 ++++------
 18 files changed, 165 insertions(+), 130 deletions(-)
 create mode 100755 support/testing/tests/package/copy-sample-script-to-target.sh
 create mode 100644 support/testing/tests/package/sample_python_autobahn.py
 create mode 100644 support/testing/tests/package/sample_python_crossbar.py
 create mode 100644 support/testing/tests/package/sample_python_cryptography.py
 create mode 100644 support/testing/tests/package/sample_python_incremental.py
 create mode 100644 support/testing/tests/package/sample_python_twisted.py
 create mode 100644 support/testing/tests/package/sample_python_txaio_asyncio.py
 create mode 100644 support/testing/tests/package/sample_python_txaio_twisted.py
 create mode 100644 support/testing/tests/package/sample_python_txtorcon.py
 create mode 100644 support/testing/tests/package/test_python_crossbar.py

-- 
2.17.1
