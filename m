From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 20:20:39 +0200
Subject: [Buildroot] [git commit] jquery-keyboard: add .hash file
Message-ID: <20160615182522.C54847FE28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3af1257fc068b68be32fa3faf3a4258570c3db6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/d75/d7500f7e063b94e9991bacfd1df9fa5aa1967db0/
http://autobuild.buildroot.org/results/f48/f485ee75ec4c9b87f17b8b8dc1898590045474b4/

For some odd reason, the file on the autobuilder ended up getting prefixed
by these 7 bytes:

00000000  31 62 30 31 61 0d 0a 1f  8b 08 00 00 00 00 00 00  |1b01a...........|

And suffixed by these 7 bytes:

0001b020  00 0d 0a 30 0d 0a 0d 0a

Which then caused gzip to fail to extract it. It is not clear to me how this
could happen (Github glitz?  It looks suspiciously like HTTP/1.1 chunked
encoding going wrong, E.G.  0x1b01a = 110618 = tarball size) - but adding a
.hash file fixes it as the corruption gets detected and we fall back to our
s.b.o mirror.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jquery-keyboard/jquery-keyboard.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jquery-keyboard/jquery-keyboard.hash b/package/jquery-keyboard/jquery-keyboard.hash
new file mode 100644
index 0000000..7502867
--- /dev/null
+++ b/package/jquery-keyboard/jquery-keyboard.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 6a20a1cdc9367c218048125eeb6f78d775175a964b3b9b781a931b63c0f98c66  jquery-keyboard-v1.18.12.tar.gz
