From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 2 Mar 2018 11:20:56 +0200
Subject: [Buildroot] [PATCH next] autofs: disable for musl
In-Reply-To: <210C7F60-BE04-4B02-9968-BD555DA0B783@openadk.org>
References: <d54d651ab276a4ae248de1c302788d3960103ff8.1519965634.git.baruch@tkos.co.il>
 <210C7F60-BE04-4B02-9968-BD555DA0B783@openadk.org>
Message-ID: <20180302092056.r3xnguaquajpq4ud@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Fri, Mar 02, 2018 at 08:51:17AM +0100, Waldemar Brodkorb wrote:
> oh, that is bad.
> Why it isn't failing for uClibc-ng?

Because uClibc-ng provides the _PATH_NSSWITCH_CONF macro.

> Or will it fail when running on the target?

I don't know, I have not tested. Looking through the code I see that autofs 
parses the content of nsswitch.conf. But I could not figure out how this 
information is used.

Maybe the correct fix is to provide a local _PATH_NSSWITCH_CONF definition for 
musl?

baruch

> > On 2. Mar 2018, at 05:40, Baruch Siach <baruch@tkos.co.il> wrote:
> > 
> > autofs requires nsswitch which musl libc does not implement. Commit
> > 873040371b14 (autofs: allow to use libtirpc) removed the
> > BR2_TOOLCHAIN_HAS_NATIVE_RPC dependency, making autofs available for
> > musl. Disable musl explicitly.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/a54/a549b62fbf03474ffd8586869637d083de275091/
> > http://autobuild.buildroot.net/results/b32/b3276b2cbd1e1c260f8df4c3945f51ddc09d492f/
> > http://autobuild.buildroot.net/results/10b/10b5c5b13971214d0439b715f1a46c78a5249309/
> > 
> > Cc: Waldemar Brodkorb <wbx@openadk.org>
> > Cc: Jonathan Ben Avraham <yba@tkos.co.il>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> > package/autofs/Config.in | 6 ++++--
> > 1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/autofs/Config.in b/package/autofs/Config.in
> > index efb0ec28ee7d..8bb5fe276f65 100644
> > --- a/package/autofs/Config.in
> > +++ b/package/autofs/Config.in
> > @@ -3,6 +3,7 @@ config BR2_PACKAGE_AUTOFS
> >    depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> >    depends on BR2_USE_MMU
> >    depends on !BR2_STATIC_LIBS # dlfcn
> > +    depends on !BR2_TOOLCHAIN_USES_MUSL # nsswitch
> >    select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> >    help
> >      Autofs controls the operation of the automount daemons. The
> > @@ -15,6 +16,7 @@ config BR2_PACKAGE_AUTOFS
> > 
> >      http://www.linuxfromscratch.org/blfs/view/svn/general/autofs.html
> > 
> > -comment "autofs needs a toolchain w/ NPTL and dynamic library"
> > +comment "autofs needs a glibc or uClibc toolchain w/ NPTL and dynamic library"
> >    depends on BR2_USE_MMU
> > -    depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> > +    depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
> > +        || BR2_TOOLCHAIN_USES_MUSL

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
