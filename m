From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Aug 2016 02:55:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/lldpd: disable use of libbsd
In-Reply-To: <20160818232414.4a44b95f@free-electrons.com>
References: <1471554082-24303-1-git-send-email-yann.morin.1998@free.fr>
 <20160818232414.4a44b95f@free-electrons.com>
Message-ID: <40a74490-3b2a-5d0a-64d5-9b37283c1cb9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-08-16 23:24, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 18 Aug 2016 23:01:21 +0200, Yann E. MORIN wrote:
>> libbsd installs at least one .pc file that contains a -isystem include
>> path (-isystem /usr.include/bsd), but -isystem is not munged by
>> pkg-config, so we end up using /usr/include/bsd which is not suitable
>> for the target. And breaks big time (see failures, below).
>>
>> But using libbsd is completely optional. In fact, our lldpd.mk did not
>> even express the dependency on libbsd, so we may well have had builds
>> without libbsd.
>>
>> The functionality brought in by using libbsd is very minor (just setting
>> the neighbour name in /proc/self/smdline), so we just make lldpd not use
>> libbsd at all. There is no --disable-libbsd or such, so we just patch it
>> out of configure.ac.
> 
> I don't like this fix, for two reasons:
> 
>  * The patch is not upstreamable.
> 
>  * It works around the problem, living a potentially problematic
>    libbsd.pc installed which can be used by other packages than lldpd.
> 
> Isn't the right solution to add support in pkg-config to mungle
> -isystem flags?

 That is the right solution. However, it's not exactly trivial to do that in
pkg-config - they're using kind of messy parsing of the flags.

 So I propose to wait until the end of the week to see if kaniini [1] comes up
with a patch we can backport, and if not, apply this one.

 My Reviewed-by stands :-)

 Regards,
 Arnout


[1] https://github.com/pkgconf/pkgconf/issues/94


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
