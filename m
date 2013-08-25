From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 25 Aug 2013 17:01:55 +0200
Subject: [Buildroot] [PATCH 1/1] Phonon needs libglib2 or else it's
	functionality tests will fail.
In-Reply-To: <20130825111712.6a96f399@skate>
References: <1377299653-9977-1-git-send-email-sagaert.johan@skynet.be>
 <20130825111712.6a96f399@skate>
Message-ID: <12BF36CE88DC4B6391EA4A1AAB62B3BE@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi Thomas

You are right,it's indeed imposssible to select phonon without having gstreamer and impliciet using libglib2.

In order to get rid my non working touchscreen when libglib2 was used by qt,
I added QT_CONFIGURE_OPTS += -no-glib to the qt makefile that yielded the Phonon functionality test failure.
So that was why I wrote the patch to avoid having phonon selected when libglib2 was absent.
And as you point out now due to the dependency chain is useless.

I don't know how the problem with the non working touch due to libglib usage in qt should be solved.
(for now I used QT_CONFIGURE_OPTS += -no-glib with phonon disabled.)

Is it a qt problem or is it a problem introduced by changed functionality in the libglib code ?...

There must be more users been affected by this, qt4.8 with tslib is a quit common I think.

Best regards, Johan


-----Oorspronkelijk bericht-----
Van: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Verzonden: zondag 25 augustus 2013 11:17
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] [PATCH 1/1] Phonon needs libglib2 or else it's functionality tests will fail.

Dear Sagaert Johan,

On Sat, 24 Aug 2013 01:14:13 +0200, Sagaert Johan wrote:
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  package/qt/Config.in | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/qt/Config.in b/package/qt/Config.in index 
> 35e8208..2541875 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -264,7 +264,8 @@ source "package/qt/Config.keyboard.in"
>  
>  config BR2_PACKAGE_QT_PHONON
>  	bool "Phonon Module"
> -	depends on BR2_PACKAGE_GSTREAMER
> +	depends on BR2_PACKAGE_GSTREAMER 
> +	depends on BR2_PACKAGE_LIBGLIB2

Hum, I'm not sure to understand. BR2_PACKAGE_QT_PHONON already depends on BR2_PACKAGE_GSTREAMER. And BR2_PACKAGE_GSTREAMER selects
BR2_PACKAGE_LIBGLIB2. So, if BR2_PACKAGE_GSTREAMER is enabled, then you're sure BR2_PACKAGE_LIBGLIB2 is enabled.

So unless I'm missing something, your patch does nothing, and I don't quite see how it could fix any issue. Can you give the .config
that exhibits your build problem?

Thanks!

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
