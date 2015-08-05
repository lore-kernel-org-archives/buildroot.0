From: Simon Marchi <simon.marchi@polymtl.ca>
Date: Wed,  5 Aug 2015 00:19:40 -0400
Subject: [Buildroot] [PATCH] ola: Add patch to fix linking issue
Message-ID: <1438748380-5528-1-git-send-email-simon.marchi@polymtl.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes this autobuild failure:

  http://autobuild.buildroot.net/results/e14/e14e1700d4fe359c56be57587bdb509e002e5753/build-end.log

I am not 100% sure of what happens (I am not a C++ expert at all), but
here it is anyway.  I assume that when the definition of
TCPSocket::ReadDescriptor is embedded in the class definition, no actual
implementation is generated (all usages of it are inline).  When object
libolaopenpixelcontrol.so tries to reference it somehow, it results in
an undefined reference.  Moving the definition in the cpp retains it. If
you have a clear explanation of what happens, I'd be happy to read it.

Signed-off-by: Simon Marchi <simon.marchi@polymtl.ca>
---
 ...link-ola-network-TCPSocket-ReadDescriptor.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/ola/Fix-link-ola-network-TCPSocket-ReadDescriptor.patch

diff --git a/package/ola/Fix-link-ola-network-TCPSocket-ReadDescriptor.patch b/package/ola/Fix-link-ola-network-TCPSocket-ReadDescriptor.patch
new file mode 100644
index 0000000..8c9385b
--- /dev/null
+++ b/package/ola/Fix-link-ola-network-TCPSocket-ReadDescriptor.patch
@@ -0,0 +1,28 @@
+Index: ola-0.9.6/common/network/TCPSocket.cpp
+===================================================================
+--- ola-0.9.6.orig/common/network/TCPSocket.cpp
++++ ola-0.9.6/common/network/TCPSocket.cpp
+@@ -163,6 +163,10 @@ TCPSocket* TCPSocket::Connect(const Sock
+   return socket;
+ }
+ 
++ola::io::DescriptorHandle TCPSocket::ReadDescriptor() const
++{
++  return m_handle;
++}
+ 
+ // TCPAcceptingSocket
+ // ------------------------------------------------
+Index: ola-0.9.6/include/ola/network/TCPSocket.h
+===================================================================
+--- ola-0.9.6.orig/include/ola/network/TCPSocket.h
++++ ola-0.9.6/include/ola/network/TCPSocket.h
+@@ -47,7 +47,7 @@ class TCPSocket: public ola::io::Connect
+ 
+   ~TCPSocket() { Close(); }
+ 
+-  ola::io::DescriptorHandle ReadDescriptor() const { return m_handle; }
++  ola::io::DescriptorHandle ReadDescriptor() const;
+   ola::io::DescriptorHandle WriteDescriptor() const { return m_handle; }
+   bool Close();
+ 
-- 
2.4.5
