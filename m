From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 5 Oct 2017 11:20:02 +0200
Subject: [Buildroot] Package infrastructure for Go programs
In-Reply-To: <7041482c-85c6-1a99-95dd-1ba1d592701d@mind.be>
References: <CA+TH9VmgHZ5xxYXeO7dzqKObsz+X=v38XhcK34tY3Fp=DjDyig@mail.gmail.com>
 <7041482c-85c6-1a99-95dd-1ba1d592701d@mind.be>
Message-ID: <CA+TH9VnwN5m5BhdfRU1tLQQAwS+XsQe3xkqgQHScXeHjHyDtFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

2017-10-04 22:00 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi Angelo,
>
> On 28-09-17 12:14, Angelo Compagnucci wrote:
>> Hello guys,
>>
>> I was reading a thread [1] about a packaging infrastructure for Go
>> software and I'm interested to revive it.
>>
>> The most difficult objection to overcome is the fact that we should
>> decompose software dependencies in the correspondent packages to be
>> downloadable separately, but unfortunately with go software (or in
>> general with any other software with fluid dependencies and package
>> management) this is really not possible.
>
>  Indeed, this is a recurring problem with languages that provide their own
> packaging infrastructure. Currently, the rule is indeed that every package needs
> to be packaged separately. For npm we have a kind of escape route, that allows
> you to give a list of npm packages to install and Buildroot will use npm to
> install those (plus dependencies). But that approach doesn't apply for a
> Buildroot package that has npm dependencies, only for something the end user
> wants to use.
>
>  My personal opinion is that we should let go of the rule that every package
> needs to be packaged separately and instead use the language packaging
> infrastructure as much as possible. *How* exactly this can be done, I'm not sure
> of. But I want to keep the following features (in decreasing order of priority).
>
> 1. The build is reproducible. If I build the same .config a year from now, I
> should use exactly the same source (and normally end up with exactly the same
> result, barring some timestamps etc.).
>
> 2. "make source" downloads everything so after that you can do an offline build.
>
> 3. Everything appears only once in the target, only a single version is used for
> each package, unless the versions are incompatible (e.g. a gstreamer-0.10 and
> gstreamer-1 side by side is acceptable).
>
> 4. BR2_PRIMARY_SITE works, it should be possible to do an offline build with an
> empty download dir as long as you can access BR2_PRIMARY_SITE.
>
> 5. Something like our hashes is implemented, i.e. if the upstream archive is
> changed, the build breaks.
>
> 6. legal-info works, the licenses end up in our manifest and preferably also a
> license file.
>
> 7. BR2_SECONDARY_SITE works, so if the original archive disappears we can still
> do a build.
>
>
>  1 and 2 are for me essential. The rest is is negotiable :-). Note that the npm
> hack currently doesn't even satisfy point 1. I'm absolutely NOT in favour of
> repeating that exercise for other languages...
>
>
>> Go permits to define dependencies on the form of a git repository
>> somewhere and this could change from a release to another. Moreover
>> the git repository linked by a software could have nested dependencies
>> that will be downloaded automatically by the go build system
>> recursively.
>
>  And is reproducibility guaranteed, or are these dependencies going to change
> automagically (without changing the root version)? I.e., will 1 be satisfied?
>
>> Dependencies are btw private to the software, downloaded in a nested
>> folder (usually called "vendor") and cannot be shared easily with
>> other software.
>
>  So this will violate 3. But that's actually no problem, because Go always does
> static linking so 3 will always be violated in practice (every executable
> contains all its dependencies).
>
>
>> This is generally true with each software that uses a package
>> management infrastructure. I can't think of packaging any modern php
>> software in buildroot cause the intricacies of dependency management
>> added by composer. Using composer in php offers no easy way to share a
>> dependency with another php project btw.
>>
>> Indeed, some buildroot software written in Go (like flannel) already
>> escapes [2] this rule.
>>
>> So in the end, it's feasible for software with an internal package
>> management and download mechanism to be in buildroot or should we
>> leave them out and so the package infrastructure?
>
>  So, above were my preferences. We should probably reserve some time at the next
> BR meeting (just two and a half weeks from now) to discuss this face to face.
>
>  Angelo, could you give some thoughts about which of these requirements might
> possibly be satisfiable and which ones we will have to sacrifice?

I have a proof of concept golang package infrastructure and I will
send asap. I used it to test some of the thing we discussed.

In pratice, for go packages there's not much of a trouble cause all of
the packages I tried bundles all of their dependencies, so anything
will be downloaded outside the release tarball.

In practice only point 6 seems the most troublesome to me. It's not a
problem to find the license of the downloaded tarball obviously, but
finding each one of the licenses of the bundled dependencies could be
a problem!

I'm investigating the problem deeply!

Sincerely, Angelo

>
>  Regards,
>  Arnout
>
>>
>> Thanks for your insights!
>>
>>
>> Sincerely, Angelo
>>
>>
>> [1] http://buildroot-busybox.2317881.n4.nabble.com/PATCH-0-8-RFC-Adding-a-Go-package-infrastructure-td124596.html
>>
>> [2] From the build log for flannel:
>> github.com/coreos/flannel/Godeps/_workspace/src/golang.org/x/net/context
>> github.com/coreos/flannel/Godeps/_workspace/src/github.com/coreos/go-iptables/iptables
>> github.com/coreos/flannel/Godeps/_workspace/src/github.com/aws/aws-sdk-go/aws/awserr
>> github.com/coreos/flannel/Godeps/_workspace/src/github.com/vaughan0/go-ini
>> github.com/coreos/flannel/Godeps/_workspace/src/github.com/aws/aws-sdk-go/internal/endpoints
>> github.com/coreos/flannel/Godeps/_workspace/src/github.com/aws/aws-sdk-go/aws/awsutil
>> github.com/coreos/flannel/Godeps/_workspace/src/github.com/aws/aws-sdk-go/internal/protocol/query/queryutil
>> github.com/coreos/flannel/Godeps/_workspace/src/github.com/aws/aws-sdk-go/internal/protocol/xml/xmlutil
>> [...]
>> In this case flannel doesn't download anything only because the
>> dependencies are pre-downloaded and included in the release archive,
>> but this still conflict with the buildroot policies.
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
