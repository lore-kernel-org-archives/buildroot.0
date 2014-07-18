From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 18 Jul 2014 16:30:49 +0300
Subject: [Buildroot] [PATCH] python: fix termios build for xtensa
In-Reply-To: <CAMo8BfKRNBdfHreAzjT+4N6Fi81SKbSsCFZxpp3GCRgz9XhGYg@mail.gmail.com>
References: <768f113a0cb394fde79b38ef52056ff8e335df0a.1405654360.git.baruch@tkos.co.il>
 <CAMo8BfKRNBdfHreAzjT+4N6Fi81SKbSsCFZxpp3GCRgz9XhGYg@mail.gmail.com>
Message-ID: <20140718133049.GC4914@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

On Fri, Jul 18, 2014 at 03:42:43PM +0400, Max Filippov wrote:
> On Fri, Jul 18, 2014 at 7:32 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > The xtensa ioctls.h header references struct serial_multiport_struct that is
> > not defined in this header or included headers. ioctls.h also references
> > tty_struct that is not exported to userspace at all. Add a patch fixing these
> > issues.
> >
> > This is only a workaround as the real problem should be fixed in the kernel
> > (by removing all struct references like all other archs). But since we support
> > older kernel versions we'll have to carry this patch for some time.
> >
> > Fixes:
> > http://autobuild.buildroot.net/results/12b/12b5612828d7f1fc7d1f69fc01341d5a6e628db5/
> >
> > Cc: Max Filippov <jcmvbkbc@gmail.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  .../python-015-serial-ioctl-workaround.patch       | 23 ++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 package/python/python-015-serial-ioctl-workaround.patch
> 
> Thank you, Baruch.
> I'll send corresponding linux patches. I definitely saw this issue
> some time ago,
> but I couldn't find any trace of that ):

You mean commit b973b4c91be8f (xtensa: fix TIOCGSERIAL and TIOCSSERIAL 
definitions)? It solved part of the problem.

It seems most other architectures migrated to asm-generic/ioctls.h.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
