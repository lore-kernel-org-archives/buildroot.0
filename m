From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 13:00:18 +0100
Subject: [Buildroot] [PATCH v3 02/17] package/fftw: break fftw-single
 into a dedicated package
In-Reply-To: <20190101110952.GG26917@scaer>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-3-thomas.petazzoni@bootlin.com>
 <20190101110952.GG26917@scaer>
Message-ID: <20190101130018.1e077516@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Jan 2019 12:09:52 +0100, Yann E. MORIN wrote:

> There is a minor nit, though: the various flavours do install some of
> the same files. For example, with just this patch applied, and enabling
> fftw-single and fftw's remaining long-double option:
> 
> ./support/scripts/check-uniq-files -t target /home/ymorin/dev/buildroot/O/build/packages-file-list.txt
> Warning: target file "./usr/bin/fftw-wisdom-to-conf" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: target file "./usr/include/fftw3.f03" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: target file "./usr/include/fftw3.f" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: target file "./usr/include/fftw3.h" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: target file "./usr/include/fftw3l.f03" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: target file "./usr/share/man/man1/fftw-wisdom-to-conf.1" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: target file "./usr/include/fftw3q.f03" is touched by more than one package: [u'fftw-single', u'fftw']
> ./support/scripts/check-uniq-files -t staging /home/ymorin/dev/buildroot/O/build/packages-file-list-staging.txt
> Warning: staging file "./usr/share/man/man1/fftw-wisdom-to-conf.1" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: staging file "./usr/bin/fftw-wisdom-to-conf" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: staging file "./usr/lib/libfftw3f.la" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: staging file "./usr/include/fftw3.f03" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: staging file "./usr/include/fftw3.f" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: staging file "./usr/include/fftw3.h" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: staging file "./usr/include/fftw3l.f03" is touched by more than one package: [u'fftw-single', u'fftw']
> Warning: staging file "./usr/include/fftw3q.f03" is touched by more than one package: [u'fftw-single', u'fftw']
> 
> In practice, I'm not sure this causes any issue, in fact, because:
> 
>   - we don't care about the man pages;
> 
>   - ./usr/lib/libfftw3f.la should in fact not be installed by fftw's
>     long-double;
> 
>   - ./usr/bin/fftw-wisdom-to-conf is bit-for-bit the same in the two
>     cases;
> 
>   - the headers are each also the same in both cases.
> 
> So, when we switched the file list from a md5-based comparison, to a
> time-based comparison, we lost the precision that md5 offered. :-/
> 
> So far, there's not much we can do for now, but in the future, we'll
> have to revisit the way we establish the per-package file list and the
> way we check uniq files.

Meh. This is not really nice. I see a few possible solutions:

 (1) Have the per-precision packages not install to STAGING/TARGET but
     to some common intermediate location, and have the common fftw
     package stay a real package, which does the actual final location.

 (2) Have the per-precision packages only install libraries, and
     have the common fftw package install the rest that is
     common/identical between variants.

That being said, I still think (and it seems like your
Reviewed-by/Tested-by also says the same) this patch series goes in the
right direction, and we can live with this drawback for now.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
