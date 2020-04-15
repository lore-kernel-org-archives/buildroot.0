From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 15 Apr 2020 17:48:41 +0100
Subject: [Buildroot] [PATCH v2 0/5] download: Add SFTP support and tests
Message-ID: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Back in October 2019 I submitted a patch adding an SFTP download method
to Buildroot, however since there were no packages using SFTP the patch
was rejected.

Yann E. MORIN suggested that it was a valid change however it required
tests to avoid bitrot - since there was no way to verify the SFTP
download method did not break over time without any packages using it.

In this series I have re-added the SFTP download method and also some
test infrastructure which starts a local SSH server and uses SFTP to
download some test packages in a br2-external project. I've also added
tests for SCP! :D

For this, I had to update the Dockerfile from Debian Stretch to Buster
which I explain a bit further in the patch. I'm not sure how to test if
this breaks anything else. Will all the tests run in a clean container +
Buildroot project clone?

You can run the tests like so:

	support/testing/run-tests -o output -d dl \
		tests.download.test_ssh.TestSFTP \
		tests.download.test_ssh.TestSCP

Thanks!
Thomas

Thomas Preston (5):
  support/docker: Update to debian:buster-20200327
  support/docker: Add openssh-server
  testing/infra: Add docstrings to base test classes
  download: Add SFTP support (not FTPS)
  support/testing: Add download tests for SCP/SFTP

 .gitlab-ci.yml                                |   2 +
 Config.in                                     |   4 +
 package/pkg-download.mk                       |   1 +
 support/docker/Dockerfile                     |   3 +-
 support/docker/apt-sources.list               |   8 +-
 support/download/dl-wrapper                   |   2 +-
 support/download/sftp                         |  37 +++++
 support/testing/infra/basetest.py             |   2 +
 .../tests/download/br2-external/scp/Config.in |   0
 .../download/br2-external/scp/external.desc   |   1 +
 .../download/br2-external/scp/external.mk     |   4 +
 .../scp/package/scp-bad/scp-bad.hash          |   1 +
 .../scp/package/scp-bad/scp-bad.mk            |  17 +++
 .../scp/package/scp-good/scp-good.hash        |   1 +
 .../scp/package/scp-good/scp-good.mk          |  17 +++
 .../scp/package/scp-nohash/scp-nohash.mk      |  17 +++
 .../download/br2-external/sftp/Config.in      |   0
 .../download/br2-external/sftp/external.desc  |   1 +
 .../download/br2-external/sftp/external.mk    |   4 +
 .../sftp/package/sftp-bad/sftp-bad.hash       |   1 +
 .../sftp/package/sftp-bad/sftp-bad.mk         |  17 +++
 .../sftp/package/sftp-good/sftp-good.hash     |   1 +
 .../sftp/package/sftp-good/sftp-good.mk       |  17 +++
 .../sftp/package/sftp-nohash/sftp-nohash.mk   |  17 +++
 support/testing/tests/download/sshd.py        | 129 ++++++++++++++++++
 .../tests/download/sshd/ssh-test-1.0.tar.xz   | Bin 0 -> 232 bytes
 support/testing/tests/download/test_ssh.py    |  66 +++++++++
 27 files changed, 364 insertions(+), 6 deletions(-)
 create mode 100755 support/download/sftp
 create mode 100644 support/testing/tests/download/br2-external/scp/Config.in
 create mode 100644 support/testing/tests/download/br2-external/scp/external.desc
 create mode 100644 support/testing/tests/download/br2-external/scp/external.mk
 create mode 100644 support/testing/tests/download/br2-external/scp/package/scp-bad/scp-bad.hash
 create mode 100644 support/testing/tests/download/br2-external/scp/package/scp-bad/scp-bad.mk
 create mode 100644 support/testing/tests/download/br2-external/scp/package/scp-good/scp-good.hash
 create mode 100644 support/testing/tests/download/br2-external/scp/package/scp-good/scp-good.mk
 create mode 100644 support/testing/tests/download/br2-external/scp/package/scp-nohash/scp-nohash.mk
 create mode 100644 support/testing/tests/download/br2-external/sftp/Config.in
 create mode 100644 support/testing/tests/download/br2-external/sftp/external.desc
 create mode 100644 support/testing/tests/download/br2-external/sftp/external.mk
 create mode 100644 support/testing/tests/download/br2-external/sftp/package/sftp-bad/sftp-bad.hash
 create mode 100644 support/testing/tests/download/br2-external/sftp/package/sftp-bad/sftp-bad.mk
 create mode 100644 support/testing/tests/download/br2-external/sftp/package/sftp-good/sftp-good.hash
 create mode 100644 support/testing/tests/download/br2-external/sftp/package/sftp-good/sftp-good.mk
 create mode 100644 support/testing/tests/download/br2-external/sftp/package/sftp-nohash/sftp-nohash.mk
 create mode 100644 support/testing/tests/download/sshd.py
 create mode 100644 support/testing/tests/download/sshd/ssh-test-1.0.tar.xz
 create mode 100755 support/testing/tests/download/test_ssh.py

-- 
2.20.1
