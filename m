From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 14:37:54 +0100
Subject: [Buildroot] [git commit] openssh: Move key generation to the start
	function of init script.
Message-ID: <20170226133801.7012480649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92b770cd825915d56ea8d92d063aebdf7ef270a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since there's not much point in generating missing host keys when the
init script is called with "stop", the call to ssh-keygen should not
be done inconditionally, but in the start function instead.

Signed-off-by: Ignacy Gaw??dzki <ignacy.gawedzki@green-communications.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
