From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 25 Nov 2016 19:00:16 +0100
Subject: [Buildroot] [PATCH] autossh: honour LDFLAGS
Message-ID: <20161125180016.GA360@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 http://autobuild.buildroot.net/results/08a458572a2e9c599dd32b837b1e5c02a6721973

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
It is indeed a change from uClibc-ng 1.0.18 and upward, but I think
it is the fault of the package not respecting LDFLAGS and so not
passing -static. I am unsure why it just worked in the past.
When it fails linker is doing following:
-lnsl -lgcc -lc -lgcc
When -static is used, following is passed:
-lnsl --start-group -lgcc -lc --end-group 

The gcc -dumpspecs from both gcc's are the same. I have no idea why
gcc behaves in another way when toolchain is compiled with 1.0.17.
---
 package/autossh/0001-honour-LDFLAGS.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/autossh/0001-honour-LDFLAGS.patch

diff --git a/package/autossh/0001-honour-LDFLAGS.patch b/package/autossh/0001-honour-LDFLAGS.patch
new file mode 100644
index 0000000..2e6160b
--- /dev/null
+++ b/package/autossh/0001-honour-LDFLAGS.patch
@@ -0,0 +1,16 @@
+Honour LDFLAGS, especially required when static linking
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur autossh-1.4e.orig/Makefile.in autossh-1.4e/Makefile.in
+--- autossh-1.4e.orig/Makefile.in	2015-02-10 05:41:58.000000000 +0100
++++ autossh-1.4e/Makefile.in	2016-11-25 12:49:06.052122855 +0100
+@@ -31,7 +31,7 @@
+ 
+ 
+ $(TARGET):	$(OFILES)
+-		$(CC) $(CPPFLAGS) -o $(TARGET) $(OFILES) $(LIBS)
++		$(CC) $(CPPFLAGS) $(LDFLAGS) -o $(TARGET) $(OFILES) $(LIBS)
+ 
+ clean:
+ 		- /bin/rm -f *.o *.a *.core *~
-- 
2.1.4
