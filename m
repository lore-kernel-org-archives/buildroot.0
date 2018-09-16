From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Sep 2018 08:36:47 +0300
Subject: [Buildroot] custom kernel
In-Reply-To: <CAKZffXFaJKWdaWXw6Ff7-Ptq+QrE0NDnOJOefBG2u-ZBjwiYEw@mail.gmail.com>
References: <CAKZffXHDkoZJ+LN75Cp3WZfuE3rdhH2SJTzA__7YC6YGY=M7MA@mail.gmail.com>
 <87efdw4otc.fsf@tkos.co.il>
 <CAKZffXFaJKWdaWXw6Ff7-Ptq+QrE0NDnOJOefBG2u-ZBjwiYEw@mail.gmail.com>
Message-ID: <20180916053647.awmnaxir2ogzakud@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jose,

On Fri, Sep 14, 2018 at 07:15:11PM +0200, Jose Luis Zabalza wrote:
> Thanks for the reply.
> But the override mechanism don't resolve my problem.
> First, I have to use a old Buildroot (2016.5) because has been tuned
> by a provider with scripts and other patches. Yes, I could change to a
> modern Buildroot version, but is a extra work. Second, the kernel has
> been tuned too, but the provider don't give me the patches or a git
> tree, only the source kernel tree tarball.

This is unfortunate.

> Now, I have to update the kernel with a patch , so, the solution is
> apply the patch to the provider kernel before using Buildroot..
> 
> It is a small annoyance but, I don't understand why if I use a
> "standard" kernel, Buildroot allows patch the kernel with "project
> patches"
>  and if I use a "custom" kernel, the "project patches mechanism" don't
> work. Yes, it can be assumed that the kernel must come complety
> patched, but you could also guess that the kernel must be patched with
> "project patches".

The source override feature is meant to be used during development. This does 
not match your use case. I'd suggest you to use the 
BR2_LINUX_KERNEL_CUSTOM_TARBALL option instead, with the file:// "protocol" to 
refer to a local file where you put your vendor provided tarball. You can then 
add patches on top of that.

baruch

> El vie., 14 sept. 2018 a las 7:42, Baruch Siach (<baruch@tkos.co.il>) 
>  escribi?:
> >
> > Hi Jose,
> >
> > Jose Luis Zabalza writes:
> > > Hello everybody.
> > >
> > > I have a buildroot config with custom linux kernel
> > >
> > > BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH="$(MYDIR)/linux"
> >
> > This symbol has been removed in version 2016.11. The new (old) way of
> > doing that is override srcdir:
> >
> >   https://git.busybox.net/buildroot/commit/?id=e782cd5b1bc231dda527d5d0a04e6a338669b92c
> >
> > See also
> >
> >   https://buildroot.org/downloads/manual/manual.html#_advanced_usage
> >
> > under "Using Buildroot during development".
> >
> > > BR2_LINUX_KERNEL_VERSION="custom"
> > > BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="$(MYDIR)/dts/mylinux_devtree.dts"
> > > BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> > > BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(MYDIR)/config/mylinux_defconfig
> > > BR2_LINUX_KERNEL_PATCH="$(MYDIR)/patches"
> > >
> > > Everything works fine except the patches in $(MYDIR)/patches are not applied.
> > >
> > > I tried to with
> > >
> > > BR2_GLOBAL_PATCH_DIR="$(MYDIR)/buildroot/packages-patches"
> > >
> > > leaving patches in
> > >     $(MYDIR)/buildroot/packages-patches/linux
> > > or
> > >     $(MYDIR)/buildroot/packages-patches/linux-custom
> > >
> > > but not patches are applied.
> > >
> > > Some idea?
> >
> > This behavior is by design. When you provide your own source tree,
> > Buildroot assumes that you customize it yourself. This is also explained
> > in the manual section I linked to above.
> >
> > baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
