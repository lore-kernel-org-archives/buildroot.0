From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 19 Feb 2014 22:05:57 +0100
Subject: [Buildroot] [PATCH 1/1] thrift: fixes compilation issues
Message-ID: <1392843957-2914-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply upstreamed patches:
https://issues.apache.org/jira/browse/THRIFT-2229
https://issues.apache.org/jira/browse/THRIFT-2367

Fixes:
http://autobuild.buildroot.net/results/efb/efbbae54b5a16b26cac7fcc69ea99bb6f8661fe8/build-end.log
http://autobuild.buildroot.net/results/f83/f837440fdf8b3bddfc6cc548902a0453640fa6b4/build-end.log

[Romain: patch 05 rebased on top of thrift-0.9.1]
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../thrift-04-failed-to-build-on-OSX-10.9-GM.patch |  88 ++++++++++++++++
 ...-05-stdlib-and-boost-both-define-uint64_t.patch | 112 +++++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 package/thrift/thrift-04-failed-to-build-on-OSX-10.9-GM.patch
 create mode 100644 package/thrift/thrift-05-stdlib-and-boost-both-define-uint64_t.patch

diff --git a/package/thrift/thrift-04-failed-to-build-on-OSX-10.9-GM.patch b/package/thrift/thrift-04-failed-to-build-on-OSX-10.9-GM.patch
new file mode 100644
index 0000000..8ff9def
--- /dev/null
+++ b/package/thrift/thrift-04-failed-to-build-on-OSX-10.9-GM.patch
@@ -0,0 +1,88 @@
+THRIFT-2229 thrift failed to build on OSX 10.9 GM
+
+---
+ compiler/cpp/src/thrifty.yy |  4 ++--
+ tutorial/cpp/CppClient.cpp  |  6 +++---
+ tutorial/cpp/CppServer.cpp  | 16 ++++++++--------
+ 3 files changed, 13 insertions(+), 13 deletions(-)
+ mode change 100644 => 100755 compiler/cpp/src/thrifty.yy
+
+diff --git a/compiler/cpp/src/thrifty.yy b/compiler/cpp/src/thrifty.yy
+old mode 100644
+new mode 100755
+index b543552..8814332
+--- a/compiler/cpp/src/thrifty.yy
++++ b/compiler/cpp/src/thrifty.yy
+@@ -675,7 +675,7 @@ ConstValue:
+       $$ = new t_const_value();
+       $$->set_integer($1);
+       if (!g_allow_64bit_consts && ($1 < INT32_MIN || $1 > INT32_MAX)) {
+-        pwarning(1, "64-bit constant \"%"PRIi64"\" may not work in all languages.\n", $1);
++        pwarning(1, "64-bit constant \"%" PRIi64"\" may not work in all languages.\n", $1);
+       }
+     }
+ | tok_dub_constant
+@@ -987,7 +987,7 @@ FieldIdentifier:
+              * warn if the user-specified negative value isn't what
+              * thrift would have auto-assigned.
+              */
+-            pwarning(1, "Nonpositive field key (%"PRIi64") differs from what would be "
++            pwarning(1, "Nonpositive field key (%" PRIi64") differs from what would be "
+                      "auto-assigned by thrift (%d).\n", $1, y_field_val);
+           }
+           /*
+diff --git a/tutorial/cpp/CppClient.cpp b/tutorial/cpp/CppClient.cpp
+index ba71caa..b91df2e 100644
+--- a/tutorial/cpp/CppClient.cpp
++++ b/tutorial/cpp/CppClient.cpp
+@@ -38,9 +38,9 @@ using namespace shared;
+ using namespace boost;
+ 
+ int main(int argc, char** argv) {
+-  shared_ptr<TTransport> socket(new TSocket("localhost", 9090));
+-  shared_ptr<TTransport> transport(new TBufferedTransport(socket));
+-  shared_ptr<TProtocol> protocol(new TBinaryProtocol(transport));
++  boost::shared_ptr<TTransport> socket(new TSocket("localhost", 9090));
++  boost::shared_ptr<TTransport> transport(new TBufferedTransport(socket));
++  boost::shared_ptr<TProtocol> protocol(new TBinaryProtocol(transport));
+   CalculatorClient client(protocol);
+ 
+   try {
+diff --git a/tutorial/cpp/CppServer.cpp b/tutorial/cpp/CppServer.cpp
+index d0dbad9..f19258c 100644
+--- a/tutorial/cpp/CppServer.cpp
++++ b/tutorial/cpp/CppServer.cpp
+@@ -113,11 +113,11 @@ protected:
+ 
+ int main(int argc, char **argv) {
+ 
+-  shared_ptr<TProtocolFactory> protocolFactory(new TBinaryProtocolFactory());
+-  shared_ptr<CalculatorHandler> handler(new CalculatorHandler());
+-  shared_ptr<TProcessor> processor(new CalculatorProcessor(handler));
+-  shared_ptr<TServerTransport> serverTransport(new TServerSocket(9090));
+-  shared_ptr<TTransportFactory> transportFactory(new TBufferedTransportFactory());
++  boost::shared_ptr<TProtocolFactory> protocolFactory(new TBinaryProtocolFactory());
++  boost::shared_ptr<CalculatorHandler> handler(new CalculatorHandler());
++  boost::shared_ptr<TProcessor> processor(new CalculatorProcessor(handler));
++  boost::shared_ptr<TServerTransport> serverTransport(new TServerSocket(9090));
++  boost::shared_ptr<TTransportFactory> transportFactory(new TBufferedTransportFactory());
+ 
+   TSimpleServer server(processor,
+                        serverTransport,
+@@ -128,10 +128,10 @@ int main(int argc, char **argv) {
+   /**
+    * Or you could do one of these
+ 
+-  shared_ptr<ThreadManager> threadManager =
++  boost::shared_ptr<ThreadManager> threadManager =
+     ThreadManager::newSimpleThreadManager(workerCount);
+-  shared_ptr<PosixThreadFactory> threadFactory =
+-    shared_ptr<PosixThreadFactory>(new PosixThreadFactory());
++  boost::shared_ptr<PosixThreadFactory> threadFactory =
++    boost::shared_ptr<PosixThreadFactory>(new PosixThreadFactory());
+   threadManager->threadFactory(threadFactory);
+   threadManager->start();
+   TThreadPoolServer server(processor,
+-- 
+1.8.5.3
+
diff --git a/package/thrift/thrift-05-stdlib-and-boost-both-define-uint64_t.patch b/package/thrift/thrift-05-stdlib-and-boost-both-define-uint64_t.patch
new file mode 100644
index 0000000..70a5885
--- /dev/null
+++ b/package/thrift/thrift-05-stdlib-and-boost-both-define-uint64_t.patch
@@ -0,0 +1,112 @@
+THRIFT-2367 Build failure: stdlib and boost both define uint64_t
+
+Fix: remove "using namespace boost;"
+Patch: Roger Meier
+---
+ lib/cpp/src/thrift/transport/TSSLServerSocket.cpp | 8 +++-----
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp       | 7 +++----
+ tutorial/cpp/CppClient.cpp                        | 2 --
+ tutorial/cpp/CppServer.cpp                        | 2 --
+ 4 files changed, 6 insertions(+), 13 deletions(-)
+
+diff --git a/lib/cpp/src/thrift/transport/TSSLServerSocket.cpp b/lib/cpp/src/thrift/transport/TSSLServerSocket.cpp
+index 4689e4a..df5ed75 100644
+--- a/lib/cpp/src/thrift/transport/TSSLServerSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLServerSocket.cpp
+@@ -22,25 +22,23 @@
+ 
+ namespace apache { namespace thrift { namespace transport {
+ 
+-using namespace boost;
+-
+ /**
+  * SSL server socket implementation.
+  */
+ TSSLServerSocket::TSSLServerSocket(int port,
+-                                   shared_ptr<TSSLSocketFactory> factory):
++                                   boost::shared_ptr<TSSLSocketFactory> factory):
+                                    TServerSocket(port), factory_(factory) {
+   factory_->server(true);
+ }
+ 
+ TSSLServerSocket::TSSLServerSocket(int port, int sendTimeout, int recvTimeout,
+-                                   shared_ptr<TSSLSocketFactory> factory):
++                                   boost::shared_ptr<TSSLSocketFactory> factory):
+                                    TServerSocket(port, sendTimeout, recvTimeout),
+                                    factory_(factory) {
+   factory_->server(true);
+ }
+ 
+-shared_ptr<TSocket> TSSLServerSocket::createSocket(int client) {
++boost::shared_ptr<TSocket> TSSLServerSocket::createSocket(int client) {
+   return factory_->createSocket(client);
+ }
+ 
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+index 029c541..5029f74 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -41,7 +41,6 @@
+ #define OPENSSL_VERSION_NO_THREAD_ID 0x10000000L
+ 
+ using namespace std;
+-using namespace boost;
+ using namespace apache::thrift::concurrency;
+ 
+ struct CRYPTO_dynlock_value {
+@@ -489,7 +488,7 @@ int TSSLSocketFactory::passwordCallback(char* password,
+   return length;
+ }
+ 
+-static shared_array<Mutex> mutexes;
++static boost::shared_array<Mutex> mutexes;
+ 
+ static void callbackLocking(int mode, int n, const char*, int) {
+   if (mode & CRYPTO_LOCK) {
+@@ -533,7 +532,7 @@ void TSSLSocketFactory::initializeOpenSSL() {
+   SSL_library_init();
+   SSL_load_error_strings();
+   // static locking
+-  mutexes = shared_array<Mutex>(new Mutex[::CRYPTO_num_locks()]);
++  mutexes = boost::shared_array<Mutex>(new Mutex[::CRYPTO_num_locks()]);
+   if (mutexes == NULL) {
+     throw TTransportException(TTransportException::INTERNAL_ERROR,
+           "initializeOpenSSL() failed, "
+@@ -591,7 +590,7 @@ void buildErrors(string& errors, int errno_copy) {
+     }
+   }
+   if (errors.empty()) {
+-    errors = "error code: " + lexical_cast<string>(errno_copy);
++    errors = "error code: " + boost::lexical_cast<string>(errno_copy);
+   }
+ }
+ 
+diff --git a/tutorial/cpp/CppClient.cpp b/tutorial/cpp/CppClient.cpp
+index ba71caa..6db8db6 100644
+--- a/tutorial/cpp/CppClient.cpp
++++ b/tutorial/cpp/CppClient.cpp
+@@ -35,8 +35,6 @@ using namespace apache::thrift::transport;
+ using namespace tutorial;
+ using namespace shared;
+ 
+-using namespace boost;
+-
+ int main(int argc, char** argv) {
+   shared_ptr<TTransport> socket(new TSocket("localhost", 9090));
+   shared_ptr<TTransport> transport(new TBufferedTransport(socket));
+diff --git a/tutorial/cpp/CppServer.cpp b/tutorial/cpp/CppServer.cpp
+index d0dbad9..d0bff32 100644
+--- a/tutorial/cpp/CppServer.cpp
++++ b/tutorial/cpp/CppServer.cpp
+@@ -41,8 +41,6 @@ using namespace apache::thrift::server;
+ using namespace tutorial;
+ using namespace shared;
+ 
+-using namespace boost;
+-
+ class CalculatorHandler : public CalculatorIf {
+  public:
+   CalculatorHandler() {}
+-- 
+1.8.5.3
+
-- 
1.8.5.3
