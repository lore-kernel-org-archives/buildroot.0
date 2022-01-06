Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB2EC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 08:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F77C6FB76;
	Thu,  6 Jan 2022 08:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZvZxvi_DkrwY; Thu,  6 Jan 2022 08:39:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F9886FBA2;
	Thu,  6 Jan 2022 08:39:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 520491BF422
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E9F5428B4
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqTmeSeU6vse for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 08:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A88E428B6
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 08:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DAEA583342; Thu,  6 Jan 2022 08:32:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 09:34:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16f660f8ceaa2a6aa0c256a77f08149b449e5a3b
X-Git-Newrev: fd548e16fbfbe0ceb6fbc7b8d1276e3ef1f292f7
X-Patchwork-Hint: ignore
Message-Id: <20220106083242.DAEA583342@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: Add download tests for
 SCP/SFTP
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fd548e16fbfbe0ceb6fbc7b8d1276e3ef1f292f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[Arnout:
 - remove spurious end-of-line backslash;
 - remove unnecessary executable bit;
 - skip test instead of failing if sshd, ssh-keygen, scp or sftp are not
   found;
 - decode the output of subprocess;
 - use subprocess.check_output instead of subprocess.get_output;
 - use subprocess.check_call instead of manually checking return code;
 - don't set always-overridden SSHD_PORT_NUMBER in .mk file;
 - explicitly set sshd options on commandline instead of relying on host
   /etc/sshd/sshd_config;
 - let sshd listen only on localhost;
 - user internal sftp server;
 - disable BACKUP_SITE, no network is supposed to be accessed;
 - remove the -bad and -nohash versions;
 - rename {sftp,scp}-good to plain {sftp,scp};
 - move the sftp and scp packages into a single "ssh" external.
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../tests/download/br2-external/ssh/Config.in      |   0
 .../tests/download/br2-external/ssh/external.desc  |   1 +
 .../tests/download/br2-external/ssh/external.mk    |   1 +
 .../download/br2-external/ssh/package/scp/scp.hash |   1 +
 .../download/br2-external/ssh/package/scp/scp.mk   |  17 +++
 .../br2-external/ssh/package/sftp/sftp.hash        |   1 +
 .../download/br2-external/ssh/package/sftp/sftp.mk |  17 +++
 support/testing/tests/download/sshd.py             | 149 +++++++++++++++++++++
 .../tests/download/sshd/ssh-test-1.0.tar.xz        | Bin 0 -> 232 bytes
 support/testing/tests/download/test_ssh.py         |  62 +++++++++
 10 files changed, 249 insertions(+)

diff --git a/support/testing/tests/download/br2-external/ssh/Config.in b/support/testing/tests/download/br2-external/ssh/Config.in
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/download/br2-external/ssh/external.desc b/support/testing/tests/download/br2-external/ssh/external.desc
new file mode 100644
index 0000000000..2fe078edce
--- /dev/null
+++ b/support/testing/tests/download/br2-external/ssh/external.desc
@@ -0,0 +1 @@
+name: SSH
diff --git a/support/testing/tests/download/br2-external/ssh/external.mk b/support/testing/tests/download/br2-external/ssh/external.mk
new file mode 100644
index 0000000000..c8f0dc748e
--- /dev/null
+++ b/support/testing/tests/download/br2-external/ssh/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_SSH_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/download/br2-external/ssh/package/scp/scp.hash b/support/testing/tests/download/br2-external/ssh/package/scp/scp.hash
new file mode 100644
index 0000000000..31353a88ba
--- /dev/null
+++ b/support/testing/tests/download/br2-external/ssh/package/scp/scp.hash
@@ -0,0 +1 @@
+sha256  b457c1a37ba7405e8806b93f3d5cc82165db0b0cad25d203f112e32c7a30c0be  ssh-test-1.0.tar.xz
diff --git a/support/testing/tests/download/br2-external/ssh/package/scp/scp.mk b/support/testing/tests/download/br2-external/ssh/package/scp/scp.mk
new file mode 100644
index 0000000000..3451aaf086
--- /dev/null
+++ b/support/testing/tests/download/br2-external/ssh/package/scp/scp.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# scp
+#
+################################################################################
+
+SCP_VERSION = 1.0
+SCP_SOURCE = ssh-test-$(SCP_VERSION).tar.xz
+SCP_SITE = scp://localhost:$(SSHD_TEST_DIR)
+SCP_DL_OPTS = \
+	-P $(SSHD_PORT_NUMBER) \
+	-i $(SSH_IDENTITY) \
+	-o "UserKnownHostsFile=/dev/null" \
+	-o "StrictHostKeyChecking=no" \
+	-o "CheckHostIP=no"
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/ssh/package/sftp/sftp.hash b/support/testing/tests/download/br2-external/ssh/package/sftp/sftp.hash
new file mode 100644
index 0000000000..31353a88ba
--- /dev/null
+++ b/support/testing/tests/download/br2-external/ssh/package/sftp/sftp.hash
@@ -0,0 +1 @@
+sha256  b457c1a37ba7405e8806b93f3d5cc82165db0b0cad25d203f112e32c7a30c0be  ssh-test-1.0.tar.xz
diff --git a/support/testing/tests/download/br2-external/ssh/package/sftp/sftp.mk b/support/testing/tests/download/br2-external/ssh/package/sftp/sftp.mk
new file mode 100644
index 0000000000..58d91f6a0d
--- /dev/null
+++ b/support/testing/tests/download/br2-external/ssh/package/sftp/sftp.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# sftp
+#
+################################################################################
+
+SFTP_VERSION = 1.0
+SFTP_SOURCE = ssh-test-$(SFTP_VERSION).tar.xz
+SFTP_SITE = sftp://localhost/$(SSHD_TEST_DIR)
+SFTP_DL_OPTS = \
+	-P $(SSHD_PORT_NUMBER) \
+	-i $(SSH_IDENTITY) \
+	-o "UserKnownHostsFile=/dev/null" \
+	-o "StrictHostKeyChecking=no" \
+	-o "CheckHostIP=no"
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/sshd.py b/support/testing/tests/download/sshd.py
new file mode 100644
index 0000000000..3345f768cc
--- /dev/null
+++ b/support/testing/tests/download/sshd.py
@@ -0,0 +1,149 @@
+import os
+import shutil
+import subprocess
+from unittest import SkipTest
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
+# SSHD_KEY_DIR is where the /etc/ssh/ssh_host_*_key files go
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
+                      "-f", "/dev/null",
+                      "-o", "ListenAddress=localhost",
+                      "-o", "PidFile=none",
+                      "-o", "AuthenticationMethods=publickey",
+                      "-o", "StrictModes=no",
+                      "-o", "Subsystem=sftp internal-sftp",
+                      "-o", "AuthorizedKeysFile={}".format(auth_keys_file)]
+        for port in range(SSHD_PORT_INITIAL, SSHD_PORT_LAST + 1):
+            cmd = daemon_cmd + ["-p", "{}".format(port)]
+            self.logfile.write(
+                "> starting sshd with '{}'\n".format(" ".join(cmd)))
+            try:
+                self.daemon = pexpect.spawn(cmd[0], cmd[1:], logfile=self.logfile,
+                                            encoding='utf-8')
+            except pexpect.exceptions.ExceptionPexpect as e:
+                self.logfile.write("> {} - skipping\n".format(e))
+                raise SkipTest(str(e))
+
+            ret = self.daemon.expect([
+                # Success
+                "Server listening on .* port {}.".format(port),
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
+    os.makedirs(hostdir, exist_ok=True)
+    os.makedirs(keydir, exist_ok=True)
+
+    cmd = ["ssh-keygen", "-A", "-f", hostdir]
+    logfile.write(
+        "> generating SSH server keys with '{}'\n".format(" ".join(cmd)))
+    # When ssh-keygen fails to create an SSH server key it doesn't return a
+    # useful error code. So use check for an error message in the output
+    # instead.
+    try:
+        out = subprocess.check_output(cmd, encoding='utf-8')
+    except FileNotFoundError:
+        logfile.write("> ssh-keygen not found - skipping\n")
+        raise SkipTest("ssh-keygen not found")
+
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
+    os.makedirs(keydir, exist_ok=True)
+
+    cmd = ["ssh-keygen",
+           "-f", keyfile,
+           "-b", "2048",
+           "-t", "rsa",
+           "-N", "",
+           "-q"]
+    logfile.write(
+        "> generating SSH client keys with '{}'\n".format(" ".join(cmd)))
+    try:
+        subprocess.check_call(cmd, stdout=logfile, stderr=logfile)
+    except FileNotFoundError:
+        logfile.write("> ssh-keygen not found - skipping\n")
+        raise SkipTest("ssh-keygen not found")
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
index 0000000000..bd83d0aff5
Binary files /dev/null and b/support/testing/tests/download/sshd/ssh-test-1.0.tar.xz differ
diff --git a/support/testing/tests/download/test_ssh.py b/support/testing/tests/download/test_ssh.py
new file mode 100644
index 0000000000..126002a355
--- /dev/null
+++ b/support/testing/tests/download/test_ssh.py
@@ -0,0 +1,62 @@
+import os
+import shutil
+
+import tests.download.sshd
+
+import infra
+
+
+class SSHTestBase(infra.basetest.BRConfigTest):
+    config = infra.basetest.MINIMAL_CONFIG + '''
+BR2_BACKUP_SITE=""
+'''
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
+        # cleans it up at the end
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
+    br2_external = [infra.filepath("tests/download/br2-external/ssh")]
+
+    def test_run(self):
+        self.download_package("scp")
+
+
+class TestSFTP(SSHTestBase):
+    br2_external = [infra.filepath("tests/download/br2-external/ssh")]
+
+    def test_run(self):
+        self.download_package("sftp")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
