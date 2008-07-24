From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 24 Jul 2008 16:33:41 +0200
Subject: [Buildroot] [PATCH 1/5] lxdoom-wad: make installation of
	Doom	shareware wad file be more generic
In-Reply-To: <1216905717-9197-1-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1216905717-9197-1-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <20080724143341.GA4991@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 24, 2008 at 03:21:53PM +0200, Hans-Christian Egtvedt wrote:
>This patch will let the user install the Doom shareware wad file if lxdoom or
>lsdldoom is selected. The wad file will also be installed into
>/usr/share/games/doom directory, since the client will search this directory
>when starting.

weeeeh
http://www.ggi-project.org/screenshots.html
>
>The Makefile rule has also been altered to depend on the installed wad file, so
>it will be multiple project safe.
>
>Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
>---
> package/lxdoom/Config.in     |    6 ++++--
> package/lxdoom/lxdoom-wad.mk |   10 +++++-----
> 2 files changed, 9 insertions(+), 7 deletions(-)
>
>diff --git a/package/lxdoom/Config.in b/package/lxdoom/Config.in
>index 892e45c..3b318e1 100644
>--- a/package/lxdoom/Config.in
>+++ b/package/lxdoom/Config.in
>@@ -3,7 +3,9 @@ config BR2_PACKAGE_LXDOOM
> 	help
> 	  This is the linux version of the popular doom game.
> config BR2_PACKAGE_LXDOOM_WAD
>-	bool "lxdoom-wad"
>+	bool "doom shareware wad file"
> 	depends on BR2_PACKAGE_LXDOOM
> 	help
>-	  This is the shareware wad data files for the doom game.
>+	  This will install the the shareware wad data file for the doom game.

the the the contains a surplus the ;)

>+
>+	  The wad file will be placed in /usr/share/games/doom/doom1.wad
>diff --git a/package/lxdoom/lxdoom-wad.mk b/package/lxdoom/lxdoom-wad.mk
>index 41b8ed8..4e38574 100644
>--- a/package/lxdoom/lxdoom-wad.mk
>+++ b/package/lxdoom/lxdoom-wad.mk
>@@ -15,14 +15,14 @@ $(DL_DIR)/$(LXDOOM_WAD_SOURCE):
> $(LXDOOM_WAD_DIR)/.unpacked: $(DL_DIR)/$(LXDOOM_WAD_SOURCE)
> 	mkdir -p $(LXDOOM_WAD_DIR)
> 	cp -f $(DL_DIR)/$(LXDOOM_WAD_SOURCE) $(LXDOOM_WAD_DIR)
>-	gunzip -d $(LXDOOM_WAD_DIR)/$(LXDOOM_WAD_SOURCE) 
>+	gunzip -d $(LXDOOM_WAD_DIR)/$(LXDOOM_WAD_SOURCE)

no. There is no gunzip. So who added this stuff? I'm 100% sure that when
i left there were no hardcoded decompressors in there. You should listen
to what user say (resp. configure).

> 	touch $@
> 
>-$(LXDOOM_WAD_DIR)/.installed: $(LXDOOM_WAD_DIR)/.unpacked
>-	cp -f $(LXDOOM_WAD_DIR)/* $(TARGET_DIR)/usr/games
>-	touch $@
>+$(TARGET_DIR)/usr/share/games/doom/doom1.wad: $(LXDOOM_WAD_DIR)/.unpacked
>+	mkdir -p $(TARGET_DIR)/usr/share/games/doom
>+	cp -f $(LXDOOM_WAD_DIR)/doom-$(LXDOOM_WAD_VERSION).wad $@

$(INSTALL) -D $(LXDOOM_WAD_DIR)/doom-$(LXDOOM_WAD_VERSION).wad $@

It's not only shorter but also avoiding broken cp and mkdir
implementations and is IMO the preferred way to copy stuff.
