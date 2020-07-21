From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 09:25:26 +0200
Subject: [Buildroot] [PATCH v2] package/resiprocate: new package
In-Reply-To: <CAMQcK5Kh4eeiN1Fm0=14JFsOzgtdoHHR+mFxHjpPMWQVBazXDg@mail.gmail.com>
References: <20200720143245.48783-1-ryan.barnett@rockwellcollins.com>
 <20200720222812.0d6432bc@windsurf.home>
 <CAMQcK5Kh4eeiN1Fm0=14JFsOzgtdoHHR+mFxHjpPMWQVBazXDg@mail.gmail.com>
Message-ID: <20200721092526.1abec404@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Jul 2020 20:57:25 -0500
Ryan Barnett <ryan.barnett@collins.com> wrote:

> > > +if BR2_PACKAGE_RESIPROCATE
> > > +
> > > +config BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT
> > > +     bool "Enable DTLS support"
> > > +     select BR2_PACKAGE_OPENSSL
> > > +     help
> > > +       Enable DTLS support (requires OpenSSL)  
> >
> > I haven't changed this, but I'm wondering if it makes sense to have a
> > separate option for this. You already have an optional dependency on
> > OpenSSL. How much more size does --with-dtls takes ?  
> 
> The reason that I created this option was so that when selected, it
> will also select/enable OpenSSL features for the package. As far as
> size improvements, there are none:
> 
> Build with only enabling BR2_PACKAGE_RESIPROCATE (size in bytes):
> 
>     3168800 Jul 20 20:06 output/target/usr/lib/libresip-1.12.so*
> 
> Build with BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT (size in bytes):
> 
>     3168800 Jul 20 20:29 output/target/usr/lib/libresip-1.12.so*
> 
> Do you just prefer this option is removed?

So what is this option doing? Is the DTLS support only in the apps? I
tried to track down where the USE_DTLS macro is used, but since I'm not
familiar with the code base, I couldn't quickly figure that out.

Is the size increase is modest, then I would just enable DTLS support
when OpenSSL is available, i.e together with --with-ssl.

> > This didn't work, as it doesn't give the same hash as the official
> > release tarball, so I switched to using the official release tarball.  
> 
> I apologize for this - since this was developed behind a firewall, I
> had to use a web browser to download the tar file and place it on my
> build server. Initially there was an issue when trying to download the
> tar.gz file using Chrome as it would download the file already
> extracted. This is because the HTTP request reply header contains
> 'content-encoding: gzip' which chrome automatically decompresses the
> file. I had temporarily switch to Github to try the issue until I
> track the issue down to this by using Firefox:
> 
> https://superuser.com/questions/940605/chromium-prevent-unpacking-tar-gz

OK, no worries.

> > Is this something that could be reported upstream, and fixed ?  
> 
> Issue has been reported upstream in the following GitHub issue:
> 
> https://github.com/resiprocate/resiprocate/issues/155

Thanks! I added a comment to it.

> > Upstream configure.ac is already using PKG_CHECK_MODULES(), so it could
> > be improved to use that as well for OpenSSL.  
> 
> I can look at creating a patch for this in the future.

Great, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
