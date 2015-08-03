From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 3 Aug 2015 11:16:00 +0000
Subject: [Buildroot] [PATCH] u-boot: 2015.07 - fix creation of .config
In-Reply-To: <1438355649.4848.41.camel@synopsys.com>
References: <1438351475-14447-1-git-send-email-abrodkin@synopsys.com>
 <20150731161818.2056383e@free-electrons.com>
 <1438355649.4848.41.camel@synopsys.com>
Message-ID: <1438600559.13201.4.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2015-07-31 at 18:14 +0300, Alexey Brodkin wrote:
> Hi Thomas,
> 
> On Fri, 2015-07-31 at 16:18 +0200, Thomas Petazzoni wrote:
> > Alexey,
> > 
> > On Fri, 31 Jul 2015 17:04:35 +0300, Alexey Brodkin wrote:
> > > Due to recent changes in U-Boot, see
> > > http://git.denx.de/?p=u-boot.git;a=commit;h=a26cd04920dc069fd6e91abb785426cf6c29f45f
> > > re-creation of .config from defconfig by "make oldconfig" happened
> > > incorrectly.
> > 
> > Hum, reverting an upstream patch doesn't really seem like a proper
> > solution for the problem. Also, it will only fix the problem for those
> > using exactly U-Boot 2015.07, but not for the majority of users who
> > have to use a vendor-specific U-Boot version (unfortunately).
> > 
> > So I believe we need to fix this properly, not by reverting an upstream
> > patch.
> 
> To be honest I think that revert will happen upstream as well.
> Recently I started discussion on that regard here http://lists.denx.de/pipermail/u-boot/2015-July/221101.html
> 
> The point is that problem has to be resolved upstream anyways in that or another way and I'll make sure
> it happens sooner [I hope] or later. Because you know we prefer to stick to upstream and so we do care upstream
> projects work for us.
> 
> And if [I hope] discussed problem is gone before the next release of Buildroot do we really care
> how the problem is solved in Buildroot for existing release?
> 
> Note that problem I'm attempting to fix doesn't really affect U-Boot compilation or execution.
> This is only related to its buildsystem. As a developers of U-Boot we [even though it was not I in person
> behind that patch but I saw this and didn't recognize upcoming problem with oldconfig] wanted to make
> life of U-Boot users a bit easier [see commit message to the original commit] but that attempt
> caused problems for those who builds U-Boot in non-standard way [I mean not via "make xxx_defconfig && make"].
> 
> Hopefully that comment makes sense.
> 
> If not do you think there's a better way to fix a failure on attempt to build vanilla U-Boot v2015.07?
> 
> BTW speaking about vendor-specific U-Boot versions I think it's now mostly our legacy now.
> If I'm not mistaken lots of boards may use vanilla U-Boot. For example Cubieboards and Wandboards
> (I own these boards and tried vanilla U-boot on them) and many more ARM boards supported in Fedora
> for ARM like Pandaboard, Olinuxinos etc. So it's just a matter of maintainers of those boards
> (if we have them at all) to try latest vanilla U-Boot and update defconfigs then if all works.

Looks like resolution in upstream U-Boot will be with specification of default "platform" for each architecture.
See http://lists.denx.de/pipermail/u-boot/2015-August/221418.html, 
http://lists.denx.de/pipermail/u-boot/2015-August/221417.html

Still this will take quite some time to update all affected 54 Kconfigs.

So probably proposed patch with revert in Buildroot makes perfect sense as we only build U-Boot but not
adding new "platforms" etc i.e. proposed patch IMHO won't hurt.

-Alexey
