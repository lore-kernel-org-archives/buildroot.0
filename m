From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 4 Jul 2016 09:54:42 +0000
Subject: [Buildroot] [PATCH] wandboard: Use HTTP for accessing Linux
 kernel and U-Boot git repos
In-Reply-To: <87wpl9ofm0.fsf@dell.be.48ers.dk>
References: <1467099927-32036-1-git-send-email-abrodkin@synopsys.com>
 <87eg7hpvm7.fsf@dell.be.48ers.dk> <1467102471.3231.17.camel@synopsys.com>
 <87wpl9ofm0.fsf@dell.be.48ers.dk>
Message-ID: <1467626012.31417.12.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, 2016-06-28 at 10:57 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> ?>> So I've changed it to use the release tarball instead.
> 
> ?> Thanks for that.
> 
> ?> Now I'm trying to get Wandboard working from the most recent upstream
> ?> kernel and U-Boot. If it all works I'll update that defconfig again :)
> 
> Great, thanks!

So I wanted to do another fixup to Wandboard very similar to what I did
for Cubieboard but looks like it requires patching of U-Boot.

What happens with the most recent U-Boot (I think I tried 2016.05 and 2016.07-rc2)
in Buildroot U-Boot's image happens to be a little bit too large.

Wandboard's SD-card layout is as follows:
1. SPL with offset 1k
2. U-Boot itself with offset 69k
3. U-Boot's environment with offset 384k

And because of u-boot.img being?323032 bytes long it simply doesn't fit in
those 315kB left before U-Boot env. That's what I see in my build console:
-------------------------->8-----------------------
hdimage(sdcard.img): part u-boot-env overlaps with previous partition
Makefile:672: recipe for target 'target-post-image' failed
make[1]: *** [target-post-image] Error 1
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2
-------------------------->8-----------------------

Note here we cannot fix the issue with changes in "board/wandboard/genimage.cfg"
because U-Boot's environment position is hardcoded in U-Boot's "include/configs/wandboard.h",
see?http://git.denx.de/?p=u-boot.git;a=blob;f=include/configs/wandboard.h#l184

Let me discuss this problem on U-Boot's mailing list first and then we either
backport upstream patch or we'll cook something out if the tree.

Interesting enough if I compile U-Boot for WB form the same sources but with ARM
toolchian available in my Fedora 23 host distro u-boot.img becomes a little bit more
compact and squeezes in its "partition" in SD-card image.

-Alexey?
