From: Stephan Henningsen <stephan@asklandd.dk>
Date: Tue,  5 Nov 2019 23:42:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/sudo: make adding 'sudo' group+rule
 optional
Message-ID: <20191105224229.20488-1-stephan@asklandd.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stephan Henningsen <stephan+buildroot@asklandd.dk>

I have concerns about the change that was made to my original patch;
Instead of having the 'sudo' group and sudoers rule enabled by the user
manually and thereby giving her concent, a change was made to apply the
option silently.

While I do understand that making this all default will make the user
experience a bit smoother, I fear that this won't be the case for
everyone.

My motivations for making it an option to begin with (and for this
follow-up patch) are the following:

1) Not everyone may be interested in the added rule to /etc/sudoers; it
may even conflict with a custom rule. For example if a custom rule was
added that does not prompt for user password, then the newly added rule,
which does prompt for user password, maybe break automated cronjobs that
rely on sudo for elevated priviledges without a password prompt.

2) Adding this group and rule is only one of many use-cases of the sudo
package; some people may prefer adding custom rules that only allow
certain well-known users (e.g. alice, bob) or certain system groups
(e.g. wheel, daemon) to become root.  These users may have to manually
revert the changes now done to their /etc/sudoers.

3) If only a little, this addition adds to the size of the system's
attack surface, potentially inadvertently allowing users to become root.

4) Not everyone may be interested in the added non-standard system group
'sudo'; they may even have to manually revert the changes now done to
their /etc/groups to trim it.

5) We're chaning default behavior of a security-critical package that may
affect systems that have run in production of years.

Most of this is just speculation, of course.  But the fact remains that
the default behavior of a package that deals with elevating user
priviledges has been changed, and for no real reason at all.  "If it ain't
broke, don't fix it" certain seems fitting, I think.

Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
---
 package/sudo/Config.in | 13 +++++++++++++
 package/sudo/sudo.mk   |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index cbef15d67b..982a4ffaa8 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -9,3 +9,16 @@ config BR2_PACKAGE_SUDO
 	  but still allow people to get their work done.
 
 	  http://www.sudo.ws/sudo/
+
+if BR2_PACKAGE_SUDO
+
+config BR2_PACKAGE_SUDO_GROUP_AND_RULE
+	bool "add group 'sudo' and enable associated sudoers rule"
+	default n
+	help
+	  Creates a group named 'sudo', and enables the following rule
+	  in the /etc/sudoers configuration file that allows members of
+	  group 'sudo' to execute any command as root:
+
+	  %sudo ALL=(ALL) ALL
+endif
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 7d52eb0b57..b8c3924d8a 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -74,9 +74,11 @@ define SUDO_USERS
 	- - sudo -1 - - - -
 endef
 
+ifeq ($(BR2_PACKAGE_SUDO_GROUP_AND_RULE),y)
 define SUDO_ENABLE_SUDO_GROUP_RULE
 	$(SED) '/^# \%sudo\tALL=(ALL) ALL/s/^# //' $(TARGET_DIR)/etc/sudoers
 endef
 SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_ENABLE_SUDO_GROUP_RULE
+endif
 
 $(eval $(autotools-package))
-- 
2.17.1
