From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Jun 2011 07:23:24 +0300
Subject: [Buildroot] how to tune powerpc e500v2 cpus in BR
In-Reply-To: <4E08E6DB.4070606@rossvideo.com>
References: <BANLkTikRNGx1Mte+sOYDeOr9f896K8GuZw@mail.gmail.com>
 <4E04C9EE.4050206@rossvideo.com>
 <20110627035939.GB3046@jasper.tkos.co.il>
 <BANLkTinSC4W8=vwRCHYmBndbJqt7rv=xgQ@mail.gmail.com>
 <4E08E6DB.4070606@rossvideo.com>
Message-ID: <20110628042324.GA3154@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matias, raymod,
On Mon, Jun 27, 2011 at 04:23:55PM -0400, Matias Garcia wrote:
> On 11-06-27 04:10 PM, raymond zhao wrote:
> >On Sun, Jun 26, 2011 at 11:59 PM, Baruch Siach<baruch@tkos.co.il>  wrote:
> >>Hi Raymond, Matias,
> >>I'm also using the CodeSourcery toolchain for the e500v2 target (P1011), and I
> >>figured out that I must pass -te500v2 to gcc at link time as well. Since there
> >>is no generic way to add LDFLAGS options in Buildroot, I've posted the patch
> >>at http://lists.busybox.net/pipermail/buildroot/2011-June/043668.html. Did you
> >>find a better solution?
> >>
> >I took a look at the CodeSourcery. Looks it doesn't support uCLibc.

Yes. I'm also trying to build a uClibc toolchain using crosstool-ng. No luck 
yet. You may try the Aboriginal Linux toolchain 
(http://landley.net/aboriginal/downloads/binaries/), although it's based on an 
old gcc version (4.2.1).

> changbing: That's correct. You may find an older toolchain from them
> that uses uClibc, but you'll have to specify it yourself in the
> Buildroot config. I found a very small difference in size (<2MB)
> between uclibc and eglibc filesystems, but I'm using 32MB of flash
> just for the OS, so small is relative.

The greatest advantage of uClibc is that it behaves better when doing static 
linking. I use it to generate Busybox based initramfs, and for this use case 
the 2MB size reduction is a big difference.

> Baruch: I use the external toolchain wrapper introduced just before
> 2011.05, but I had to patch it to add arbitrary options. I posted a
> couple of patches here, one that introduces a new option for
> selecting the sysroot when compiling the external wrapper, and
> another that simply passes the BR2_TARGET_OPTIMIZATIONS to the
> external wrapper, but they didn't get much attention.

Can this solve the link time -te500v2 issue? I'll look into this.

baruch

> I prefer the first method (new config option) because you can choose
> not to pass the optimizations at some later point for whatever
> reason, and thus use the wrapper only to select your sysroot.
> 
> Cheers,
> Matias

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
