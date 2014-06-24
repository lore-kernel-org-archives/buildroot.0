From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jun 2014 18:41:14 +0200
Subject: [Buildroot] [RFCv1 2/4] pkg-generic: add step_pkg_size global
 instrumentation hook
In-Reply-To: <53A9A92A.7030509@mind.be>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1402177567-8021-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <53A9A92A.7030509@mind.be>
Message-ID: <20140624184114.1b450ef8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 24 Jun 2014 18:36:58 +0200, Arnout Vandecappelle wrote:

> > +# Package size steps
> > +define step_pkg_size_start
> > +	echo "PKG SIZE START $(1)"
> > +	(cd $(TARGET_DIR) ; find . -type f) | sort > \
> > +		$(BUILD_DIR)/$(1).tmp_filelist_before
> > +endef
> > +
> > +define step_pkg_size_end
> > +	echo "PKG SIZE END $(1)"
> > +	(cd $(TARGET_DIR); find . -type f) | sort > \
> > +		$(BUILD_DIR)/$(1).tmp_filelist_after
> > +	diff -u $(BUILD_DIR)/$(1).tmp_filelist_before $(BUILD_DIR)/$(1).tmp_filelist_after | \
> > +		grep '^\+\./' | sed 's%^\+%%' > $(BUILD_DIR)/$(1).filelist
> > +	$(RM) -f $(BUILD_DIR)/$(1).tmp_filelist_before \
> > +		$(BUILD_DIR)/$(1).tmp_filelist_after
> > +endef
> > +
> > +define step_pkg_size
> > +	$(if $(filter install-target,$(2)),\
> > +		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3))) \
> > +		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3))))
> > +endef
> > +GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
> 
>  Since these instrumentation steps are relatively expensive (especially for
> large builds with many small packages), I would prefer to only enable this after
> setting some environment variable or config option or similar.

Agreed, I'll add this in the next iteration of the patch series.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
