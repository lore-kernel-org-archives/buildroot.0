From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 13 Jul 2015 00:55:13 +0200
Subject: [Buildroot] [PATCH v2] skeleton: apply locale settings in user
	shells
In-Reply-To: <1421684056-5266-6-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-6-git-send-email-maxtram95@gmail.com>
Message-ID: <1436741713-27300-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxim Mikityanskiy <maxtram95@gmail.com>

Add /etc/profile.d/locale.sh script from Arch Linux to /etc/profile.
This script looks for locale.conf, sources it, and exports the LANG and
LC_* variables.

[Arnout: put in /etc/profile in the skeleton rather than making it
 systemd specific.]

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2 [Arnout]: make the modification to /etc/profile in the skeleton
rather than something systemd-specific - proposed by Samuel Martin.
---
 system/skeleton/etc/profile | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index 3812dda..c7438fe 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -35,6 +35,29 @@ if [ "$PS1" ]; then
 
 fi;
 
+if [ -z "$LANG" ]; then
+  if [ -n $HOME ] && [ -r $HOME/.config/locale.conf ]; then
+    . "$HOME/.config/locale.conf"
+  elif [ -r /etc/locale.conf ]; then
+    . /etc/locale.conf
+  fi
+fi
+
+LANG=${LANG:-C}
+export LANG
+[ -n "$LC_CTYPE" ]          && export LC_CTYPE
+[ -n "$LC_NUMERIC" ]        && export LC_NUMERIC
+[ -n "$LC_TIME" ]           && export LC_TIME
+[ -n "$LC_COLLATE" ]        && export LC_COLLATE
+[ -n "$LC_MONETARY" ]       && export LC_MONETARY
+[ -n "$LC_MESSAGES" ]       && export LC_MESSAGES
+[ -n "$LC_PAPER" ]          && export LC_PAPER
+[ -n "$LC_NAME" ]           && export LC_NAME
+[ -n "$LC_ADDRESS" ]        && export LC_ADDRESS
+[ -n "$LC_TELEPHONE" ]      && export LC_TELEPHONE
+[ -n "$LC_MEASUREMENT" ]    && export LC_MEASUREMENT
+[ -n "$LC_IDENTIFICATION" ] && export LC_IDENTIFICATION
+
 # Source configuration files from /etc/profile.d
 for i in /etc/profile.d/*.sh ; do
     if [ -r "$i" ]; then
-- 
2.1.4
