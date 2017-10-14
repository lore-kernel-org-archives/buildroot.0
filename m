From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 14 Oct 2017 15:39:56 +0200
Subject: [Buildroot] [PATCH] prosody: bump to version 0.10.0
Message-ID: <20171014133956.25082-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this version is not restricted to Lua 5.1
the configure step is refactored with the variable PROSODY_CONF_OPTS

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/Config.in       |   4 +-
 package/prosody/prosody.cfg.lua | 128 ++++++++++++++++++++++++----------------
 package/prosody/prosody.hash    |   8 +--
 package/prosody/prosody.mk      |  29 +++++----
 4 files changed, 96 insertions(+), 73 deletions(-)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index 77eeb85ab..1bc79b7f2 100644
--- a/package/prosody/Config.in
+++ b/package/prosody/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PROSODY
 	bool "prosody"
-	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_LUAEXPAT # runtime
 	select BR2_PACKAGE_LUASEC # runtime
 	select BR2_PACKAGE_LUASOCKET # runtime
@@ -15,4 +15,4 @@ config BR2_PACKAGE_PROSODY
 	  https://prosody.im
 
 comment "prosody needs the lua interpreter"
-	depends on !BR2_PACKAGE_LUA_5_1 && !BR2_PACKAGE_LUAJIT
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
diff --git a/package/prosody/prosody.cfg.lua b/package/prosody/prosody.cfg.lua
index 8329c0ad4..af3cc0e48 100644
--- a/package/prosody/prosody.cfg.lua
+++ b/package/prosody/prosody.cfg.lua
@@ -1,10 +1,11 @@
 -- Prosody Example Configuration File
 --
 -- Information on configuring Prosody can be found on our
--- website at http://prosody.im/doc/configure
+-- website at https://prosody.im/doc/configure
 --
 -- Tip: You can check that the syntax of this file is correct
--- when you have finished by running: luac -p prosody.cfg.lua
+-- when you have finished by running this command:
+--     prosodyctl check config
 -- If there are any errors, it will let you know what and where
 -- they are, otherwise it will keep quiet.
 --
@@ -18,17 +19,22 @@
 
 -- This is a (by default, empty) list of accounts that are admins
 -- for the server. Note that you must create the accounts separately
