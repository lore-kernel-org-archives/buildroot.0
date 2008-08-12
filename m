From: Michel Benoit <murpme@gmail.com>
Date: Tue, 12 Aug 2008 10:42:07 +0200
Subject: [Buildroot] cross compile curl with buildroot
In-Reply-To: <3530b0eb0808111341j4cae15e7m8d6f15f08c32128e@mail.gmail.com>
References: <c88e466f0808110842o35e633c3mb28a3c178ad0a829@mail.gmail.com>
	<3530b0eb0808111341j4cae15e7m8d6f15f08c32128e@mail.gmail.com>
Message-ID: <c88e466f0808120142m34501465q73b58c7759f0abec@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Does anyone have an idea what could be causing libcurl to throw an
>> Illegal instruction signal?
>> Has anyone successfully cross-compiled curl for an arm target?
>
> Saw the same problem.  Turning -Os off seemed to get rid of it when
> compiling libcurl.
>

Thanks for the tip.
I solved the problem by adding CFLAGS=-O0 before .7configure in curl.mk.

$(CURL_DIR)/.configured: $(CURL_DIR)/.unpacked
	(cd $(CURL_DIR); rm -rf config.cache; \
		aclocal; \
		libtoolize --force; \
		./reconf; )
	$(CONFIG_UPDATE) $(CURL_DIR)
	(cd $(CURL_DIR); \
		$(TARGET_CONFIGURE_OPTS) \
		$(TARGET_CONFIGURE_ARGS) \
		CFLAGS=-O0 \
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \

The last -O on the gcc command line is the one that takes effect.
The -O0 thus overrides -Os from buildroot.  With no external CFLAGS
defines curl configure uses -O2 by default.

 Michel
