From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jun 2013 17:22:07 +0200
Subject: [Buildroot] [PATCH] bzip2: Rearrange build order
In-Reply-To: <8738swej95.fsf@dell.be.48ers.dk>
References: <1370436976-746-1-git-send-email-markos.chandras@gmail.com>
 <877gi8ekf6.fsf@dell.be.48ers.dk> <20130605160438.2a47341b@skate>
 <8738swej95.fsf@dell.be.48ers.dk>
Message-ID: <20130605172207.7251ce79@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 05 Jun 2013 16:15:34 +0200, Peter Korsgaard wrote:

>  Thomas> Are you sure there are not already many packages that build
>  Thomas> things only once with -fPIC and use that for both the static
>  Thomas> and the shared library?
> 
>  Thomas> What you're proposing here is quite the opposite to what you
>  Thomas> merged (from me) in a33baa1ef9dadbec8e45d411c30d636fa6b8872a
>  Thomas> (icu: don't build object files twice).
> 
> I've never claimed I was consistent ;) What I'm saying is simply that
> the "correct" way to do this, is to build the object files twice similar
> to how E.G. libtool does it.
> 
> For something as small (and possibly performance sensitive) as bzip2 I
> think it is worthwhile doing it.

I'm not sure I agree with your idea of making a different decision
depending on the package. Either we decide that all static libraries
should not be built with -fPIC, and we apply this rule on all packages,
or we decide that all static libraries are built with -fPIC, so that we
actually build object files only once.

In fact, I hadn't realized that libtool was building each and every .c
file twice, once without -fPIC for the static library, and once with
-fPIC for the shared library.

I believe we have three choices:

 (1) When !BR2_PREFER_STATIC_LIB, pass --enable-shared --disable-static
     instead of the current --enable-shared --enable-static. When I did
     009d8fceab4db7815502e4b0565fe0ef531d512c, I wasn't aware that
     having --enable-static was causing a double build of source files.
     Had I realized that, I would have probably suggested a different
     solution. If someone builds with !BR2_PREFER_STATIC_LIB, it's
     pretty unlikely that the static version of the libraries will be
     needed. There might be a few exceptions, but they can be handled
     by the user by adding --enable-static to the CONF_OPT of the
     specific packages he is interested in.

 (2) When !BR2_PREFER_STATIC_LIB, find a way of telling libtool not to
     build object files twice, and generate static libraries using the
     -fPIC capable object files. It's slightly less efficient, but if
     you're building !BR2_PREFER_STATIC_LIB, you're using shared
     libraries for most of your applications anyway, so having a small
     hit with the few static libraries isn't going to be really
     noticeable.

 (3) When !BR2_PREFER_STATIC_LIB, keep --enable-shared and
     --enable-static as we have today, and make sure that object files
     are always built twice, once without -fPIC, and once with. I
     believe this is making the build time longer, for situations
     (usage of static libraries when !BR2_PREFER_STATIC_LIB) that are
     fairly uncommon.

In any case, the solution of "some packages have their static library
objects built without -fPIC, some other packages have their static
library objects built with -fPIC" is not really nice. Where's the
boundary between the first and second category of packages?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
