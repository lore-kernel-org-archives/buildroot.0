From: ratbert90 <aduskett@gmail.com>
Date: Sun, 26 Jul 2020 22:11:00 +0000
Subject: [Buildroot] [PATCH] package/grpc: needs host gcc >= 4.9
In-Reply-To: <20200726210823.20922-1-yann.morin.1998@free.fr>
References: <20200726210823.20922-1-yann.morin.1998@free.fr>
Message-ID: <BY5PR19MB3668703B0B0C459376B914B4FB750@BY5PR19MB3668.namprd19.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Yann;

________________________________
From: Yann E. MORIN <yann.morin.1998@gmail.com> on behalf of Yann E. MORIN <yann.morin.1998@free.fr>
Sent: Sunday, July 26, 2020 14:08
To: buildroot at buildroot.org
Cc: Yann E. MORIN; Adam Duskett
Subject: [PATCH] package/grpc: needs host gcc >= 4.9

On some versions of gcc 4.8, like the one packaged in Ubuntu 14.04 (in
extended support until 2022-04). Researching the cause for the bug was
non-conclusive, except for:

     https://github.com/grpc/grpc/issues/19265

which ends with the less than informative "I've settled it."

The trails leads to https://github.com/oudalab/co-incidents/issues/29,
which leads to https://github.com/protocolbuffers/protobuf/issues/5353.

Although the reporter provided a very good initial investigation, with
bisection of grpc *and* protobuf, the report has just lingered untouched
for almost two years now. One of the remaining commits in the protobuf
bisect is this giant hairball:

    https://github.com/protocolbuffers/protobuf/commit/0400cca3236de1ca
    Integrated internal changes from Google
    282 changed files with 15,223 additions and 14,041 deletions.

No surprise the reporter of protobuf!5353 got very frustrated to find
such a monster commit to investigate... :-(

Another lead brings us similar reports, too:

     https://github.com/grpc/grpc/issues/22781

which concludes that "I've already fixed this issue. Can you try it on
1.29.1?"

But we're already usign 1.30.2, and we still have the issue (so maybe
it's a different one...)

So, because the issue manifests itself only on an ancient system, Ubuntu
14.04, with a now ancient gcc 4.8, we just make grpc depend on a host
gcc >= 4.9.

The problem here is two fold:
1) CentOS7 also comes with gcc4.8 and compiles fine.

2) Ubuntu 14.04 still fails even when using newer GCC versions from a PPA (I tried with gcc 6 and the same error occurred)

So a user could in theory decide to try and install a newer GCC on Ubuntu 14.04 like I did in testing and will still get a bad experience. :(

I?m not sure what the correct answer to this issue is, but I have a hard time accepting this patch is the proper fix due to the above.

Adam


Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
---
 package/collectd/Config.in | 1 +
 package/grpc/Config.in     | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 188be3c0fb..77f088e76d 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -565,6 +565,7 @@ config BR2_PACKAGE_COLLECTD_GRAPHITE

 config BR2_PACKAGE_COLLECTD_GRPC
         bool "grpc"
+       depends on BR2_HOST_GCC_AT_LEAST_4_9 # grpc
         depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
         depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
         depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index 45299888ea..8257f7c8a5 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GRPC
         bool "grpc"
+       depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-grpc fails to build on some gcc-4.8 versions
         depends on BR2_INSTALL_LIBSTDCPP
         depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
         depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
@@ -17,8 +18,9 @@ config BR2_PACKAGE_GRPC

           http://github.com/grpc/grpc

-comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8, host gcc >= 4.9"
         depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
         depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-               || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+               || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
+               || !BR2_HOST_GCC_AT_LEAST_4_9
         depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
--
2.20.1

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200726/c7f4d03b/attachment.html>
