From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Oct 2016 21:19:40 +0200
Subject: [Buildroot] [PATCH 1/2] package.snappy: fix static builds
In-Reply-To: <1475348688-1805-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 1 Oct 2016 21:04:47 +0200")
References: <1475348688-1805-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87intapnhv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > For some toolchains, libstdc++ uses pthread symbols:
 >     .../lib/libstdc++.a(eh_alloc.o): In function `__gnu_cxx::__mutex::lock()':
 >     eh_alloc.cc:(.text._ZN9__gnu_cxx7__mutex4lockEv[_ZN9__gnu_cxx7__mutex4lockEv]+0x2):
 >     undefined reference to `pthread_mutex_lock'

 > and a lot of other pthread symbols...

 > However, when doing a static build, there is no way for the linker what
 > library to link in, so the build fails miserably if -pthread is not
 > specified at link time.

 > Fixes:
 >     http://autobuild.buildroot.org/results/15e/15ecaa23f0116e8120b3d62e553c838f0303df35/
 >     http://autobuild.buildroot.org/results/f0a/f0abe301816e39eb4ae26d3e8cd42d90901d5ac5/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > Note: snappy's buildsystem uses libtool, and libsnappy.la does have the
 > necessary -pthread listed as a "dependency":

 >    16 # Linker flags that cannot go in dependency_libs.
 >    17 inherited_linker_flags=' -pthread'

 > But that is not picked-up by libtool, and I don't know why...

This is arguably a toolchain bug and the thing that fails to link is
just a unit test, so we could also disable it - But OK.

> ---
 >  package/snappy/snappy.mk | 8 ++++++++
 >  1 file changed, 8 insertions(+)

 > diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
 > index b00dddf..3e8d603 100644
 > --- a/package/snappy/snappy.mk
 > +++ b/package/snappy/snappy.mk
 > @@ -16,4 +16,12 @@ SNAPPY_INSTALL_STAGING = YES
 >  # Disable tests
 >  SNAPPY_CONF_OPTS = --disable-gtest
 
 > +# libsnappy links with libstdc++. libstdc++ uses pthread symbols. libstdc++
 > +# does not have a .pc file, and its .la file does not mention -pthread.
 > +# So, static links to libstdc++ will fail if -pthread is not explicity
 > +# linked to. Only do that for static builds.
 > +ifeq ($(BR2_STATIC_LIBS),y)
 > +SNAPPY_CONF_OPTS += LIBS=-pthread
 > +endif

Snappy doesn't depend on threads, so this should only be done if
BR2_TOOLCHAIN_HAS_THREADS.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
