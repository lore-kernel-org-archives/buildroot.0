From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 15:44:04 +0200
Subject: [Buildroot] [PATCH v7 5/9] core: sanitize RPATH in host tree at
 the very end of the build
In-Reply-To: <4e228fa3-0126-6752-8a98-e17967b61fb3@mind.be>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-6-git-send-email-wg@grandegger.com>
 <4e228fa3-0126-6752-8a98-e17967b61fb3@mind.be>
Message-ID: <20170720154404.7533bf28@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 01:51:53 +0200, Arnout Vandecappelle wrote:

>  This sanitization takes a non-trivial amount of time. For example, on a config
> with basically just systemd enabled, rebuilding the rootfs tarballs without the
> sanitization takes just 5 seconds. target+staging sanitization adds 10 seconds
> to that. host sanitization adds another 20 seconds. So globally we go from 5 to
> 34 seconds as the baseline time to rebuild anything.

This is indeed not good.

>  Also, we discussed this before (also with Thomas): I'm not so sure we want to
> do this as part of the normal build. It would make sense to me to have a new
> "sdk" target which is NOT a dependency of world, that should be called
> explicitly to get a relocatable toolchain. That already solves a big part of the
> time issue I mentioned above. But it also means we can later add other things to
> that sdk target, like creating a tarball of it. And anyway the host sanitization
> is only useful if you're actually going to move the sdk somewhere else.

Yes for "make sdk".

>  Also, host-finalize (or sdk) should depend on toolchain, and probably also on
> $(filter host-%,$(PACKAGES)). The latter is currently incomplete, but when we
> get around to selecting BR2_PACKAGE_HOST_* for all host packages, we will make
> sure that 'make sdk' really generates the complete sdk.

For the SDK, you also need to build all the target packages. The SDK
contains the sysroot (i.e STAGING_DIR), where the target packages
install libraries and headers.

Basically, sdk needs to depend on "world".

>  And finally, I think that the staging sanitization fits better here than in
> target-finalize. It has nothing to do with target, and the only reason that we
> do such sanitization is to make the sdk relocatable.

The sanitization in staging and target has nothing to do with making
the SDK relocatable. Why do you think it's related ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