--- (see http://prosody.im/doc/creating_accounts for info)
+-- (see https://prosody.im/doc/creating_accounts for info)
 -- Example: admins = { "user1 at example.com", "user2 at example.net" }
 admins = { }
 
 -- Enable use of libevent for better performance under high load
--- For more information see: http://prosody.im/doc/libevent
---use_libevent = true;
+-- For more information see: https://prosody.im/doc/libevent
+--use_libevent = true
+
+-- Prosody will always look in its source directory for modules, but
+-- this option allows you to specify additional locations where Prosody
+-- will look for modules first. For community modules, see https://modules.prosody.im/
+--plugin_paths = {}
 
 -- This is the list of modules Prosody will load on startup.
 -- It looks for mod_modulename.lua in the plugins folder, so make sure that exists too.
--- Documentation on modules can be found at: http://prosody.im/doc/modules
+-- Documentation for bundled modules can be found at: https://prosody.im/doc/modules
 modules_enabled = {
 
 	-- Generally required
@@ -39,38 +45,40 @@ modules_enabled = {
 		"disco"; -- Service discovery
 
 	-- Not essential, but recommended
+		"carbons"; -- Keep multiple clients in sync
+		"pep"; -- Enables users to publish their mood, activity, playing music and more
 		"private"; -- Private XML storage (for room bookmarks, etc.)
+		"blocklist"; -- Allow users to block communications with other users
 		"vcard"; -- Allow users to set vCards
-	
-	-- These are commented by default as they have a performance impact
-		--"privacy"; -- Support privacy lists
-		--"compression"; -- Stream compression
 
 	-- Nice to have
 		"version"; -- Replies to server version requests
 		"uptime"; -- Report how long server has been running
 		"time"; -- Let others know the time here on this server
 		"ping"; -- Replies to XMPP pings with pongs
-		"pep"; -- Enables users to publish their mood, activity, playing music and more
 		"register"; -- Allow users to register on this server using a client and change passwords
+		--"mam"; -- Store messages in an archive and allow users to access it
 
 	-- Admin interfaces
 		"admin_adhoc"; -- Allows administration via an XMPP client that supports ad-hoc commands
 		--"admin_telnet"; -- Opens telnet console interface on localhost port 5582
-	
+
 	-- HTTP modules
 		--"bosh"; -- Enable BOSH clients, aka "Jabber over HTTP"
+		--"websocket"; -- XMPP over WebSockets
 		--"http_files"; -- Serve static files from a directory over HTTP
 
 	-- Other specific functionality
-		"posix"; -- POSIX functionality, sends server to background, enables syslog, etc.
+		--"limits"; -- Enable bandwidth limiting for XMPP connections
 		--"groups"; -- Shared roster support
+		--"server_contact_info"; -- Publish contact information for this service
 		--"announce"; -- Send announcement to all online users
 		--"welcome"; -- Welcome users who register accounts
 		--"watchregistrations"; -- Alert admins of registrations
 		--"motd"; -- Send a message to users when they log in
 		--"legacyauth"; -- Legacy authentication. Only used by some old clients and bots.
-};
+		--"proxy65"; -- Enables a file transfer proxy service which clients behind NAT can use
+}
 
 -- These modules are auto-loaded, but should you want
 -- to disable them then uncomment them here:
@@ -78,37 +86,39 @@ modules_disabled = {
 	-- "offline"; -- Store offline messages
 	-- "c2s"; -- Handle client connections
 	-- "s2s"; -- Handle server-to-server connections
-};
+	-- "posix"; -- POSIX functionality, sends server to background, enables syslog, etc.
+}
 
 -- Disable account creation by default, for security
--- For more information see http://prosody.im/doc/creating_accounts
-allow_registration = false;
-
--- These are the SSL/TLS-related settings. If you don't want
--- to use SSL/TLS, you may comment or remove this
-ssl = {
-	key = "certs/localhost.key";
-	certificate = "certs/localhost.crt";
-}
+-- For more information see https://prosody.im/doc/creating_accounts
+allow_registration = false
 
 -- Force clients to use encrypted connections? This option will
 -- prevent clients from authenticating unless they are using encryption.
 
-c2s_require_encryption = false
+c2s_require_encryption = true
+
+-- Force servers to use encrypted connections? This option will
+-- prevent servers from authenticating unless they are using encryption.
+-- Note that this is different from authentication
+
+s2s_require_encryption = true
+
 
 -- Force certificate authentication for server-to-server connections?
 -- This provides ideal security, but requires servers you communicate
 -- with to support encryption AND present valid, trusted certificates.
 -- NOTE: Your version of LuaSec must support certificate verification!
--- For more information see http://prosody.im/doc/s2s#security
+-- For more information see https://prosody.im/doc/s2s#security
 
 s2s_secure_auth = false
 
--- Many servers don't support encryption or have invalid or self-signed
--- certificates. You can list domains here that will not be required to
--- authenticate using certificates. They will be authenticated using DNS.
+-- Some servers have invalid or self-signed certificates. You can list
+-- remote domains here that will not be required to authenticate using
+-- certificates. They will be authenticated using DNS instead, even
+-- when s2s_secure_auth is enabled.
 
---s2s_insecure_domains = { "gmail.com" }
+--s2s_insecure_domains = { "insecure.example" }
 
 -- Even if you leave s2s_secure_auth disabled, you can still require valid
 -- certificates for some domains by specifying a list here.
@@ -119,15 +129,15 @@ s2s_secure_auth = false
 -- use Prosody's configured data storage to store the authentication data.
 -- To allow Prosody to offer secure authentication mechanisms to clients, the
 -- default provider stores passwords in plaintext. If you do not trust your
--- server please see http://prosody.im/doc/modules/mod_auth_internal_hashed
+-- server please see https://prosody.im/doc/modules/mod_auth_internal_hashed
 -- for information about using the hashed backend.
 
-authentication = "internal_plain"
+authentication = "internal_hashed"
 
 -- Select the storage backend to use. By default Prosody uses flat files
 -- in its configured data directory, but it also supports more backends
 -- through modules. An "sql" backend is included by default, but requires
--- additional dependencies. See http://prosody.im/doc/storage for more info.
+-- additional dependencies. See https://prosody.im/doc/storage for more info.
 
 --storage = "sql" -- Default is "internal"
 
@@ -136,16 +146,40 @@ authentication = "internal_plain"
 --sql = { driver = "MySQL", database = "prosody", username = "prosody", password = "secret", host = "localhost" }
 --sql = { driver = "PostgreSQL", database = "prosody", username = "prosody", password = "secret", host = "localhost" }
 
+
+-- Archiving configuration
+-- If mod_mam is enabled, Prosody will store a copy of every message. This
+-- is used to synchronize conversations between multiple clients, even if
+-- they are offline. This setting controls how long Prosody will keep
+-- messages in the archive before removing them.
+
+archive_expires_after = "1w" -- Remove archived messages after 1 week
+
+-- You can also configure messages to be stored in-memory only. For more
+-- archiving options, see https://prosody.im/doc/modules/mod_mam
+
 -- Logging configuration
--- For advanced logging see http://prosody.im/doc/logging
+-- For advanced logging see https://prosody.im/doc/logging
 log = {
-	-- info = "prosody.log"; -- Change 'info' to 'debug' for verbose logging
-	-- error = "prosody.err";
-	"*syslog"; -- Logging to syslog
+	info = "prosody.log"; -- Change 'info' to 'debug' for verbose logging
+	error = "prosody.err";
+	"*syslog"; -- Uncomment this for logging to syslog
 	-- "*console"; -- Log to the console, useful for debugging with daemonize=false
 }
 
-pidfile = "/var/run/prosody/prosody.pid"
+-- Uncomment to enable statistics
+-- For more info see https://prosody.im/doc/statistics
+-- statistics = "internal"
+
+-- Certificates
+-- Every virtual host and component needs a certificate so that clients and
+-- servers can securely verify its identity. Prosody will automatically load
+-- certificates/keys from the directory specified here.
+-- For more information, including how to use 'prosodyctl' to auto-import certificates
+-- (from e.g. Let's Encrypt) see https://prosody.im/doc/certificates
+
+-- Location of directory to find certificates in (relative to main config file):
+certificates = "certs"
 
 ----------- Virtual hosts -----------
 -- You need to add a VirtualHost entry for each domain you wish Prosody to serve.
@@ -153,32 +187,22 @@ pidfile = "/var/run/prosody/prosody.pid"
 
 VirtualHost "localhost"
 
-VirtualHost "example.com"
-	-- Assign this host a certificate for TLS, otherwise it would use the one
-	-- set in the global section (if any).
-	-- Note that old-style SSL on port 5223 only supports one certificate, and will always
-	-- use the global one.
-	ssl = {
-		key = "certs/example.com.key";
-		certificate = "certs/example.com.crt";
-	}
+--VirtualHost "example.com"
+--	certificate = "/path/to/example.crt"
 
 ------ Components ------
 -- You can specify components to add hosts that provide special services,
 -- like multi-user conferences, and transports.
--- For more information on components, see http://prosody.im/doc/components
+-- For more information on components, see https://prosody.im/doc/components
 
 ---Set up a MUC (multi-user chat) room server on conference.example.com:
 --Component "conference.example.com" "muc"
 
--- Set up a SOCKS5 bytestream proxy for server-proxied file transfers:
---Component "proxy.example.com" "proxy65"
-
 ---Set up an external component (default component port is 5347)
 --
 -- External components allow adding various services, such as gateways/
 -- transports to other networks like ICQ, MSN and Yahoo. For more info
--- see: http://prosody.im/doc/components#adding_an_external_component
+-- see: https://prosody.im/doc/components#adding_an_external_component
 --
 --Component "gateway.example.com"
 --	component_secret = "password"
diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 38942ea7f..d56099456 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://prosody.im/downloads/source/{MD5,SHA1,SHA256,SHA512}SUMS
-md5    d743adea6cfbaacc3a24cc0c3928bb1b  prosody-0.9.12.tar.gz
-sha1   1ee224263a5b3d67960e12edbbe6b2f16b95d147  prosody-0.9.12.tar.gz
-sha256 1a59a322b71928a21985522aa00d0eab3552208d7bf9ecb318542a1b2fee3e8d  prosody-0.9.12.tar.gz
-sha512 e87b5f3b3e327722cec9d8d0470684e2ec2788a1c5ae623c4f505a00572ef21f65afe84cd5b7de47d6a65fe8872506fe34e5e8886e20979ff84710669857ca76  prosody-0.9.12.tar.gz
+md5    0eebf7a18ce1fc7dd9954c94ebd85f54  prosody-0.10.0.tar.gz
+sha1   57c1c5a665e6453bdde06727ef398cd69accd9d7  prosody-0.10.0.tar.gz
+sha256 7414e447256c60b2645578c4a5913113cd74b419ca5a032b54db90d98a978498  prosody-0.10.0.tar.gz
+sha512 ee66e240afba6a8cb286623da48d9b535798153fb65e32070cec93aafe360e91f7087eeb49dec0f7d145e24f04339ed0878e50835b52f682130b204e22990ce9  prosody-0.10.0.tar.gz
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index f7a325b46..c51fa6660 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,30 +4,29 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.9.12
+PROSODY_VERSION = 0.10.0
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-PROSODY_DEPENDENCIES = openssl libidn
+PROSODY_DEPENDENCIES = host-luainterpreter luainterpreter libidn openssl
 
-ifeq ($(BR2_PACKAGE_LUA_5_1),y)
-PROSODY_DEPENDENCIES += lua
-endif
+PROSODY_CONF_OPTS = \
+	--with-lua-bin="$(HOST_DIR)/usr/bin" \
+	--with-lua="$(STAGING_DIR)/usr" \
+	--lua-version=$(LUAINTERPRETER_ABIVER) \
+	--c-compiler=$(TARGET_CC) \
+	--cflags="$(TARGET_CFLAGS)" \
+	--linker=$(TARGET_CC) \
+	--ldflags="$(TARGET_LDFLAGS) -shared" \
+	--sysconfdir=/etc/prosody \
+	--prefix="/usr"
 
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
-PROSODY_DEPENDENCIES += luajit
+PROSODY_CONF_OPTS += --runwith=luajit
 endif
 
 define PROSODY_CONFIGURE_CMDS
-	cd $(@D) && \
-		$(TARGET_CONFIGURE_OPTS) \
-		./configure --prefix=/usr \
-		--c-compiler=$(TARGET_CC) \
-		--cflags="$(TARGET_CFLAGS)" \
-		--linker=$(TARGET_CC) \
-		--ldflags="$(TARGET_LDFLAGS) -shared" \
-		--sysconfdir=/etc/prosody \
-		--with-lua=$(STAGING_DIR)/usr
+	cd $(@D) && ./configure $(PROSODY_CONF_OPTS)
 endef
 
 define PROSODY_BUILD_CMDS
-- 
2.11.0
