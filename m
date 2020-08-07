From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 7 Aug 2020 15:51:09 +0200
Subject: [Buildroot] Root password and ssh issues
In-Reply-To: <6b1def36-8387-624c-a51f-21d20505f500@bootlin.com>
References: <12918ca7-601b-3a85-67bd-4b7953840a77@bootlin.com>
 <20200807115412.3b93cbc4@windsurf.home>
 <d0f3148a-c8d3-e5cf-68ee-030699e7abec@bootlin.com>
 <20200807131256.5c691f3b@gmx.net>
 <1b8d3eda-957d-184d-2bbc-da9d871ccb43@railnova.eu>
 <20200807133552.09637480@gmx.net>
 <6b1def36-8387-624c-a51f-21d20505f500@bootlin.com>
Message-ID: <20200807155109.5399a89c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Fri, 7 Aug 2020 15:41:04 +0200, Michael Opdenacker <michael.opdenacker@bootlin.com> wrote:

> Greetings,
>
> Thanks for these useful clarifications!
>
> On 8/7/20 1:35 PM, Peter Seiderer wrote:
> > ...and should be fixed for uclibc by commit 'package/uclibc: defconfig:
> > enable sha-256/512 password auth support' ([1])...
> >
> > By the way, maybe it would be nice if the buildroot password hash
> > selection although changes the busybox default via
> > busybox/.config CONFIG_FEATURE_DEFAULT_PASSWD_ALGO="md5"?
> >
> > Regards,
> > Peter
> >
> > [1] https://git.buildroot.net/buildroot/commit/?id=bdd8362a88428ed1c04fc6f4bbcbf7692b2a2b39
>
> Right, I should have mentioned that I'm using an external uClibc
> toolchain built by crosstool-ng.
>
> Do I understand well that the trouble comes from Dropbear (not BusyBox)
> supporting only MD5 in /etc/shadow, at least when built with my toolchain?

Yes, dropbear trouble, but by indirection of the used libc (here uclibc),
if possible take a look at your crosstol-ng uclibc .config file and search
for (for full support):

UCLIBC_HAS_SHA256_CRYPT_IMPL=y
UCLIBC_HAS_SHA512_CRYPT_IMPL=y

And adjust and rebuild accordingly...

And/or try to lower the buildroot default passoword hash from sha512 to sha256
in case your uclibc supports sha256 (you can check by testing ssh login after
setting the password with passwd -a sha256)...

Regards,
Peter


>
> Thanks again,
>
> Michael.
>
