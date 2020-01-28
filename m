From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Jan 2020 14:44:12 +0100
Subject: [Buildroot] host-python-2.7 failure to build _hashlib
In-Reply-To: <CA+h21hrqSponHMwMUBXhRaCmnVjwzrhKJSH+XSZcO8Zp69JFmA@mail.gmail.com>
References: <CA+h21hors57FFbQzm0x2Rd_pABb95-GaxPOPiRQ5ZzB9NgT-Mg@mail.gmail.com>
 <20200127234031.79371041@windsurf>
 <CA+h21hr2ReX5zxqmRrM9dq77S-nwqSQvmTQh6N-FLEvoooUfLw@mail.gmail.com>
 <20200128101431.02251042@windsurf>
 <CA+h21hrqSponHMwMUBXhRaCmnVjwzrhKJSH+XSZcO8Zp69JFmA@mail.gmail.com>
Message-ID: <20200128144412.16fe35b1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Jan 2020 12:28:01 +0200
Vladimir Oltean <olteanv@gmail.com> wrote:

> > diff --git a/package/python/python.mk b/package/python/python.mk
> > index 41a981e3d3..cd79be78f6 100644
> > --- a/package/python/python.mk
> > +++ b/package/python/python.mk
> > @@ -33,7 +33,8 @@ HOST_PYTHON_CONF_OPTS += \
> >         --disable-test-modules \
> >         --disable-bz2 \
> >         --disable-ossaudiodev \
> > -       --disable-pyo-build
> > +       --disable-pyo-build \
> > +       --disable-hashlib  
> 
> Yes, this works, but I'm not exactly sure what conclusion I should draw from it.

I explained above the patch in my previous e-mail what (I believe) was
happening.

> hashlib seems to require BR2_PACKAGE_HOST_PYTHON_SSL, but without a
> proper dependency tracking system for host packages, I don't know how
> it can be disabled in that case.

Three solutions:

 - We hook into the BR2_PACKAGE_HOST_PYTHON_SSL option, and add
   --disable-hashlib in the "else" case of this condition. This makes
   the BR2_PACKAGE_HOST_PYTHON_SSL option have the semantic "build all
   Python modules that depend on OpenSSL".

 - We create a separate BR2_PACKAGE_HOST_PYTHON_HASHLIB option, so that
   the semantic of BR2_PACKAGE_HOST_PYTHON_SSL remains "build the
   Python ssl module"

 - We simply unconditionally add --disable-hashlib like I proposed, and
   wait until someone needs hashlib in host-python.

I suggest we take the third solution for now.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
