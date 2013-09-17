From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Tue, 17 Sep 2013 09:56:56 -0500
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
In-Reply-To: <20130917063717.1b005fd2@skate>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <52376C45.1020406@mind.be> <20130917063717.1b005fd2@skate>
Message-ID: <OF999C53E5.E2BBEA65-ON86257BE9.004D220D-86257BE9.00521E02@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 
09/16/2013 11:37:17 PM:

> Dear Arnout Vandecappelle,
> 
> On Mon, 16 Sep 2013 22:38:29 +0200, Arnout Vandecappelle wrote:
[...]
> > 2. I really have a huge problem with the fact that the .config is no 
> > longer complete, and that instead you have to explicitly provide
> > extra command-line arguments to be able to reproduce the build. And
> > it doesn't help that it behaves differently when you have an
> > out-of-tree output directory (where the BR2_EXTERNAL is stored) than
> > when you're using the default output directory. I'm actually very
> > surprised that nobody else seems to have a problem with this. So for
> > me, this gets a big Nack unless the BR2_EXTERNAL is stored in
> > the .config.
> 
> On the wrapper Makefile that contains BR2_EXTERNAL, I am not convinced
> it is a good idea, since as you mention it creates a difference whether
> you're building out-of-tree from the output directory, or out-of-tree
> but from the source directory. I think this is not good, and therefore
> that BR2_EXTERNAL shouldn't be kept in the wrapper Makefile.

I do think that concerns those are valid concerns but from my use with 
BR2_EXTERNAL (with both v1 and v2) here is my take away with the 
experience. Note: I've been using this almost exclusively the last week
since I've had to put together some new board configuration.

Having to make sure that BR2_EXTERNAL is defined when you call make 
gets very annoying quickly. I understand that I can just export 
BR2_EXTERNAL 
to your environment to not have to declare BR2_EXTERNAL every time. 
So to make my life easier, I've did just that but have run into one 
major gotcha with it. Exporting BR2_EXTERNAL to the environment is 
just as unclear as being written to the wrapper makefile and if I 
come back to shell and forget to check what BR2_EXTERNAL is, I can
perform a build with BR2_EXTERNAL that isn't correct for that board.

Well beta testing this latest patchset, I've found that putting it the 
wrapper makefile has allowed to not always have to keep putting 
BR2_EXTERNAL
in but also not have BR2_EXTERNAL seek into other builds/configurations.
I know in my external build folder that I'm using X defconfig the Y 
BR2_EXTERNAL and I usually don't have any reason to change Y because 
that folder has been dedicated to a specific project that share common
BR2_EXTERNAL.

Maybe with BR2_EXTERNAL, we can encourage the use of O= since to quote 
Thomas from below: "it's a local build decision"? I don't know what is
best do here since the way BR2_EXTERNAL has been implement here I feel
is the best way and since BR2_EXTERNAL is completely optional I don't
know if encouraging the use O= is a bad thing.
 
> However, I still do not understand how storing BR2_EXTERNAL in .config
> will clarify things for the user. Changing BR2_EXTERNAL affects what
> 'menuconfig' shows. So there is no way for 'menuconfig' to update what
> it displays when the user changes the value of BR2_EXTERNAL without
> exiting/re-running menuconfig, which sounds really odd.
> 
> To me, BR2_EXTERNAL= is a bit like O=, it's a local build decision that
> you make to add some external configurations/external packages. Most
> likely, if you have external packages in BR2_EXTERNAL, the defconfig
> you have to use is also in BR2_EXTERNAL, so there's no way you can
> forget to specify BR2_EXTERNAL on the command, since otherwise you
> won't be able to even see your defconfig.

I completely agree with this as while using this patchset, I've forgotten
to specify BR2_EXTERNAL so I don't get see the defconfig I'm looking for.
I guess is a subtle reminder that I haven't specified BR2_EXTERNAL.

My usual workflow while using this patchset is follows:

make BR2_EXTERNAL=/some/path help
[find the defconfig I want to build for]
make BR2_EXTERNAL=/some/path O=/build/path defconfig
cd /build/path
[do buildroot menuconfig stuff if needed]]
make

Here is my workflow when doing a new BR2_EXTERNAL build that I've found
useful

make BR2_EXTERNAL=/some/path O=/build/path allnoconfig
cd /build/path
make menuconfig
[make my buildroot configuration selections]
make savedefconfig 
[NOTE: in buildroot menuconfig the save defconfig option has set to 
$(BR2_EXTERNAL)/configs/some_defconfig]
 
> So while I do agree that being able to store BR2_EXTERNAL would be
> nice, I don't see how it can be achieved in a way that isn't confusing
> for the user.

I agree too, maybe 

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130917/b019f883/attachment-0001.html>
