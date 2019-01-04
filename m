From: David J. Fogle <Dave@exitstrategytech.com>
Date: Fri, 4 Jan 2019 21:35:23 +0000
Subject: [Buildroot] [PATCH] package/systemd: set vconsole support option to
 default y
Message-ID: <1dc021862b1041c3990d6ce25bb331ca@exitstrategytech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


package/systemd:? set vconsole support option to default y

Without this support option enabled, systemd does not allow vterm switching, and could possibly lead to user lockout on tty1. 

We prevent these scenarios by enabling the vconsole tool default y, as console login is much more prevalent than not. This allows the option to disable the tool if needed, but as this is a rare usage, it is better to let a user decide they do *not* need it than to expect them to know they *do*.

Any serial connections will not be impacted by absence of this tool, as there are no vconsoles on serial.

Signed-off-by: David Fogle <dave@exitstrategytech.com>
---
?package/systemd/Config.in | 1 +
?1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 25f322e8f3..920b65db44 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -325,6 +325,7 @@ config BR2_PACKAGE_SYSTEMD_TMPFILES
?
?config BR2_PACKAGE_SYSTEMD_VCONSOLE
??????? bool "enable vconsole tool"
+?????? default y
??????? help
????????? systemd-vconsole-setup is an early boot service that
????????? configures the virtual console font and console keymap.
-- 
2.19.2
