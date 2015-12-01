From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 1 Dec 2015 21:34:26 +0100
Subject: [Buildroot] [PATCH] musl: add a sys/queue.h implementation
In-Reply-To: <1449001048.1893.30.camel@embedded.rocks>
References: <1448924535-8093-1-git-send-email-sergio.prado@e-labworks.com>
 <1449001048.1893.30.camel@embedded.rocks>
Message-ID: <565E0452.30002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-12-15 21:17, J?rg Krause wrote:
> Hi all,
> 
> On Mo, 2015-11-30 at 21:02 -0200, Sergio Prado wrote:
>> Musl does not provide a 'sys/queue.h' implementation, and this has
>> been
>> a problem for packages that depend on it.
>>
>> So lets create a package called sys-queue that will install
>> 'sys/queue.h'
>> in the staging directory when enabled.
>>
>> Musl toolchain and external toolchain packages will depend on this
>> package, so that 'sys/queue.h' will be always installed when
>> compiling
>> with a musl based toolchain.
>>
> 
> Maybe we can handle this similiar to the gettext integration and define
> a BR2_NEEDS_SYS_QUEUE for toolchains not providing a queue library.
> 
> Packages that need a queue implementation can use 'select
> BR2_PACKAGE_NETBSD_QUEUE if BR2_NEEDS_SYS_QUEUE' in their Config.in
> file and add a '$(if $(BR2_NEEDS_SYS_QUEUE),netbsd-queue)' to their
> dependencies in the .mk file. 

 This would add quite a lot of complexity. Unconditionally installing
sys/queue.h for musl libraries is really a lot simpler.

> 
> This means we have a package 'netbsd-queue' with the sources of the
> NetBSD project you proposed. Note, there exists more implementations of
> the queue library, e.g. OpenBSD, Apple, so I would prefer to use the
> name of the implementation as there is no *the* sys/queue.h.

 That's a good idea. Not that I expect we'll ever carry another queue
implementation (actually we already have two: uClibc and glibc).

 Regards,
 Arnout

> 
> Furthermore, we allow a package to use, for whatever reasons, to select
> a different queue implementation.
> 
> On the other hand, maybe it is to confusing for the package maintainer
> to have different options for a queue library, so we just provide a
> default package named 'sys-queue' using the sources of NetBSD?
> 
> Best regards
> J?rg Krause
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
