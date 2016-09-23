From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 23 Sep 2016 06:12:44 +0000
Subject: [Buildroot] [PATCH] qt5: Disable pkg-config usage for
 cross-building
In-Reply-To: <20160923075722.3dbee0a8@free-electrons.com>
References: <1474573700-22730-1-git-send-email-abrodkin@synopsys.com>
 <20160922205817.GC3179@free.fr>
 <20160923075722.3dbee0a8@free-electrons.com>
Message-ID: <1474611155.2562.6.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann,

On Fri, 2016-09-23 at 07:57 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 22 Sep 2016 22:58:17 +0200, Yann E. MORIN wrote:
> 
> > 
> > I have not paid much attention to the previous discussion on the topic.
> > 
> > However, I think disabling use of pkg-config is wrong. That is qmake
> > that is at fault here because, from what I understood from the previous
> > discussion, it emits -isystem where it should not.
> > 
> > So qmake needs to be fixed to not emit -isystem in those conditions.
> > 
> > Removing the use of pkg-config is just papering over the real problem.
> > 
> > Usually, using pkg-config solves more issues than not using it.
> > 
> > So, I am not very happy with this patch, to say the least... :-(
> 
> I entirely agree with Yann. Disabling pkg-config is clearly not the
> solution we want to use.
>
> Alexey, have you tried the other approaches I outlined in the thread
> where the initial discussion took place?

Well I don't like removal of pkg-config usage either but...
Another approach with setting?QMAKE_CFLAGS_ISYSTEM to "" may work as well
(even thought I haven't tried it yet) but that will mean people using
buildroot-built toolchain for building their Qt5 apps will see those
compiler warnings about "wrong" stuff in system headers. In the end that's why
this "-isystem" was introduced in the first place.

In other words disabling pkg-config in Qt5 affects only Qt5 itself while
adding "QMAKE_CFLAGS_ISYSTEM = ''" to "package/qt5/qt5base/qmake.conf"
affects both Qt5 itself and apps that are written on Qt.

-Alexey
