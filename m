From: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Fri, 24 Apr 2020 13:26:39 +0200
Subject: [Buildroot] [PATCH 1/3] package/mbedtls: add
 BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
In-Reply-To: <20200424090710.GA5035@scaer>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
 <20200423220905.06d9dc59@windsurf.home>
 <20200423232758.zwos3e5f55pz23ld@einstein.dilieto.eu>
 <20200424090710.GA5035@scaer>
Message-ID: <20200424112639.xdzs4ggqtijcij74@einstein.dilieto.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 24, 2020 at 11:07:10AM +0200, Yann E. MORIN wrote:
>  - an X.509 parser that encounters an extension marked 'critical' when
>    parsing a certificate, and that does not recognise that extension,
>    *must* reject that certificate.
>

I wouldn't be so sure that it must be done at parsing stage though.  
OpenSSL and GnuTLS parse the certificate without problems and then fail 
at validation stage.  OpenSSL even has a "-ignore_critical" command line 
switch to ignore critical extensions:

https://man.openbsd.org/openssl.1#ignore_critical

I honestly think the approach of mbedTLS to critical extensions is blunt 
to say the least.  And just as a side note, mbedTLS *will* still happily 
generate, sign and export a certificate with an unsupported critical 
extension, even when it's built without that damn feature.  Don't ask me 
how I know...  if you don't believe me, look at 
mbedtls_x509write_crt_set_extension, called on line 1167 in ualpn.c

>
>I think we should refuse to use mbedtls with uacme.

I agree, at least until mbedTLS changes its approach.

Regards
Nicola
