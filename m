From: Trent Piepho <tpiepho@impinj.com>
Date: Thu, 8 Nov 2018 21:55:45 +0000
Subject: [Buildroot] [PATCH] libcurl: Allow selection of TLS package
 libcurl will use
In-Reply-To: <87ftwb8db7.fsf@dell.be.48ers.dk>
References: <20181108001209.14889-1-tpiepho@impinj.com>
 <87ftwb8db7.fsf@dell.be.48ers.dk>
Message-ID: <1541714144.30311.360.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2018-11-08 at 22:33 +0100, Peter Korsgaard wrote:
> > > > > > "Trent" == Trent Piepho <tpiepho@impinj.com> writes:
>  
>  > +choice
>  > +	prompt "SSL/TLS library to use"
>  > +	default BR2_PACKAGE_LIBCURL_OPENSSL if BR2_PACKAGE_OPENSSL
>  > +	default BR2_PACKAGE_LIBCURL_GNUTLS if BR2_PACKAGE_GNUTLS
>  > +	default BR2_PACKAGE_LIBCURL_LIBNSS if BR2_PACKAGE_LIBNSS
>  > +	default BR2_PACKAGE_LIBCURL_MBEDTLS if BR2_PACKAGE_MBEDTLS
> 
> kconfig defaults to the first available option, so these default .. if
> .. can be removed.

I thought I had to do this, but it's been a while since I made this
patch.  I'll remove them.

> 
>  > +
>  > +config BR2_PACKAGE_LIBCURL_NOSSL
>  > +	bool "No SSL/TLS support"
> 
> Is there really a use case for building curl without TLS support if one
> or more of the libraries are available? If not, then I would simply make
> the choice depend on openssl || gnutls || libnss || mbedtls and drop
> this nossl option.

I can't think of one besides minimizing the size of libcurl.  Though I
expect someone after that level of optimization would have already
turned off all TLS libraries and they don't need this option either. 
It just seemed to cover all the bases consistently.  I think kconfig
doesn't like it if the choice has no options selected?

Perhaps I should change this last one to a comment "no tls" stanza, 
enabled when no tls support is present, that explains one needs a tls
library.
