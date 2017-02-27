From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Feb 2017 15:58:54 +0100
Subject: [Buildroot] [RFC PATCH 1/2] package/gobject-introspection: add
 package
In-Reply-To: <20170224092549.2c560db3@free-electrons.com>
References: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
 <b5cbc35d4d8e4457563fdf5b8dfd04360c6616a5.1487811280.git.sam.bobroff@au1.ibm.com>
 <20170223101820.127d5700@free-electrons.com>
 <20170224040713.GA4446@tungsten.ozlabs.ibm.com>
 <20170224092549.2c560db3@free-electrons.com>
Message-ID: <8eeadd56-4c2b-94ff-c182-50e18e81f749@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-02-17 09:25, Thomas Petazzoni wrote:
> On Fri, 24 Feb 2017 15:07:13 +1100, Sam Bobroff wrote:
> 
>> Yes, absolutely, and I really don't know how we should handle it. I
>> searched fairly hard for another solution but the only other one seems
>> to be to rewrite gobject-introspection completely and the other
>> projects that have attempted this have used the same host-qemu approach
>> (that's yocto and cygwin).
> Can you summarize what is Qemu used for in the context of building
> gobject-introspection ?
> 
> If it's to generate some architecture-specific file, can we
> pre-generate it, and bundle it with Buildroot ?

 As far as I can see, it just runs ldd under qemu, to find the paths to the
libraries that will actually be used (i.e., the libraries that have to be
introspected, I guess). That's why Jerome suggested to use his cross-ldd
scriptlet [1], which would also work with musl and uClibc.

 However, as far as I understand, it really only needs to find a list of shared
libraries used by a program. In our case, instead of going through ldd, we can
just use readelf because there is normally only a single instance of each SONAME
in the target.

 I'm not 100% sure, however; I also see some references to dlopen() though it's
not clear to me if this is called during the build.


>> Would a comment in the menuconfig section for gobject-introspection be
>> any better? It's more likely to be seen but it's not really the "right"
>> place -- you can run into the kernel version issue with QEMU usermode
>> without using gobject-introspection (although not during the build!).
>>
>> But more generally, should buildroot accept this kind of solution at
>> all? It works and is useful but it significantly more complex and
>> therefore problem-prone than normal...
> I'd really like to avoid a qemu-based solution if possible. But of
> course, if there's really no other option and people want
> gobject-introspection, we won't have much choice :/

 At least, if we do go the qemu-user way, it should always work, so also with
musl and uClibc, also if host headers are older than target... But really,
cross-compilation doesn't work at all (i.e. qemu is needed), and anyway doesn't
work on the unusual architectures where Debian is not available, then I don't
think Buildroot is the right way.

 Regards,
 Arnout

[1]   https://gist.github.com/jerome-pouiller/c403786c1394f53f44a3b61214489e6f


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
