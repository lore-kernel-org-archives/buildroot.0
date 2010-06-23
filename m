From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 09:12:24 +0200
Subject: [Buildroot] On strip and debugging symbols
In-Reply-To: <87d3vi7qqq.fsf@macbook.be.48ers.dk>
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<87hbkv6sej.fsf@macbook.be.48ers.dk>
	<0D753D10438DA54287A00B027084269763715D651B@AUSP01VMBX24.collaborationhost.net>
	<87d3vi7qqq.fsf@macbook.be.48ers.dk>
Message-ID: <20100623091224.266d1030@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Jun 2010 22:32:29 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Anyway, this is what coreutils' install does, so we probably don't
> have much chance for changing it. I have been pondering always doing
> make install instead of install-strip as we always strip at the end
> anyway.

In the notes I have from our Buildroot Developer Day after FOSDEM in
February :

 * Figure out if we can always build the packages in $(STAGING) *with*
   debugging symbols. If so, make it the default. If not, make it an
   option (location to be decided ?)

Therefore, I'd propose to add two options (which would replace the
existing ENABLE_DEBUG knob) :

 * ENABLE_DEBUG_IN_STAGING, which is enabled by default, and has the
   effect of building all packages with '-g', and installing them
   unstripped in $(STAGING_DIR). All *packages* would be installed in
   STAGING, be there libraries or end-user applications, so we could
   get rid of the <pkg>_INSTALL_STAGING and <pkg>_INSTALL_TARGET knobs.
   Having the debugging symbols in $(STAGING_DIR) allows to use remote
   debugging correctly. All packages are installed with
   "DESTDIR=$(STAGING_DIR) install" and "DESTDIR=$(TARGET_DIR)
   install", and only the stripping in $(TARGET_DIR) is done at a
   global level. So we don't try to use install-strip anymore.

 * ENABLE_DEBUG_IN_TARGET, which depends on ENABLE_DEBUG_IN_STAGING,
   and is disabled by default. This would disable the stripping of
   binaries on the target, so as to keep debugging symbols on the
   target, in case someone wants to run/use gdb on the target.

With this, we would have three cases :

 * (ENABLE_DEBUG_IN_STAGING=y, ENABLE_DEBUG_IN_TARGET=n) which is the
   default behaviour. Packages are built with debugging symbols, they
   are kept in $(STAGING_DIR), removed in $(TARGET_DIR). Remote
   debugging is possible. Target debugging is not.

 * (ENABLE_DEBUG_IN_STAGING=n, ENABLE_DEBUG_IN_TARGET=n). In that case
   packages are built without debugging symbols. Binaries are kept
   unstripped in $(STAGING_DIR) and stripped in $(TARGET_DIR). Remote
   and target debugging are not possible.

 * (ENABLE_DEBUG_IN_STAGING=y, ENABLE_DEBUG_IN_TARGET=y). Packages are
   built with debugging symbols, they are kept in $(STAGING_DIR) *and*
   $(TARGET_DIR). Remote *and* target debugging are possible.

Are there other cases not handled here that would be useful ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
