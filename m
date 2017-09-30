From: nidujay <nidujay@gmail.com>
Date: Sun, 1 Oct 2017 09:14:53 +1100
Subject: [Buildroot] [PATCH v3 1/1] package/prosody: new package
In-Reply-To: <1506809333-5130-1-git-send-email-nidujay@gmail.com>
References: <1506809333-5130-1-git-send-email-nidujay@gmail.com>
Message-ID: <CABSQcyiqjjQWeJbQzRTzZwBe8y==mfKH=swTfteb1nJcsq5wzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please ignore this as it starts a new thread. Apologies for the noise.

Dushara

On 1 October 2017 at 09:08, Dushara Jayasinghe <nidujay@gmail.com> wrote:

> As stated by the upstream developers, Prosody only supports
> lua-5.1 or luajit (which is a lua-5.1 interpreter):
>
> > Response from zash at zash.se:
> >
> >> I pegged the package to lua 5,1 based on the contents of the
> >> INSTALL file. Is this a hard requirement?
> >
> > Up until Prosody 0.9 Lua 5.1 is required. However LuaJIT
> > implements Lua 5.1 so it works.
>
> The license terms are not very consistent: the source files all
> state to be "MIT/X11 licensed" and defer to the COPYING file for
> details, but that file only has the text for the MIT license.
> Thus, we believe the license to be MIT/X11, as stated in the source
> files.
>
> This installs the base system with certificates for two domains:
> localhost and example.com
>
> The default runtime configuration is tweaked during installation
> to properly setup logging and pid-file directories.
>
> Prosody doesn't like being executed as root, and thus the daemon
> is executed as the user prosody. The startup script creates the
> pid file write location with appropriate permissions.
>
> Signed-off-by: Dushara Jayasinghe <nidujay@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> Chanes v2 -> v3:
>   - Create prosody group for patch file
>   - Use pidfile in service termination
>   - Remove superfluous _SOURCE line (Suggested by Yann E. Morin)
>
>  DEVELOPERS                      |   3 +
>  package/Config.in               |   1 +
>  package/prosody/Config.in       |  18 ++++
>  package/prosody/S50prosody      |  44 ++++++++++
>  package/prosody/prosody.cfg.lua | 184 ++++++++++++++++++++++++++++++
> ++++++++++
>  package/prosody/prosody.hash    |   5 ++
>  package/prosody/prosody.mk      |  69 +++++++++++++++
>  7 files changed, 324 insertions(+)
>  create mode 100644 package/prosody/Config.in
>  create mode 100644 package/prosody/S50prosody
>  create mode 100644 package/prosody/prosody.cfg.lua
>  create mode 100644 package/prosody/prosody.hash
>  create mode 100644 package/prosody/prosody.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f3944e2..c415ef9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -485,6 +485,9 @@ F:  package/nss-pam-ldapd/
>  F:     package/sp-oops-extract/
>  F:     package/unscd/
>
> +N:     Dushara Jayasinghe <nidujay@gmail.com>
> +F:     package/prosody/
> +
>  N:     Ed Swierk <eswierk@skyportsystems.com>
>  F:     package/xxhash/
>
> diff --git a/package/Config.in b/package/Config.in
> index a21c5f0..4291d97 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1716,6 +1716,7 @@ endif
>         source "package/pptp-linux/Config.in"
>         source "package/privoxy/Config.in"
>         source "package/proftpd/Config.in"
> +       source "package/prosody/Config.in"
>         source "package/proxychains-ng/Config.in"
>         source "package/ptpd/Config.in"
>         source "package/ptpd2/Config.in"
> diff --git a/package/prosody/Config.in b/package/prosody/Config.in
> new file mode 100644
> index 0000000..77eeb85
> --- /dev/null
> +++ b/package/prosody/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_PROSODY
> +       bool "prosody"
> +       depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
> +       select BR2_PACKAGE_LUAEXPAT # runtime
> +       select BR2_PACKAGE_LUASEC # runtime
> +       select BR2_PACKAGE_LUASOCKET # runtime
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_LIBIDN
> +       select BR2_PACKAGE_LUAFILESYSTEM # runtime
> +       help
> +         Prosody is a modern XMPP communication server. It aims to be
> +         easy to set up and configure, and efficient with system
> +         resources.
> +
> +         https://prosody.im
> +
> +comment "prosody needs the lua interpreter"
> +       depends on !BR2_PACKAGE_LUA_5_1 && !BR2_PACKAGE_LUAJIT
> diff --git a/package/prosody/S50prosody b/package/prosody/S50prosody
> new file mode 100644
> index 0000000..84913a5
> --- /dev/null
> +++ b/package/prosody/S50prosody
> @@ -0,0 +1,44 @@
> +#! /bin/sh
> +
> +NAME=prosody
> +DAEMON=/usr/bin/$NAME
> +
> +# This must match the pidfile field in
> +# /etc/prosody/prosody.cfg.lua
> +
> +PIDDIR=/var/run/$NAME
> +PIDFILE=$PIDDIR/$NAME.pid
> +
> +# Gracefully exit if the package has been removed.
> +test -x $DAEMON || exit 0
> +
> +case "$1" in
> +  start)
> +    printf "Starting $NAME: "
> +    mkdir -p $PIDDIR
> +    chown $NAME:$NAME $PIDDIR
> +    start-stop-daemon -S -q -o -x $DAEMON -c $NAME
> +    [ $? = 0 ] && echo "OK" || echo "FAIL"
> +    ;;
> +  stop)
> +    printf "Stopping $NAME: "
> +    # The standard method of identifying the name doesn't
> +    # work as the process name is lua. So use the pidfile
> +    # which is created by the service itself as a match
> +    # criteria when stopping the service
> +    start-stop-daemon -K -q -o -p "$PIDFILE"
> +    [ $? = 0 ] && echo "OK" || echo "FAIL"
> +    ;;
> +  restart|reload)
> +    echo "Restarting $NAME: "
> +    $0 stop
> +    sleep 1
> +    $0 start
> +    ;;
> +  *)
> +    echo "Usage: $0 {start|stop|restart|reload}" >&2
> +    exit 1
> +    ;;
> +esac
> +
> +exit 0
> diff --git a/package/prosody/prosody.cfg.lua
> b/package/prosody/prosody.cfg.lua
> new file mode 100644
> index 0000000..8329c0a
> --- /dev/null
> +++ b/package/prosody/prosody.cfg.lua
> @@ -0,0 +1,184 @@
> +-- Prosody Example Configuration File
> +--
> +-- Information on configuring Prosody can be found on our
> +-- website at http://prosody.im/doc/configure
> +--
> +-- Tip: You can check that the syntax of this file is correct
> +-- when you have finished by running: luac -p prosody.cfg.lua
> +-- If there are any errors, it will let you know what and where
> +-- they are, otherwise it will keep quiet.
> +--
> +-- The only thing left to do is rename this file to remove the .dist
> ending, and fill in the
> +-- blanks. Good luck, and happy Jabbering!
> +
> +
> +---------- Server-wide settings ----------
> +-- Settings in this section apply to the whole server and are the default
> settings
> +-- for any virtual hosts
> +
> +-- This is a (by default, empty) list of accounts that are admins
> +-- for the server. Note that you must create the accounts separately
> +-- (see http://prosody.im/doc/creating_accounts for info)
> +-- Example: admins = { "user1 at example.com", "user2 at example.net" }
> +admins = { }
> +
> +-- Enable use of libevent for better performance under high load
> +-- For more information see: http://prosody.im/doc/libevent
> +--use_libevent = true;
> +
> +-- This is the list of modules Prosody will load on startup.
> +-- It looks for mod_modulename.lua in the plugins folder, so make sure
> that exists too.
> +-- Documentation on modules can be found at:
> http://prosody.im/doc/modules
> +modules_enabled = {
> +
> +       -- Generally required
> +               "roster"; -- Allow users to have a roster. Recommended ;)
> +               "saslauth"; -- Authentication for clients and servers.
> Recommended if you want to log in.
> +               "tls"; -- Add support for secure TLS on c2s/s2s connections
> +               "dialback"; -- s2s dialback support
> +               "disco"; -- Service discovery
> +
> +       -- Not essential, but recommended
> +               "private"; -- Private XML storage (for room bookmarks,
> etc.)
> +               "vcard"; -- Allow users to set vCards
> +
> +       -- These are commented by default as they have a performance impact
> +               --"privacy"; -- Support privacy lists
> +               --"compression"; -- Stream compression
> +
> +       -- Nice to have
> +               "version"; -- Replies to server version requests
> +               "uptime"; -- Report how long server has been running
> +               "time"; -- Let others know the time here on this server
> +               "ping"; -- Replies to XMPP pings with pongs
> +               "pep"; -- Enables users to publish their mood, activity,
> playing music and more
> +               "register"; -- Allow users to register on this server
> using a client and change passwords
> +
> +       -- Admin interfaces
> +               "admin_adhoc"; -- Allows administration via an XMPP client
> that supports ad-hoc commands
> +               --"admin_telnet"; -- Opens telnet console interface on
> localhost port 5582
> +
> +       -- HTTP modules
> +               --"bosh"; -- Enable BOSH clients, aka "Jabber over HTTP"
> +               --"http_files"; -- Serve static files from a directory
> over HTTP
> +
> +       -- Other specific functionality
> +               "posix"; -- POSIX functionality, sends server to
> background, enables syslog, etc.
> +               --"groups"; -- Shared roster support
> +               --"announce"; -- Send announcement to all online users
> +               --"welcome"; -- Welcome users who register accounts
> +               --"watchregistrations"; -- Alert admins of registrations
> +               --"motd"; -- Send a message to users when they log in
> +               --"legacyauth"; -- Legacy authentication. Only used by
> some old clients and bots.
> +};
> +
> +-- These modules are auto-loaded, but should you want
> +-- to disable them then uncomment them here:
> +modules_disabled = {
> +       -- "offline"; -- Store offline messages
> +       -- "c2s"; -- Handle client connections
> +       -- "s2s"; -- Handle server-to-server connections
> +};
> +
> +-- Disable account creation by default, for security
> +-- For more information see http://prosody.im/doc/creating_accounts
> +allow_registration = false;
> +
> +-- These are the SSL/TLS-related settings. If you don't want
> +-- to use SSL/TLS, you may comment or remove this
> +ssl = {
> +       key = "certs/localhost.key";
> +       certificate = "certs/localhost.crt";
> +}
> +
> +-- Force clients to use encrypted connections? This option will
> +-- prevent clients from authenticating unless they are using encryption.
> +
> +c2s_require_encryption = false
> +
> +-- Force certificate authentication for server-to-server connections?
> +-- This provides ideal security, but requires servers you communicate
> +-- with to support encryption AND present valid, trusted certificates.
> +-- NOTE: Your version of LuaSec must support certificate verification!
> +-- For more information see http://prosody.im/doc/s2s#security
> +
> +s2s_secure_auth = false
> +
> +-- Many servers don't support encryption or have invalid or self-signed
> +-- certificates. You can list domains here that will not be required to
> +-- authenticate using certificates. They will be authenticated using DNS.
> +
> +--s2s_insecure_domains = { "gmail.com" }
> +
> +-- Even if you leave s2s_secure_auth disabled, you can still require valid
> +-- certificates for some domains by specifying a list here.
> +
> +--s2s_secure_domains = { "jabber.org" }
> +
> +-- Select the authentication backend to use. The 'internal' providers
> +-- use Prosody's configured data storage to store the authentication data.
> +-- To allow Prosody to offer secure authentication mechanisms to clients,
> the
> +-- default provider stores passwords in plaintext. If you do not trust
> your
> +-- server please see http://prosody.im/doc/modules/
> mod_auth_internal_hashed
> +-- for information about using the hashed backend.
> +
> +authentication = "internal_plain"
> +
> +-- Select the storage backend to use. By default Prosody uses flat files
> +-- in its configured data directory, but it also supports more backends
> +-- through modules. An "sql" backend is included by default, but requires
> +-- additional dependencies. See http://prosody.im/doc/storage for more
> info.
> +
> +--storage = "sql" -- Default is "internal"
> +
> +-- For the "sql" backend, you can uncomment *one* of the below to
> configure:
> +--sql = { driver = "SQLite3", database = "prosody.sqlite" } -- Default.
> 'database' is the filename.
> +--sql = { driver = "MySQL", database = "prosody", username = "prosody",
> password = "secret", host = "localhost" }
> +--sql = { driver = "PostgreSQL", database = "prosody", username =
> "prosody", password = "secret", host = "localhost" }
> +
> +-- Logging configuration
> +-- For advanced logging see http://prosody.im/doc/logging
> +log = {
> +       -- info = "prosody.log"; -- Change 'info' to 'debug' for verbose
> logging
> +       -- error = "prosody.err";
> +       "*syslog"; -- Logging to syslog
> +       -- "*console"; -- Log to the console, useful for debugging with
> daemonize=false
> +}
> +
> +pidfile = "/var/run/prosody/prosody.pid"
> +
> +----------- Virtual hosts -----------
> +-- You need to add a VirtualHost entry for each domain you wish Prosody
> to serve.
> +-- Settings under each VirtualHost entry apply *only* to that host.
> +
> +VirtualHost "localhost"
> +
> +VirtualHost "example.com"
> +       -- Assign this host a certificate for TLS, otherwise it would use
> the one
> +       -- set in the global section (if any).
> +       -- Note that old-style SSL on port 5223 only supports one
> certificate, and will always
> +       -- use the global one.
> +       ssl = {
> +               key = "certs/example.com.key";
> +               certificate = "certs/example.com.crt";
> +       }
> +
> +------ Components ------
> +-- You can specify components to add hosts that provide special services,
> +-- like multi-user conferences, and transports.
> +-- For more information on components, see http://prosody.im/doc/
> components
> +
> +---Set up a MUC (multi-user chat) room server on conference.example.com:
> +--Component "conference.example.com" "muc"
> +
> +-- Set up a SOCKS5 bytestream proxy for server-proxied file transfers:
> +--Component "proxy.example.com" "proxy65"
> +
> +---Set up an external component (default component port is 5347)
> +--
> +-- External components allow adding various services, such as gateways/
> +-- transports to other networks like ICQ, MSN and Yahoo. For more info
> +-- see: http://prosody.im/doc/components#adding_an_external_component
> +--
> +--Component "gateway.example.com"
> +--     component_secret = "password"
> diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
> new file mode 100644
> index 0000000..38942ea
> --- /dev/null
> +++ b/package/prosody/prosody.hash
> @@ -0,0 +1,5 @@
> +# Hashes from: https://prosody.im/downloads/source/{MD5,SHA1,SHA256,
> SHA512}SUMS
> +md5    d743adea6cfbaacc3a24cc0c3928bb1b  prosody-0.9.12.tar.gz
> +sha1   1ee224263a5b3d67960e12edbbe6b2f16b95d147  prosody-0.9.12.tar.gz
> +sha256 1a59a322b71928a21985522aa00d0eab3552208d7bf9ecb318542a1b2fee3e8d
> prosody-0.9.12.tar.gz
> +sha512 e87b5f3b3e327722cec9d8d0470684e2ec2788a1c5ae623c4f505a00572e
> f21f65afe84cd5b7de47d6a65fe8872506fe34e5e8886e20979ff84710669857ca76
> prosody-0.9.12.tar.gz
> diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
> new file mode 100644
> index 0000000..f7a325b
> --- /dev/null
> +++ b/package/prosody/prosody.mk
> @@ -0,0 +1,69 @@
> +###########################################################
> #####################
> +#
> +# prosody
> +#
> +###########################################################
> #####################
> +
> +PROSODY_VERSION = 0.9.12
> +PROSODY_SITE = https://prosody.im/downloads/source
> +PROSODY_LICENSE = MIT
> +PROSODY_LICENSE_FILES = COPYING
> +PROSODY_DEPENDENCIES = openssl libidn
> +
> +ifeq ($(BR2_PACKAGE_LUA_5_1),y)
> +PROSODY_DEPENDENCIES += lua
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +PROSODY_DEPENDENCIES += luajit
> +endif
> +
> +define PROSODY_CONFIGURE_CMDS
> +       cd $(@D) && \
> +               $(TARGET_CONFIGURE_OPTS) \
> +               ./configure --prefix=/usr \
> +               --c-compiler=$(TARGET_CC) \
> +               --cflags="$(TARGET_CFLAGS)" \
> +               --linker=$(TARGET_CC) \
> +               --ldflags="$(TARGET_LDFLAGS) -shared" \
> +               --sysconfdir=/etc/prosody \
> +               --with-lua=$(STAGING_DIR)/usr
> +endef
> +
> +define PROSODY_BUILD_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define PROSODY_INSTALL_TARGET_CMDS
> +       $(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
> +endef
> +
> +define PROSODY_INSTALL_INIT_SYSV
> +       $(INSTALL) -D -m 0755 package/prosody/S50prosody \
> +               $(TARGET_DIR)/etc/init.d/S50prosody
> +endef
> +
> +define PROSODY_USERS
> +       prosody -1 prosody -1 * - - - Prosody user
> +endef
> +
> +# make install installs a Makefile and meta data to generate certs
> +define PROSODY_REMOVE_CERT_GENERATOR
> +       rm -f $(TARGET_DIR)/etc/prosody/certs/Makefile
> +       rm -f $(TARGET_DIR)/etc/prosody/certs/*.cnf
> +endef
> +
> +PROSODY_POST_INSTALL_TARGET_HOOKS += PROSODY_REMOVE_CERT_GENERATOR
> +
> +# 1. Enable posix functionality
> +# 2. Log to syslog
> +# 3. Specify pid file write location
> +# 4. Enable virtual host example.com
> +define PROSODY_TWEAK_DEFAULT_CONF
> +       $(INSTALL) -D package/prosody/prosody.cfg.lua \
> +               $(TARGET_DIR)/etc/prosody/prosody.cfg.lua
> +endef
> +
> +PROSODY_POST_INSTALL_TARGET_HOOKS += PROSODY_TWEAK_DEFAULT_CONF
> +
> +$(eval $(generic-package))
> --
> 2.1.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171001/982e7f4f/attachment.html>
