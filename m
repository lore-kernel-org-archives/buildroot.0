From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 19:43:47 +0200
Subject: [Buildroot] [PATCH] linux: run depmod only if modules directory
 exists
In-Reply-To: <20200829145845.GI14354@scaer> (Yann E. MORIN's message of "Sat, 
 29 Aug 2020 16:58:45 +0200")
References: <20200623113859.172177-1-paul@crapouillou.net>
 <20200829145845.GI14354@scaer>
Message-ID: <87h7slfiuk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Paul, All,
 > On 2020-06-23 13:38 +0200, Paul Cercueil spake thusly:
 >> If the modules directory that corresponds to the version of the kernel
 >> being built has been deleted, don't try to run depmod, which will
 >> obviously fail.
 >> 
 >> This can happen for instance when the modules are stripped from the main
 >> root filesystem, and placed into a separate filesystem image, so that
 >> the root filesystem and the kernel can be updated separately.
 >> 
 >> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
 >> ---
 >> linux/linux.mk | 3 ++-
 >> 1 file changed, 2 insertions(+), 1 deletion(-)
 >> 
 >> diff --git a/linux/linux.mk b/linux/linux.mk
 >> index b90b032bb9..d31933fea1 100644
 >> --- a/linux/linux.mk
 >> +++ b/linux/linux.mk
 >> @@ -490,7 +490,8 @@ endef
 >> # Run depmod in a target-finalize hook, to encompass modules installed by
 >> # packages.
 >> define LINUX_RUN_DEPMOD
 >> -	if grep -q "CONFIG_MODULES=y" $(LINUX_DIR)/.config; then \
 >> +	if test -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED) \

 > Removing stuff from target and then expecting everything continues to
 > work as expected is a bit hackish, I believe. But another maintainer
 > was OK with that patch, so applied to master now, thanks.

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
