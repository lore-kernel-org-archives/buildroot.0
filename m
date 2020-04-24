From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 13:45:59 +0200
Subject: [Buildroot] [PATCH 1/3] package/mbedtls: add
 BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
In-Reply-To: <20200424112639.xdzs4ggqtijcij74@einstein.dilieto.eu>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
 <20200423220905.06d9dc59@windsurf.home>
 <20200423232758.zwos3e5f55pz23ld@einstein.dilieto.eu>
 <20200424090710.GA5035@scaer>
 <20200424112639.xdzs4ggqtijcij74@einstein.dilieto.eu>
Message-ID: <20200424114559.GG5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-04-24 13:26 +0200, Nicola Di Lieto spake thusly:
> On Fri, Apr 24, 2020 at 11:07:10AM +0200, Yann E. MORIN wrote:
> > - an X.509 parser that encounters an extension marked 'critical' when
> >   parsing a certificate, and that does not recognise that extension,
> >   *must* reject that certificate.
> >
> 
> I wouldn't be so sure that it must be done at parsing stage though.

Well, "parsing" is maybe not the correct word, but as far as I
understand wikipedia on X.209 [0]:

    A certificate-using system must reject the certificate if it
    encounters a critical extension that it does not recognize,
    or a critical extension that contains information that it cannot
    process.

[0] https://en.wikipedia.org/wiki/X.509#Structure_of_a_certificate

So, as mbedtls does not know what to do with such a critical extension,
allowing it to just ignore it is a violation of the X.509 spec.

>  OpenSSL
> and GnuTLS parse the certificate without problems and then fail at
> validation stage.  OpenSSL even has a "-ignore_critical" command line switch
> to ignore critical extensions:
> 
> https://man.openbsd.org/openssl.1#ignore_critical

But that is different: this is a command line argument, which is
obviously not the default. Enabling X509_UNSUPPORTED_CRITICAL_EXTENSION
will make that the default behaviour, which is unsound.

Regards,
Yann E. MORIN.

> I honestly think the approach of mbedTLS to critical extensions is blunt to
> say the least.  And just as a side note, mbedTLS *will* still happily
> generate, sign and export a certificate with an unsupported critical
> extension, even when it's built without that damn feature.  Don't ask me how
> I know...  if you don't believe me, look at
> mbedtls_x509write_crt_set_extension, called on line 1167 in ualpn.c
> 
> >
> >I think we should refuse to use mbedtls with uacme.
> 
> I agree, at least until mbedTLS changes its approach.
> 
> Regards
> Nicola

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
