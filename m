From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2011 21:52:26 +0200
Subject: [Buildroot] [PATCH] Makefile.package.in: Makes it possible to
 override the default extract commands
In-Reply-To: <20110510204332.62afd066@surf>
References: <1305027254-21565-1-git-send-email-a@awn.dk>
	<1305027254-21565-2-git-send-email-a@awn.dk>
	<20110510204332.62afd066@surf>
Message-ID: <20110516215226.26540f2a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Allan,

On Tue, 10 May 2011 20:43:32 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> > +# default extract command
> > +$(2)_EXTRACT_CMDS ?= $(if $($(2)_SOURCE),$(INFLATE$(suffix
> > $($(2)_SOURCE))) $(DL_DIR)/$($(2)_SOURCE) | \
> > +	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR)
> > $(TAR_OPTIONS) -)
> 
> Hm, this is not some nice. I'm currently testing your patch, I'll see
> if I find a better way of writing this.

I haven't really searched a better way of writing this, but I've used
your patch and found some problem with it. It does not quote
sufficiently the variables, so things break with host packages.

I have been able to get things working with:

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 9949b58..0a4c220 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -425,7 +425,8 @@ $(2)_TARGET_CLEAN =         $$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =         $$($(2)_DIR)/.stamp_dircleaned
 
 # default extract command
-$(2)_EXTRACT_CMDS ?= $(if $($(2)_SOURCE),$(INFLATE$(suffix $($(2)_SOURCE))) $(DL_DIR)/$($(2)_SOURCE) | \
+$(2)_EXTRACT_CMDS ?= \
+       $$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS)
        -)

On top of what you did.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
