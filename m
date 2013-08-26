From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Aug 2013 10:21:22 +0200
Subject: [Buildroot] [PATCH 1/1] Phonon needs libglib2 or else it's
 functionality tests will fail.
In-Reply-To: <12BF36CE88DC4B6391EA4A1AAB62B3BE@JohanW7>
References: <1377299653-9977-1-git-send-email-sagaert.johan@skynet.be>
 <20130825111712.6a96f399@skate>
 <12BF36CE88DC4B6391EA4A1AAB62B3BE@JohanW7>
Message-ID: <20130826102122.37b44fd8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun, 25 Aug 2013 17:01:55 +0200, Sagaert Johan wrote:

> You are right,it's indeed imposssible to select phonon without having gstreamer and impliciet using libglib2.
> 
> In order to get rid my non working touchscreen when libglib2 was used by qt,
> I added QT_CONFIGURE_OPTS += -no-glib to the qt makefile that yielded the Phonon functionality test failure.

Yes, obviously, this will not work nicely. If you want to do this
properly, we'd have to have a separate Kconfig option to enable glib
support in Qt, so that even if Glib is enabled in your configuration,
you can disable Glib support in Qt without hacking the qt.mk file.
Then, the Phonon option would also depend on that new Kconfig option.

> So that was why I wrote the patch to avoid having phonon selected when libglib2 was absent.
> And as you point out now due to the dependency chain is useless.
> 
> I don't know how the problem with the non working touch due to libglib usage in qt should be solved.
> (for now I used QT_CONFIGURE_OPTS += -no-glib with phonon disabled.)
> 
> Is it a qt problem or is it a problem introduced by changed functionality in the libglib code ?...
> 
> There must be more users been affected by this, qt4.8 with tslib is a quit common I think.

Well, at this point, I guess you'd have to debug this by adding some
debug messages in the input handling code of Qt to see where the
touchscreen events are being lost.

Or you can get in touch with the Qt community to see if they have an
idea. Or try with various Glib versions to see which one introduces the
breakage, maybe it will point to something interesting?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
