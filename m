From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:29 -0300
Subject: [Buildroot] [PATCH v2 00/12] default runtime test case for python
 packages v2
In-Reply-To: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
References: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
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

Patches 1 to 3 gradually prepare the current python test cases to receive the
new class TestPythonPackageBase.

Patch 4 adds the new class with common logic to copy the sample script and
execute it.

Patches 5 to 10 change one by one the 6 current test cases for python packages
to use the new class.
Since the sample scripts are now stored on separate files they are automatically
picked by the check-flake8 job on GitLab CI, so I formatted them to comply to
flake8 (only empty lines or adding "# noqa" for the script that only import the
module but don't use it).

Patch 11 use a new naming convention for test cases related to Python.

Patch 12 refreshes a test case that Yegor created for python-crossbar.

Here a complete run of runtime tests on Gitlab CI:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/35168102

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

Ricardo Martincoski (11):
  support/testing: use helper class in IPython test
  support/testing: use helper class in Python test
  support/testing: create intermediate class per Python version
  support/testing: create default test case for python packages
  support/testing: use TestPythonPackageBase for python-autobahn
  support/testing: use TestPythonPackageBase for python-cryptography
  support/testing: use TestPythonPackageBase for python-incremental
  support/testing: use TestPythonPackageBase for python-twisted
  support/testing: use TestPythonPackageBase for python-txaio
  support/testing: use TestPythonPackageBase for python-txtorcon
  support/testing: rename python* test cases

Yegor Yefremov (1):
  testing: add python-crossbar tests

 .gitlab-ci.yml                                | 29 +++----
 .../package/copy-sample-script-to-target.sh   |  7 ++
 .../tests/package/sample_python_autobahn.py   |  1 +
 .../package/sample_python_cryptography.py     |  3 +
 .../package/sample_python_incremental.py      |  3 +
 .../tests/package/sample_python_twisted.py    |  9 +++
 .../package/sample_python_txaio_asyncio.py    |  3 +
 .../package/sample_python_txaio_twisted.py    |  3 +
 .../tests/package/sample_python_txtorcon.py   |  1 +
 support/testing/tests/package/test_ipython.py | 25 +++----
 support/testing/tests/package/test_python.py  | 75 +++++++++++++++----
 .../tests/package/test_python_autobahn.py     | 31 ++------
 .../tests/package/test_python_crossbar.py     | 20 +++++
 .../tests/package/test_python_cryptography.py | 34 +++------
 .../tests/package/test_python_incremental.py  | 34 +++------
 .../tests/package/test_python_twisted.py      | 48 ++++--------
 .../tests/package/test_python_txaio.py        | 30 ++------
 .../tests/package/test_python_txtorcon.py     | 32 +++-----
 18 files changed, 189 insertions(+), 199 deletions(-)
 create mode 100755 support/testing/tests/package/copy-sample-script-to-target.sh
 create mode 100644 support/testing/tests/package/sample_python_autobahn.py
 create mode 100644 support/testing/tests/package/sample_python_cryptography.py
 create mode 100644 support/testing/tests/package/sample_python_incremental.py
 create mode 100644 support/testing/tests/package/sample_python_twisted.py
 create mode 100644 support/testing/tests/package/sample_python_txaio_asyncio.py
 create mode 100644 support/testing/tests/package/sample_python_txaio_twisted.py
 create mode 100644 support/testing/tests/package/sample_python_txtorcon.py
 create mode 100644 support/testing/tests/package/test_python_crossbar.py

-- 
2.17.1
