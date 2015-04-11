From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Apr 2015 08:23:23 +0200
Subject: [Buildroot] [PATCH v4] *config: improve handling of BR2_LEGACY
In-Reply-To: <1428709742-4787-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 11 Apr 2015 01:49:02 +0200")
References: <1428709742-4787-1-git-send-email-arnout@mind.be>
Message-ID: <87wq1jches.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > In 8a46d4bf1f the randpackageconfig and allpackageyesconfig were
 > extended with disabling all the legacy options, otherwise the resulting
 > config couldn't be built. However, that didn't work for randconfig and
 > allyesconfig.

 > This commit reverts 8a46d4bf1f and replaces it with a different
 > approach: skipping of the legacy config options is passed explicitly
 > through the environment variable SKIP_LEGACY, which forces
 > BR2_SKIP_LEGACY to y. The new option BR2_SKIP_LEGACY completely
 > disables the legacy handling, which effectively removes all the legacy
 > options from the .config.

 > However, in that case no values are set for the legacy options so a
 > subsequent oldconfig will query them. Therefore, run an additional
 > olddefconfig.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > [yann.morin.1998 at free.fr: do not rely on a user-visible option, works
 >  perfectly well with only blind options set from the environment]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changes v3 -> v4: (Arnout)
 >   - remove redundant BR2_SKIP_LEGACY_ENV
 >   - improve commit message
 >   - add an explanatory comment

> @@ -718,51 +719,56 @@ config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 >  	@mkdir -p $(BUILD_DIR)/buildroot-config
 >  	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
 > +# For the config targets that automatically select options, we pass
 > +# BR2_LEGACY=y to disable the legacy options. However, in that case

This should be SKIP_LEGACY=y. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
