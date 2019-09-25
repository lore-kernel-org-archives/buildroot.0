From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 18:08:26 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/nodejs: security
 bump to version v10.16.3
Message-ID: <20190925175422.61BF48F459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e00b6b8556618a7115baf5ba810eec2d28e10d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

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

Notice that this version bump requires nghttp2 1.39.2.  It also includes an
(unconditional) embedded copy of brotli.

Update the license hash because of copyright year changes and the addition
of the MIT-style license text for large_pages and brotli.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8c3032414e894b8ece6e7cdc350bc0014a4b21c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 6 +++---
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 6cb2cdd5b7..c7de1e637c 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v10.15.3/SHASUMS256.txt
-sha256 4e22d926f054150002055474e452ed6cbb85860aa7dc5422213a2002ed9791d5  node-v10.15.3.tar.xz
+# From https://nodejs.org/dist/v10.16.3/SHASUMS256.txt
+sha256 7bf1123d7415964775b8f81fe6ec6dd5c3c08abb42bb71dfe4409dbeeba26bbd  node-v10.16.3.tar.xz
 
 # Hash for license file
-sha256 7ab373b3671d57d91078f5345ea9486443c9ca498eb9f8cf87dee2641a6fa09d  LICENSE
+sha256 2b0fe00a83916d0290c8531db25a827e18d01e7c4bf000e9a0f2e826604ba41e  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 2577239e19..5a143845d1 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 10.15.3
+NODEJS_VERSION = 10.16.3
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
