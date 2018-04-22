From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 10:28:28 +0200
Subject: [Buildroot] [PATCH v2] lz4: improve static only build support
In-Reply-To: <20180421210510.v4zwz6y57z7stryx@tarshish>
References: <e5fee55fc78a363b247f0eb8594aa9f40d3a1526.1524199966.git.baruch@tkos.co.il>
 <20180420084143.3b20bd3a@windsurf.numericable.fr>
 <20180421210510.v4zwz6y57z7stryx@tarshish>
Message-ID: <20180422102828.01dd1455@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Sun, 22 Apr 2018 00:05:10 +0300, Baruch Siach wrote:

> > Admittedly, it isn't a huge improvement, but for consistency it would
> > be good to do that.  
> 
> Many other packages build both shared and static libraries when 
> BR2_SHARED_LIBS=y.

Yes, I know. I don't know how strict we want to be about this. Probably
not too much because it doesn't matter that much.

> This particular case is easy enough to fix, though.

Yes, that's the point: for this package, it's super easy to fix, so
it's nice to do it.

> Is there any advantage to not building the static library when 
> BR2_SHARED_LIBS=y other than the small build time reduction?

In some cases there is more than a "small build time reduction".

The object files that go in a shared library must be built with -fPIC.
Such object files can also be used in a static library, but the code is
not as optimized as it could be, and therefore object files that go in
a static library should ideally not be built with -fPIC. I believe some
packages (but not many) do build their object files twice, once with
-fPIC for the shared library, once without -fPIC for the static
library. This creates more than a "small build time reduction".

From the commit log of commit f1d3e09895b245da9d54bbaef36e5de95269034e:

    For example, a static+shared build of libglib2 takes 1 minutes and 59
    seconds, with a final build directory of 96 MB. A shared-only build of
    libglib2 takes only 1 minutes and 31 seconds (almost a 25% reduction
    of the build time), and the final build directory weights 89 MB (a
    reduction of almost 8%).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
