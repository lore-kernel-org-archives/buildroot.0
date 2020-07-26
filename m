From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 25 Jul 2020 19:28:56 -0700
Subject: [Buildroot] [PATCH 0/5] libwebsockets fixup
Message-ID: <20200726022901.295552-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

As I was picking through the packages under my name in the developers' file, I
checked libwebsockets and found that it was quite out of date!

I started to dig around and found two issues I wanted to fix before updating
libwebsockets:

1) libwebsockets compiles just fine without fork() and has had vfork()
   support for at * least * 5 years (I couldn't find anything further back,
   but it might have been there even longer.)

2) zlib hasn't been a requirement since 2013 and is only necessary if
   LWS_WITHOUT_EXTENSIONS is "ON," which is the default behavior.

As such, the first two patches deal directly with those issues.
The first removes "depends on BR2_USE_MMU," the second explicitly sets
LWS_WITHOUT_EXTENSIONS to "OFF." (See the patch for more details and size
comparisons.)

The 4.0 series of libwebsockets also has several new features and options
which we may want to enable in a separate patch series, but for this patch
series, I just wanted to include a check for libglib2 and libmount.

The other options we may want to enable in the future are:
 - LWS_ROLE_MQTT
 - LWS_WITH_SYS_ASYNC_DNS
 - LWS_WITH_SYS_NTPCLIENT
 - LWS_WITH_SYS_DHCP_CLIENT
 - LWS_WITH_SECURE_STREAMS
 - LWS_WITH_STRUCT_JSON
 - LWS_WITH_SPAWN
 - LWS_WITH_SQLITE3/LWS_WITH_STRUCT_SQLITE3

Feel free to check out the CMakeLists.txt and the changelog file to see what
those options do, some of them are quite neat! If we do decide to impliment
those options, a Config.in entry would be needed for all of them except
for SQLITE.

Also, mbedtls and wolfssl are supported and have been for quite a while, but
nobody cares about adding support for those libraries. I sure as heck don't!

I tested the changes on Fedora 32 and CentOS7 with
"./utils/test-pkg -c ./defconfig -p libwebsockets" and got
"6 builds, 0 skipped, 0 build failed, 0 legal-info failed" as a result.

Thanks for taking a look at the series!

Adam Duskett (5):
  package/libwebsockets: remove dependency on mmu
  package/libwebsockets: add support for extensions
  package/libwebsockets: bump version to 4.0.20
  package/libwebsockets: add libglib2 support
  package/libwebsockets: add fsmount support

 ...ts-txt-fix-static-build-with-openssl.patch | 34 -------------------
 package/libwebsockets/Config.in               |  1 -
 package/libwebsockets/libwebsockets.hash      |  4 +--
 package/libwebsockets/libwebsockets.mk        | 21 ++++++++++--
 4 files changed, 20 insertions(+), 40 deletions(-)
 delete mode 100644 package/libwebsockets/0001-CMakeLists-txt-fix-static-build-with-openssl.patch

-- 
2.26.2
