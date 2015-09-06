From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Sep 2015 11:28:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/libldns: Fix static build
In-Reply-To: <1441449596-2894-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Sat, 5 Sep 2015 12:39:56 +0200")
References: <1441449596-2894-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87h9n7lwve.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > http://autobuild.buildroot.net/results/a0e/a0e686cbe5104f48c9ab05aef7b2989abdb23821/
 > http://autobuild.buildroot.net/results/527/527b6167fcade1333d8bedffca21e32e410ed8c9/
 > http://autobuild.buildroot.net/results/0f2/0f229b6806b5cf18d5b56f80088bba7dc3c6eb28/
 > http://autobuild.buildroot.net/results/bad/bad1c0590868c1e97f647172f85b112ff2604994/
 > http://autobuild.buildroot.net/results/7db/7dba36ae44560e65a00daf912abe8b43fa8a060d/
 > http://autobuild.buildroot.net/results/3bf/3bf24e3e845ad8ebcfd0469787e7b7342ecfe3c5/
 > http://autobuild.buildroot.net/results/7c6/7c6985518bb068ef1764dfb44c59c9f583f07c71/
 > http://autobuild.buildroot.net/results/211/2117de3dc3d1168bdba0c771b54b3d998e3d62ce/
 > http://autobuild.buildroot.net/results/908/90893b2cdbbc02d75be5cbc09b8a244d5b05d386/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/libldns/libldns.mk | 9 +++++++++
 >  1 file changed, 9 insertions(+)

 > diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
 > index 9a28404..5073c09 100644
 > --- a/package/libldns/libldns.mk
 > +++ b/package/libldns/libldns.mk
 > @@ -33,4 +33,13 @@ LIBLDNS_CONF_OPTS += \
 >  	--disable-sha2
 >  endif
 
 > +# missing -lz is breaks configure, add it using pkgconf

Drop the extra 'is'.

I got a bit confused about this as we already have host-pkgconf as a
dependency for the openssl support, but looking at the configure script
I see it isn't used.

As this is specific to the openssl backend this should be inside the
openssl conditional (and host-pkgconf should only be added for static
builds).

 > +# compiling target linktest also fails due -lz being placed at a wrong
 > +# position during linking, so we avoid this target by only building the
 > +# target 'lib', which is enough for us

For consistency and to ensure we'll notice soon if the lib target in the
future no longer is enough I would prefer to do this unconditionally.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
