From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Oct 2015 10:56:39 +0200
Subject: [Buildroot] Issues with the toolchain wrapper applied to the
 internal toolchain
In-Reply-To: <561AC198.9070206@mind.be>
References: <20151011120859.7e786a73@free-electrons.com>
 <561AC198.9070206@mind.be>
Message-ID: <561E18C7.5090201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-10-15 22:07, Arnout Vandecappelle wrote:
> On 11-10-15 12:08, Thomas Petazzoni wrote:
[snip]
>> As you can see, it looks for the "real" compiler in the wrong location.
>> I believe it should instead re-use some of the logic of
>> BR_CROSS_PATH_REL.
> 
>  Actually I don't see how this could happen, but I'm too tired now to study it
> in detail.

 The problem is that the absolute path is constructed based on $(HOST_DIR)
relative to the location of the executable. That means that the /usr bit is
included. However, in the external toolchain tarballs, the /usr bit is left out.

 I think it's time that we remove the usr part of HOST_DIR. It's quite useless
IMHO. However, it's a pretty big change...

 Specifically for the internal toolchain wrapper, we could calculate abspath
differently for the internal and the external case. Not really ideal if you ask me.


[snip]
>> Also, another concern I have is what going to happen with the double
>> wrapper? A Buildroot toolchain has a wrapper, and then when it's
>> re-used as an external toolchain, another wrapper is created. Will this
>> work OK, especially in terms of ccache behavior?
> 
>  Good point. Also if we add something like that galileo-specific option to the
> toolchain wrapper, we probably don't want it (or repeat it) when used as an
> external toolchain.
> 
>  One solution for both issues would be to deal with buildroot-built toolchains
> explicitly in the toolchain wrapper, i.e. detect the existence of .real and exec
> that one directly. Would that be an acceptable solution?

 Since this solution will be a lot easier, and we probably want it anyway for
the ccache and arch-options issue, I will go for this solution.

 The question is then: do we detect the existence of .real at runtime in the
wrapper itself, or when building the toolchain wrapper?

 I'll try to find time this evening to work this out.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
