From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 May 2013 16:58:14 +0200
Subject: [Buildroot] [PATCH 1/1] ser2net: add default init script
In-Reply-To: <20130505143252.GA13672@game.jcrosoft.org>
References: <1367757785-5850-1-git-send-email-plagnioj@jcrosoft.com>
 <20130505135025.GA3246@free.fr>
 <20130505143252.GA13672@game.jcrosoft.org>
Message-ID: <20130505145814.GB3246@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christophe, All,

On Sun, May 05, 2013 at 04:32:52PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 15:50 Sun 05 May     , Yann E. MORIN wrote:
> > Jean-Christophe, All,
> > 
> > See my comments inlined below.
> > 
> > On Sun, May 05, 2013 at 02:43:05PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > > add option to specify the configuration file
> > > 
> > > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> > > ---
> > >  package/ser2net/Config.in  |    9 +++++++++
> > >  package/ser2net/S50ser2net |   48 ++++++++++++++++++++++++++++++++++++++++++++
> > >  package/ser2net/ser2net.mk |   27 +++++++++++++++++++++++++
> > >  3 files changed, 84 insertions(+)
> > >  create mode 100644 package/ser2net/S50ser2net
> > > 
> > > diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
> > > index e3b8870..3480d85 100644
> > > --- a/package/ser2net/Config.in
> > > +++ b/package/ser2net/Config.in
> > > @@ -8,5 +8,14 @@ config BR2_PACKAGE_SER2NET
> > >  
> > >  	  http://ser2net.sourceforge.net
> > >  
> > > +if BR2_PACKAGE_SER2NET
> > > +
> > > +config BR2_PACKAGE_SER2NET_CONF
> > > +	string "Configuration file"
> > > +	help
> > > +	  Configuration file.
> > 
> > I think we should provide a default, basic configuration file that we
> > install unconditionnally to the rootfs. The user will then be free to
> > provide a post-build script to tweak that file.
> 
> I hate post-build it's not trackable and as it's completly board specific with
> x serial to export I do not want a generic file

It's not about what *you* want, it's about what is *best* for Buildroot
and *all* its users, *and* is maintenable and easily reproduced (which
pointing to a config file outside of the buildroot tree is definitely
not) *and* can fit your use case (which what I suggest should).

We're speaking about a _default_ and _simple_ configuration file. Of
course it can not cover all use cases, but just exporting a single
serial port would be enough. Customisation beyond that is really part of
the post-build scripts.

And if you think that post-build script are not trackable, then letting
the user specify a config file (presumably out-side of the Buildroot tree)
is no more trackable either. So this excuse does not hold water.

And I *do* track my post-build and post-image scripts. Here's the
setting I use:

    .../buildroot/          <- the buildroot tree
    .../board-X/            <- the board-X tree, which *is* a git tree
    .../board-X/configs/    <- dir with all .config files for board-X
    .../board-X/scripts/    <- dir with add scripts for board-X
    .../board-X/misc/       <- misc files to push into rootfs
    .../board-X/build/      <- untracked dir for out-of-tree build

Then I have those files tracked in my git tree:
    .../board-X/configs/br.defconfig
    .../board-X/configs/linux.defconfig
    .../board-X/configs/bb.defconfig
    .../board-X/scripts/ssh-key-in-root.ssh.authorized_keys
    .../board-X/scripts/other-mount-points-in-etc.fstab
    .../board-X/scripts/create-sdcard-image
    .../board-X/scripts/checksum-images
    .../board-X/misc/S98dvb-devices
   [and so on...]

Now, all I said above is my point of view. Just let see what the
maintainer will accept. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
