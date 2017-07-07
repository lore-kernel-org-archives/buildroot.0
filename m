From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Jul 2017 17:26:55 +0200
Subject: [Buildroot] [PATCH] ccache: make default host-ccache cache dir
	fit for multi-user setups
In-Reply-To: <904fdb4b-2dd4-af9b-ac79-8e31cc554647@mind.be> (Arnout
 Vandecappelle's message of "Fri, 7 Jul 2017 17:18:11 +0200")
References: <20170706104841.7711-1-peter@korsgaard.com>
 <20170706212148.4f6a4f47@windsurf.lan>
 <87y3s1w672.fsf@dell.be.48ers.dk>
 <20170707092808.23bae4fd@windsurf.lan>
 <87podcwpbb.fsf@dell.be.48ers.dk>
 <904fdb4b-2dd4-af9b-ac79-8e31cc554647@mind.be>
Message-ID: <87lgo0w9mo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  I think Thomas's point is: ~/.br-ccache is fine, ~/foo/bar/directory is not
 > fine, even if that is what was configured in the buildroot config from which the
 > external toolchain was generated (and which is NOT the buildroot configuration
 > used by the final user, otherwise this problem wouldn't even occur).

Well, it is a choice made by whoever built the sdk, just like the gcc
version and C library or whatever.

If it truly makes sense to make this configuable is another question. I
have never used that feature at least (but we have plenty of other
features that I also don't use).

 >  I think Thomas, like me, means that we should instead revert
 > d93a0b402934309c632d4a825b7fe6183ce8c4c7.

That is also an option, but as we have been carrying this patch for > 3
years, there might be people using it.

 >  In fact, I think we should drop this Buildroot-specific patching entirely. As
 > far as I can see, BR_CACHE_DIR was introduced to replace the normal CCACHE_DIR
 > because way back when our ccache didn't reliably detect the compiler and would
 > reuse object files that we actually created with a different toolchain. So the
 > Buildroot-specific ccache would disable fingerprinting completely. Obviously, if
 > it would then reuse the same cache directory as the normal ccache, there would
 > be a huge risk that target ccache would use cached objects for the host...

 >  Nowadays we have the fingerprinting in place (which is hopefully still
 > reliable), so the reason for have a separate cache dir is gone IMO. So I think
 > we should just use CCACHE_DIR instead of BR_CACHE_DIR. BR2_CCACHE_DIR still
 > makes sense, since you may want to encode a shared ccache in your Buildroot
 > config. But I think it should default to empty, where empty means don't export
 > CCACHE_DIR and rely on ccache's default.

Yes, I have also always been uneasy about these ccache patches - But I
normally don't use ccache, so I'm not sure how bullet proof the finger
printing is.

 >  Such a change, however, would first require a test to be set up. And testing
 > ccache is decidedly non-trivial. Therefore it's a more long-term goal.
 > Therefore, this patch makes sense after all. Indeed, if a user currently
 > generates an SDK with the default configuration, it will definitely do the wrong
 > thing (pointing to another user's br-ccache directory). So I'll change my weak
 > NACK into a weak ACK.

Ok, thanks.

-- 
Bye, Peter Korsgaard
