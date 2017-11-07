From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Nov 2017 20:55:58 +0100
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <d79b315e-3ccd-5da3-4794-7ea97a296c0d@mind.be>
References: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>
 <20171107181307.58471ad9@windsurf>
 <d79b315e-3ccd-5da3-4794-7ea97a296c0d@mind.be>
Message-ID: <20171107205558.315ce04c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Nov 2017 18:55:20 +0100, Arnout Vandecappelle wrote:

> > in package/pkg-generic.mk. But of course, we need to exclude the
> > host-ccache package from this, otherwise we would have a circular
> > dependency. Do you want to try something like this?  
> 
>  Ha, I didn't understand the original problem but now I see. The issue is that
> ccache is part of DEPENDENCIES_HOST_PREREQ, and DEPENDENCIES_HOST_PREREQ is
> *not* added to each package's DEPENDENCIES,

Exactly.

> instead it is added to the
> core-dependencies target and each package depends on that. It's an easy way to
> avoid circular dependencies, I guess.
> 
>  So I think the proper solution would be to add DEPENDENCIES_HOST_PREREQ to the
> dependencies of all packages except themselves, similar to how it's done for
> toolchain.

Isn't this DEPENDENCIES_HOST_PREREQ thing a bit crappy in the first
place? Why isn't host-ccache simply added as a dependency of all
packages, except itself?

Another example is that today, host-lzip is always built at the
beginning of build, even if you're not building any package that needs
the lzip "decompressor".

So perhaps this calls for a little bit of rework in this area, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
