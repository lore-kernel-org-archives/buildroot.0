From: Alexey Galakhov <agalakhov@gmail.com>
Date: Mon, 7 Dec 2015 21:48:21 +0100
Subject: [Buildroot] [PATCH v2 1/1] core: add option to force compiling
 C++ as C++11
In-Reply-To: <5660D0FC.4000101@mind.be>
References: <1448893176-21456-1-git-send-email-agalakhov@gmail.com>
 <5660D0FC.4000101@mind.be>
Message-ID: <20151207214821.16c08d4d.agalakhov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 4 Dec 2015 00:32:12 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 30-11-15 15:19, Alexey Galakhov wrote:
> > Many C++ libraries like boost and log4cplus use defines to be
> > compatible with both C++03 and C++11 standards. This causes ABI
> > incompatibilities between a library built with C++03 and an
> > application built with C++11. To avoid this, one has to built
> > libraries as C++11 as well.
> > 
> > This patch introduces the BR2_ENABLE_CPP11 configuration option
> > that forces passing --std=c++11 to the compiler while building C++
> > target libraries.
> > 
> > Signed-off-by: Alexey Galakhov <agalakhov@gmail.com>  
> 
>  Hi Alexey,
> 
>  I've been mulling about this for some time and I'm not sure if we
> really want this. First of all, as I wrote before, it should probably
> be done automatically somehow instead of being user-selectable.
> However, I'm also afraid that some packages will fail to build with
> --std=c++11. Since we will not enable this option in the
> autobuilders, we will not notice such problems.
> 
>  Do you know of other packages (other than boost) that expose this
> problem? Perhaps instead we should add an option to boost only?

Hi Arnout,

At least log4cplus suffers from the same problem. Theoretically it
should affect every package that uses move constructors and checks the
version using the __cplusplus macro.

Unfortunately, it is impossible to do this not user-selectable. The
correct setting depends upon third-party programs installed on top of
the buildroot, and we have no way to determine the correct settings for
them.

We may override this option on per-package basis in case it gives
compilation problems. Theoretically any modern compiler should work
fine even with legacy code in C++11 mode, so it should be more or less
safe to enable C++11 for everything.

Regards,
Alexey
