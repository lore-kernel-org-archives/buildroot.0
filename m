From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 08:19:56 +0100
Subject: [Buildroot] [PATCH] Makefile: fix locale purge when
 BR2_PER_PACKAGE_DIRECTORIES=y
In-Reply-To: <20200316154623.972632-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 16 Mar 2020 16:46:23 +0100")
References: <20200316154623.972632-1-thomas.petazzoni@bootlin.com>
Message-ID: <87o8sifen7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > With BR2_PER_PACKAGE_DIRECTORIES=y, we have the following code in the
 > main Makefile:

 > target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
 > 	@$(call MESSAGE,"Finalizing target directory")
 > 	$(call per-package-rsync,$(sort $(PACKAGES)),target,$(TARGET_DIR))
 > 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))

 > The per-package-rsync call creates the global $(TARGET_DIR) from the
 > per-package $(TARGET_DIR). Then, we call the TARGET_FINALIZE_HOOKS.

 > One of the TARGET_FINALIZE_HOOKS, PURGE_LOCALES, remove locales that
 > are not desired by the user. It does so using a loop with the
 > $(wildcard ...) function.

 > However, the $(wildcard ...) function is expanded at the moment the
 > rule is evaluated. And with per-package directory, at the time the
 > rule is evaluated, the global $(TARGET_DIR) is empty, so $(wildcard
 > ...) will return nothing. It is indeed only after the call to
 > per-package-rsync that the TARGET_DIR will be populated.

 > This commit fixes that by moving away from $(wildcard ...) and use a
 > shell test instead, since we are anyway in big block of shell code.

 > With this, locales are properly purged again when
 > BR2_PER_PACKAGE_DIRECTORIES=y.

 > Fixes: c4e6d5c8be6ada8e7c60950e3b499c55d48761cb ("core: implement per-package SDK and target")
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
