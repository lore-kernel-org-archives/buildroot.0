From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 19:52:25 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/nodejs: security
 bump to version v8.16.1
Message-ID: <20190925175412.6A9C98F446@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b775c99262378aa4fa44ba6d7268c37879db464f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- CVE-2019-9511 "Data Dribble": The attacker requests a large amount of data
  from a specified resource over multiple streams.  They manipulate window
  size and stream priority to force the server to queue the data in 1-byte
  chunks.  Depending on how efficiently this data is queued, this can
  consume excess CPU, memory, or both, potentially leading to a denial of
  service.

- CVE-2019-9512 "Ping Flood": The attacker sends continual pings to an
  HTTP/2 peer, causing the peer to build an internal queue of responses.
  Depending on how efficiently this data is queued, this can consume excess
  CPU, memory, or both, potentially leading to a denial of service.

- CVE-2019-9513 "Resource Loop": The attacker creates multiple request
  streams and continually shuffles the priority of the streams in a way that
  causes substantial churn to the priority tree.  This can consume excess
  CPU, potentially leading to a denial of service.

- CVE-2019-9514 "Reset Flood": The attacker opens a number of streams and
  sends an invalid request over each stream that should solicit a stream of
  RST_STREAM frames from the peer.  Depending on how the peer queues the
  RST_STREAM frames, this can consume excess memory, CPU, or both,
  potentially leading to a denial of service.

- CVE-2019-9515 "Settings Flood": The attacker sends a stream of SETTINGS
  frames to the peer.  Since the RFC requires that the peer reply with one
  acknowledgement per SETTINGS frame, an empty SETTINGS frame is almost
  equivalent in behavior to a ping.  Depending on how efficiently this data
  is queued, this can consume excess CPU, memory, or both, potentially
  leading to a denial of service.

- CVE-2019-9516 "0-Length Headers Leak": The attacker sends a stream of
  headers with a 0-length header name and 0-length header value, optionally
  Huffman encoded into 1-byte or greater headers.  Some implementations
  allocate memory for these headers and keep the allocation alive until the
  session dies.  This can consume excess memory, potentially leading to a
  denial of service.

- CVE-2019-9517 "Internal Data Buffering": The attacker opens the HTTP/2
  window so the peer can send without constraint; however, they leave the
  TCP window closed so the peer cannot actually write (many of) the bytes on
  the wire.  The attacker then sends a stream of requests for a large
  response object.  Depending on how the servers queue the responses, this
  can consume excess memory, CPU, or both, potentially leading to a denial
  of service.

- CVE-2019-9518 "Empty Frames Flood": The attacker sends a stream of frames
  with an empty payload and without the end-of-stream flag.  These frames
  can be DATA, HEADERS, CONTINUATION and/or PUSH_PROMISE.  The peer spends
  time processing each frame disproportionate to attack bandwidth.  This can
  consume excess CPU, potentially leading to a denial of service.
  (Discovered by Piotr Sikora of Google)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index ad8ad4ad99..d1e2b39c35 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v8.15.1/SHASUMS256.txt
-sha256 6b6486a3f452624941f6e11dd5f878c298d43e9c21b5f43ca1721dc7ce25add1  node-v8.15.1.tar.xz
+# From https://nodejs.org/dist/v8.16.1/SHASUMS256.txt
+sha256 d8c190acdf2d967faf49c22df883d31a8d4e249d67852dae3c2d8a0f756b0512  node-v8.16.1.tar.xz
 
 # Hash for license file
 sha256 b87be6c1479ed977481115869c2dd8b6d59e5ea55aa09939d6c898242121b2f5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index b4e9351c63..2cc8ecc829 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.15.1
+NODEJS_VERSION = 8.16.1
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
