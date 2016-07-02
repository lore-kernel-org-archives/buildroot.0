From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jul 2016 13:22:52 +0200
Subject: [Buildroot] [PATCH v2 11/15] toolchain/toolchain-external: add
 libgfortran and libquadmath to the TOOLCHAIN_EXTERNAL_LIBS list
In-Reply-To: <20160701232238.3d0f725c@free-electrons.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-12-s.martin49@gmail.com>
 <20160701232238.3d0f725c@free-electrons.com>
Message-ID: <9e216551-f324-fb88-829b-43423169ba35@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-07-16 23:22, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri,  1 Jul 2016 18:29:16 +0200, Samuel Martin wrote:
> 
>> +ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
>> +TOOLCHAIN_EXTERNAL_LIBS += libgfortran.so.*
>> +# fortran needs quadmath on x86 and x86_64
>> +ifeq ($(BR2_I386)$(BR2_x86_64),y)
>> +TOOLCHAIN_EXTERNAL_LIBS += libquadmath.so*
>> +endif
>> +endif
> 
> OK. Then maybe on the internal toolchain backend side, we should keep
> things simple for libquadmath:
> 
>  1/ Disable it when we know it's not supported (wchar missing)
> 
>  2/ Forcefully enable it when Fortran is enabled and we're on
>     i386/x86_64
> 
>  3/ Copy it only when Fortran is enabled and i386/x86_64
> 
> Which is pretty much what you did originally I believe.
> 
> This way, only the people who care about Fortran support will have
> libquadmath copied to their target. If in the future some other
> non-Fortran related package needs libquadmath, we can revisit this at
> this time.

 fftw you mean? :-)

 At this point, it is perhaps better to introduce a blind
BR2_TOOLCHAIN_HAS_QUADMATH option (or should it be USE?) that is selected
automatically as appropriate. Later we could add a BR2_PACKAGE_GCC_QUADMATH
option to enable it explicitly.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
