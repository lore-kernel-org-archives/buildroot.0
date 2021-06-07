From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:44 -0000
Subject: [Buildroot] [git commit] support/testing: add python-dbus-next test
Message-ID: <20210607144655.64E8A81191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f40219ff69fbfa31dea7a5d57d0c5129f6d77b4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  2 +
 .../tests/package/sample_python_dbus_next.py       | 44 ++++++++++++++++++++++
 .../testing/tests/package/test_python_dbus_next.py | 40 ++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a75d430af..93687081c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1660,9 +1660,11 @@ F:	package/python-typing-extensions/
 F:	package/python-xmodem/
 F:	package/rs485conf/
 F:	package/turbolua/
+F:	support/testing/tests/package/sample_python_dbus_next.py
 F:	support/testing/tests/package/sample_python_pytest.py
 F:	support/testing/tests/package/sample_python_pytest_asyncio.py
 F:	support/testing/tests/package/test_netdata.py
+F:	support/testing/tests/package/test_python_dbus_next.py
 F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
diff --git a/support/testing/tests/package/sample_python_dbus_next.py b/support/testing/tests/package/sample_python_dbus_next.py
new file mode 100644
index 0000000000..1fcb76f45a
--- /dev/null
+++ b/support/testing/tests/package/sample_python_dbus_next.py
@@ -0,0 +1,44 @@
+import asyncio
+from dbus_next.aio import MessageBus
+from dbus_next.service import ServiceInterface, method
+import dbus_next.introspection as intr
+from dbus_next import BusType
+
+
+class SampleInterface(ServiceInterface):
+    def __init__(self):
+        super().__init__('test.interface')
+
+    @method()
+    def Ping(self):
+        pass
+
+    @method()
+    def ConcatStrings(self, what1: 's', what2: 's') -> 's':
+        return what1 + what2
+
+
+async def main():
+    bus_name = 'dbus.next.sample'
+
+    bus = await MessageBus(bus_type=BusType.SYSTEM).connect()
+    bus2 = await MessageBus(bus_type=BusType.SYSTEM).connect()
+
+    await bus.request_name(bus_name)
+
+    service_interface = SampleInterface()
+    bus.export('/test/path', service_interface)
+
+    introspection = await bus2.introspect(bus_name, '/test/path')
+    assert type(introspection) is intr.Node
+    obj = bus2.get_proxy_object(bus_name, '/test/path', introspection)
+    interface = obj.get_interface(service_interface.name)
+
+    result = await interface.call_ping()
+    assert result is None
+
+    result = await interface.call_concat_strings('hello ', 'world')
+    assert result == 'hello world'
+
+
+asyncio.run(main())
diff --git a/support/testing/tests/package/test_python_dbus_next.py b/support/testing/tests/package/test_python_dbus_next.py
new file mode 100644
index 0000000000..3c597ad198
--- /dev/null
+++ b/support/testing/tests/package/test_python_dbus_next.py
@@ -0,0 +1,40 @@
+import textwrap
+
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3DBusNext(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_DBUS=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DBUS_NEXT=y
+        """
+    sample_scripts = ["tests/package/sample_python_dbus_next.py"]
+
+    def run_sample_scripts(self):
+        config = \
+            """
+            <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+             "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+            <busconfig>
+              <policy user="root">
+                <allow own="dbus.next.sample"/>
+                <allow send_destination="dbus.next.sample"/>
+              </policy>
+            </busconfig>
+            """
+        config = textwrap.dedent(config)
+        config_dir = "/etc/dbus-1/system.d"
+        config_fn = "dbus.next.sample.conf"
+
+        # Setup and reload D-Bus configuration
+        self.emulator.run("mkdir -p " + config_dir)
+        self.emulator.run("cat > " + config_dir + "/" + config_fn +
+                          " <<EOF" + config + "EOF")
+        self.emulator.run("killall -SIGHUP dbus-daemon")
+
+        # Run test scripts
+        super().run_sample_scripts()
