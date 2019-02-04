From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 21:11:39 +0100
Subject: [Buildroot] [git commit] package/rtmpdump: drop openssl support
Message-ID: <20190204201021.41F0983BE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d001395fac944b476e342e06dd0a92a70de3bd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rtmpdump does not support openssl 1.1.x, has not seen any changes upstream
since 2015, is only used with the gnutls backend in Debian and Fedora.

There exists a 3rd party patch for openssl 1.1.x support:

https://github.com/JudgeZarbi/RTMPDump-OpenSSL-1.1

But there is an open issue reported about a crash in the handshake code
(which is modified by the patch):

https://github.com/JudgeZarbi/RTMPDump-OpenSSL-1.1/issues/1

And the README for the repo states:

I modified a few of the files in the librtmp directory to conform to the new
getters and setters in OpenSSL 1.1.0.  I don't claim to be a security
expert, and neither have I had any experience with OpenSSL in a programming
sense, so I'm not sure exactly if it's correct, but it compiles and seems to
work for what I use it for.

Which does not sound very reassuring, so instead drop the openssl support.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtmpdump/rtmpdump.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index f5d430ce36..03cdd9d00f 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -16,9 +16,6 @@ RTMPDUMP_DEPENDENCIES = zlib
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 RTMPDUMP_DEPENDENCIES += gnutls
 RTMPDUMP_CRYPTO = GNUTLS
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-RTMPDUMP_DEPENDENCIES += openssl
-RTMPDUMP_CRYPTO = OPENSSL
 else
 # no crypto
 RTMPDUMP_CRYPTO =
