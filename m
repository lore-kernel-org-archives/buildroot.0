From: Ignacy =?iso-8859-2?Q?Gaw=EAdzki?= <ignacy.gawedzki@green-communications.fr>
Date: Fri, 24 Feb 2017 15:26:24 +0100
Subject: [Buildroot] [PATCH] openssh: Move key generation to the start
 function of init script.
Message-ID: <20170224142623.yldyeed3aif3w6de@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since there's not much point in generating missing host keys when the
init script is called with "stop", the call to ssh-keygen should not
be done inconditionally, but in the start function instead.

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
---
 package/openssh/S50sshd | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index c151142..22da41d 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -6,12 +6,12 @@
 # Make sure the ssh-keygen progam exists
 [ -f /usr/bin/ssh-keygen ] || exit 0
 
-# Create any missing keys
-/usr/bin/ssh-keygen -A
-
 umask 077
 
 start() {
+	# Create any missing keys
+	/usr/bin/ssh-keygen -A
+
 	printf "Starting sshd: "
 	/usr/sbin/sshd
 	touch /var/lock/sshd
-- 
2.9.3
