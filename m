From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 17:22:33 +0100
Subject: [Buildroot] Making the Qt5 packaging compatible with
 per-package folder
In-Reply-To: <20181116171845.4bc2a936@windsurf>
References: <20181116171845.4bc2a936@windsurf>
Message-ID: <20181203172233.3dbc0867@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Ga?l,

I was wondering if you had any feedback/idea on the below
questions/issues ?

Thanks!

Thomas

On Fri, 16 Nov 2018 17:18:45 +0100, Thomas Petazzoni wrote:
> Peter, Ga?l,
> 
> I don't know if you have followed the discussion, but I recently sent a
> new iteration of the per-package folder series [1], which allows to
> support top-level parallel build.
> 
> One issue is that the Qt5 packaging as done today in Buildroot is not
> compatible with per-package folders.
> 
> If you remember well, the installation of each Qt5 module works like
> this:
> 
>  - Staging installation
> 
>    Just "make install". No DESTDIR or INSTALL_ROOT is passed, because
>    the installation path is hardcoded in qmake itself. "make install"
>    will install stuff to both $(HOST_DIR) and $(STAGING_DIR).
> 
>  - Target installation
> 
>    We manually copy the shared libraries, QML files, fonts, and other
>    stuff. This is already annoying to maintain today, because we
>    sometimes forget to install something that is important, we need to
>    handle the LTS/latest Qt5 version difference, etc. It would be a lot
>    less maintenance if we could use "make install" also for the target
>    installation.
> 
> Even if the current packaging is not ideal, it worked fine. But it
> breaks badly with per-package folders. As explained above, the paths in
> qmake are hardcoded. So when you do "make install" in qt5location for
> example, it ends up being installed in the per-package folder of
> qt5base (both HOST_DIR and STAGING_DIR), as it's the qt5base
> HOST_DIR/STAGING_DIR that are hardcoded inside the qmake binary.
> 
> I tried to fix this issue, but for the moment, I haven't found a
> solution. I first tried to use the -extprefix ./configure option, but
> it didn't behave as we needed. Then I tried to do some manual
> replacement in the Qt5 Makefiles after they have been generated (like
> OpenEmbedded is doing), but they unfortunately get re-generated because
> we tweak the .prl files from Qt5, and the Qt5 Makefiles regenerates the
> Mkaefiles if they are older than the .prl files.
> 
> The current status of my experiment is visible at
> https://git.bootlin.com/users/thomas-petazzoni/buildroot/commit/?h=ppsh-qt5&id=676d26ab1ca3d8f8ee5788dbc06f4e0703188bf1,
> with a very long commit that explains the problem, and what was tried
> so far. At this point, I am considering cheating on the date of
> the .prl file to avoid the Makefiles from being re-generated, but this
> is really a hack on top of what is already a hack.
> 
> Do you have some other ideas to solve this ? Can we fix qmake to do the
> right thing ?
> 
> Thanks a lot for your help,
> 
> Thomas
> 
> [1] http://patchwork.ozlabs.org/project/buildroot/list/?series=75909



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
