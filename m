From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Aug 2017 17:31:16 +0200
Subject: [Buildroot] [PATCH v6 1/3] rpi-userland: fix opengl library
	symlinks
In-Reply-To: <20170811013358.26864-2-gael.portay@savoirfairelinux.com>
References: <20170811013358.26864-1-gael.portay@savoirfairelinux.com>
 <20170811013358.26864-2-gael.portay@savoirfairelinux.com>
Message-ID: <e68a0fc8-7ad3-26c3-02a3-79a794600271@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Since you're probably going to send a v7 with the IA32 workaround, some
comments on this patch which I'd otherwise fix up while applying.

On 11-08-17 03:33, Ga?l PORTAY wrote:
> The Qt WebEngine module loads libEGL.so.1 and libGLESv2.so.2 libraries.
> Path are hard-coded [1].
  Paths

> 
> This patch sets up cmake to create those library links.
> 
> 	# ls -l /usr/lib/lib*GL*
> 	lrwxrwxrwx    1 root     root            11 Mar 21 17:24 /usr/lib/libEGL.so -> libEGL.so.1
> 	lrwxrwxrwx    1 root     root            15 Mar 21 17:24 /usr/lib/libEGL.so.1 -> libEGL.so.1.0.0
> 	-rwxr-xr-x    1 root     root        163152 Mar 22 14:56 /usr/lib/libEGL.so.1.0.0
> 	lrwxrwxrwx    1 root     root            14 Mar 21 17:24 /usr/lib/libGLESv2.so -> libGLESv2.so.2
> 	lrwxrwxrwx    1 root     root            18 Mar 21 17:24 /usr/lib/libGLESv2.so.2 -> libGLESv2.so.2.0.0
> 	-rwxr-xr-x    1 root     root         78788 Mar 22 14:56 /usr/lib/libGLESv2.so.2.0.0

 If I read the code correctly (I didn't try to execute it), it will actually
create a link libEGL.so.1 -> libEGL.so, so where do you get the above?

> 
> A pull request is pending [2].
> 
> [1] https://github.com/qt/qtwebengine/blob/5.8.0/src/core/surface_factory_qt.cpp#L76-L86

 Perhaps use the 5.9.1 link now:
https://github.com/qt/qtwebengine/blob/v5.9.1/src/core/surface_factory_qt.cpp#L76-L86


> [2] https://github.com/raspberrypi/userland/pull/379

 This pull request URL should also be in the patch itself.

> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

 Another question: do the other 10 providers of libGLES and libEGL do create the
correct symlinks? If some of them don't, then perhaps we should find a more
fundamental solution... That said, for now this is sufficient I think.

 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
