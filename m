From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 8 Jul 2008 11:56:10 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <87vdzgh4ko.fsf@macbook.be.48ers.dk>
References: <20080708101305.8702C3C697@busybox.net>
	<20080708120426.GB30117@cloud.net.au>
	<d6cda7730807080525x78e47b99keb583cec5e3fd045@mail.gmail.com>
	<87bq18mtwg.fsf@macbook.be.48ers.dk>
	<d6cda7730807080616s2f16871fo498ad1ea9095ef75@mail.gmail.com>
	<87lk0cjyh3.fsf@macbook.be.48ers.dk>
	<d6cda7730807080635m5c2949e2me4b4cca844e82e07@mail.gmail.com>
	<87vdzgh4ko.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730807080756qb660dd7k19a618ce9d90ad7b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 8, 2008 at 10:45 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>
> Hi,
>
>  >> I don't get it, how do the files get installed into TARGET_DIR?
>  >>
>  Thiago> Oh, that's because in the google repository it was made in different
>  Thiago> commits, but there John changed it to use make install instead. He was
>  Thiago> looking into the issue of having Midori and other packages connect to
>  Thiago> https servers. To fix that, besides having a proper openssl install,
>  Thiago> one needs to install the CA certificates. But none the less make
>  Thiago> install is better than copying individual files.
>
> Yes, if it doesn't install a bunch of unneeded stuff.
>

It will install to /usr/bin c_rehash  fipsld  openssl and
headers/libs, which the current make file does in:

$(TARGET_DIR)/usr/lib/libssl.a: $(STAGING_DIR)/usr/lib/libcrypto.a
        mkdir -p $(TARGET_DIR)/usr/include
        cp -a $(STAGING_DIR)/usr/include/openssl $(TARGET_DIR)/usr/include/
        cp -dpf $(STAGING_DIR)/usr/lib/libssl.a $(TARGET_DIR)/usr/lib/
        cp -dpf $(STAGING_DIR)/usr/lib/libcrypto.a $(TARGET_DIR)/usr/lib/
        touch -c $@

But it also creates /lib/ssl/certs folder (empty) and
/lib/ssl/openssl.cnf which should be important to programs that verify
the peer identity, such as browsers like midori.

If I'm not mistaken, the headers and static libs are usually removed
later on when packing the final image, right?
