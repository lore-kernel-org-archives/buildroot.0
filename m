From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 21 Feb 2018 07:06:14 +0000
Subject: [Buildroot] __mcount on ARC
In-Reply-To: <e88703ad-f70c-27b3-d142-18b898fa57b0@synopsys.com>
References: <8e90a87a-7e64-6662-3309-ce0325bc686f@gmail.com>
 <20180219090939.1f050545@windsurf.lan>
 <1519030700.14718.9.camel@synopsys.com>
 <e88703ad-f70c-27b3-d142-18b898fa57b0@synopsys.com>
Message-ID: <1519196773.5212.10.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vineet, Zoltan,

On Tue, 2018-02-20 at 12:53 -0800, Vineet Gupta wrote:
> On 02/19/2018 12:58 AM, Alexey Brodkin wrote:
> > 
> > Looks like ARC port of glibc only defines "_mcount" but not "__mcount", see
> 
> It used to be so before glibc commit 46e2c0e216ba ARC: Fix -pg build error which 
> has been in my
> glibc branch #vineet-glibc-master for quite some time and hopefully is the one 
> buildroot is picking up.

Nope we still refer to "arc-2017.09-release". That will be kept for upcoming BR release
which is happening this month and then we'll switch to newer tag like the most recent
arc-2018.03-eng00x.

> The driving force here is gcc which defines what mc* call is generated, and that 
> for ARC is __mcount
> 
> > ------------------------------------->8---------------------------------
> > arc-linux-readelf -s libc.so.6 | grep mcount
> >     124: 000b397c     4 FUNC    GLOBAL DEFAULT   11 _mcount@@GLIBC_2.26
> >     423: 000df95c    44 FUNC    GLOBAL DEFAULT   11 _dl_mcount_wrapper_check@@GLIBC_2.26
> >    1584: 000df944    22 FUNC    GLOBAL DEFAULT   11 _dl_mcount_wrapper@@GLIBC_2.26
> 
> On my end, I see
> 
> arc-linux-nm ./build/glibc-vineet-glibc-master/build/linkobj/libc.so | grep mcount
> 00070930 T __mcount
> 
> > ------------------------------------->8---------------------------------
> > 
> > and https://github.com/foss-for-synopsys-dwc-arc-processors/glibc/blob/vineet-glibc-master/sysdeps/arc/machine-gmon.h#L26
> 
> Look carefully, this actually defines __mcount not _mcount
> 
> > 
> > I'm an expert in neither glibc nor gprof so not sure what is a difference between
> > _mcount vs __mcount but for AArch64 thay set "strong_alias (__mcount, _mcount)" here:
> > https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/aarch64/mcount.c#l32
> > 
> > So maybe we need to do the same for ARC.
> 
> No, we don't have to  - don't try to apply bandaid without first checking if it is 
> really needed.

Thanks for all that technical background.

So Zoltan, please go ahead and disable profiling of GPSD for ARC but please
add a comment like "# Needs glibc for ARC to arc-2018.03-eng007+".

-Alexey
