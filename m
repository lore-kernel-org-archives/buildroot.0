From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 15 Oct 2018 21:42:23 -0300
Subject: [Buildroot] [PATCH 0/7] default runtime test case for python
 packages
Message-ID: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
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

The first patch adds the common logic to copy the sample script and execute it.

Each one of the following patches changes one of the 6 current test cases for
python packages to use the common logic.
Since the sample scripts are now stored on separate files they are automatically
picked by the check-flake8 job on GitLab CI, so I formatted them to comply to
flake8 (only empty lines or adding "# noqa" for the script that only import the
module but don't use it).

Here a complete run on Gitlab CI:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/32931721

Regards,
Ricardo


Ricardo Martincoski (7):
  support/testing: create default test case for python packages
  support/testing: use default test_run for python-autobahn
  support/testing: use default test_run for python-cryptography
  support/testing: use default test_run for python-incremental
  support/testing: use default test_run for python-twisted
  support/testing: use default test_run for python-txaio
  support/testing: use default test_run for python-txtorcon

 .../package/copy-sample-script-to-target.sh   |  7 +++
 .../tests/package/sample_python_autobahn.py   |  1 +
 .../package/sample_python_cryptography.py     |  3 ++
 .../package/sample_python_incremental.py      |  3 ++
 .../tests/package/sample_python_twisted.py    |  9 ++++
 .../package/sample_python_txaio_asyncio.py    |  3 ++
 .../package/sample_python_txaio_twisted.py    |  3 ++
 .../tests/package/sample_python_txtorcon.py   |  1 +
 support/testing/tests/package/test_python.py  | 43 ++++++++++++++++++
 .../tests/package/test_python_autobahn.py     | 31 ++++---------
 .../tests/package/test_python_cryptography.py | 34 ++++----------
 .../tests/package/test_python_incremental.py  | 34 ++++----------
 .../tests/package/test_python_twisted.py      | 45 ++++++-------------
 .../tests/package/test_python_txaio.py        | 30 +++----------
 .../tests/package/test_python_txtorcon.py     | 32 ++++---------
 15 files changed, 129 insertions(+), 150 deletions(-)
 create mode 100755 support/testing/tests/package/copy-sample-script-to-target.sh
 create mode 100644 support/testing/tests/package/sample_python_autobahn.py
 create mode 100644 support/testing/tests/package/sample_python_cryptography.py
 create mode 100644 support/testing/tests/package/sample_python_incremental.py
 create mode 100644 support/testing/tests/package/sample_python_twisted.py
 create mode 100644 support/testing/tests/package/sample_python_txaio_asyncio.py
 create mode 100644 support/testing/tests/package/sample_python_txaio_twisted.py
 create mode 100644 support/testing/tests/package/sample_python_txtorcon.py

-- 
2.17.1
