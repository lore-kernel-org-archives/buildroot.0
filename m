From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 22:10:15 +0100
Subject: [Buildroot] [git commit] boost: specify architecture variant for
	sparc
Message-ID: <20151201232118.1060D7FB18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b13641be6a83aca80a7a9bdfe03f71465355b3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using a patch to specify the architecture variant for
sparc, use some Boost configure variables.

[Thomas: reword commit log.]

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0003-Remove-bogus-c3-cpu-varant-for-SPARC.patch | 42 ----------------------
 package/boost/boost.mk                             |  4 +++
 2 files changed, 4 insertions(+), 42 deletions(-)

diff --git a/package/boost/0003-Remove-bogus-c3-cpu-varant-for-SPARC.patch b/package/boost/0003-Remove-bogus-c3-cpu-varant-for-SPARC.patch
deleted file mode 100644
index a4d39b3..0000000
--- a/package/boost/0003-Remove-bogus-c3-cpu-varant-for-SPARC.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ec60c37295146bb80aa44a92cf416027b75b5ff7 Mon Sep 17 00:00:00 2001
-From: Vladimir Prus <vladimir@codesourcery.com>
-Date: Mon, 27 Apr 2015 19:12:54 +0300
-Subject: [PATCH] Remove bogus 'c3' cpu varant for SPARC.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- src/tools/gcc.jam | 3 +--
- src/tools/gcc.py  | 3 +--
- 2 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/src/tools/gcc.jam b/src/tools/gcc.jam
-index eff95ae..128ab84 100644
---- a/tools/build/src/tools/gcc.jam
-+++ b/tools/build/src/tools/gcc.jam
-@@ -1138,8 +1138,7 @@ cpu-flags gcc OPTIONS : x86 : c3-2 : -march=c3-2 ;
- ##
- cpu-flags gcc OPTIONS : x86 : atom : -march=atom ;
- # Sparc
--cpu-flags gcc OPTIONS : sparc : c3 : -mcpu=c3 : default ;
--cpu-flags gcc OPTIONS : sparc : v7 : -mcpu=v7 ;
-+cpu-flags gcc OPTIONS : sparc : v7 : -mcpu=v7 : default ;
- cpu-flags gcc OPTIONS : sparc : cypress : -mcpu=cypress ;
- cpu-flags gcc OPTIONS : sparc : v8 : -mcpu=v8 ;
- cpu-flags gcc OPTIONS : sparc : supersparc : -mcpu=supersparc ;
-diff --git a/src/tools/gcc.py b/src/tools/gcc.py
-index a13ce7a..d2d3294 100644
---- a/tools/build/src/tools/gcc.py
-+++ b/tools/build/src/tools/gcc.py
-@@ -789,8 +789,7 @@ cpu_flags('gcc', 'OPTIONS', 'x86', 'atom', ['-march=atom'])
- # Sparc
- flags('gcc', 'OPTIONS', ['<architecture>sparc/<address-model>32'], ['-m32'])
- flags('gcc', 'OPTIONS', ['<architecture>sparc/<address-model>64'], ['-m64'])
--cpu_flags('gcc', 'OPTIONS', 'sparc', 'c3', ['-mcpu=c3'], default=True)
--cpu_flags('gcc', 'OPTIONS', 'sparc', 'v7', ['-mcpu=v7'])
-+cpu_flags('gcc', 'OPTIONS', 'sparc', 'v7', ['-mcpu=v7'], default=True)
- cpu_flags('gcc', 'OPTIONS', 'sparc', 'cypress', ['-mcpu=cypress'])
- cpu_flags('gcc', 'OPTIONS', 'sparc', 'v8', ['-mcpu=v8'])
- cpu_flags('gcc', 'OPTIONS', 'sparc', 'supersparc', ['-mcpu=supersparc'])
--- 
-2.3.6
-
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 80325b0..efc0020 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -89,6 +89,10 @@ BOOST_OPTS += toolset=gcc \
 	     abi=$(BOOST_ABI) \
 	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release)
 
+ifeq ($(BR2_sparc),y)
+BOOST_OPTS += architecture=sparc instruction-set=v8
+endif
+
 # By default, Boost build and installs both the shared and static
 # variants. Override that if we want static only or shared only.
 ifeq ($(BR2_STATIC_LIBS),y)
