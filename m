From: Anisse Astier <anisse@astier.eu>
Date: Thu, 19 Jul 2018 09:58:42 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: Avoid absolute path to python
 in shebang
In-Reply-To: <20180718171843.5ed5f10c@windsurf>
References: <1531413454-11546-1-git-send-email-david.owens@rockwellcollins.com>
 <20180718171843.5ed5f10c@windsurf>
Message-ID: <20180719075842.k3gxopajcat7f4dt@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

We just hit this issue with the buildroot-2018.02 branch. Is this is the
scope of LTS-backportable patches ?

Otherwise it's very easy to take the patch in an external, but I'm
guessing it might break other builds somewhere.

Regards,

Anisse


On Wed, Jul 18, 2018 at 05:18:43PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 12 Jul 2018 11:37:34 -0500, David Owens wrote:
> > When the output directory is nested under a long path name, calling the
> > gdbus-codegen, glib-genmarshal, or glib-mkenums scripts throws the
> > error:
> > 
> > > '/usr/bin/env: /...: No such file or directory'  
> > 
> > This is because libglib2 uses the absolute path to the python
> > interpreter for its shebang statements, and shebangs have a max length
> > of 127 chars[1]. A long absolute path will be cut off and appear as a
> > missing file.
> > 
> > Since the host Python is present in the $PATH passed to all packages, we
> > can copy the workaround from Yocto and just use the python interpreter
> > in $PATH[2]. However, 'python' is used instead of 'python3' as the
> > scripts are compatible with both.
> > 
> > [1] https://linux.die.net/man/2/execve
> > [2] http://cgit.openembedded.org/openembedded-core/commit/?id=eef7883587acc933d6f34b559ec03ff84d18573b
> > 
> > Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> > Signed-off-by: David Owens <david.owens@rockwellcollins.com>
> > ---
> >  ...t-hardcode-python-path-into-various-tools.patch | 48 ++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >  create mode 100644 package/libglib2/0004-Do-not-hardcode-python-path-into-various-tools.patch
> 
> Applied to master, thanks.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
