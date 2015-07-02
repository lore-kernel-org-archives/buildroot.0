From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 12:35:28 +0200
Subject: [Buildroot] [PATCH 1/1] force rsync of local package and try to
 rebuild it with its dependencies
In-Reply-To: <1435828515-16620-1-git-send-email-viallard@syscom-instruments.com>
References: <1435828515-16620-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <20150702123528.1d32089a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anthony Viallard,

On Thu,  2 Jul 2015 11:15:15 +0200, Anthony Viallard wrote:
> The purpose of this patch is to force rsync of local site packages and
> rebuild them if their source code has changed. Therefore, if the source
> of a package has changed, it will be rebuild if you type make or
> make <pkg>. Likewise, if a package has a library dependency which is
> local site package too and you type make <pkg>, the library will be
> rebuild if the source has been modified.
> 
> This behavior is pretty useful if you use buildroot with many of your
> own packages. Especially if you share these packages with a developer
> team through a version control system like git.

Again, I don't think we want this change in Buildroot. I don't think we
want *all* local packages to systematically be rsync'ed and rebuilt, at
every "make" invocation.

Maybe we want a separate "make rebuild-local" target (not sure of the
name), which would trigger this special action. Local packages could be
all registered in a global LOCAL_PACKAGES variable, and make
rebuild-local would rebuild them all.

Note that you could also solve this problem by adding something like
that in your external.mk (provided you're using BR2_EXTERNAL):

# Needs to be filled in with your complete list of packages
CUSTOM_PACKAGES = foo1 foo2 foo3

rebuild-custom: $(foreach p,$(CUSTOM_PACKAGES),$(p))

> -	rsync -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
> +	rsync -au $(RSYNC_VCS_EXCLUSIONS) --include core $(SRCDIR)/ $(@D)

This change is unrelated to the patch I believe.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
