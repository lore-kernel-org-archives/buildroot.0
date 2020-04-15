From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 15 Apr 2020 17:48:46 +0100
Subject: [Buildroot] [PATCH v2 5/5] support/testing: Add download tests for
 SCP/SFTP
In-Reply-To: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
References: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
Message-ID: <20200415164846.122126-6-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add download test infrastructure which starts an OpenSSH server using
the sshd binary installed on the Buildroot host. This server can then be
used to test the expected usage of the SCP and SFTP download methods.
The test creates new SSH keys for the server and client, so that the
server can be run as a non-root user.

A new test module has been added called `tests.download.sshd` which
contains helper methods to create the SSH keys and a class called
`OpenSSHDaemon` which handles the sshd server component.

The tests download example packages in the br2-external project `ssh`.
They check the following conditions for both SCP and SFTP download
methods:
- Correct hash.
- Incorrect hash.
- No hash file.

The SSH download test infrastructure is based on test_git.py.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 .gitlab-ci.yml                                |   2 +
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
 20 files changed, 313 insertions(+)
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

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4b84a5b709..8061b50526 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -349,6 +349,8 @@ tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone: { extends: .runtime
 tests.core.test_timezone.TestNoTimezone: { extends: .runtime_test }
 tests.download.test_git.TestGitHash: { extends: .runtime_test }
 tests.download.test_git.TestGitRefs: { extends: .runtime_test }
+tests.download.test_ssh.TestSCP: { extends: .runtime_test }
+tests.download.test_ssh.TestSFTP: { extends: .runtime_test }
 tests.fs.test_ext.TestExt2: { extends: .runtime_test }
 tests.fs.test_ext.TestExt2r1: { extends: .runtime_test }
 tests.fs.test_ext.TestExt3: { extends: .runtime_test }
diff --git a/support/testing/tests/download/br2-external/scp/Config.in b/support/testing/tests/download/br2-external/scp/Config.in
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/download/br2-external/scp/external.desc b/support/testing/tests/download/br2-external/scp/external.desc
new file mode 100644
index 0000000000..0ca0389a32
--- /dev/null
+++ b/support/testing/tests/download/br2-external/scp/external.desc
@@ -0,0 +1 @@
+name: SCP
diff --git a/support/testing/tests/download/br2-external/scp/external.mk b/support/testing/tests/download/br2-external/scp/external.mk
new file mode 100644
index 0000000000..49408f2f22
--- /dev/null
+++ b/support/testing/tests/download/br2-external/scp/external.mk
@@ -0,0 +1,4 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_SCP_PATH)/package/*/*.mk))
+
+# Get the openssh-server port number from the test infra
+SSHD_PORT_NUMBER ?= 2222
diff --git a/support/testing/tests/download/br2-external/scp/package/scp-bad/scp-bad.hash b/support/testing/tests/download/br2-external/scp/package/scp-bad/scp-bad.hash
new file mode 100644
index 0000000000..90b15b30c2
--- /dev/null
+++ b/support/testing/tests/download/br2-external/scp/package/scp-bad/scp-bad.hash
@@ -0,0 +1 @@
+sha256  0000000000000000000000000000000000000000000000000000000000000000  ssh-test-1.0.tar.xz
diff --git a/support/testing/tests/download/br2-external/scp/package/scp-bad/scp-bad.mk b/support/testing/tests/download/br2-external/scp/package/scp-bad/scp-bad.mk
new file mode 100644
index 0000000000..5f6d55d940
--- /dev/null
+++ b/support/testing/tests/download/br2-external/scp/package/scp-bad/scp-bad.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# scp-bad
+#
+################################################################################
+
+SCP_BAD_VERSION = 1.0
+SCP_BAD_SOURCE = ssh-test-$(SCP_BAD_VERSION).tar.xz
+SCP_BAD_SITE = scp://localhost:$(SSHD_TEST_DIR)
+SCP_BAD_DL_OPTS = \
+	-P $(SSHD_PORT_NUMBER) \
+	-i $(SSH_IDENTITY) \
+	-o "UserKnownHostsFile=/dev/null" \
+	-o "StrictHostKeyChecking=no" \
+	-o "CheckHostIP=no"
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/scp/package/scp-good/scp-good.hash b/support/testing/tests/download/br2-external/scp/package/scp-good/scp-good.hash
new file mode 100644
index 0000000000..31353a88ba
--- /dev/null
+++ b/support/testing/tests/download/br2-external/scp/package/scp-good/scp-good.hash
@@ -0,0 +1 @@
+sha256  b457c1a37ba7405e8806b93f3d5cc82165db0b0cad25d203f112e32c7a30c0be  ssh-test-1.0.tar.xz
diff --git a/support/testing/tests/download/br2-external/scp/package/scp-good/scp-good.mk b/support/testing/tests/download/br2-external/scp/package/scp-good/scp-good.mk
new file mode 100644
index 0000000000..eff455a470
--- /dev/null
+++ b/support/testing/tests/download/br2-external/scp/package/scp-good/scp-good.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# scp-good
+#
+################################################################################
+
+SCP_GOOD_VERSION = 1.0
+SCP_GOOD_SOURCE = ssh-test-$(SCP_GOOD_VERSION).tar.xz
+SCP_GOOD_SITE = scp://localhost:$(SSHD_TEST_DIR)
+SCP_GOOD_DL_OPTS = \
+	-P $(SSHD_PORT_NUMBER) \
+	-i $(SSH_IDENTITY) \
+	-o "UserKnownHostsFile=/dev/null" \
+	-o "StrictHostKeyChecking=no" \
+	-o "CheckHostIP=no" \
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/scp/package/scp-nohash/scp-nohash.mk b/support/testing/tests/download/br2-external/scp/package/scp-nohash/scp-nohash.mk
new file mode 100644
index 0000000000..f44c45fda3
--- /dev/null
+++ b/support/testing/tests/download/br2-external/scp/package/scp-nohash/scp-nohash.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# scp-nohash
+#
+################################################################################
+
+SCP_NOHASH_VERSION = 1.0
+SCP_NOHASH_SOURCE = ssh-test-$(SCP_NOHASH_VERSION).tar.xz
+SCP_NOHASH_SITE = scp://localhost:$(SSHD_TEST_DIR)
+SCP_NOHASH_DL_OPTS = \
+	-P $(SSHD_PORT_NUMBER) \
+	-i $(SSH_IDENTITY) \
+	-o "UserKnownHostsFile=/dev/null" \
+	-o "StrictHostKeyChecking=no" \
+	-o "CheckHostIP=no" \
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/sftp/Config.in b/support/testing/tests/download/br2-external/sftp/Config.in
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/download/br2-external/sftp/external.desc b/support/testing/tests/download/br2-external/sftp/external.desc
new file mode 100644
index 0000000000..ae3a2860cd
--- /dev/null
+++ b/support/testing/tests/download/br2-external/sftp/external.desc
@@ -0,0 +1 @@
+name: SFTP
diff --git a/support/testing/tests/download/br2-external/sftp/external.mk b/support/testing/tests/download/br2-external/sftp/external.mk
new file mode 100644
index 0000000000..cd4a7c839e
--- /dev/null
+++ b/support/testing/tests/download/br2-external/sftp/external.mk
@@ -0,0 +1,4 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_SFTP_PATH)/package/*/*.mk))
+
+# Get the openssh-server port number from the test infra
+SSHD_PORT_NUMBER ?= 2222
diff --git a/support/testing/tests/download/br2-external/sftp/package/sftp-bad/sftp-bad.hash b/support/testing/tests/download/br2-external/sftp/package/sftp-bad/sftp-bad.hash
new file mode 100644
index 0000000000..90b15b30c2
--- /dev/null
+++ b/support/testing/tests/download/br2-external/sftp/package/sftp-bad/sftp-bad.hash
@@ -0,0 +1 @@
+sha256  0000000000000000000000000000000000000000000000000000000000000000  ssh-test-1.0.tar.xz
diff --git a/support/testing/tests/download/br2-external/sftp/package/sftp-bad/sftp-bad.mk b/support/testing/tests/download/br2-external/sftp/package/sftp-bad/sftp-bad.mk
new file mode 100644
index 0000000000..fa83c2cd68
--- /dev/null
+++ b/support/testing/tests/download/br2-external/sftp/package/sftp-bad/sftp-bad.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# sftp-bad
+#
+################################################################################
+
+SFTP_BAD_VERSION = 1.0
+SFTP_BAD_SOURCE = ssh-test-$(SFTP_BAD_VERSION).tar.xz
+SFTP_BAD_SITE = sftp://localhost/$(SSHD_TEST_DIR)
+SFTP_BAD_DL_OPTS = \
+	-P $(SSHD_PORT_NUMBER) \
+	-i $(SSH_IDENTITY) \
+	-o "UserKnownHostsFile=/dev/null" \
+	-o "StrictHostKeyChecking=no" \
+	-o "CheckHostIP=no" \
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/sftp/package/sftp-good/sftp-good.hash b/support/testing/tests/download/br2-external/sftp/package/sftp-good/sftp-good.hash
new file mode 100644
index 0000000000..31353a88ba
--- /dev/null
+++ b/support/testing/tests/download/br2-external/sftp/package/sftp-good/sftp-good.hash
@@ -0,0 +1 @@
+sha256  b457c1a37ba7405e8806b93f3d5cc82165db0b0cad25d203f112e32c7a30c0be  ssh-test-1.0.tar.xz
diff --git a/support/testing/tests/download/br2-external/sftp/package/sftp-good/sftp-good.mk b/support/testing/tests/download/br2-external/sftp/package/sftp-good/sftp-good.mk
new file mode 100644
index 0000000000..1cb5f22dbc
--- /dev/null
+++ b/support/testing/tests/download/br2-external/sftp/package/sftp-good/sftp-good.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# sftp-good
+#
+################################################################################
+
+SFTP_GOOD_VERSION = 1.0
+SFTP_GOOD_SOURCE = ssh-test-$(SFTP_GOOD_VERSION).tar.xz
+SFTP_GOOD_SITE = sftp://localhost/$(SSHD_TEST_DIR)
+SFTP_GOOD_DL_OPTS = \
+	-P $(SSHD_PORT_NUMBER) \
+	-i $(SSH_IDENTITY) \
+	-o "UserKnownHostsFile=/dev/null" \
+	-o "StrictHostKeyChecking=no" \
+	-o "CheckHostIP=no" \
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/sftp/package/sftp-nohash/sftp-nohash.mk b/support/testing/tests/download/br2-external/sftp/package/sftp-nohash/sftp-nohash.mk
new file mode 100644
index 0000000000..62a2c3d864
--- /dev/null
+++ b/support/testing/tests/download/br2-external/sftp/package/sftp-nohash/sftp-nohash.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# sftp-nohash
+#
+################################################################################
+
+SFTP_NOHASH_VERSION = 1.0
+SFTP_NOHASH_SOURCE = ssh-test-$(SFTP_NOHASH_VERSION).tar.xz
+SFTP_NOHASH_SITE = sftp://localhost/$(SSHD_TEST_DIR)
+SFTP_NOHASH_DL_OPTS = \
+	-P $(SSHD_PORT_NUMBER) \
+	-i $(SSH_IDENTITY) \
+	-o "UserKnownHostsFile=/dev/null" \
+	-o "StrictHostKeyChecking=no" \
+	-o "CheckHostIP=no" \
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/sshd.py b/support/testing/tests/download/sshd.py
new file mode 100644
index 0000000000..ba5c2e053f
--- /dev/null
+++ b/support/testing/tests/download/sshd.py
@@ -0,0 +1,129 @@
+import os
+import shutil
+import subprocess
+
+# subprocess does not kill the child daemon when a test case fails by raising
+# an exception. So use pexpect instead.
+import pexpect
+
+import infra
+
+
+SSHD_PORT_INITIAL = 2222
+SSHD_PORT_LAST = SSHD_PORT_INITIAL + 99
+SSHD_PATH = "/usr/sbin/sshd"
+SSHD_HOST_DIR = "host"
+
+# SSHD_KEY_DIR is where the /etc/ss/ssh_host_*_key files go
+SSHD_KEY_DIR = os.path.join(SSHD_HOST_DIR, "etc/ssh")
+SSHD_KEY = os.path.join(SSHD_KEY_DIR, "ssh_host_ed25519_key")
+
+# SSH_CLIENT_KEY_DIR is where the client id_rsa key and authorized_keys files go
+SSH_CLIENT_KEY_DIR = os.path.join(SSHD_HOST_DIR, "home/br-user/ssh")
+SSH_CLIENT_KEY = os.path.join(SSH_CLIENT_KEY_DIR, "id_rsa")
+SSH_AUTH_KEYS_FILE = os.path.join(SSH_CLIENT_KEY_DIR, "authorized_keys")
+
+
+class OpenSSHDaemon():
+
+    def __init__(self, builddir, logtofile):
+        """
+        Start an OpenSSH SSH Daemon
+
+        In order to support test cases in parallel, select the port the
+        server will listen to in runtime. Since there is no reliable way
+        to allocate the port prior to starting the server (another
+        process in the host machine can use the port between it is
+        selected from a list and it is really allocated to the server)
+        try to start the server in a port and in the case it is already
+        in use, try the next one in the allowed range.
+        """
+        self.daemon = None
+        self.port = None
+
+        self.logfile = infra.open_log_file(builddir, "sshd", logtofile)
+
+        server_keyfile = os.path.join(builddir, SSHD_KEY)
+        auth_keys_file = os.path.join(builddir, SSH_AUTH_KEYS_FILE)
+        daemon_cmd = [SSHD_PATH,
+                      "-D", # or use -ddd to debug
+                      "-e",
+                      "-h", server_keyfile,
+                      "-o", "AuthorizedKeysFile={}".format(auth_keys_file)]
+        for port in range(SSHD_PORT_INITIAL, SSHD_PORT_LAST + 1):
+            cmd = daemon_cmd + ["-p", "{}".format(port)]
+            self.logfile.write(
+                "> starting sshd with '{}'\n".format(" ".join(cmd)))
+            self.daemon = pexpect.spawn(cmd[0], cmd[1:], logfile=self.logfile,
+                                        encoding='utf-8')
+            ret = self.daemon.expect([
+                # Success
+                "Server listening on :: port {}.".format(port),
+                # Failure
+                "Cannot bind any address."])
+            if ret == 0:
+                self.port = port
+                return
+        raise SystemError("Could not find a free port to run sshd")
+
+    def stop(self):
+        if self.daemon is None:
+            return
+        self.daemon.terminate(force=True)
+
+
+def generate_keys_server(builddir, logfile):
+    """Generate keys required to run an OpenSSH Daemon."""
+    keyfile = os.path.join(builddir, SSHD_KEY)
+    if os.path.exists(keyfile):
+        logfile.write("> SSH server key already exists '{}'".format(keyfile))
+        return
+
+    hostdir = os.path.join(builddir, SSHD_HOST_DIR)
+    keydir = os.path.join(builddir, SSHD_KEY_DIR)
+    infra.run_cmd_on_host(builddir, ["mkdir", "-p", hostdir, keydir])
+
+    cmd = ["ssh-keygen", "-A", "-f", hostdir]
+    logfile.write(
+        "> generating SSH server keys with '{}'\n".format(" ".join(cmd)))
+    # When ssh-keygen fails to create an SSH server key it doesn't return a
+    # useful error code. So use subprocess.getoutput to check for an error
+    # message instead.
+    out = subprocess.getoutput(" ".join(cmd))
+    logfile.write(out)
+    if "Could not save your public key" in out:
+        raise SystemError("Could not generate SSH server keys")
+
+
+def generate_keys_client(builddir, logfile):
+    """Generate keys required to log into an OpenSSH Daemon via SCP or SFTP."""
+    keyfile = os.path.join(builddir, SSH_CLIENT_KEY)
+    if os.path.exists(keyfile):
+        logfile.write("> SSH client key already exists '{}'".format(keyfile))
+        return
+
+    keydir = os.path.join(builddir, SSH_CLIENT_KEY_DIR)
+    infra.run_cmd_on_host(builddir, ["mkdir", "-p", keydir])
+
+    cmd = ["ssh-keygen",
+           "-f", keyfile,
+           "-b", "2048",
+           "-t", "rsa",
+           "-N", "",
+           "-q"]
+    logfile.write(
+        "> generating SSH client keys with '{}'\n".format(" ".join(cmd)))
+    ret = subprocess.call(cmd, stdout=logfile, stderr=logfile)
+    if ret > 0:
+        raise SystemError("Could not generate SSH client keys")
+
+    # Allow key-based login for this user (so that we can fetch from localhost)
+    pubkeyfile = os.path.join(keydir, "{}.pub".format(keyfile))
+    authfile = os.path.join(keydir, "authorized_keys")
+    shutil.copy(pubkeyfile, authfile)
+
+
+def generate_keys(builddir, logtofile):
+    logfile = infra.open_log_file(builddir, "ssh-keygen", logtofile)
+    generate_keys_server(builddir, logfile)
+    generate_keys_client(builddir, logfile)
diff --git a/support/testing/tests/download/sshd/ssh-test-1.0.tar.xz b/support/testing/tests/download/sshd/ssh-test-1.0.tar.xz
new file mode 100644
index 0000000000000000000000000000000000000000..bd83d0aff57569181d48e3c62ed24cf413349857
GIT binary patch
literal 232
zcmV<E02lxLH+ooF000E$*0e?f03iVu0001VFXf})C;tGaT>v at ZoLY1;=#rcYU!vo{
zY*d180V}vZPgp1s8F;=V2;UVkreiQmd@~S!C7Cz<muCq&y&rU=#0Mnb>Go}p<~MWy
zLlsZz<ezJHLQ+Zz;FM>Od$tuKG<#wIxTdaXt!(>CWqO6(9;!ET?+(Xp1W5kWc%A<b
zSztIv+|VVwQHZ*%f;jPjmxo8t{;$zGJ!I)lpxo`&x%+_rzrkKwYNz5s%Y8pC0001w
i;7sIpNoptn0mA`+Pyhh at 39RU`#Ao{g000001X)^l_h(@M

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/test_ssh.py b/support/testing/tests/download/test_ssh.py
new file mode 100755
index 0000000000..4fc4fd552a
--- /dev/null
+++ b/support/testing/tests/download/test_ssh.py
@@ -0,0 +1,66 @@
+import os
+import shutil
+
+import tests.download.sshd
+
+import infra
+
+
+class SSHTestBase(infra.basetest.BRConfigTest):
+    config = infra.basetest.MINIMAL_CONFIG
+    sshd_test_dir = infra.filepath("tests/download/sshd")
+    sshd = None
+
+    def setUp(self):
+        super(SSHTestBase, self).setUp()
+
+        self.show_msg("Generating keys")
+        tests.download.sshd.generate_keys(self.builddir, self.logtofile)
+
+        self.show_msg("Starting sshd")
+        self.sshd = tests.download.sshd.OpenSSHDaemon(self.builddir,
+                                                      self.logtofile)
+
+    def tearDown(self):
+        self.show_msg("Stopping sshd")
+        if self.sshd:
+            self.sshd.stop()
+        super(SSHTestBase, self).tearDown()
+
+    def download_package(self, package):
+        self.show_msg("Downloading {}".format(package))
+        # store downloaded tarball inside the output dir so the test infra
+        # cleans it up@the end
+        dl_dir = os.path.join(self.builddir, "dl")
+        ssh_identity = os.path.join(self.builddir,
+                                    tests.download.sshd.SSH_CLIENT_KEY)
+        # enforce that we test the download
+        if os.path.exists(dl_dir):
+            shutil.rmtree(dl_dir)
+        env = {"BR2_DL_DIR": dl_dir,
+               "SSHD_PORT_NUMBER": str(self.sshd.port),
+               "SSHD_TEST_DIR": self.sshd_test_dir,
+               "SSH_IDENTITY": ssh_identity}
+        self.b.build(["{}-dirclean".format(package),
+                      "{}-source".format(package)],
+                     env)
+
+
+class TestSCP(SSHTestBase):
+    br2_external = [infra.filepath("tests/download/br2-external/scp")]
+
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.download_package("scp-bad")
+        self.download_package("scp-good")
+        self.download_package("scp-nohash")
+
+
+class TestSFTP(SSHTestBase):
+    br2_external = [infra.filepath("tests/download/br2-external/sftp")]
+
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.download_package("sftp-bad")
+        self.download_package("sftp-good")
+        self.download_package("sftp-nohash")
-- 
2.20.1
