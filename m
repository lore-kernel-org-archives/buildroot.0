From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 3 Jul 2014 23:07:14 +0200
Subject: [Buildroot] Raspberry Pi: recommendations for web kiosk
In-Reply-To: <CAAXf6LXiNMEjoN1Pv=2Qu73oJgc+jCsEizAFo1=WV+V57b27WQ@mail.gmail.com>
References: <CAAXf6LXK64M-BO3V-K6e_27m7UhYOe3N01oXBSVfF6NUdqrARA@mail.gmail.com>
 <20140626124257.GA13409@rmm-p1267483>
 <CAAXf6LUR=nSyh3GPk037uYUOE3hRngWmrj+YOxiQe6RD75TRBw@mail.gmail.com>
 <20140626170127.GA3742@ned>
 <CAAXf6LXiNMEjoN1Pv=2Qu73oJgc+jCsEizAFo1=WV+V57b27WQ@mail.gmail.com>
Message-ID: <20140703210713.GA22181@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 02, 2014 at 11:04:05AM +0200, Thomas De Schampheleire wrote:
> Hi Eric,
>
> On Thu, Jun 26, 2014 at 7:01 PM, Eric Le Bihan
> <eric.le.bihan.dev@free.fr> wrote:
> > On Thu, Jun 26, 2014 at 03:15:25PM +0200, Thomas De Schampheleire wrote:
> >> Hi Eric,
> >>
> >> On Thu, Jun 26, 2014 at 2:42 PM, Eric Le Bihan
> >> <eric.le.bihan.dev@free.fr> wrote:
> >> > Hi!
> >> > On Wed, Jun 25, 2014 at 03:02:29PM +0200, Thomas De Schampheleire wrote:
> >> >> Hi,
> >> >>
> >> >> We currently use a Raspberry Pi as a simple web-wall. It cycles every
> >> >> two minutes between two (non-local) web pages, one of which contains a
> >> >> few iframes.
> >> >>
> >> >> While this can hardly be called a resource-intensive task, the
> >> >> Raspberry Pi by no means performs this fluently. The pages load
> >> >> relatively slow, and administration tasks on this pi also suffer from
> >> >> hickups.
> >> >>
> >> >> The pi currently contains a raspbian image (not done by me, I swear!
> >> >> :-) ) and uses chromium in kiosk mode to display the web pages.
> >> >>
> >> >> My basic question is: can I expect to get better performance by
> >> >> setting up a custom buildroot image, or is rpi so poor in performance,
> >> >> even for this mundane task?
> >> >> Which packages should I select to achieve this?
> >> >>
> >> >> Do I need an X.org or not really?
> >> >> If X.org is needed, does 'Kdrive / tinyX' work on rpi, or should I
> >> >> select modular x.org, and how do these compare.
> >> >> (as you notice, I have never set up embedded boards with graphical stuff).
> >> >>
> >> >> Which browser should/could I use? Preferably something that can run in
> >> >> fullscreen mode as this is a kiosk-like board.
> >> >>
> >> >> Is rpi-userland needed / recommended? How would I benefit from it?
> >> >>
> >> >> Any other recommendations/tips are welcome too, of course.
> >> > Just my two cents: how about using a custom application based on QtWebkit with
> >> > EGLFS [1]?
> >> >
> >>
> >> This is not a commercial product, but rather an internal information
> >> screen used on the workfloor. So writing custom applications, which I
> >> assume is quite some work, is not acceptable. I am hoping for a more
> >> or less out-of-the-box solution...
> > Well, thanks to QML and QtWebkit, that is pretty doable. I hacked a quick
> > example at https://github.com/elebihan/webkiosk, inspired by the Qt examples.
> >
> > AFAIK, running it with the '-platform eglfs' option should do the trick (not
> > tested, my RPi is out of order :-( )
> >
>
> Is this a QT4 or QT5 project?
> I enabled qt5 in buildroot, together with the qt5webkit and qt5quick1
> packages, and then ran qmake in your webkiosk project. However, 'qml'
> and 'quick' modules are not found.
> How is this supposed to work?

It's a Qt5 project. I added a package for webkiosk in my external
customization for Buildroot [1], as well as a configuration for building an
image for RPi (demo_webkiosk_rpi_defconfig). The "elebihan/qt5wayland" branch
of my Buildroot repo [2] should be used, because a patch is needed to build
qt5base with EGLFS support [3].

Though the program runs smoothly on x86 and the build is successful, executing
the program on the target ends up with a black screen... The command used is:

  $ webkiosk -platform eglfs

I'll investigate as soon as I'll understand why I can not use my USB keyboard
and the Ethernet connection as the same time (D'Oh! Not convenient for
debugging)...

>
> Looking at the sources in qt5quick1, I don't see any reference to the
> installation of a 'quick' module, only of 'declarative'.
>
> Thanks,
> Thomas

Best regards,
ELB

[1] https://github.com/elebihan/buildroot-ext-elb
[2] https://github.com/elebihan/buildroot/tree/elebihan/qt5wayland
[3] https://github.com/elebihan/buildroot/commit/9593273c4341ccfce5b0d8667e00c06db0b00fc4
