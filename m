From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 22:54:27 +0200
Subject: [Buildroot] [git commit] package/gerbera: bump to version 1.8.0
Message-ID: <20210419202756.7378281474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8974596836945eada8e162844fb87f88adec9100
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also recreate config.xml by building and running Gerbera using:

```
~/buildroot/output/target/usr/bin/gerbera --create-config > package/gerbera/config.xml

```

Note, that Gerbera sets the `<home>` parameter now to the runtime user's home by
default when generating the script. This is not appropriate when running Gerbera
on an embedded Linux system as we usually do not have multiple users or even
users at all. Therefore, we set the home directory to /var/lib/gerbera`.

As this directory is not created when installing Gerbera to the target,
it is created by the start script.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gerbera/S99gerbera   |   3 +
 package/gerbera/config.xml   | 144 ++++++++++++++++++++-----------------------
 package/gerbera/gerbera.hash |   2 +-
 package/gerbera/gerbera.mk   |   2 +-
 4 files changed, 73 insertions(+), 78 deletions(-)

diff --git a/package/gerbera/S99gerbera b/package/gerbera/S99gerbera
index d1c74c887c..e5a70e78a8 100644
--- a/package/gerbera/S99gerbera
+++ b/package/gerbera/S99gerbera
@@ -8,6 +8,9 @@ GERBERA_ARGS="-c /etc/gerbera/config.xml -l /var/log/gerbera.log"
 # shellcheck source=/dev/null
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
+# (Re)create home directory
+mkdir -p /var/lib/$DAEMON
+
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
diff --git a/package/gerbera/config.xml b/package/gerbera/config.xml
index ddaaa7f18f..30d70e21f7 100644
--- a/package/gerbera/config.xml
+++ b/package/gerbera/config.xml
@@ -1,12 +1,13 @@
+<?xml version="1.0" encoding="UTF-8"?>
 <config version="2" xmlns="http://mediatomb.cc/config/2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://mediatomb.cc/config/2 http://mediatomb.cc/config/2.xsd">
   <!--
      See http://gerbera.io or read the docs for more
-     information on creating and using config.xml configration files.
+     information on creating and using config.xml configuration files.
     -->
   <server>
     <ui enabled="yes" show-tooltips="yes">
       <accounts enabled="no" session-timeout="30">
-        <account user="gerbera" password="gerbera"/>
+        <account user="gerbera" password="gerbera" />
       </accounts>
     </ui>
     <name>Gerbera</name>
@@ -28,23 +29,6 @@
         <database-file>gerbera.db</database-file>
       </sqlite3>
     </storage>
-    <protocolInfo extend="no"/><!-- For PS3 support change to "yes" -->
-    <!--
-       Uncomment the lines below to get rid of jerky avi playback on the
-       DSM320 or to enable subtitles support on the DSM units
-    -->
-    <!--
-    <custom-http-headers>
-      <add header="X-User-Agent: redsonic"/>
-    </custom-http-headers>
-
-    <manufacturerURL>redsonic.com</manufacturerURL>
-    <modelNumber>105</modelNumber>
-    -->
-    <!-- Uncomment the line below if you have a Telegent TG100 -->
-    <!--
-       <upnp-string-limit>101</upnp-string-limit>
-    -->
     <extended-runtime-options>
       <mark-played-items enabled="no" suppress-cds-updates="yes">
         <string mode="prepend">*</string>
@@ -55,88 +39,96 @@
     </extended-runtime-options>
   </server>
   <import hidden-files="no">
-    <scripting script-charset="UTF-8">
-      <virtual-layout type="builtin"/>
+    <scripting>
+      <virtual-layout type="builtin" />
     </scripting>
     <mappings>
       <extension-mimetype ignore-unknown="no">
-        <map from="mp3" to="audio/mpeg"/>
-        <map from="ogx" to="application/ogg"/>
-        <map from="ogv" to="video/ogg"/>
-        <map from="oga" to="audio/ogg"/>
-        <map from="ogg" to="audio/ogg"/>
-        <map from="ogm" to="video/ogg"/>
-        <map from="asf" to="video/x-ms-asf"/>
-        <map from="asx" to="video/x-ms-asf"/>
-        <map from="wma" to="audio/x-ms-wma"/>
-        <map from="wax" to="audio/x-ms-wax"/>
-        <map from="wmv" to="video/x-ms-wmv"/>
-        <map from="wvx" to="video/x-ms-wvx"/>
-        <map from="wm" to="video/x-ms-wm"/>
-        <map from="wmx" to="video/x-ms-wmx"/>
-        <map from="m3u" to="audio/x-mpegurl"/>
-        <map from="pls" to="audio/x-scpls"/>
-        <map from="flv" to="video/x-flv"/>
-        <map from="mkv" to="video/x-matroska"/>
-        <map from="mka" to="audio/x-matroska"/>
-        <map from="dsf" to="audio/x-dsd"/>
-        <map from="dff" to="audio/x-dsd"/>
-        <map from="wv" to="audio/x-wavpack"/>
+        <map from="asf" to="video/x-ms-asf" />
+        <map from="asx" to="video/x-ms-asf" />
+        <map from="dff" to="audio/x-dsd" />
+        <map from="dsf" to="audio/x-dsd" />
+        <map from="flv" to="video/x-flv" />
+        <map from="m2ts" to="video/mp2t" />
+        <map from="m3u" to="audio/x-mpegurl" />
+        <map from="mka" to="audio/x-matroska" />
+        <map from="mkv" to="video/x-matroska" />
+        <map from="mp3" to="audio/mpeg" />
+        <map from="mts" to="video/mp2t" />
+        <map from="oga" to="audio/ogg" />
+        <map from="ogg" to="audio/ogg" />
+        <map from="ogm" to="video/ogg" />
+        <map from="ogv" to="video/ogg" />
+        <map from="ogx" to="application/ogg" />
+        <map from="pls" to="audio/x-scpls" />
+        <map from="ts" to="video/mp2t" />
+        <map from="tsa" to="audio/mp2t" />
+        <map from="tsv" to="video/mp2t" />
+        <map from="wax" to="audio/x-ms-wax" />
+        <map from="wm" to="video/x-ms-wm" />
+        <map from="wma" to="audio/x-ms-wma" />
+        <map from="wmv" to="video/x-ms-wmv" />
+        <map from="wmx" to="video/x-ms-wmx" />
+        <map from="wv" to="audio/x-wavpack" />
+        <map from="wvx" to="video/x-ms-wvx" />
         <!-- Uncomment the line below for PS3 divx support -->
-        <!-- <map from="avi" to="video/divx"/> -->
+        <!-- <map from="avi" to="video/divx" /> -->
         <!-- Uncomment the line below for D-Link DSM / ZyXEL DMA-1000 -->
-        <!-- <map from="avi" to="video/avi"/> -->
+        <!-- <map from="avi" to="video/avi" /> -->
       </extension-mimetype>
       <mimetype-upnpclass>
-        <map from="audio/*" to="object.item.audioItem.musicTrack"/>
-        <map from="video/*" to="object.item.videoItem"/>
-        <map from="image/*" to="object.item.imageItem"/>
-        <map from="application/ogg" to="object.item.audioItem.musicTrack"/>
+        <map from="application/ogg" to="object.item.audioItem.musicTrack" />
+        <map from="audio/*" to="object.item.audioItem.musicTrack" />
+        <map from="image/*" to="object.item.imageItem" />
+        <map from="video/*" to="object.item.videoItem" />
       </mimetype-upnpclass>
       <mimetype-contenttype>
-        <treat mimetype="audio/mpeg" as="mp3"/>
-        <treat mimetype="application/ogg" as="ogg"/>
-        <treat mimetype="audio/ogg" as="ogg"/>
-        <treat mimetype="audio/x-flac" as="flac"/>
-        <treat mimetype="audio/x-ms-wma" as="wma"/>
-        <treat mimetype="audio/x-wavpack" as="wv"/>
-        <treat mimetype="image/jpeg" as="jpg"/>
-        <treat mimetype="audio/x-mpegurl" as="playlist"/>
-        <treat mimetype="audio/x-scpls" as="playlist"/>
-        <treat mimetype="audio/x-wav" as="pcm"/>
-        <treat mimetype="audio/L16" as="pcm"/>
-        <treat mimetype="video/x-msvideo" as="avi"/>
-        <treat mimetype="video/mp4" as="mp4"/>
-        <treat mimetype="audio/mp4" as="mp4"/>
-        <treat mimetype="video/x-matroska" as="mkv"/>
-        <treat mimetype="audio/x-matroska" as="mka"/>
-        <treat mimetype="audio/x-dsd" as="dsd"/>
+        <treat mimetype="application/ogg" as="ogg" />
+        <treat mimetype="audio/L16" as="pcm" />
+        <treat mimetype="audio/flac" as="flac" />
+        <treat mimetype="audio/mp4" as="mp4" />
+        <treat mimetype="audio/mpeg" as="mp3" />
+        <treat mimetype="audio/ogg" as="ogg" />
+        <treat mimetype="audio/x-dsd" as="dsd" />
+        <treat mimetype="audio/x-flac" as="flac" />
+        <treat mimetype="audio/x-matroska" as="mka" />
+        <treat mimetype="audio/x-mpegurl" as="playlist" />
+        <treat mimetype="audio/x-ms-wma" as="wma" />
+        <treat mimetype="audio/x-scpls" as="playlist" />
+        <treat mimetype="audio/x-wav" as="pcm" />
+        <treat mimetype="audio/x-wavpack" as="wv" />
+        <treat mimetype="image/jpeg" as="jpg" />
+        <treat mimetype="video/mp4" as="mp4" />
+        <treat mimetype="video/x-matroska" as="mkv" />
+        <treat mimetype="video/x-msvideo" as="avi" />
       </mimetype-contenttype>
     </mappings>
+    <online-content>
+      <AppleTrailers enabled="no" refresh="43200" update-at-start="no" resolution="640" />
+    </online-content>
   </import>
   <transcoding enabled="no">
     <mimetype-profile-mappings>
-      <transcode mimetype="video/x-flv" using="vlcmpeg"/>
-      <transcode mimetype="application/ogg" using="vlcmpeg"/>
-      <transcode mimetype="application/ogg" using="oggflac2raw"/>
-      <transcode mimetype="audio/x-flac" using="oggflac2raw"/>
+      <transcode mimetype="application/ogg" using="vlcmpeg" />
+      <transcode mimetype="audio/ogg" using="ogg2mp3" />
+      <transcode mimetype="video/x-flv" using="vlcmpeg" />
     </mimetype-profile-mappings>
     <profiles>
-      <profile name="oggflac2raw" enabled="no" type="external">
-        <mimetype>audio/L16</mimetype>
+      <profile name="ogg2mp3" enabled="no" type="external">
+        <mimetype>audio/mpeg</mimetype>
         <accept-url>no</accept-url>
         <first-resource>yes</first-resource>
         <accept-ogg-theora>no</accept-ogg-theora>
-        <agent command="ogg123" arguments="-d raw -o byteorder:big -f %out %in"/>
-        <buffer size="1048576" chunk-size="131072" fill-size="262144"/>
+        <agent command="ffmpeg" arguments="-y -i %in -f mp3 %out" />
+        <buffer size="1048576" chunk-size="131072" fill-size="262144" />
       </profile>
       <profile name="vlcmpeg" enabled="no" type="external">
         <mimetype>video/mpeg</mimetype>
         <accept-url>yes</accept-url>
         <first-resource>yes</first-resource>
         <accept-ogg-theora>yes</accept-ogg-theora>
-        <agent command="vlc" arguments="-I dummy %in --sout #transcode{venc=ffmpeg,vcodec=mp2v,vb=4096,fps=25,aenc=ffmpeg,acodec=mpga,ab=192,samplerate=44100,channels=2}:standard{access=file,mux=ps,dst=%out} vlc:quit"/>
-        <buffer size="14400000" chunk-size="512000" fill-size="120000"/>
+        <agent command="vlc" arguments="-I dummy %in --sout #transcode{venc=ffmpeg,vcodec=mp2v,vb=4096,fps=25,aenc=ffmpeg,acodec=mpga,ab=192,samplerate=44100,channels=2}:standard{access=file,mux=ps,dst=%out} vlc:quit" />
+        <buffer size="14400000" chunk-size="512000" fill-size="120000" />
       </profile>
     </profiles>
   </transcoding>
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index e584db1354..cdd1fbff60 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  cbe7ea78977db8c02fcca1759ed149f199a590afaf4a6d21ffcca8623d1a0cc5  gerbera-1.6.4.tar.gz
+sha256  02044abd1363c5f5604c5830e560b102ac456179afbf3be60e65847f47f4c599  gerbera-1.8.0.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index ccb3b2eeb5..69d52e2677 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.6.4
+GERBERA_VERSION = 1.8.0
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
