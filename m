From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 23 Mar 2017 00:02:30 -0300
Subject: [Buildroot] [PATCH v3 1/5] support/testing: core testing
	infrastructure
References: <1490042214-6762-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <58d33ac6e1494_71523fd706b87604408fc@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

There are still 2 things that I think can be solved together.

On Mon, Mar 20, 2017 at 05:36 PM, Thomas Petazzoni wrote:

[snip]
> +++ b/support/testing/conf/unittest.cfg
> @@ -0,0 +1,6 @@
> +[unittest]
> +plugins = nose2.plugins.mp
> +
> +[multiprocess]
> +processes = 1

1) If I increase the value of processes in unittest.cfg to unleash the power of
nose2, emulator fails sporadically because telnet port is fixed.

[snip]
> +++ b/support/testing/infra/emulator.py
[snip]
> +        qemu_cmd = ["qemu-system-{}".format(qemu_arch),
> +                    "-serial", "telnet::1234,server",
> +                    "-display", "none"]

2) If I do this (not restricted to these testcases) ...

for i in $(seq 100); do \
support/testing/run-tests -d dl1 -o output -k tests.package || break ; done

... while performing other resource-consuming tasks on my PC, such as starting
an unrelated build that uses all the cores, I eventually get this:

ERROR: test_run (tests.package.test_dropbear.TestDropbear)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/testing-v3/support/testing/tests/package/test_dropbear.py", line 22, in test_run
    self.emulator.login("testpwd")
  File "/tmp/testing-v3/support/testing/infra/emulator.py", line 101, in login
    self.__read_until("buildroot login:", 10)
  File "/tmp/testing-v3/support/testing/infra/emulator.py", line 89, in __read_until
    data = self.__tn.read_until(waitstr, timeout)
  File "/usr/lib/python2.7/telnetlib.py", line 294, in read_until
    return self._read_until_with_poll(match, timeout)
  File "/usr/lib/python2.7/telnetlib.py", line 329, in _read_until_with_poll
    self.fill_rawq()
  File "/usr/lib/python2.7/telnetlib.py", line 576, in fill_rawq
    buf = self.sock.recv(50)
error: [Errno 104] Connection reset by peer

Something like this patch could fix those:

+++ b/support/testing/infra/emulator.py
@@ -1,3 +1,3 @@
+import pexpect
 import socket
-import subprocess
 import telnetlib
@@ -7,2 +7,5 @@ import infra.basetest
 
+TELNET_PORT_INITIAL = 1234
+TELNET_PORT_LAST = TELNET_PORT_INITIAL + 20
+
 # TODO: Most of the telnet stuff need to be replaced by stdio/pexpect to discuss
@@ -13,2 +16,3 @@ class Emulator(object):
         self.qemu = None
+        self.port = None
         self.__tn = None
@@ -43,3 +47,2 @@ class Emulator(object):
         qemu_cmd = ["qemu-system-{}".format(qemu_arch),
-                    "-serial", "telnet::1234,server",
                     "-display", "none"]
@@ -75,4 +78,15 @@ class Emulator(object):
         with infra.smart_open(self.log_file) as lfh:
-            lfh.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
-            self.qemu = subprocess.Popen(qemu_cmd, stdout=lfh, stderr=lfh)
+            for port in range(TELNET_PORT_INITIAL, TELNET_PORT_LAST):
+                telnet_arg = ["-serial", "telnet::{},server".format(port)]
+                cmd = qemu_cmd + telnet_arg
+                lfh.write("> starting qemu with '{}'\n".format(" ".join(cmd)))
+                self.qemu = pexpect.spawn(cmd[0], cmd[1:], logfile=lfh)
+                ret = self.qemu.expect(["waiting for connection",
+                                        "Address already in use"])
+                if ret == 0:
+                    self.port = port
+                    break
+                self.qemu.read()
+        if not self.port:
+            raise SystemError("Could not find a free port to run emulator")
 
@@ -81,3 +95,3 @@ class Emulator(object):
             try:
-                self.__tn = telnetlib.Telnet("localhost", 1234)
+                self.__tn = telnetlib.Telnet("localhost", self.port)
                 if self.__tn:
@@ -100,6 +114,8 @@ class Emulator(object):
     def login(self, password=None):
-        self.__read_until("buildroot login:", 10)
+        # The login prompt can take some time to appear when running multiple
+        # instances in parallel, so set the timeout to a large value
+        self.__read_until("buildroot login:", 30)
         if "buildroot login:" not in self.log:
             with infra.smart_open(self.log_file) as lfh:
-                lfh.write("==> System does not boot")
+                lfh.write("==> System does not boot\n")
             raise SystemError("System does not boot")
@@ -133,3 +149,2 @@ class Emulator(object):
             return
-        self.qemu.terminate()
-        self.qemu.kill()
+        self.qemu.terminate(force=True)

Regards,
Ricardo
