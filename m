From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Dec 2019 13:28:47 +0100
Subject: [Buildroot] [PATCH/next 1/3] package/solarus: bump to version
 1.6.2
In-Reply-To: <20191201092823.1288313-1-fontaine.fabrice@gmail.com>
References: <20191201092823.1288313-1-fontaine.fabrice@gmail.com>
Message-ID: <20191215132847.3c6f256b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  1 Dec 2019 10:28:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> -SOLARUS_VERSION = 1.6.0
> -SOLARUS_SITE = http://www.solarus-games.org/downloads/solarus
> -SOLARUS_SOURCE = solarus-$(SOLARUS_VERSION)-src.tar.gz
> +SOLARUS_VERSION = 1.6.2
> +SOLARUS_SITE = \
> +	https://gitlab.com/solarus-games/solarus/archive/v$(SOLARUS_VERSION)

Here, this URL doesn't work, it downloads a blurb of HTML. To get an
actual tarball, I need to do the following change:

diff --git a/package/solarus/solarus.hash b/package/solarus/solarus.hash
index 596c0e3bdf..3c14b92b1b 100644
--- a/package/solarus/solarus.hash
+++ b/package/solarus/solarus.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 a752c26ef9d7a22c8b054d5e22967f5e24519b9b3b22aaff265224e8088c833f  solarus-1.6.2.tar.gz
+sha256 a752c26ef9d7a22c8b054d5e22967f5e24519b9b3b22aaff265224e8088c833f  solarus-v1.6.2.tar.gz
 
 sha256 309875d925041d909bc705473d6c4b7905272aea15c1c2389088c26c161bae1f  license.txt
diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index 6f65a53fea..b8965f3c5e 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 SOLARUS_VERSION = 1.6.2
+SOLARUS_SOURCE = solarus-v$(SOLARUS_VERSION).tar.gz
 SOLARUS_SITE = \
-       https://gitlab.com/solarus-games/solarus/archive/v$(SOLARUS_VERSION)
+       https://gitlab.com/solarus-games/solarus/-/archive/v$(SOLARUS_VERSION)
 
 SOLARUS_LICENSE = GPL-3.0 (code), CC-BY-SA-4.0 (Solarus logos and icons), \
        CC-BY-SA-3.0 (GUI icons)

But then, the hash doesn't match:

ERROR: solarus-v1.6.2.tar.gz has wrong sha256 hash:
ERROR: expected: a752c26ef9d7a22c8b054d5e22967f5e24519b9b3b22aaff265224e8088c833f
ERROR: got     : cec4da0fb041dec3ec1f1cba79c40a519e994b562d582cd56e37fc444c8c656c

Could you double check ?

Also, you had some comments on PATCH 2/3, so I guess a v2 for this
series is needed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
