From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 23 Jul 2008 23:42:17 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
In-Reply-To: <20080723103550.70E8B3C7D7@busybox.net>
References: <20080723103550.70E8B3C7D7@busybox.net>
Message-ID: <20080723134217.GC27147@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 23, 2008 at 03:35:50AM -0700, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-07-23 03:35:50 -0700 (Wed, 23 Jul 2008)
> New Revision: 22929
> 
> Log:
> gettext: also remove from staging on -clean
> 
> Modified:
>    trunk/buildroot/package/gettext/gettext.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/gettext/gettext.mk
> ===================================================================
> --- trunk/buildroot/package/gettext/gettext.mk	2008-07-23 08:41:08 UTC (rev 22928)
> +++ trunk/buildroot/package/gettext/gettext.mk	2008-07-23 10:35:50 UTC (rev 22929)
> @@ -125,6 +125,7 @@
>  gettext-unpacked: $(GETTEXT_DIR)/.unpacked
>  
>  gettext-clean:
> +	-$(MAKE) DESTDIR=$(STAGING_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) uninstall
>  	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) uninstall
>  	-$(MAKE) -C $(GETTEXT_DIR) clean

This demonstrates another problem with sharing the build_$(ARCH) (and
particularly build_$(ARCH)/staging-dir) between projects built out of
the same tree.. running gettext-clean (probably among others) on one
project trashes the staging directory for others. Rebuilding those will
reinstall it in the staging directory I suppose.

Personally I think the shared build_$(ARCH) is just wrong with multiple
projects. I might hack my local copy to define BUILD_DIR to match
PROJECT_BUILD_DIR to fix this.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
