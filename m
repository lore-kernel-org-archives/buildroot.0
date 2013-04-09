From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Apr 2013 23:22:31 +0200
Subject: [Buildroot] Including wine package - Reg
In-Reply-To: <CAGK4xy7fch-cGi66rLovOo8mRvRrif7Pzg_MF89vy46H5VH0SQ@mail.gmail.com>
References: <CAGK4xy6eXjG7MzWS81uNmthwd5ODBB_ae+DQMSFfPkX6_GfQiw@mail.gmail.com>
 <20130408231204.0b30b7df@skate>
 <CAGK4xy5fzi5F0C_CaAq0e2JJmdUhNKD3ZuBqE8cBw8dsV+HQrw@mail.gmail.com>
 <20130408233156.0ab27a38@skate>
 <CAGK4xy49Dm1G0J3w2CUzHZ2=2bObyd8i94e1mdYnzy8vTJg-KQ@mail.gmail.com>
 <CAGK4xy4fnpOkmYJJ_+YoXJHG2Rf6BrxMyXTjjYHtDDp_R8zM8g@mail.gmail.com>
 <20130409201651.35dc862f@skate>
 <CAGK4xy7fch-cGi66rLovOo8mRvRrif7Pzg_MF89vy46H5VH0SQ@mail.gmail.com>
Message-ID: <20130409232231.0b261d1a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arunkumar Vijayakumar,

On Wed, 10 Apr 2013 02:49:24 +0530, Arunkumar Vijayakumar wrote:

> I found the issue with the cross compiler and fixed it. Now when I tried
> executing wine package using
> $ make wine v=1 in buildroot
> 
> It throwed an error stating to use --with-wine-tools for cross compiling,
> hence I used
> WINE_CONF_OPT = --with-wine-tools=$(BUILD_DIR)/wine-$(WINE_VERSION)

This looks odd. Why would the wine package require a reference to its
own source directory? Doesn't sound correct.

> Again I got an error of missing Xlib/Xfree86 package, though I have
> installed those using apt-get install xorg xorg-dev *libx*11-dev in my
> ubuntu 12.04 desktop system.
> 
> But it didnt work hence i forced to use the following line in .mk file and
> it got worked.
> WINE_CONF_OPT += --x-libraries=/usr/lib/X11
> WINE_CONF_OPT += --x-includes=/usr/include/X11
> WINE_CONF_OPT += --with-x

Do you realize that Buildroot is used for *cross* compilation?
Therefore pointing the compilation to /usr/lib or /usr/include is just
plain wrong, and is precisely what Buildroot avoids everywhere. What
you're doing here is completely incorrect and has absolutely no chance
of working.

If wine depends on X11 libraries, then your wine package must depend on
the appropriate X11 Buildroot packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
