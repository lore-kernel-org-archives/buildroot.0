From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 10 Oct 2013 21:45:44 +0200
Subject: [Buildroot] [PATCH v4] ccache: expose control interface via
	'make ccache-options'
In-Reply-To: <1381427457-25627-1-git-send-email-tjlee@ambarella.com>
References: <CAAXf6LWg8YGG-yv3dvZjqswagBOMV8gmT1XsWz4KOygEbFUtGw@mail.gmail.com>
 <1381427457-25627-1-git-send-email-tjlee@ambarella.com>
Message-ID: <05215539-a7b2-47a5-a319-100742fdd41a@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tzu-Jung,

Tzu-Jung Lee <roylee17@gmail.com> wrote:
>usage:
>	# set cache limit size
>	make CCACHE_OPTIONS="--max-size=5G" ccache-options
>
>	# zero statistics counters
>	make CCACHE_OPTIONS="--zero-stats" ccache-options
>
>Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
>---
>Include the useful warning message suggested by Thomas.
>
>We might need a separate patch to obsolete the ccache-stats later.
>
> docs/manual/ccache-support.txt | 11 +++++++++++
> package/ccache/ccache.mk       | 11 +++++++++++
> 2 files changed, 22 insertions(+)
>
>diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
>index 4969180..fe06a01 100644
>--- a/docs/manual/ccache-support.txt
>+++ b/docs/manual/ccache-support.txt
>@@ -23,3 +23,14 @@ remove this directory.
> 
> You can get statistics on the cache (its size, number of hits,
> misses, etc.) by running +make ccache-stats+.
>+
>+The make target +ccache-options+ and the +CCACHE_OPTIONS+ variable
>+provide more generic access to the ccache. For example
>+
>+-----------------
>+# set cache limit size
>+make CCACHE_OPTIONS="--max-size=5G" ccache-options
>+
>+# zero statistics counters
>+make CCACHE_OPTIONS="--zero-stats" ccache-options
>+-----------------
>diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
>index c5e9385..7b6155d 100644
>--- a/package/ccache/ccache.mk
>+++ b/package/ccache/ccache.mk
>@@ -45,3 +45,14 @@ ifeq ($(BR2_CCACHE),y)
> ccache-stats: host-ccache
> 	$(Q)$(CCACHE) -s
> endif
>+
>+ifeq ($(BR2_CCACHE),y)
>+ccache-options: host-ccache
>+ifeq ($(CCACHE_OPTIONS),)
>+	$(Q)echo "Usage: make ccache-options CCACHE_OPTIONS=\"opts\""
>+	$(Q)echo "where 'opts' corresponds to one or more valid ccache options" \
>+	"(see ccache help text below)"
>+	$(Q)echo
>+endif
>+	$(Q)$(CCACHE) $(CCACHE_OPTIONS)
>+endif

Did you see my other comment about combining the ifeq statements of ccache-stats and ccache-options?

Best regards,
Thomas
