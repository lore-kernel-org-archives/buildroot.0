From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Wed, 29 Jan 2020 18:26:18 +0100
Subject: [Buildroot] [PATCH 3/3] package/rabbitmq-server: bump version to
 3.8.2
In-Reply-To: <20200129172618.16966-1-frank.vanbever@essensium.com>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
Message-ID: <20200129172618.16966-3-frank.vanbever@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

RabbitMQ now depends on Elixir for the build system.
The log directory is required for the server to start with the default
configuration. This behaviour was changed in v3.7 with the move to erlang-lager
as the logging library

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
 package/rabbitmq-server/Config.in             |  5 ++--
 package/rabbitmq-server/S50rabbitmq-server    |  2 ++
 package/rabbitmq-server/rabbitmq-server.hash  | 25 +++++++++++++++-
 package/rabbitmq-server/rabbitmq-server.mk    | 29 ++++++++++---------
 .../rabbitmq-server/rabbitmq-server.service   |  1 +
 5 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/package/rabbitmq-server/Config.in b/package/rabbitmq-server/Config.in
index b3b7639e28..10a7c27d68 100644
--- a/package/rabbitmq-server/Config.in
+++ b/package/rabbitmq-server/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RABBITMQ_SERVER
 	bool "rabbitmq-server"
 	depends on BR2_PACKAGE_ERLANG
+	select BR2_PACKAGE_HOST_ELIXIR
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_OPENSSL # Required to build Erlang's crypto and ssl
 	                           # applications
@@ -10,5 +11,5 @@ config BR2_PACKAGE_RABBITMQ_SERVER
 
 	  http://www.rabbitmq.com
 
-comment "rabbitmq-server needs erlang"
-	depends on !BR2_PACKAGE_ERLANG
+comment "rabbitmq-server needs erlang and elixir"
+	depends on !BR2_PACKAGE_ERLANG || !BR2_PACKAGE_HOST_ELIXIR
diff --git a/package/rabbitmq-server/S50rabbitmq-server b/package/rabbitmq-server/S50rabbitmq-server
index faf248ded2..35f7844860 100644
--- a/package/rabbitmq-server/S50rabbitmq-server
+++ b/package/rabbitmq-server/S50rabbitmq-server
@@ -5,10 +5,12 @@
 
 INSTALLUSER=rabbitmq
 RUNDIR=/var/run/rabbitmq
+LOGDIR=/var/log/rabbitmq
 
 case "$1" in
   start)
 	install -d -o "$INSTALLUSER" -g "$INSTALLUSER" "$RUNDIR" || exit 1
+	install -d -o "$INSTALLUSER" -g "$INSTALLUSER" "$LOGDIR" || exit 1
         printf "Starting rabbitmq-server: "
         su -c "/usr/sbin/rabbitmq-server -detached" - "$INSTALLUSER" 2>/dev/null
         [ $? = 0 ] && echo "OK" || echo "FAIL"
diff --git a/package/rabbitmq-server/rabbitmq-server.hash b/package/rabbitmq-server/rabbitmq-server.hash
index 3cd412dd0f..6dec4f8af3 100644
--- a/package/rabbitmq-server/rabbitmq-server.hash
+++ b/package/rabbitmq-server/rabbitmq-server.hash
@@ -1,2 +1,25 @@
 # Locally computed
-sha256 395689bcf57fd48aed452fcd43ff9a992de40067d3ea5c44e14680d69db7b78e  rabbitmq-server-3.6.6.tar.xz
+sha256 8c6729b985cb21bab13363b1c806cfa15845b046be9e641ab1496bd5a1eaf19d  rabbitmq-server-3.8.2.tar.xz
+sha256 a96b7ed2e7def9c86d84d9ca0e79e4a55fc8e6e202ac89caa4f9791ccb9cf2a3  LICENSE
+sha256 acd82bfce369b066e7e612197206da4fa38b8614486658775d0b6f66ac30114a  LICENSE-APACHE2
+sha256 aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE-APACHE2-excanvas
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE-APACHE2-ExplorerCanvas
+sha256 b04c8850fdf64d17233f0acbe4eb632f03bd663094233c949bdbe788858bb841  LICENSE-APL2-Stomp-Websocket
+sha256 3c69f8327beaaa45d2f3d7831edf211d0f37d1d9c7754267478320697e1882e9  LICENSE-BSD-base64js
+sha256 af7b5cdf5e16446c64d6e755b2a6386e38c56500ae27587edcd94c96d330ee35  LICENSE-BSD-recon
+sha256 7615ea96ccddc822655cb48a9d2a5cac2f176fca7fe28131af934ce21f48cbc8  LICENSE-erlcloud
+sha256 c69d6e3fc8c51730a706aba5dcd5df978cb0c7b20c7bfe788e063cbc7fc1b234  LICENSE-httpc_aws
+sha256 c0e940d13f488849c27963e7d87f3fc27a2f5843cfd49148029a558251014689  LICENSE-ISC-cowboy
+sha256 af399cded8f343407fb68eeb51755676e9700c65c380f073376afd8d20f428a1  LICENSE-MIT-EJS
+sha256 b2614726fe57ee8267324ecfdebe6e578e5aaa5a77a7f84b9d26463c058147d1  LICENSE-MIT-EJS10
+sha256 0f26e121a7a1dab675bd8474cdc517428863036a668260033467c7278f488cd4  LICENSE-MIT-Erlware-Commons
+sha256 52cb566b16d84314b92b91361ed072eaaf166e8d3dfa3d0fd3577613925f205c  LICENSE-MIT-Flot
+sha256 8cb9a8ff8cafd6a085fd4f086e797b719c334a621df19354dc286591003da3f5  LICENSE-MIT-jQuery
+sha256 44f25d51c90aa55dd4b3ba7f3d6e9a594073fcbefe651e16e74cabd48005b476  LICENSE-MIT-jQuery164
+sha256 fc93cc7361401413887f4c1349e4b0be4bcef936eaafbcc7485038abe197c692  LICENSE-MIT-Mochi
+sha256 b80081a5bb527dbe6b79f18a40f44b4ba6303e4856cadd249672c97b90e6dd7c  LICENSE-MIT-Sammy
+sha256 cfc50fa0d7ee02c2d71c8866ef211a4814e8c89c50b725d27e8bdf550291a9ed  LICENSE-MIT-Sammy060
+sha256 c008551400c9629d5f35a4f4fb6a671cf574d41cb365ae57e3d90341e51b3bdd  LICENSE-MPL
+sha256 66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  LICENSE-MPL2
+sha256 c008551400c9629d5f35a4f4fb6a671cf574d41cb365ae57e3d90341e51b3bdd  LICENSE-MPL-RabbitMQ
+sha256 c69d6e3fc8c51730a706aba5dcd5df978cb0c7b20c7bfe788e063cbc7fc1b234  LICENSE-rabbitmq_aws
diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index f9c28e6677..7edf649fcd 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -4,20 +4,23 @@
 #
 ################################################################################
 
