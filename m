From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Mar 2018 00:08:08 +0200
Subject: [Buildroot] [PATCHv2] core: alternate solution to disable C++
In-Reply-To: <20180327214021.4d0e7b44@gmx.net>
References: <20180327110022.19980-1-yann.morin.1998@free.fr>
 <20180327214021.4d0e7b44@gmx.net>
Message-ID: <a6c522f3-7744-4863-5d51-400d907080ae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-03-18 21:40, Peter Seiderer wrote:
> Hello Yann,
> 
> On Tue, 27 Mar 2018 13:00:22 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
>> Some packages that use libtool really need some love to be able to
>> disable C++ support.
>>
>> This is because libtool will want to call AC_PROG_CXXCPP as soon as CXX
>> is set non-empty to something different from 'no'. Then, AC_PROG_CXXCPP
>> will want a C++ preprocessor that works on valid input *and* fail on
>> invalid input.
>>
>> So, providing 'false' as the C++ compiler will then require that we do
>> have a working C++ preprocessor. Which is totally counter-productive
>> since we do not have a C++ compiler to start with...
>>
>> bd39d11d2e (core/infra: fix build on toolchain without C++) was a
>> previous attempt at fixing this, by using the host's C++ preprocessor.
>>
>> However, that is very incorrect (that's my code, I can say so!) because
>> the set of defines will most probably be different for the host and the
>> target, thus causign all sorts of trouble. For example, on ARM we'd have
>> to include different headers for soft-float vs hard-float, which is
>> decided based on a macro, which is not defined for x86, and thus may
>> redirect to the wrong (and missing) header.
>>
>> Instead, we notice that libtool uses the magic value 'no' to decide that
>> a C++ compiler is not available, in which case it skeips the call to
>> AC_PROG_CXXCPP.
>>
>> Given that 'no' is not provided by any package in Debian and
>> derivatives, as well as in Fedora, we can assume that no system will
>> have an executable called 'no'. Hence, we use that as a magic value to
>> disable C++ detection altogether.
>>
>> Fixes: #10846 (again)
> 
> Fixes the gnutls configure failure described in Bug-10846...
> 
> Tested-by: Peter Seiderer <ps.report@gmx.net>

 Does that also imply that your earlier patch [1] can be marked as Superseded?

 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/889057/

> 
> Regards,
> Peter
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
