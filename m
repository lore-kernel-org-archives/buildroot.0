From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Feb 2012 22:37:57 +0100
Subject: [Buildroot] [PATCH 1/2] Add support for U-Boot SPL
In-Reply-To: <CALB96Nk748E0taoD_TGpsPyqe098yC6No-xzmLE+2EjHmtaZqw@mail.gmail.com>
References: <1328402147-21404-1-git-send-email-n-dechesne@ti.com>
 <201202100058.02053.arnout@mind.be>
 <CALB96Nk748E0taoD_TGpsPyqe098yC6No-xzmLE+2EjHmtaZqw@mail.gmail.com>
Message-ID: <201202102237.57366.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 10 February 2012 19:27:52 Dechesne, Nicolas wrote:
> On Fri, Feb 10, 2012 at 12:58 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
> >  It doesn't work well, but unfortunately I don't know how to solve it.
> > MLO and u-boot.img are only created for the omap configs, and only in
> > u-boot 2011.12 or later.  Depending on omap in the Config.in is almost
> > impossible, and also depending on 2011.12 is difficult because it could
> > be a custom git instead.
> >
> ouch. thanks for finding this out, as I didn't notice.
> 
> looking at the SPL code, it seems that SPL will parse the uboot file and
> try to determine the format. if it does not find the right signature it
> will assume it's raw, e.g. something a-la u-boot.bin.
> so we could patch SPL to load u-boot.bin (the name used by SPL is
> hardcoded). but that means that we have to carry over 1 patch and keep
> rebasing it...

 That doesn't sound like a very good idea, indeed.


> >  I think the only solution is to add a check in the .mk file if MLO and
> > u-boot.img indeed exist, and fall back to the default instead if not.
> >
> 
> indeed, the u-boot.img does not seem to be created unless it's needed (e.g.
> in OMAP case). so that might work.
> 
> would you accept such a solution? if so i can update my patches with that?

 I don't see why we would not accept that solution.

 However, I just saw that my remark applies to all other possible targets as
well.  It looks like the u-boot build produces just one of the possible images
(kwb, ldr, bin, -nand.bin) so the user is responsible for choosing the right
one in the config.  So I guess you can disregard my original remark.  Although
actually, I'd prefer if the BR2_TARGET_UBOOT_FORMAT_* options would just go
away.  The install commands can copy all of them, as far as they exist.  But
you don't have to worry about that, Nicolas.


> >  What is also missing is that the choice between the different image types
> > should depend on !BR2_TARGET_UBOOT_SPL.
> 
> sorry, i don't get this one. what do you mean?

 There is a prompt 'U-Boot binary format' that selects which u-boot.* to
install.  If you select SPL, the binary format must be .img.  So you should
make sure that the Config.in enforces that.

 Come to think of it, you can simply make the SPL one of the binary 
formats.  It's not exactly the same, of course, because MLO is a separate
file.  But it serves the same purpose: select the binary format appropriate
for the target.  So, move the BR2_TARGET_UBOOT_SPL config up 60 lines
so it becomes part of the binary format choice.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120210/40810971/attachment.html>
