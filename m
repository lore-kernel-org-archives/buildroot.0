From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:24:45 +0100
Subject: [Buildroot] [git commit] package/boa: drop package
Message-ID: <20210118210537.E2B6488390@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=906a4668696a5e987ee408dc3f150d2a9032204b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop boa package as it is affected by multiple CVEs (CVE-2017-9833,
CVE-2018-21027 and CVE-2018-21028) and is not maintained anymore (no
release since 2005):

https://nvd.nist.gov/vuln/search/results?form_type=Advanced&results_type=overview&seach_type=all&query=cpe:2.3:a:boa:boa:0.94.14.21:*:*:*:*:*:*:*

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                    |   7 ++
 package/Config.in                   |   1 -
 package/boa/0001-use-name-max.patch |  21 ----
 package/boa/Config.in               |   8 --
 package/boa/boa.conf                | 187 --------------------------------
 package/boa/boa.hash                |   3 -
 package/boa/boa.mk                  |  19 ----
 package/boa/mime.types              | 205 ------------------------------------
 8 files changed, 7 insertions(+), 444 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ee2d0e97a4..e30f678234 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2021.02"
 
+config BR2_PACKAGE_BOA
+	bool "boa package removed"
+	select BR2_LEGACY
+	help
+	  The boa package was removed as it is affected by multiple
+	  CVEs and is not maintained anymore (no release since 2005).
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA
 	bool "imx sdma firmware is provided by firmware-imx"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index bfc60b5a69..4ddde0d985 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2065,7 +2065,6 @@ menu "Networking applications"
 	source "package/bluez-tools/Config.in"
 	source "package/bluez5_utils/Config.in"
 	source "package/bmon/Config.in"
-	source "package/boa/Config.in"
 	source "package/boinc/Config.in"
 	source "package/brcm-patchram-plus/Config.in"
 	source "package/bridge-utils/Config.in"
