From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 22:59:53 +0200
Subject: [Buildroot] [PATCH] package/numactl: make available on all
 architectures
In-Reply-To: <20210418162359.3462571-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 18 Apr 2021 18:23:58 +0200")
References: <20210418162359.3462571-1-thomas.petazzoni@bootlin.com>
Message-ID: <87k0oog3sm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Since its introduction in commit
 > b05e74ff92b6728369e1540fc0a2bd60025f2146 in 2013, numactl has had an
 > explicit list of architectures that it supports. Interestingly, this
 > list does not include ARM, and now that rt-tests unconditionally needs
 > numactl, it meant the rt-tests package was no longer available on ARM.

 > Further investigation revealed that there is nothing in recent
 > versions of numactl that appears to be architecture-specific. It does
 > build with all of Buildroot toolchains currently used in the
 > autobuilders.

 > The only necessary changes are:

 >  * Exclude no-MMU architectures, as madvise() is used in the code
 >    base, and this is not available on no-MMU architectures.

 >  * Make sure to use -latomic when needed, as some atomic operations
 >    are used.

 >  * Backport a patch that fixes the .symver usage, which only affects
 >    really old gcc versions: only the old ARM Sourcery toolchain was
 >    affected by this. Newer gcc versions support the gcc "symver"
 >    attribute, so that the code that directly emits the assembly
 >    .symver directive is not invoked.

 > With these changes, numactl builds successfully on all our supported
 > toolchains.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I hesitated a bit as this is kind of a feature patch, but you can also
argue that the removal of rt-tests on E.G. ARM in 2021.02 is a
regression, so committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
