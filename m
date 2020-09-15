From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Sep 2020 21:10:00 +0200
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <CA+h8R2p=3KN=11jmkKg4AOToGhJ+BX+F8yx5-OOUyPO1yBD9fQ@mail.gmail.com>
References: <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903132852.GZ14354@scaer> <20200903160205.7e67bbe7@windsurf.home>
 <20200903151221.GA14354@scaer> <20200903181334.1a25642b@windsurf.home>
 <20200903191841.GC14354@scaer>
 <CA+h8R2rNmRJUor9CDjyNzsgGPCmpE3XPjtkFdjzCeMGYenWKxA@mail.gmail.com>
 <20200903204341.GE14354@scaer>
 <CA+h8R2ooPOmJeE0dK7bQ+AyHG+ZT3ZRtYG80RjUdpBf78Q4aHw@mail.gmail.com>
 <20200904080612.GG14354@scaer>
 <CA+h8R2p=3KN=11jmkKg4AOToGhJ+BX+F8yx5-OOUyPO1yBD9fQ@mail.gmail.com>
Message-ID: <bf2665e6-c73c-cef2-3f3c-f85238b9932c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/09/2020 00:33, Christian Stewart wrote:
> Yann,
> 
> On Fri, Sep 4, 2020 at 1:06 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Ah, because you store all the go vendored dependencies "away" of the
>> package.
>>
>> I am not sure I like that, because it breaks the semantics of the dl/
>> directory: all the csource needed by one package is in dl/foo/ and the
>> vendored dependencies *are* part of the package.
>>
>> So I am absolutely not in favour of storing the go modules on the side.
> 
> I've thought about this quite a bit and I think you're probably right,
> for a v1 implementation in Buildroot we most likely should do the
> approach of "go mod vendor" just before compressing the source file
> for "make source." It should work fine for Go (can't speak for node or
> others) because the vendor/ tree is always consistent.

 Now that apparently everyone is on the same page, I think it's good to keep
track of the conclusions, so I've created a wiki page [1].

 If there is anything that needs further discussion, please continue that here
in the list. However, if there is something I just didn't write down correctly
or clearly enough, simply update the wiki.

 For your convenience, I've copied the wiki page below.


== Problem statement and requirements

Language package managers make it possible to express dependencies and make sure
the correct version of those dependencies are used.

For Buildroot, the problem is to make sure those dependencies are downloaded.
Sometimes the upstream package simply bundles all dependencies (this is called
"vendored"), but sometimes they only have them by reference.

Buildroot needs to make sure that:

* the dependencies are downloaded;
* the dependencies are extracted in a way that they're accessible by the
language's build system;
* everything is properly hashed so we are sure the correct tarballs were downloaded;
* it is possible to do "make source", unplug the network, and do a build;
* it is possible to use a BR2_PRIMARY_SITE and BR2_PRIMARY_SITE_ONLY;
* it is possible to use BR2_BACKUP_SITE;
* the information produced by "make legal-info" is correct.

An additional nice-to-have is to be able to split off the open source
dependencies from the non-redistributable dependencies.


== Possible solutions

1. Add a download helper that downloads the base source, runs the package
manager to vendor all dependencies, and creates a tarball of this bundle.
2. Add a download helper that downloads the base source, runs the package
manager to vendor all dependencies, and creates a separate tarball containing
only the dependencies.
3. Add a download helper that downloads the base source, runs the package
manager to vendor all dependencies, splits off the non-redistributable
dependencies, and creates a separate tarball for the open-source and the
non-redistributable dependencies.
4. Add a download helper that downloads the base source, runs the package
manager to get all dependencies, and creates a separate tarball for each
individual dependency.
5. Solution 1 + extra legal-info infrastructure that makes it possible to strip
off non-redistributable parts when generating the legal-info tarball.

Solution 1 is the simplest to implement. It is the approach taken by
http://patchwork.ozlabs.org/project/buildroot/list/?series=159771 for cargo.

Solution 2 is also easy to implement. However:

- the download infra has to "know" how to download the additional tarball (it
should not be downloaded when using the normal method, but it should be
downloaded for PRIMARY and BACKUP);
- the additional tarball has to be added to the hash file;
- the additional tarball has to be extracted as well.

Solution 3 is like solution 2, but times two.

Solution 4 is a lot more complicated to implement. It is probably doable to use
the language itself to wrap the package manager (which typically has a library
as well) to gather a list of all dependencies and URLs. Then each of them has to
be downloaded and tarred separately. However, to support PRIMARY and BACKUP,
we'll need to maintain this list inside Buildroot as well. In addition, we need
a separate hash for each tarball.

Solution 5 is somewhat orthogonal to the rest. It has the nice advantage that it
can also be applied to cases where the bundling is done without using a language
package manager (e.g. for C/C++ code).


 Regards,
 Arnout

[1] https://elinux.org/Buildroot:Language_package_managers_and_dependencies
