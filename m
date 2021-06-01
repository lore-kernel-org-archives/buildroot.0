From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 1 Jun 2021 16:17:35 +0200
Subject: [Buildroot] [PATCHv3 02/15] core: introduce
 BR2_ENABLE_RUNTIME_DEBUG
In-Reply-To: <5360781d-d225-68f6-e419-6744b8fa9c16@mind.be>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
 <20210525122750.5022-3-patrickdepinguin@gmail.com>
 <5360781d-d225-68f6-e419-6744b8fa9c16@mind.be>
Message-ID: <CAAXf6LVJYVofxTrQBAutO_BSzgB9CoBGBRLFV33HCeBiC-d_GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar, 25 may 2021 a las 22:34, Arnout Vandecappelle
(<arnout@mind.be>) escribi?:
>
>
>
> On 25/05/2021 14:27, Thomas De Schampheleire wrote:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > Some packages have optional runtime assertions, extra traces, or other
> > elements that can help in debugging problems. However, such runtime elements
> > can negatively influence performance.
> >
> > In a test program performing 100K gRPC calls from a client to a local server
> > and receiving the returned response, we see following execution time:
> >
> >     - runtime debug enabled: 1065 seconds
> >     - runtime debug disabled:  48 seconds
> >
> > This is more than a factor 20 (!) difference. Analysis shows that the
> > problem mostly stems from libabseil-cpp (a dependency of gRPC) which enables
> > mutex deadlock analysis when the preprocessor flag 'NDEBUG' is not set,
> > which adds a 'backtrace()' call on every lock/unlock.  Potentially worse,
> > when libunwind is enabled and linked with the test program, 'backtrace()' is
> > not provided by glibc but by libunwind itself.
> >
> > For production systems, users expect good performance out-of-the-box. In the
> > example above, the difference is huge and unless explicitly tested and
> > analyzed, users may not realize that the performance could be much better.
> >
> > Address this problem by introducing a new option BR2_ENABLE_RUNTIME_DEBUG,
> > which can be used by packages or package infrastructures to set the
> > necessary flags.
> >
> > Note that BR2_ENABLE_RUNTIME_DEBUG is orthogonal to BR2_ENABLE_DEBUG: the
> > former changes runtime behavior, while the latter is only expected to add
> > debug symbols to the build. Today, the cmake build system does introduce a
> > runtime impact when BR2_ENABLE_DEBUG is set, but that will be rectified in a
> > subsequent commit.
> >
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > ---
> >  Config.in | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Config.in b/Config.in
> > index c65e34bd5e..a008425688 100644
> > --- a/Config.in
> > +++ b/Config.in
> > @@ -412,6 +412,19 @@ config BR2_DEBUG_3
> >  endchoice
> >  endif
> >
> > +config BR2_ENABLE_RUNTIME_DEBUG
>
>  I'm still not convinced that RUNTIME_DEBUG is the best name, but I can't think
> of anything better.
>
> > +     bool "build packages with runtime debugging info"
>
>  It's not debugging info (that is actually covered by BR2_ENABLE_DEBUG) - it's
> debugging support. Or maybe just "debugging".

It's hard to describe it well because the exact influence will depend
on the package.
For some it will only be asserts that enabled/disabled, others will
have extra traces, yet others will compile additional code for
developers.

I feel that "build packages with runtime debugging support" may give
the false impression that this option is needed in order to be able to
debug the package.

But likewise, the original title of this option could also be
interpreted incorrectly.

So I suggest that the person that applies the patch can make the final call ;-)

Thanks,
Thomas
