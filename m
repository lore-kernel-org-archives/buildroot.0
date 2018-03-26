From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 22:06:11 +0200
Subject: [Buildroot] [git commit] prosody: replace tweaked configuration by
 patches
Message-ID: <20180326200626.BA07483C52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1df9a5b5b2ffd5de88b2a3b4f2aaa9d38a7acf95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upgrading a tweaked configuration is painful, so stay with the
upstream configuration which is already installed, and just apply a
few patches.

Everybody could do its own configuration in its root filesystem
overlay.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: squash patches.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/prosody/0001-enable-syslog.patch |  25 +++++
 package/prosody/0002-add-pidfile.patch   |  26 +++++
 package/prosody/prosody.cfg.lua          | 184 -------------------------------
 package/prosody/prosody.mk               |  11 --
 4 files changed, 51 insertions(+), 195 deletions(-)

diff --git a/package/prosody/0001-enable-syslog.patch b/package/prosody/0001-enable-syslog.patch
new file mode 100644
index 0000000000..4bd0a15aed
--- /dev/null
+++ b/package/prosody/0001-enable-syslog.patch
@@ -0,0 +1,25 @@
+From 267b5d195be0f3a8f00ccf4ccb62e25a9c4e48eb Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 22 Oct 2017 08:44:01 +0200
+Subject: [PATCH] enable syslog
+
+note: the posix module is auto-loaded by default
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+diff --git a/prosody.cfg.lua.dist b/prosody.cfg.lua.dist
+index a0fc6c9e..af3cc0e4 100644
+--- a/prosody.cfg.lua.dist
++++ b/prosody.cfg.lua.dist
+@@ -163,7 +163,7 @@ archive_expires_after = "1w" -- Remove archived messages after 1 week
+ log = {
+ 	info = "prosody.log"; -- Change 'info' to 'debug' for verbose logging
+ 	error = "prosody.err";
+-	-- "*syslog"; -- Uncomment this for logging to syslog
++	"*syslog"; -- Uncomment this for logging to syslog
+ 	-- "*console"; -- Log to the console, useful for debugging with daemonize=false
+ }
+ 
+-- 
+2.11.0
+
diff --git a/package/prosody/0002-add-pidfile.patch b/package/prosody/0002-add-pidfile.patch
new file mode 100644
index 0000000000..b6af8dd822
--- /dev/null
+++ b/package/prosody/0002-add-pidfile.patch
@@ -0,0 +1,26 @@
+From 124d479195ac8ec1747b5b89fe4860d0e92c2aae Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 22 Oct 2017 08:58:11 +0200
+Subject: [PATCH] add pidfile
+
+see https://prosody.im/doc/configure#posix-only_options
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+diff --git a/prosody.cfg.lua.dist b/prosody.cfg.lua.dist
+index af3cc0e4..675db12f 100644
+--- a/prosody.cfg.lua.dist
++++ b/prosody.cfg.lua.dist
+@@ -181,6 +181,9 @@ log = {
+ -- Location of directory to find certificates in (relative to main config file):
+ certificates = "certs"
+ 
++-- This must match the PIDFILE used in S50prosody
++pidfile = "/var/run/prosody/prosody.pid"
++
+ ----------- Virtual hosts -----------
+ -- You need to add a VirtualHost entry for each domain you wish Prosody to serve.
+ -- Settings under each VirtualHost entry apply *only* to that host.
+-- 
+2.11.0
+
diff --git a/package/prosody/prosody.cfg.lua b/package/prosody/prosody.cfg.lua
deleted file mode 100644
index 8329c0ad4e..0000000000
--- a/package/prosody/prosody.cfg.lua
+++ /dev/null
@@ -1,184 +0,0 @@
--- Prosody Example Configuration File
---
--- Information on configuring Prosody can be found on our
--- website at http://prosody.im/doc/configure
---
--- Tip: You can check that the syntax of this file is correct
--- when you have finished by running: luac -p prosody.cfg.lua
--- If there are any errors, it will let you know what and where
--- they are, otherwise it will keep quiet.
---
--- The only thing left to do is rename this file to remove the .dist ending, and fill in the
--- blanks. Good luck, and happy Jabbering!
-
-
----------- Server-wide settings ----------
--- Settings in this section apply to the whole server and are the default settings
--- for any virtual hosts
-
--- This is a (by default, empty) list of accounts that are admins
--- for the server. Note that you must create the accounts separately
--- (see http://prosody.im/doc/creating_accounts for info)
--- Example: admins = { "user1 at example.com", "user2 at example.net" }
-admins = { }
-
--- Enable use of libevent for better performance under high load
--- For more information see: http://prosody.im/doc/libevent
---use_libevent = true;
-
--- This is the list of modules Prosody will load on startup.
--- It looks for mod_modulename.lua in the plugins folder, so make sure that exists too.
--- Documentation on modules can be found at: http://prosody.im/doc/modules
-modules_enabled = {
-
-	-- Generally required
-		"roster"; -- Allow users to have a roster. Recommended ;)
-		"saslauth"; -- Authentication for clients and servers. Recommended if you want to log in.
-		"tls"; -- Add support for secure TLS on c2s/s2s connections
-		"dialback"; -- s2s dialback support
-		"disco"; -- Service discovery
-
-	-- Not essential, but recommended
-		"private"; -- Private XML storage (for room bookmarks, etc.)
-		"vcard"; -- Allow users to set vCards
-	
-	-- These are commented by default as they have a performance impact
-		--"privacy"; -- Support privacy lists
-		--"compression"; -- Stream compression
-
-	-- Nice to have
-		"version"; -- Replies to server version requests
-		"uptime"; -- Report how long server has been running
-		"time"; -- Let others know the time here on this server
-		"ping"; -- Replies to XMPP pings with pongs
-		"pep"; -- Enables users to publish their mood, activity, playing music and more
-		"register"; -- Allow users to register on this server using a client and change passwords
-
-	-- Admin interfaces
-		"admin_adhoc"; -- Allows administration via an XMPP client that supports ad-hoc commands
-		--"admin_telnet"; -- Opens telnet console interface on localhost port 5582
-	
-	-- HTTP modules
-		--"bosh"; -- Enable BOSH clients, aka "Jabber over HTTP"
-		--"http_files"; -- Serve static files from a directory over HTTP
-
-	-- Other specific functionality
-		"posix"; -- POSIX functionality, sends server to background, enables syslog, etc.
-		--"groups"; -- Shared roster support
-		--"announce"; -- Send announcement to all online users
-		--"welcome"; -- Welcome users who register accounts
-		--"watchregistrations"; -- Alert admins of registrations
-		--"motd"; -- Send a message to users when they log in
-		--"legacyauth"; -- Legacy authentication. Only used by some old clients and bots.
-};
-
--- These modules are auto-loaded, but should you want
--- to disable them then uncomment them here:
-modules_disabled = {
-	-- "offline"; -- Store offline messages
-	-- "c2s"; -- Handle client connections
-	-- "s2s"; -- Handle server-to-server connections
-};
-
--- Disable account creation by default, for security
--- For more information see http://prosody.im/doc/creating_accounts
-allow_registration = false;
-
--- These are the SSL/TLS-related settings. If you don't want
--- to use SSL/TLS, you may comment or remove this
-ssl = {
-	key = "certs/localhost.key";
-	certificate = "certs/localhost.crt";
-}
-
--- Force clients to use encrypted connections? This option will
--- prevent clients from authenticating unless they are using encryption.
-
-c2s_require_encryption = false
-
--- Force certificate authentication for server-to-server connections?
--- This provides ideal security, but requires servers you communicate
--- with to support encryption AND present valid, trusted certificates.
--- NOTE: Your version of LuaSec must support certificate verification!
--- For more information see http://prosody.im/doc/s2s#security
-
-s2s_secure_auth = false
-
--- Many servers don't support encryption or have invalid or self-signed
--- certificates. You can list domains here that will not be required to
--- authenticate using certificates. They will be authenticated using DNS.
-
---s2s_insecure_domains = { "gmail.com" }
-
--- Even if you leave s2s_secure_auth disabled, you can still require valid
--- certificates for some domains by specifying a list here.
-
---s2s_secure_domains = { "jabber.org" }
-
--- Select the authentication backend to use. The 'internal' providers
--- use Prosody's configured data storage to store the authentication data.
--- To allow Prosody to offer secure authentication mechanisms to clients, the
--- default provider stores passwords in plaintext. If you do not trust your
--- server please see http://prosody.im/doc/modules/mod_auth_internal_hashed
--- for information about using the hashed backend.
-
-authentication = "internal_plain"
-
--- Select the storage backend to use. By default Prosody uses flat files
--- in its configured data directory, but it also supports more backends
--- through modules. An "sql" backend is included by default, but requires
--- additional dependencies. See http://prosody.im/doc/storage for more info.
-
---storage = "sql" -- Default is "internal"
-
--- For the "sql" backend, you can uncomment *one* of the below to configure:
---sql = { driver = "SQLite3", database = "prosody.sqlite" } -- Default. 'database' is the filename.
---sql = { driver = "MySQL", database = "prosody", username = "prosody", password = "secret", host = "localhost" }
---sql = { driver = "PostgreSQL", database = "prosody", username = "prosody", password = "secret", host = "localhost" }
-
--- Logging configuration
--- For advanced logging see http://prosody.im/doc/logging
-log = {
-	-- info = "prosody.log"; -- Change 'info' to 'debug' for verbose logging
-	-- error = "prosody.err";
-	"*syslog"; -- Logging to syslog
-	-- "*console"; -- Log to the console, useful for debugging with daemonize=false
-}
-
-pidfile = "/var/run/prosody/prosody.pid"
-
------------ Virtual hosts -----------
--- You need to add a VirtualHost entry for each domain you wish Prosody to serve.
--- Settings under each VirtualHost entry apply *only* to that host.
-
-VirtualHost "localhost"
-
-VirtualHost "example.com"
-	-- Assign this host a certificate for TLS, otherwise it would use the one
-	-- set in the global section (if any).
-	-- Note that old-style SSL on port 5223 only supports one certificate, and will always
-	-- use the global one.
-	ssl = {
-		key = "certs/example.com.key";
-		certificate = "certs/example.com.crt";
-	}
-
------- Components ------
--- You can specify components to add hosts that provide special services,
--- like multi-user conferences, and transports.
--- For more information on components, see http://prosody.im/doc/components
-
----Set up a MUC (multi-user chat) room server on conference.example.com:
---Component "conference.example.com" "muc"
-
--- Set up a SOCKS5 bytestream proxy for server-proxied file transfers:
---Component "proxy.example.com" "proxy65"
-
----Set up an external component (default component port is 5347)
---
--- External components allow adding various services, such as gateways/
--- transports to other networks like ICQ, MSN and Yahoo. For more info
--- see: http://prosody.im/doc/components#adding_an_external_component
---
---Component "gateway.example.com"
---	component_secret = "password"
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 3ff891909c..c5a83081dc 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -56,15 +56,4 @@ endef
 
 PROSODY_POST_INSTALL_TARGET_HOOKS += PROSODY_REMOVE_CERT_GENERATOR
 
-# 1. Enable posix functionality
-# 2. Log to syslog
-# 3. Specify pid file write location
-# 4. Enable virtual host example.com
-define PROSODY_TWEAK_DEFAULT_CONF
-	$(INSTALL) -D package/prosody/prosody.cfg.lua \
-		$(TARGET_DIR)/etc/prosody/prosody.cfg.lua
-endef
-
-PROSODY_POST_INSTALL_TARGET_HOOKS += PROSODY_TWEAK_DEFAULT_CONF
-
 $(eval $(generic-package))
