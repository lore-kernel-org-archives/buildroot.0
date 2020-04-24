From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 11:07:10 +0200
Subject: [Buildroot] [PATCH 1/3] package/mbedtls: add
 BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
In-Reply-To: <20200423232758.zwos3e5f55pz23ld@einstein.dilieto.eu>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
 <20200423220905.06d9dc59@windsurf.home>
 <20200423232758.zwos3e5f55pz23ld@einstein.dilieto.eu>
Message-ID: <20200424090710.GA5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicola, Fabrice, Thomas, All,

On 2020-04-24 01:27 +0200, Nicola Di Lieto spake thusly:
> On Thu, Apr 23, 2020 at 10:09:05PM +0200, Thomas Petazzoni wrote:
> >What is this X509_UNSUPPORTED_CRITICAL_EXTENSION functionality that is
> >so weird that it requires patching the mbedtls config.h file ? Why is
> >uacme absolutely requiring this functionality that no other user of
> >mbedtls requires ?
> 
> There is an explanation at
> https://github.com/ndilieto/uacme/issues/23
> 
> Briefly, tls-alpn-01 validation requires (as per RFC8737 section 6.1) a new
> critical certificate extension. mbedTLS doesn't know about it and refuses to
> parse any certificate with such extension unless that build feature is
> enabled.

So, I think I now wrapped my head around this issue, and I think I got
it. Here's what I understood from the different resources [0] [1]:

  - in X.509, some extensions can be added to certificates
  - an extension can be marked as 'critical' or 'not critical'
  - an X.509 parser that encounters an extension marked 'critical' when
    parsing a certificate, and that does not recognise that extension,
    *must* reject that certificate.

mbedtls does the right thing here: it rejects such certificates.

However, embedtls has an option to treat thoe 'critical' extensions as
if they were 'not critical'.

I think we should refuse to use mbedtls with uacme.

[0] https://en.wikipedia.org/wiki/X.509
[1] https://github.com/ndilieto/uacme/issues/23

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
