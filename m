From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:25:07 +0100
Subject: [Buildroot] [RFC 2/3] rpi-userland: fix opengl library symlinks
In-Reply-To: <20170322225104.32xu2q6fhyoph4fg@gportay>
References: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
 <20170322181331.23500-3-gael.portay@savoirfairelinux.com>
 <20170322225421.5ce139f6@free-electrons.com>
 <20170322223851.vlc46h63xsksr3f5@gportay>
 <20170322234756.0a6deb80@free-electrons.com>
 <20170322225104.32xu2q6fhyoph4fg@gportay>
Message-ID: <20170325152507.3a17a336@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 18:51:04 -0400, Ga?l PORTAY wrote:

> > Ah, it uses dlopen() on specifically libEGL.so.1 and libOpenGLES.so.2,
> > OK. Then it makes sense. Maybe your patch should be submitted upstream
> > to rpi-userland?  
> 
> I am on it.
> 
> I made a PR on github.

As was said in https://github.com/raspberrypi/userland/pull/379, the PR
you have submitted changes the SONAME of the library, so any binary
already built against rpi-userland before your change will no longer
work after your change. Your suggestion to run ldconfig is irrelevant.

When you link against a library, the SONAME of this library gets
encoded into a NEEDED entry of the thing (program or library) that
links against this library. Then at runtime, the dynamic loader goes
through those NEEDED entries to load the shared libraries that the
program needs. So if the NEEDED entry of a program no longer points to
an existing library, you broke binary compatibility.

So maybe we simply need some symbolic links to be created:

 libEGL.so.1 -> libEGL.so
 libGLES.so.2 -> libGLES.so

This way, qt5webengine will be able to find the EGL/OpenGLES
implementation, but the rpi-userland libraries SONAME remains the same.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
