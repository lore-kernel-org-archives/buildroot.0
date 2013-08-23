From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 23 Aug 2013 16:50:12 +0200
Subject: [Buildroot] Problem with Qt when using commit libglib2: Bump
	libglib2 to 2.36.1 ( no touchscreen )
In-Reply-To: <20130823131819.6035af8e@skate>
References: <16F215BDBD9D49C49E858122318082E4@JohanW7>
 <20130823131819.6035af8e@skate>
Message-ID: <7C318BF756CF414E91C74C93340742D5@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

I used QT_CONFIGURE_OPTS += -no-glib and this seems to fix the problem, but it breaks phonon. See below
So I had to disable Phonon first.
It might be needed to add glib as dependency for phonon in the config menu.

Creating qmake. Please wait...
make[1]: Entering directory `/home/buildroot12git/output/build/qt-4.8.5/qmake'
make[1]: Leaving directory `/home/buildroot12git/output/build/qt-4.8.5/qmake'

You have asked to use pkg-config and are cross-compiling.
Please make sure you have a correctly set-up pkg-config
environment!

Phonon support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.
make: *** [/home/buildroot12git/output/build/qt-4.8.5/.stamp_configured] Error 101



I will bump glib2 to the latest version to see if this solves anything...
Building it now ....

Regards Johan


-----Oorspronkelijk bericht-----
Van: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Verzonden: vrijdag 23 augustus 2013 13:18
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] Problem with Qt when using commit libglib2: Bump libglib2 to 2.36.1 ( no touchscreen )

Dear Sagaert Johan,

On Fri, 23 Aug 2013 10:28:46 +0200, Sagaert Johan wrote:

> For some unknown reason, this commit (1232fe4d22e15a31385c69f02570f036b738b6b2) seems to break Qt484 at runtime.
> Qt just does not react any longer to the touchscreen.There are no warnings.
> Everything else is the same, i see no obvious relation between this commit and the trouble i have.
> Just have no clue what the binding is between libglib2 and Qt ?

Qt has a glib integration. If you're not using it, you could disable it by replacing:

ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
QT_CONFIGURE_OPTS += -glib
QT_DEPENDENCIES += libglib2
else
QT_CONFIGURE_OPTS += -no-glib
endif

by just:

QT_CONFIGURE_OPTS += -no-glib

This would at least help us confirm that the problem is indeed here.

Thanks,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
