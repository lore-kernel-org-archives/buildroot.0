From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 12 Aug 2017 11:54:36 -0400
Subject: [Buildroot] [PATCH v6 1/3] rpi-userland: fix opengl library
	symlinks
In-Reply-To: <e68a0fc8-7ad3-26c3-02a3-79a794600271@mind.be>
References: <20170811013358.26864-1-gael.portay@savoirfairelinux.com>
 <20170811013358.26864-2-gael.portay@savoirfairelinux.com>
 <e68a0fc8-7ad3-26c3-02a3-79a794600271@mind.be>
Message-ID: <20170812155436.eh73caa3ejsvedkn@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Sat, Aug 12, 2017 at 05:31:16PM +0200, Arnout Vandecappelle wrote:
>  Since you're probably going to send a v7 with the IA32 workaround, some
> comments on this patch which I'd otherwise fix up while applying.
> 
> On 11-08-17 03:33, Ga?l PORTAY wrote:
> > The Qt WebEngine module loads libEGL.so.1 and libGLESv2.so.2 libraries.
> > Path are hard-coded [1].
>   Paths
> 
> > 
> > This patch sets up cmake to create those library links.
> > 
> > 	# ls -l /usr/lib/lib*GL*
> > 	lrwxrwxrwx    1 root     root            11 Mar 21 17:24 /usr/lib/libEGL.so -> libEGL.so.1
> > 	lrwxrwxrwx    1 root     root            15 Mar 21 17:24 /usr/lib/libEGL.so.1 -> libEGL.so.1.0.0
> > 	-rwxr-xr-x    1 root     root        163152 Mar 22 14:56 /usr/lib/libEGL.so.1.0.0
> > 	lrwxrwxrwx    1 root     root            14 Mar 21 17:24 /usr/lib/libGLESv2.so -> libGLESv2.so.2
> > 	lrwxrwxrwx    1 root     root            18 Mar 21 17:24 /usr/lib/libGLESv2.so.2 -> libGLESv2.so.2.0.0
> > 	-rwxr-xr-x    1 root     root         78788 Mar 22 14:56 /usr/lib/libGLESv2.so.2.0.0
> 
>  If I read the code correctly (I didn't try to execute it), it will actually
> create a link libEGL.so.1 -> libEGL.so, so where do you get the above?

You are right, this output is outdated.

	$ ls -l /usr/lib/lib*GL*
	-rwxr-xr-x 1 gportay gportay 130032 Aug 10 21:16 libbrcmEGL.so
	-rwxr-xr-x 1 gportay gportay  71088 Aug 10 21:17 libbrcmGLESv2.so
	-rwxr-xr-x 1 gportay gportay 130032 Aug 10 21:17 libEGL.so
	lrwxrwxrwx 1 gportay gportay      9 Aug  9 12:30 libEGL.so.1 -> libEGL.so
	-rwxr-xr-x 1 gportay gportay  71088 Aug 10 21:16 libGLESv2.so
	lrwxrwxrwx 1 gportay gportay     12 Aug  9 12:30 libGLESv2.so.2 -> libGLESv2.so

> 
> > 
> > A pull request is pending [2].
> > 
> > [1] https://github.com/qt/qtwebengine/blob/5.8.0/src/core/surface_factory_qt.cpp#L76-L86
> 
>  Perhaps use the 5.9.1 link now:
> https://github.com/qt/qtwebengine/blob/v5.9.1/src/core/surface_factory_qt.cpp#L76-L86
> 
> 
> > [2] https://github.com/raspberrypi/userland/pull/379
> 
>  This pull request URL should also be in the patch itself.
> 
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

I will reword the commit.

> 
>  Another question: do the other 10 providers of libGLES and libEGL do create the
> correct symlinks? If some of them don't, then perhaps we should find a more
> fundamental solution... That said, for now this is sufficient I think.
> 

I will have a look to this.

>  Regards,
>  Arnout
> 

Regards,
Gael
