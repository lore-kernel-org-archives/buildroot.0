From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 8 Jul 2008 10:35:21 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <87lk0cjyh3.fsf@macbook.be.48ers.dk>
References: <20080708101305.8702C3C697@busybox.net>
	<20080708120426.GB30117@cloud.net.au>
	<d6cda7730807080525x78e47b99keb583cec5e3fd045@mail.gmail.com>
	<87bq18mtwg.fsf@macbook.be.48ers.dk>
	<d6cda7730807080616s2f16871fo498ad1ea9095ef75@mail.gmail.com>
	<87lk0cjyh3.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730807080635m5c2949e2me4b4cca844e82e07@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 8, 2008 at 10:29 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>  Thiago> It built to avr32 without it, but I also have some clean up changes
>  Thiago> laying here, so I will commit both if it's ok.
>  Thiago> Basically, this:
>  Thiago> http://code.google.com/p/buildroot/source/diff?r=638&format=side&path=/trunk/package/openssl/openssl.mk
>
> I don't get it, how do the files get installed into TARGET_DIR?
>
Oh, that's because in the google repository it was made in different
commits, but there John changed it to use make install instead. He was
looking into the issue of having Midori and other packages connect to
https servers. To fix that, besides having a proper openssl install,
one needs to install the CA certificates. But none the less make
install is better than copying individual files.

$(STAGING_DIR)/usr/lib/libcrypto.a: $(OPENSSL_DIR)/apps/openssl
        $(MAKE) CC=$(TARGET_CC) INSTALL_PREFIX=$(STAGING_DIR)/usr -C
$(OPENSSL_DIR) install
        $(MAKE) CC=$(TARGET_CC) INSTALL_PREFIX=$(TARGET_DIR) -C
$(OPENSSL_DIR) install
        touch -c $@