-RABBITMQ_SERVER_VERSION = 3.6.6
-RABBITMQ_SERVER_SITE = http://www.rabbitmq.com/releases/rabbitmq-server/v$(RABBITMQ_SERVER_VERSION)
+RABBITMQ_SERVER_VERSION = 3.8.2
+RABBITMQ_SERVER_SITE = https://github.com/rabbitmq/rabbitmq-server/releases/download/v$(RABBITMQ_SERVER_VERSION)
 RABBITMQ_SERVER_SOURCE = rabbitmq-server-$(RABBITMQ_SERVER_VERSION).tar.xz
-RABBITMQ_SERVER_LICENSE = MPL-1.1, Apache-2.0, BSD-2-Clause, EPL, MIT, MPL-2.0
-RABBITMQ_SERVER_LICENSE_FILES = LICENSE-MPL-RabbitMQ \
-				LICENSE LICENSE-APACHE2-ExplorerCanvas \
-				LICENSE-APL2-Rebar LICENSE-APL2-Stomp-Websocket \
-				LICENSE-BSD-base64js LICENSE-BSD-glMatrix \
-				LICENSE-EPL-OTP LICENSE-MIT-EJS10 \
-				LICENSE-MIT-Flot LICENSE-MIT-jQuery164 \
-				LICENSE-MIT-Mochi LICENSE-MIT-Mochiweb \
-				LICENSE-MIT-Sammy060 LICENSE-MIT-SockJS \
-				LICENSE-MPL2
-RABBITMQ_SERVER_DEPENDENCIES = host-libxslt host-zip erlang libxslt
+RABBITMQ_SERVER_LICENSE = MPL-1.1, Apache-2.0, BSD-3-Clause, BSD-2-Clause, MIT, MPL-2.0, ISC
+RABBITMQ_SERVER_LICENSE_FILES = LICENSE LICENSE-APACHE2 LICENSE-APACHE2-excanvas \
+				LICENSE-APACHE2-ExplorerCanvas LICENSE-APL2-Stomp-Websocket \
+				LICENSE-BSD-base64js LICENSE-BSD-recon LICENSE-erlcloud \
+				LICENSE-httpc_aws LICENSE-ISC-cowboy \
+				LICENSE-MIT-EJS LICENSE-MIT-EJS10 \
+				LICENSE-MIT-Erlware-Commons LICENSE-MIT-Flot \
+				LICENSE-MIT-jQuery LICENSE-MIT-jQuery164 \
+				LICENSE-MIT-Mochi LICENSE-MIT-Sammy \
+				LICENSE-MIT-Sammy060 LICENSE-MPL \
+				LICENSE-MPL2 LICENSE-MPL-RabbitMQ \
+				LICENSE-rabbitmq_aws
+
+RABBITMQ_SERVER_DEPENDENCIES = host-elixir host-libxslt host-zip erlang libxslt
 RABBITMQ_SERVER_TARGET_BINS = rabbitmq-plugins rabbitmq-server rabbitmqctl rabbitmq-env rabbitmq-defaults
 
 define RABBITMQ_SERVER_BUILD_CMDS
diff --git a/package/rabbitmq-server/rabbitmq-server.service b/package/rabbitmq-server/rabbitmq-server.service
index 268b4bdcd2..f69b33d455 100644
--- a/package/rabbitmq-server/rabbitmq-server.service
+++ b/package/rabbitmq-server/rabbitmq-server.service
@@ -8,6 +8,7 @@ User=rabbitmq
 Group=rabbitmq
 Environment=HOME=/var/lib/rabbitmq
 WorkingDirectory=/var/lib/rabbitmq
+LogsDirectory=/var/log/rabbitmq
 ExecStart=/usr/sbin/rabbitmq-server
 ExecStop=/usr/sbin/rabbitmqctl stop
 
-- 
2.20.1
