From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2019 13:02:42 +0100
Subject: [Buildroot] [PATCH v3 07/17] package/aubio: use the new
 fftw-double and fftw-single packages
In-Reply-To: <20181231133030.25991-8-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-8-thomas.petazzoni@bootlin.com>
Message-ID: <20190101120242.GL26917@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gwenha?l, All,

Gwenha?l, question for you below...

On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> [Thomas: drop the condition on BR2_PACKAGE_FFTW]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/aubio/aubio.mk | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
> index b0cc8b899e..dd2db2adb9 100644
> --- a/package/aubio/aubio.mk
> +++ b/package/aubio/aubio.mk
> @@ -27,7 +27,7 @@ AUBIO_CONF_OPTS += --disable-sndfile
>  endif
>  
>  # Could not compile aubio in double precision mode with libsamplerate
> -ifeq ($(BR2_PACKAGE_LIBSAMPLERATE)$(BR2_PACKAGE_FFTW_PRECISION_SINGLE),yy)
> +ifeq ($(BR2_PACKAGE_LIBSAMPLERATE)$(BR2_PACKAGE_FFTW_SINGLE),yy)

Now, we can be in a situation where both single and double are enabled,
so the condi9tion here would be satisfied, i.e. we'd build with
libsamplerate, but...

>  AUBIO_DEPENDENCIES += libsamplerate
>  AUBIO_CONF_OPTS += --enable-samplerate
>  else
> @@ -41,15 +41,14 @@ else
>  AUBIO_CONF_OPTS += --disable-jack
>  endif
>  
> -ifeq ($(BR2_PACKAGE_FFTW),y)
> -AUBIO_DEPENDENCIES += fftw
>  # fftw3 require double otherwise it will look for fftw3f
> -ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
> +ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)

... here we'd be using the double variant, as it takes precedence over
the single one.

Thus we'd end up in the situation that the comment warns about: building
libsamplerate in double precision is not possible.

So, I'd suggest that we move the libsamplerate condition below, in the
fftw-single condition...

>  AUBIO_CONF_OPTS += --enable-fftw3 --enable-double
> -else ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
> +AUBIO_DEPENDENCIES += fftw-double
> +else ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
>  AUBIO_CONF_OPTS += --enable-fftw3f --disable-double
> -endif
> -else  # !BR2_PACKAGE_FFTW
> +AUBIO_DEPENDENCIES += fftw-single

... here.

Of course, if the comment is now wrong and the libsamplerate can be
build with fftw-double, the fix is different, and the condition on
fftw-single should be dropped for libsamplerate.

Gwenha?l, care to share your thoughts on this? ;-)

Regards,
Yann E. MORIN.

> +else
>  AUBIO_CONF_OPTS += --disable-fftw3
>  endif
>  
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
