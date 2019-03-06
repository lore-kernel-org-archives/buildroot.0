From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Mar 2019 23:25:43 +0100
Subject: [Buildroot] [git commit] core/pkg-infra: restore completeness
 of packages files lists
In-Reply-To: <6b2a27b3-5bd0-442f-80fb-608c858b9828@cesnet.cz>
References: <20190208083943.3BB41884AC@busybox.osuosl.org>
 <6b2a27b3-5bd0-442f-80fb-608c858b9828@cesnet.cz>
Message-ID: <20190306222543.GU2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan, All,

On 2019-03-06 12:57 +0100, Jan Kundr?t spake thusly:
> > package/pkg-generic.mk | 14 +++++++++++---
> > 1 file changed, 11 insertions(+), 3 deletions(-)
> >
> >diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> >index f5cab2b9c2..6168b40e89 100644
> >--- a/package/pkg-generic.mk
> >+++ b/package/pkg-generic.mk
> >@@ -63,13 +63,21 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
> > # $(2): base directory to search in
> > # $(3): suffix of file  (optional)
> > define step_pkg_size_inner
> >+	@touch $(BUILD_DIR)/.files-list$(3).stat
> > 	@touch $(BUILD_DIR)/packages-file-list$(3).txt
> > 	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
> > 	cd $(2); \
> >-	find . \( -type f -o -type l \) \
> >-		-newer $($(PKG)_DIR)/.stamp_built \
> >-		-exec printf '$(1),%s\n' {} + \
> >+	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
> >+		| LC_ALL=C sort > $(BUILD_DIR)/.files-list$(3).new
> >+	LC_ALL=C comm -13 \
> >+		$(BUILD_DIR)/.files-list$(3).stat \
> >+		$(BUILD_DIR)/.files-list$(3).new \
> >+		> $($(PKG)_BUILDDIR)/.files-list$(3).txt
> >+	sed -r -e 's/^[^,]+/$(1)/' \
> >+		$($(PKG)_BUILDDIR)/.files-list$(3).txt \
> > 		>> $(BUILD_DIR)/packages-file-list$(3).txt
> >+	mv $(BUILD_DIR)/.files-list$(3).new \
> >+		$(BUILD_DIR)/.files-list$(3).stat
> 
> This breaks top-level parallel build.

Yes, that's not unexpected, and I'm not entirely surprised.

So, TLPB is not yet supported, so fixing the files lists was deemed more
important than allowing an as-yet unsupported (and known to anyway
already break in other surprising and silent ways) "feature".

We also discussed this at the devloers days in Brussels, where I pointed
out that this would also break for PPSH (aka per-package staging+host,
aka PPD, perp-package directory). Again, fixing it for the upcoming LTS
was more important.

> Here's an example how it looks when it
> breaks:
[--SNIP--]
> I can't offer much insight into how to best fix this, unfortunately, whether
> to add some locking or whether to make this per-package.
> 
> This is just with a patched top-level Makefile to remove the .NOTPARALLEL
> stanza, with no per-package build dire patches atec.

And it is known that just removing .NOTPRALLEL would otherwise open a
can of worms, with much more subtle breakage anyway, like concurrent
acces to direcotries or files in target/  (install(1) is racy in how
it tests if a file exists and then creates it).

We've just made this breakage more verbose, now. ;-]

But really, the real way to TLPB is with PPD anyway.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
