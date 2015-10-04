From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 17:07:44 +0200
Subject: [Buildroot] [PATCH v2 04/18] infra: move ccache handling to the
	toolchain wrapper
In-Reply-To: <1443961738-12149-5-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 4 Oct 2015 13:28:44 +0100")
References: <1443961738-12149-1-git-send-email-arnout@mind.be>
 <1443961738-12149-5-git-send-email-arnout@mind.be>
Message-ID: <87mvvyoenz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Since we always have a toolchain wrapper now, we can move the ccache
 > call to the toolchain wrapper.

 > The hostcc ccache handling obviously stays.

 > The global addition of ccache to TARGET_CC/CXX is removed, but many
 > individual packages and infras still add it. This means we have a
 > chain like this: ccache -> toolchain-wrapper -> ccache -> gcc
 > However, this is fairly harmless: for cache misses, the inner ccache
 > just adds overhead and for cache hits, the inner ccache is never
 > called. Later patches will remove these redundant ccache calls.

 > As a side effect, perl now supports ccache as well.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Danomi Manchego <danomimanchego123@gmail.com>
 > Cc: K?roly Kasza <kaszak@gmail.com>
 > Reviewed-by: Romain Naour <romain.naour@openwide.fr>

> +++ b/toolchain/toolchain-wrapper.mk
 > @@ -16,6 +16,10 @@ TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 >  # separate argument when used in execv() by the toolchain wrapper.
 >  TOOLCHAIN_WRAPPER_ARGS += -DBR_ADDITIONAL_CFLAGS='$(foreach f,$(call qstrip,$(BR2_TARGET_OPTIMIZATION)),"$(f)",)'
 
 > +ifeq ($(BR2_CCACHE),y)
 > +TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE='"$(CCACHE)"'
 > +endif

As I just mentioned IRL, CCACHE is $(HOST_DIR)/usr/bin/ccache, E.G the
absolute path to ccache - So hardcoding this in the wrapper isn't really
nice for relocatable SDK.

-- 
Bye, Peter Korsgaard
