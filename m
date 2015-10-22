From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Oct 2015 20:00:55 +0300
Subject: [Buildroot] ltp-testsuite without native RPC (commit
 8f1c4c49a2ab0fc9e6cf73370f4483e253e5ac2d)
In-Reply-To: <CAAXf6LVHGhhGiKvRd0bBDJqZ4ao5so637g_oUkdOfoa3v3RMqg@mail.gmail.com>
References: <CAAXf6LUBj47OW0+VBzeYE-Zh3jLMg77-kWCOiSCMPGiRKKSPfw@mail.gmail.com>
 <20151015181727.GI2451@tarshish>
 <CAAXf6LV5hJVK+zqbFHZ0qbwfShx2ZhyLBNdEXvURPpEJp+4=OQ@mail.gmail.com>
 <20151019173523.GX20889@tarshish> <20151020034901.GZ20889@tarshish>
 <CAAXf6LVHGhhGiKvRd0bBDJqZ4ao5so637g_oUkdOfoa3v3RMqg@mail.gmail.com>
Message-ID: <20151022170055.GE5512@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Oct 22, 2015 at 10:24:24AM +0200, Thomas De Schampheleire wrote:
> On Tue, Oct 20, 2015 at 5:49 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Mon, Oct 19, 2015 at 08:35:23PM +0300, Baruch Siach wrote:
> >> On Mon, Oct 19, 2015 at 03:26:18PM +0200, Thomas De Schampheleire wrote:
> >> > On Thu, Oct 15, 2015 at 8:17 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> >> > > On Thu, Oct 15, 2015 at 04:06:39PM +0200, Thomas De Schampheleire wrote:
> >> > >> What about patching ltp-testsuite instead, not enabling the RPC tests
> >> > >> in this case? At first sight this was added with following (ltp)
> >> > >> commit:
> >> > >> https://github.com/linux-test-project/ltp/commit/8e9a4dbb8eaa561e51d6d8ebe5a5342f3e498224
> >> > >
> >> > > Isn't that what ac_cv_header_tirpc_netconfig_h=no is doing?
> >> >
> >> > I just tried building ltp-testsuite with a no-rpc toolchain on top of
> >> > latest buildroot. Here is the build failure:
> >> >
> >> > /usr/bin/make -C lib -f
> >> > ".../output/build/ltp-testsuite-20150420/testcases/network/rpc/basic_tests/rpc01/lib/Makefile"
> >> > all
> >> > make[7]: Entering directory
> >> > `.../output/build/ltp-testsuite-20150420/testcases/network/rpc/basic_tests/rpc01/lib'
> >> > .../output/host/usr/bin/powerpc-linux-gcc -D_LARGEFILE_SOURCE
> >> > -D_LARGEFILE64_SOURCE -Os -g -O2 -fno-strict-aliasing -pipe -Wall -W
> >> > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -Wold-style-definition
> >> > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FORTIFY_SOURCE=2
> >> > -I../../../../../../include -I../../../../../../include  -c -o
> >> > librpc01.o librpc01.c
> >> > librpc01.c:19:21: fatal error: rpc/xdr.h: No such file or directory
> >> >  #include <rpc/xdr.h>
> >> >                      ^
> >> > compilation terminated.
> >> > make[7]: *** [librpc01.o] Error 1
> >> >
> >> >
> >> > I think my original problem (this was with a previous version of
> >> > ltp-testsuite) was that rpc/rpc.h was missing, but I think the bottom
> >> > line is the same: ltp-testsuite attempts to build RPC-related tests
> >> > but the necessary header files are not available.
> >> >
> >> > My approach was to add libtirpc to the equation, which provides the
> >> > header files and library to make things work.
> >> >
> >> > With your patch, libtirpc is not added, and so the header files remain
> >> > unavailable.
> >> >
> >> > How do you suggest to proceed?
> >> > One approach is to disable the ltp tests that use rpc entirely (on top
> >> > of your last patch), another one is to disable only the tests that use
> >> > authdes_create (on top of my original patch; reverting yours).
> >> > Other ideas are welcome, of course.
> >>
> >> The best solution seems to be fixing the root cause upstream. There was an
> >> attempt by Natanael Copa in commit c0547c56dafb8e1 (Add configure option to
> >> disable DES authentication) to add a --disable-authdes configure option to
> >> libtirpc. There was another attempt in commit 58cd17f999 (Fix: unresolved
> >> _crypt() symbols) to add a local implementation of DES. The first attempt was
> >> later reverted in commit f17b44048003 (Revert commit c0547c56dafb ('Add
> >> configure option to disable DES')) which also (inadvertedly?) removed
> >> des_crypt.c and des_impl.c from Makefile.am. Restoring the local DES
> >> implementation looks not so hard to do.
> >>
> >> In the mean time I think we can replace our
> >> 0007-Disable-DES-authentification-support.patch with something more flexible
> >> along the lines of Natanael's reverted patch.
> >
> > Which, of course, won't solve our problem.
> >
> > I'll look into the first approach (libtirpc local DES) if I find some time.
> 
> Thanks in advance, Baruch!

It turns out that making auth_des to build takes more than a DES 
implementation. NIS support is also needed.

At this point I think your original suggestion, i.e. disabling authdes_create 
tests, makes more sense. I'm not sure when I'll be able to look into this 
again, though.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
