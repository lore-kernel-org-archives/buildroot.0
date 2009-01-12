From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Mon, 12 Jan 2009 14:05:44 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/liberation
In-Reply-To: <20090112124048.BBE95766E4@busybox.osuosl.org>
References: <20090112124048.BBE95766E4@busybox.osuosl.org>
Message-ID: <20090112130544.GA32253@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 12, 2009 at 12:40:48PM +0000, laird at uclibc.org wrote:
>Author: laird
>Date: 2009-01-12 12:40:48 +0000 (Mon, 12 Jan 2009)
>New Revision: 24792
>
>Log:
>package/liberation/liberation.mk: Correct the makefile to what it should have been
>
>Correct the makefile so that it works and is what I originally planned to add.
>
>Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>
>
>
>
>Modified:
>   trunk/buildroot/package/liberation/liberation.mk
>
>
>Changeset:
>Modified: trunk/buildroot/package/liberation/liberation.mk
>===================================================================
>--- trunk/buildroot/package/liberation/liberation.mk	2009-01-12 10:29:46 UTC (rev 24791)
>+++ trunk/buildroot/package/liberation/liberation.mk	2009-01-12 12:40:48 UTC (rev 24792)
>@@ -18,12 +18,12 @@
> 	$(LIBERATION_CAT) $(DL_DIR)/$(LIBERATION_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> 	touch $(LIBERATION_DIR)/.unpacked

touch $@
> 
>-$(STAGING_DIR)/usr/share/fonts/.ttf: $(LIBERATION_DIR)/.unpacked
>+$(STAGING_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
> 	-mkdir -p $(STAGING_DIR)/usr/share/fonts/liberation

The preferred thing to do is to use $(INSTALL) -d $(@D)

> 	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(STAGING_DIR)/usr/share/fonts/liberation/

okay.. the target is fonts/LiberationMono-Bold.ttf and you put the fonts into
fonts/liberation/

> 	touch -c $(STAGING_DIR)/usr/share/fonts/.ttf

See how it would be *so* much better to use 'touch -c $@' ?

> 
>-$(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(STAGING_DIR)/usr/share/fonts/.ttf
>+$(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(STAGING_DIR)/usr/share/fonts/LiberationMono-Bold.ttf
> 	-mkdir -p $(TARGET_DIR)/usr/share/fonts/liberation
> 	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(TARGET_DIR)/usr/share/fonts/liberation/
> 	touch -c $(TARGET_DIR)/usr/share/fonts/.ttf

about the same 3 bugs as above.
Please, be more careful..