diff --git a/package/boa/0001-use-name-max.patch b/package/boa/0001-use-name-max.patch
deleted file mode 100644
index 055e56c3e1..0000000000
--- a/package/boa/0001-use-name-max.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Use NAME_MAX instead of MAXNAMLEN
-
-NAME_MAX is POSIX, and available in all C libraries, generally in
-<limits.h>, while MAXNAMLEN is BSD-specific, and only available in
-musl in <sys/param.h>. So let's use NAME_MAX instead of MAXNAMLEN.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/index_dir.c
-===================================================================
---- a/src/index_dir.c
-+++ b/src/index_dir.c
-@@ -29,7 +29,7 @@
- #include <fcntl.h>
- #include "compat.h"
- 
--#define MAX_FILE_LENGTH                         MAXNAMLEN
-+#define MAX_FILE_LENGTH                         NAME_MAX
- #define MAX_PATH_LENGTH                         PATH_MAX
- 
- #define INT_TO_HEX(x) \
diff --git a/package/boa/Config.in b/package/boa/Config.in
deleted file mode 100644
index cb085a2494..0000000000
--- a/package/boa/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_BOA
-	bool "boa"
-	depends on BR2_USE_MMU # uses fork()
-	help
-	  A very small and very fast http daemon. Not intended as
-	  a feature-packed server.
-
-	  http://www.boa.org/
diff --git a/package/boa/boa.conf b/package/boa/boa.conf
deleted file mode 100644
index f51c237316..0000000000
--- a/package/boa/boa.conf
+++ /dev/null
@@ -1,187 +0,0 @@
-# Boa v0.94 configuration file
-# File format has not changed from 0.93
-# File format has changed little from 0.92
-# version changes are noted in the comments
-#
-# The Boa configuration file is parsed with a lex/yacc or flex/bison
-# generated parser.  If it reports an error, the line number will be
-# provided; it should be easy to spot.  The syntax of each of these
-# rules is very simple, and they can occur in any order.  Where possible
-# these directives mimic those of NCSA httpd 1.3; I saw no reason to 
-# introduce gratuitous differences.
-
-# $Id: boa.conf,v 1.1 2004/10/09 02:48:37 andersen Exp $
-
-# The "ServerRoot" is not in this configuration file.  It can be compiled
-# into the server (see defines.h) or specified on the command line with
-# the -c option, for example:
-#
-# boa -c /usr/local/boa
-
-
-# Port: The port Boa runs on.  The default port for http servers is 80.
-# If it is less than 1024, the server must be started as root.
-
-Port 80
-
-# Listen: the Internet address to bind(2) to.  If you leave it out,
-# it takes the behavior before 0.93.17.2, which is to bind to all
-# addresses (INADDR_ANY).  You only get one "Listen" directive,
-# if you want service on multiple IP addresses, you have three choices:
-#    1. Run boa without a "Listen" directive
-#       a. All addresses are treated the same; makes sense if the addresses
-#          are localhost, ppp, and eth0.
-#       b. Use the VirtualHost directive below to point requests to different
-#          files.  Should be good for a very large number of addresses (web
-#          hosting clients).
-#    2. Run one copy of boa per IP address, each has its own configuration
-#       with a "Listen" directive.  No big deal up to a few tens of addresses.
-#       Nice separation between clients.
-# The name you provide gets run through inet_aton(3), so you have to use dotted
-# quad notation.  This configuration is too important to trust some DNS.
-
-#Listen 192.68.0.5
-
-#  User: The name or UID the server should run as.
-# Group: The group name or GID the server should run as.
-
-User nobody
-Group nobody
-
-# ServerAdmin: The email address where server problems should be sent.
-# Note: this is not currently used, except as an environment variable
-# for CGIs.
-
-#ServerAdmin root at localhost
-
-# ErrorLog: The location of the error log file. If this does not start
-# with /, it is considered relative to the server root.
-# Set to /dev/null if you don't want errors logged.
-# If unset, defaults to /dev/stderr
-
-ErrorLog /var/log/boa/error_log
-# Please NOTE: Sending the logs to a pipe ('|'), as shown below,
-#  is somewhat experimental and might fail under heavy load.
-# "Usual libc implementations of printf will stall the whole
-#  process if the receiving end of a pipe stops reading."
-#ErrorLog "|/usr/sbin/cronolog --symlink=/var/log/boa/error_log /var/log/boa/error-%Y%m%d.log"
-
-# AccessLog: The location of the access log file. If this does not
-# start with /, it is considered relative to the server root.
-# Comment out or set to /dev/null (less effective) to disable 
-# Access logging.
-
-AccessLog /var/log/boa/access_log
-# Please NOTE: Sending the logs to a pipe ('|'), as shown below,
-#  is somewhat experimental and might fail under heavy load.
-# "Usual libc implementations of printf will stall the whole
-#  process if the receiving end of a pipe stops reading."
-#AccessLog  "|/usr/sbin/cronolog --symlink=/var/log/boa/access_log /var/log/boa/access-%Y%m%d.log"
-
-# UseLocaltime: Logical switch.  Uncomment to use localtime 
-# instead of UTC time
-#UseLocaltime
-
-# VerboseCGILogs: this is just a logical switch.
-#  It simply notes the start and stop times of cgis in the error log
-# Comment out to disable.
-
-#VerboseCGILogs
-
-# ServerName: the name of this server that should be sent back to 
-# clients if different than that returned by gethostname + gethostbyname 
-
-#ServerName www.your.org.here
-
-# VirtualHost: a logical switch.
-# Comment out to disable.
-# Given DocumentRoot /var/www, requests on interface 'A' or IP 'IP-A'
-# become /var/www/IP-A.
-# Example: http://localhost/ becomes /var/www/127.0.0.1
-#
-# Not used until version 0.93.17.2.  This "feature" also breaks commonlog
-# output rules, it prepends the interface number to each access_log line.
-# You are expected to fix that problem with a postprocessing script.
-
-#VirtualHost 
-
-# DocumentRoot: The root directory of the HTML documents.
-# Comment out to disable server non user files.
-
-DocumentRoot /var/www
-
-# UserDir: The name of the directory which is appended onto a user's home
-# directory if a ~user request is recieved.
-
-UserDir public_html
-
-# DirectoryIndex: Name of the file to use as a pre-written HTML
-# directory index.  Please MAKE AND USE THESE FILES.  On the
-# fly creation of directory indexes can be _slow_.
-# Comment out to always use DirectoryMaker
-
-DirectoryIndex index.html
-
-# DirectoryMaker: Name of program used to create a directory listing.
-# Comment out to disable directory listings.  If both this and
-# DirectoryIndex are commented out, accessing a directory will give
-# an error (though accessing files in the directory are still ok).
-
-DirectoryMaker /usr/lib/boa/boa_indexer
-
-# DirectoryCache: If DirectoryIndex doesn't exist, and DirectoryMaker
-# has been commented out, the the on-the-fly indexing of Boa can be used
-# to generate indexes of directories. Be warned that the output is 
-# extremely minimal and can cause delays when slow disks are used.
-# Note: The DirectoryCache must be writable by the same user/group that 
-# Boa runs as.
-
-# DirectoryCache /var/spool/boa/dircache
-
-# KeepAliveMax: Number of KeepAlive requests to allow per connection
-# Comment out, or set to 0 to disable keepalive processing
-
-KeepAliveMax 1000
-
-# KeepAliveTimeout: seconds to wait before keepalive connection times out
-
-KeepAliveTimeout 10
-
-# MimeTypes: This is the file that is used to generate mime type pairs
-# and Content-Type fields for boa.
-# Set to /dev/null if you do not want to load a mime types file.
-# Do *not* comment out (better use AddType!)
-
-MimeTypes /etc/mime.types
-
-# DefaultType: MIME type used if the file extension is unknown, or there
-# is no file extension.
-
-DefaultType text/plain
-
-# AddType: adds types without editing mime.types
-# Example: AddType type extension [extension ...]
-
-# Uncomment the next line if you want .cgi files to execute from anywhere
-#AddType application/x-httpd-cgi cgi
-
-# Redirect, Alias, and ScriptAlias all have the same semantics -- they
-# match the beginning of a request and take appropriate action.  Use
-# Redirect for other servers, Alias for the same server, and ScriptAlias
-# to enable directories for script execution.
-
-# Redirect allows you to tell clients about documents which used to exist in
-# your server's namespace, but do not anymore. This allows you to tell the
-# clients where to look for the relocated document.
-# Example: Redirect /bar http://elsewhere/feh/bar
-
-# Aliases: Aliases one path to another.
-# Example: Alias /path1/bar /path2/foo
-
-# Alias /doc /usr/doc
-
-# ScriptAlias: Maps a virtual path to a directory for serving scripts
-# Example: ScriptAlias /htbin/ /www/htbin/
-
-ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
-
diff --git a/package/boa/boa.hash b/package/boa/boa.hash
deleted file mode 100644
index 4efe3aec43..0000000000
--- a/package/boa/boa.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  02c51bf25f29d56e641b662f0767759654c28d88ec31f55c5a73d57edfe13cf6  boa-0.94.14rc21.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
deleted file mode 100644
index d8bcaa122b..0000000000
--- a/package/boa/boa.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# boa
-#
-################################################################################
-
-BOA_VERSION = 0.94.14rc21
-BOA_SITE = http://www.boa.org
-BOA_LICENSE = GPL-2.0+
-BOA_LICENSE_FILES = COPYING
-
-define BOA_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 755 $(@D)/src/boa $(TARGET_DIR)/usr/sbin/boa
-	$(INSTALL) -D -m 755 $(@D)/src/boa_indexer $(TARGET_DIR)/usr/lib/boa/boa_indexer
-	$(INSTALL) -D -m 644 package/boa/boa.conf $(TARGET_DIR)/etc/boa/boa.conf
-	$(INSTALL) -D -m 644 package/boa/mime.types $(TARGET_DIR)/etc/mime.types
-endef
-
-$(eval $(autotools-package))
diff --git a/package/boa/mime.types b/package/boa/mime.types
deleted file mode 100644
index 53f6ea1011..0000000000
--- a/package/boa/mime.types
+++ /dev/null
@@ -1,205 +0,0 @@
-###############################################################################
-#
-#  MIME-TYPES and the extensions that represent them
-#
-#  This file is part of the "mime-support" package.  Please send email (not a
-#  bug report) to mime-support at packages.debian.org if you would like new types
-#  and/or extensions to be added.
-#
-#  Note: Compression schemes like "gzip", "bzip", and "compress" are not
-#  actually "mime-types".  They are "encodings" and hence must _not_ have
-#  entries in this file to map their extensions.  The "mime-type" of an
-#  encoded file refers to the type of data that has been encoded, not the
-#  type of the encoding.
-#
-###############################################################################
-
-
-application/activemessage
-application/andrew-inset
-application/applefile
-application/atomicmail
-application/cu-seeme				csm cu
-application/dca-rft
-application/dec-dx
-application/dsptype				tsp
-application/futuresplash			spl
-application/ghostview
-application/mac-binhex40			hqx
-application/macwriteii
-application/msaccess				mdb
-application/msword				doc dot
-application/news-message-id
-application/news-transmission
-application/octet-stream			bin
-application/oda					oda
-application/pdf					pdf
-application/pgp-signature			pgp
-application/postscript				ps ai eps
-application/remote-printing
-application/rtf					rtf
-application/slate
-application/vnd.ms-excel			xls xlb
-application/vnd.ms-powerpoint			ppt pps pot
-application/vnd.wap.wmlc			wmlc
-application/vnd.wap.wmlscriptc			wmlsc
-application/wita
-application/wordperfect5.1			wp5
-application/zip					zip
-application/x-123				wk
-application/x-bcpio				bcpio
-application/x-chess-pgn				pgn
-application/x-core
-application/x-cpio				cpio
-application/x-csh
-application/x-debian-package			deb
-application/x-director				dcr dir dxr
-application/x-dms				dms
-application/x-dvi				dvi
-application/x-executable
-application/x-font				pfa pfb gsf pcf pcf.Z
-application/x-gnumeric				gnumeric
-application/x-gtar				gtar tgz
-application/x-hdf				hdf
-application/x-httpd-php				phtml pht php
-application/x-httpd-php3			php3
-application/x-httpd-php3-source			phps
-application/x-httpd-php3-preprocessed 		php3p
-application/x-httpd-php4			php4
-application/x-ica				ica
-application/x-java				class
-application/x-javascript			js
-application/x-kdelnk
-application/x-kchart				chrt
-application/x-killustrator			kil
-application/x-kpresenter			kpr kpt
-application/x-kspread				ksp
-application/x-kword				kwd kwt
-application/x-latex				latex
-application/x-lha				lha
-application/x-lzh				lzh
-application/x-lzx				lzx
-application/x-maker				frm maker frame fm fb book fbdoc
-application/x-mif				mif
-application/x-msdos-program			com exe bat dll
-application/x-msi				msi
-application/x-netcdf				nc cdf
-application/x-ns-proxy-autoconfig		pac
-application/x-object				o
-application/x-ogg				ogg
-application/x-oz-application			oza
-application/x-perl				pl pm
-application/x-redhat-package-manager		rpm
-application/x-rx
-application/x-sh
-application/x-shar				shar
-application/x-shellscript
-application/x-shockwave-flash			swf swfl
-application/x-stuffit				sit
-application/x-sv4cpio				sv4cpio
-application/x-sv4crc				sv4crc
-application/x-tar				tar
-application/x-tcl
-application/x-tex
-application/x-tex-gf				gf
-application/x-tex-pk				pk PK
-application/x-texinfo				texinfo texi
-application/x-trash				~ % bak old sik
-application/x-troff				t tr roff
-application/x-troff-man				man
-application/x-troff-me				me
-application/x-troff-ms				ms
-application/x-ustar				ustar
-application/x-wais-source			src
-application/x-wingz				wz
-
-audio/basic					au snd
-audio/midi					mid midi
-audio/mpeg					mpga mpega mp2 mp3
-audio/mpegurl					m3u
-audio/prs.sid					sid
-audio/x-aiff					aif aiff aifc
-audio/x-gsm					gsm
-audio/x-pn-realaudio				ra rm ram
-audio/x-wav					wav
-
-image/bitmap					bmp
-image/gif					gif
-image/ief					ief
-image/jpeg					jpeg jpg jpe
-image/pcx					pcx
-image/png					png
-image/tiff					tiff tif
-image/vnd.wap.wbmp				wbmp
-image/x-cmu-raster				ras
-image/x-coreldraw				cdr
-image/x-coreldrawpattern			pat
-image/x-coreldrawtemplate			cdt
-image/x-corelphotopaint				cpt
-image/x-jng					jng
-image/x-portable-anymap				pnm
-image/x-portable-bitmap				pbm
-image/x-portable-graymap			pgm
-image/x-portable-pixmap				ppm
-image/x-rgb					rgb
-image/x-xbitmap					xbm
-image/x-xpixmap					xpm
-image/x-xwindowdump				xwd
-
-inode/chardevice
-inode/blockdevice
-inode/directory-locked
-inode/directory
-inode/fifo
-inode/socket
-
-message/external-body
-message/news
-message/partial
-message/rfc822
-
-multipart/alternative
-multipart/appledouble
-multipart/digest
-multipart/mixed
-multipart/parallel
-
-text/comma-separated-values			csv
-text/css					css
-text/english
-text/html					htm html xhtml
-text/mathml					mml
-text/plain					txt text diff
-text/richtext					rtx
-text/tab-separated-values			tsv
-text/vnd.wap.wml				wml
-text/vnd.wap.wmlscript				wmls
-text/xml					xml
-text/x-c++hdr					h++ hpp hxx hh
-text/x-c++src					c++ cpp cxx cc
-text/x-chdr					h
-text/x-crontab
-text/x-csh					csh
-text/x-csrc					c
-text/x-java					java
-text/x-makefile
-text/x-moc					moc
-text/x-pascal					p pas
-text/x-setext					etx
-text/x-sh					sh
-text/x-tcl					tcl tk
-text/x-tex					tex ltx sty cls
-text/x-vcalendar				vcs
-text/x-vcard					vcf
-
-video/dl					dl
-video/fli					fli
-video/gl					gl
-video/mpeg					mpeg mpg mpe
-video/quicktime					qt mov
-video/x-mng					mng
-video/x-ms-asf					asf asx
-video/x-msvideo					avi
-video/x-sgi-movie				movie
-
-x-world/x-vrml					vrm vrml wrl
