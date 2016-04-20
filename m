From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 20 Apr 2016 22:27:07 +0200
Subject: [Buildroot] [PATCH] python-backports-ssl-match-hostname: new
	package
In-Reply-To: <5460F213-7D25-4931-AFEA-9D13D3546075@exablox.com>
References: <1461144174-7711-1-git-send-email-yegorslists@googlemail.com>
 <20160420112839.43c4d35d@free-electrons.com>
 <CAGm1_ktt7NWNMxWagm_KZqupximn6mmUft-e+JdTo5L8FKNfAw@mail.gmail.com>
 <5460F213-7D25-4931-AFEA-9D13D3546075@exablox.com>
Message-ID: <CAGm1_ksog_2Q=zSaYSPrTJOxj04e8Qm+ui3FcUi8S0WYX4CuWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Wed, Apr 20, 2016 at 6:44 PM, Charles Hardin <ckhardin@exablox.com> wrote:
> Yes - I think I just selected it out of laziness because we don?t run
> different
> python versions and only use python 2.7

Could you perform following test?

1. disable backports.ssl_match_hostname
2. enable SSL support in Python, python-tornado and python-cerifi
3. make clean && make

Is your application functioning without backports.ssl_match_hostname?

Thanks.

Yegor

> On Apr 20, 2016, at 2:58 AM, Yegor Yefremov <yegorslists@googlemail.com>
> wrote:
>
> On Wed, Apr 20, 2016 at 11:28 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Wed, 20 Apr 2016 11:22:54 +0200, yegorslists at googlemail.com wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Fixes #8856
>
>
> Are you sure this is sufficient to fix the bug? Doesn't python-tornado
> also needs to select this new package when Python 2 is used?
>
>
> Both Python 2 and 3 implement ssl.match_hostname(cert, hostname) [1]
>
> backports.ssl_match_hostname 3.5.0.1 introduces some enhancements made
> in 3.5. See its history:
>
> History
> -------
>
> * This function was introduced in python-3.2
> * It was updated for python-3.4a1 for a CVE
> (backports-ssl_match_hostname-3.4.0.1)
> * It was updated from RFC2818 to RFC 6125 compliance in order to fix another
> security flaw for python-3.3.3 and python-3.4a5
> (backports-ssl_match_hostname-3.4.0.2)
> * It was updated in python-3.5 to handle IPAddresses in ServerAltName fields
> (something that backports.ssl_match_hostname will do if you also install the
> ipaddress library from pypi).
>
> Tornado has following logic to decide, when to import
> backports.ssl_match_hostname
>
> if hasattr(ssl, 'match_hostname') and hasattr(ssl,
> 'CertificateError'):  # python 3.2+
>    ssl_match_hostname = ssl.match_hostname
>    SSLCertificateError = ssl.CertificateError
> elif ssl is None:
>    ssl_match_hostname = SSLCertificateError = None
> else:
>    import backports.ssl_match_hostname
>    ssl_match_hostname = backports.ssl_match_hostname.match_hostname
>    SSLCertificateError = backports.ssl_match_hostname.CertificateError
>
> So if the user wants to use ssl.match_hostname, he must select
> Python's SSL support.
>
> Turns out, that this package can be used only, if the user imports it
> directly.
>
> [1] https://docs.python.org/2.7/library/ssl.html
>
>
> --
> Bits go in, bytes go out.
>
