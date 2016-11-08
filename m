From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 21:53:07 +0100
Subject: [Buildroot] [PATCH v4 04/22] toolchain-external: introduce
 toolchain-external-package
In-Reply-To: <20161108163847.76ce7e6f@free-electrons.com>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161107012017.22505-5-arnout@mind.be>
 <a6555b0b-413d-0248-8b6f-75319c385440@gmail.com>
 <96c92e87-dc71-3030-d620-5ed285259ebb@mind.be>
 <20161108092049.45aa1609@free-electrons.com>
 <9b5894c1-e895-1bab-ea4d-da880ee0323f@mind.be>
 <20161108163847.76ce7e6f@free-electrons.com>
Message-ID: <c14c0a7e-37a8-aeaa-9e26-517db0e8cf91@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 16:38, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 8 Nov 2016 13:30:16 +0100, Arnout Vandecappelle wrote:
> 
>>  That would be useful if such a toolchain uncovers problems that we can fix in
>> Buildroot. If all it does is to add autobuilder exceptions, there isn't much
>> point... Well, the other thing we can do is to add *_AT_LEAST_NNN options,
>> that's true.
> 
> Yes, that's what I'm thinking of: it allows us to realize when a
> package needs gcc 4.7 or 4.8, or when some fairly recent kernel headers
> are needed, for example. If all we test is gcc 4.9 with 4.0 kernel
> headers, then all our users that are stuck with 4.7 (or older
> toolchains) with 3.0 kernel headers will have a really bad experience.

 For things which we don't test in the autobuilders, I think we should retire
the _AT_LEAST_ option. What is the use of having an option that tells you which
packages will work with gcc 4.6, if we actually have no idea if those packages
will work with gcc 4.6? So indeed, removing the blackfin toolchain would mean
removing gcc 4.3, 4.4, 4.5, 4.6 and 4.7 (the lowest option is actually useless
because it is always set).

 Anyway, the Blackfin toolchain is now the only one with gcc < 4.7, but this
toolchain wasn't really great for testing gcc compatibility, because many
packages are already excluded due to its various other arch limitations.

 Ideally we should generate a gcc 4.5 - headers 3.0 - glibc 2.19 based toolchain
for a few architectures. We can use 2015.02 for that. uClibc is not so
interesting because older versions can break in so many ways, and because less
packages are tested with it.

> 
>>  Those autobuilder exceptions for ct-ng, what kind of errors are they for? Not
>> something covered by *_AT_LEAST? Like bugs in libc, for which we don't have
>> _AT_LEAST?
> 
> Looking quickly at the autobuild-run exceptions, we have:
> 
>  - Toolchains with gcc affected by various PRs

 But that should be handled with _AT_LEAST, no?

> 
>  - Toolchains with too old eglibc (2.18)
> 
>  - Toolchains that fail to build this or that package, with no
>    documented reason (might be explained in the commit log, though).

 Yeah, I've taken a look at the commit logs and it's usually because of too old
uclibc.

 I also noticed that the majority of the exceptions are for toolchains that are
no longer in toolchain-configs.csv...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
