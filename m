From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 18:05:45 +0100
Subject: [Buildroot] Libcurl : to depend or not to depend ?
In-Reply-To: <AD9141CB33AC4D019D399FFCCB3E46D3@JohanW7>
References: <8E5E9D7D337A4C58AD26215008FACEF4@JohanW7>
 <20120321162014.6e2fd485@skate>
 <AD9141CB33AC4D019D399FFCCB3E46D3@JohanW7>
Message-ID: <20120321180545.02ab322f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 21 Mar 2012 17:50:26 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> I know what to do, but in case you need openssl and you also want libcurl BUT without SSL there is no way to build it like it is
> now.

Correct. Presumably, the size impact of OpenSSL support in libcurl is
pretty small (OpenSSL itself is huge, but the OpenSSL support in
libcurl is most likely relatively small), so it is generally not
necessary.

We might of course add a libcurl suboption to make this configurable,
but for most packages, the OpenSSL support is automatically enabled if
OpenSSL is present.

> The trick i use now to build libcurl without ssl is 
> 	disabling openssl
> 	build (libcurl gets build without SSL)
> 	enable openssl
> 	build (libcurl does'nt change and i also have openssl now.)

Or just modify libcurl.mk so that it always passes --without-ssl
regardless of whether OpenSSL is selected or not. I think it's much
easier.

I don't think Buildroot can really adapt to each and every situation
(and still be maintainable), and some special situations require direct
modifications of the .mk file. For example, not later than today, I had
to:

 * Change openssl.mk because I wanted to build only the static version
   (OpenSSL in my case was used only by one application, and linking
   OpenSSL statically against this application allowed some space
   savings)

 * Change avahi.mk to build the Avahi libraries statically, for the
   same reasons (only used by Avahi programs themselves, so it allows
   some space savings)

I just maintain those project-specific tweaks in a Git branch. They are
simple, so when I need to upgrade Buildroot they are not a big issue.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
