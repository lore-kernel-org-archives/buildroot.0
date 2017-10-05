From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 Oct 2017 20:05:50 +0200
Subject: [Buildroot] Package infrastructure for Go programs
In-Reply-To: <CA+TH9VnwN5m5BhdfRU1tLQQAwS+XsQe3xkqgQHScXeHjHyDtFw@mail.gmail.com>
References: <CA+TH9VmgHZ5xxYXeO7dzqKObsz+X=v38XhcK34tY3Fp=DjDyig@mail.gmail.com>
 <7041482c-85c6-1a99-95dd-1ba1d592701d@mind.be>
 <CA+TH9VnwN5m5BhdfRU1tLQQAwS+XsQe3xkqgQHScXeHjHyDtFw@mail.gmail.com>
Message-ID: <3628be9d-8cd1-e394-577b-6ecf2fc818a3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-10-17 11:20, Angelo Compagnucci wrote:
> Dear Arnout Vandecappelle,
> 
> 2017-10-04 22:00 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
[snip]
>> 1. The build is reproducible. If I build the same .config a year from now, I
>> should use exactly the same source (and normally end up with exactly the same
>> result, barring some timestamps etc.).
>>
>> 2. "make source" downloads everything so after that you can do an offline build.
>>
>> 3. Everything appears only once in the target, only a single version is used for
>> each package, unless the versions are incompatible (e.g. a gstreamer-0.10 and
>> gstreamer-1 side by side is acceptable).
>>
>> 4. BR2_PRIMARY_SITE works, it should be possible to do an offline build with an
>> empty download dir as long as you can access BR2_PRIMARY_SITE.
>>
>> 5. Something like our hashes is implemented, i.e. if the upstream archive is
>> changed, the build breaks.
>>
>> 6. legal-info works, the licenses end up in our manifest and preferably also a
>> license file.
>>
>> 7. BR2_SECONDARY_SITE works, so if the original archive disappears we can still
>> do a build.
[snip]
> I have a proof of concept golang package infrastructure and I will
> send asap. I used it to test some of the thing we discussed.
> 
> In pratice, for go packages there's not much of a trouble cause all of
> the packages I tried bundles all of their dependencies, so anything
> will be downloaded outside the release tarball.

 If I understand correctly, the go packaging is not like the other language
packaging utilities (npm, pip, rebar, cargo, ...) in that it really only builds
the package, the download and extraction is still managed by us, and the
dependencies are managed directly by upstream. So the only limitation is that it
links statically with libraries bundled in the upstream tarball. I have
absolutely no problem with that.


> In practice only point 6 seems the most troublesome to me. It's not a
> problem to find the license of the downloaded tarball obviously, but
> finding each one of the licenses of the bundled dependencies could be
> a problem!

 Well, not more so than for any other package. A great many packages bundle some
code that comes from different projects or that has been contributed under a
different license. The simple approach is to just run Debian's licensecheck tool
on the source. It's not conclusive but generally good enough.

 Regards,
 Arnout


[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
