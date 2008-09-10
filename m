From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 10 Sep 2008 20:47:50 +1000
Subject: [Buildroot] [PATCH] Ignore errors on rmdir in clean-targets;
	retry
In-Reply-To: <20080910081110.GA24785@aeon.hgd.crondor.net>
References: <20080910081110.GA24785@aeon.hgd.crondor.net>
Message-ID: <20080910104750.GA18852@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 10, 2008 at 10:11:10AM +0200, Michel Wilson wrote:
> Hi,
> 
> Same patch, better mailer :)
> As stated before, makes various clean-targets behave when some
> directories it tries to remove are missing.

Not just clean targets, fwiw:

> Index: target/jffs2/jffs2root.mk
> ===================================================================
> --- target/jffs2/jffs2root.mk	(revision 23359)
> +++ target/jffs2/jffs2root.mk	(working copy)
> @@ -58,7 +58,7 @@
>  ifneq ($(BR2_HAVE_INFOPAGES),y)
>  	@rm -rf $(TARGET_DIR)/usr/info
>  endif
> -	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
> +	@-rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
>  	$(if $(TARGET_LDCONFIG),test -x $(TARGET_LDCONFIG) && $(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null)
>  	# Use fakeroot to pretend all target binaries are owned by root
>  	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))

That's not in the clean target.

> Index: target/cloop/cloop.mk
> ===================================================================
> --- target/cloop/cloop.mk	(revision 23359)
> +++ target/cloop/cloop.mk	(working copy)
> @@ -71,7 +71,7 @@
>  	@rm -rf $(TARGET_DIR)/usr/info
>  	@rm -rf $(TARGET_DIR)/usr/share/info
>  endif
> -	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
> +	@-rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
>  	which mkisofs
>  	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
>  	- which symlinks && symlinks -r $(TARGET_DIR)

That's in check-tools target. (Which incidentally appears to be
namespace polution - cloop should prefix its target names with cloop.)

All this use of @... appears to be unnecessary information hiding too.
(Not blaming your patch for this of course.)

/usr/share is a standard system directory probably present in the target
skeleton, so it doesn't seem right for any package to be removing it
anyway.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
