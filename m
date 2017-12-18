From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 18 Dec 2017 13:05:25 +0000
Subject: [Buildroot] [PATCH] board: add support for ARC HS Development
 Kit (HSDK)
In-Reply-To: <20171218120618.4a8a9c83@windsurf>
References: <20171207170628.2806-1-didin@synopsys.com>
 <20171213083421.327551f7@windsurf.png.is.keysight.com>
 <1513188243.3598.20.camel@synopsys.com>
 <20171214070831.4339bc22@windsurf.png.is.keysight.com>
 <1513329342.29404.15.camel@synopsys.com> <20171218120618.4a8a9c83@windsurf>
Message-ID: <1513602324.3211.27.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2017-12-18 at 12:06 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 15 Dec 2017 09:15:43 +0000, Alexey Brodkin wrote:
> 
> > > I think option (3) is the best. But it has a drawback: it breaks
> > > backward compatibility for existing users that rely on the file being
> > > named uboot-env.bin. So instead, you could add a new U-Boot option that
> > > allows to customize the name of the generated image. By default it
> > > would be uboot-env.bin to keep backward compatibility, but it could be
> > > set to a different value in your defconfig.
> > > 
> > > Or we decide to break the backward compatibility :)  
> > 
> > Well here again we're bumping to a situation that "something might be used
> > by BR users and we don't know what and how" :)
> > 
> > I mean in upstream Buildroot (as of today, i.e. without HSDK support) 
> > "uboot-env.bin" is only used for dumping binary data into SD-card image,
> > which essentially means file name makes no sense as long as genimage.cfg mentions
> > it correctly and as it might be seen from my patch proposal it is already handled
> > (proabably I should have left the patch above in place so you don't need to
> > look-up my previous email).
> > 
> > So our only concern might be people use "uboot-env.bin" on their own.
> 
> I think we should simply make the output file name configurable, which
> solves your use case, and preserves backward compatibility. This should
> all be explained in the commit log.

Right, we're already working on the patch to that effect.

> > > > > This should instead use the generic support/scripts/genimage.sh
> > > > >     
> > > > > > +tar czf output/images/sdcard.img.tar.gz --directory="./output/images"  sdcard.img    
> > > > > 
> > > > > And this is not needed.    
> > > > 
> > > > Well IMHO compression of the image makes sense because that way we may generate images
> > > > with larger FAT-partition without bumping size of the output image.
> > > > 
> > > > See we always allocate a bit more space for FAT partition (or it is applicable to any not-last
> > > > partiotion - not sure about that) compared to what we need just to make sure it's enough space for our
> > > > stuff. Moreover I'd like to have some more space so I may for example put 2 uImages side by side
> > > > and switch between them later on and do it all without re-formatting of the SD-card.
> > > > 
> > > > And given how large SD-cards these days are I'm fine with allocating even 100Mb for first FAT partiotion.
> > > > Now if we don't compress sdcard.img it will be of size 100+ Mb. But if we gzip it then we only have size
> > > > of real payload, i.e. ~6-7 Mb while keeping a lot of flexibility for image user.
> > > > 
> > > > Not to mention a case of sharing built images.
> > > > 
> > > > That said I'd rather prefer to either compress images by default (does it really hurt?)
> > > > or at least have it as an option.  
> > > 
> > > I'm not sure we want to solve this in your specific post-image script,
> > > it's a more generic problem. Though I agree we don't have a good way of
> > > solving it right now.
> > > 
> > > Also, creating a tarball for just one file is a bit weird, you could
> > > just gzip sdcard.img to produce sdcard.img.gz.  
> > 
> > That's exactly what we do: we compress only resulting "sdcard.img" into "sdcard.img.tar.gz".
> 
> No, the code creates a tarball:
> 
> tar czf output/images/sdcard.img.tar.gz --directory="./output/images"  sdcard.img
> 
> Which is useless when compressing a single file. Just compress the file
> with gzip, no need to create a tarball.

I spotted that as well in Eugeniy's patch :)
Essentially there's no need for a tarball, plaingzip will be used.

> But again, I recommend against that, as none of our defconfigs do this
> currently.

As usual probably because people never had to share built images with others or
keep many of them. In comparison OpenWrt guys do it for all images just because
they build images for tons of boards and keep those images on FTPs.

> If you want to solve this problem, solve it separately,
> otherwise your defconfig will wait for ages before being merged.

Sure that makes perfect sense. But we'll keep working on that functionality so that
we'll be able to use it once corresponding patches are merged.

-Alexey
