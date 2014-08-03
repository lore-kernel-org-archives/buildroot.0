From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat,  2 Aug 2014 21:21:19 -0400
Subject: [Buildroot] [PATCH 1/1] openssh: replace individual ssh-keygen
	calls with a single call
Message-ID: <1407028879-2004-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since openssh-6.0, the ssh-keygen app has supported a -A option,
which creates any missing keys.  This frees us of having to add
new ssh-keygen invocations as new key types are introduced.  This
also frees us of having to know the default key names and locations.
So this patch replaces all the the init.d script invocations with
a single "ssh-keygen -A" call.

Note: the systemd service script *already* uses this option.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/openssh/S50sshd |   34 ++--------------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index d3abf7c..65bdb90 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -6,38 +6,8 @@
 # Make sure the ssh-keygen progam exists
 [ -f /usr/bin/ssh-keygen ] || exit 0
 
-# Check for the SSH1 RSA key
-if [ ! -f /etc/ssh_host_key ] ; then
-	echo Generating RSA Key...
-	/usr/bin/ssh-keygen -t rsa1 -f /etc/ssh_host_key -C '' -N ''
-fi
-
-# Check for the SSH2 RSA key
-if [ ! -f /etc/ssh_host_rsa_key ] ; then
-	echo Generating RSA Key...
-	/usr/bin/ssh-keygen -t rsa -f /etc/ssh_host_rsa_key -C '' -N ''
-fi
-
-# Check for the SSH2 DSA key
-if [ ! -f /etc/ssh_host_dsa_key ] ; then
-	echo Generating DSA Key...
-	echo
-	/usr/bin/ssh-keygen -t dsa -f /etc/ssh_host_dsa_key -C '' -N ''
-fi
-
-# Check for the SSH2 ECDSA key
-if [ ! -f /etc/ssh_host_ecdsa_key ]; then
-	echo Generating ECDSA Key...
-	echo
-	/usr/bin/ssh-keygen -t ecdsa -f /etc/ssh_host_ecdsa_key -C '' -N ''
-fi
-
-# Check for the ed25519 key
-if [ ! -f /etc/ssh_host_ed25519_key ]; then
-	echo Generating ed25519 Key...
-	echo
-	/usr/bin/ssh-keygen -t ed25519 -f /etc/ssh_host_ed25519_key -C '' -N ''
-fi
+# Create any missing keys
+/usr/bin/ssh-keygen -A
 
 umask 077
 
-- 
1.7.9.5
