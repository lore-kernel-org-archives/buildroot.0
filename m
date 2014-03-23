From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Mar 2014 20:50:36 +0100
Subject: [Buildroot] [PATCH] ccache: Make the cache directory after
	ccache is built
In-Reply-To: <1395349734-20969-2-git-send-email-dan.moulding@rackwareinc.com>
 (Dan Moulding's message of "Thu, 20 Mar 2014 15:08:54 -0600")
References: <1395349734-20969-1-git-send-email-dan.moulding@rackwareinc.com>
 <1395349734-20969-2-git-send-email-dan.moulding@rackwareinc.com>
Message-ID: <87lhw0vgmr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dan" == Dan Moulding <dan.moulding@rackwareinc.com> writes:

 > This ensures that the cache directory (and all of its ancestor
 > directories) exist. This is a nice thing to do because, if the parent
 > of the cache directory doesn't exist, then ccache will complain that
 > it cannot create the cache directory, causing the build to fail.

 > Signed-off-by: Dan Moulding <dan.moulding@rackwareinc.com>
 > ---
 >  package/ccache/ccache.mk | 9 +++++++++
 >  1 file changed, 9 insertions(+)

 > diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
 > index c2c9731..4ca9820 100644
 > --- a/package/ccache/ccache.mk
 > +++ b/package/ccache/ccache.mk
 > @@ -38,6 +38,15 @@ endef
 >  HOST_CCACHE_POST_CONFIGURE_HOOKS += \
 >  	HOST_CCACHE_PATCH_CONFIGURATION
 
 > +ifeq ($(BR2_CCACHE),y)

This doesn't need to be inside a BR2_CCACHE conditional (just like the
_PATCH_CONFIGURATION hook above) - As it isn't executed unless ccache is
built.

 > +define HOST_CCACHE_MAKE_CACHE_DIR
 > +	mkdir -p $(BR_CACHE_DIR)
 > +endef
 > +
 > +HOST_CCACHE_POST_BUILD_HOOKS += \
 > +	HOST_CCACHE_MAKE_CACHE_DIR

It's not really related to building ccache, more its proper installation
- So I've changed this to use _POST_INSTALL_HOOKS.

Committed with those changes, thanks.

-- 
Bye, Peter Korsgaard
