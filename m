From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Mar 2017 21:53:21 +0100
Subject: [Buildroot] [RFC PATCH 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <0825a8e8-94d9-c6dd-3b22-555c02280f35@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-3-git-send-email-wg@grandegger.com>
 <20170303154853.4eb15819@free-electrons.com>
 <c8a4d85e-ff1a-44ab-832b-bd4eff235a00@grandegger.com>
 <8122b244-b97f-e0fd-6d15-a33b8f44af25@grandegger.com>
 <30db8390-0a94-5449-0c5e-90263576be98@mind.be>
 <817f4be5-9f4c-927d-f611-8b112dfd0097@grandegger.com>
 <7524a67f-d19d-1023-262c-c0b7793e6066@mind.be>
 <0825a8e8-94d9-c6dd-3b22-555c02280f35@grandegger.com>
Message-ID: <6976debd-6909-3767-3645-7a40162c40df@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-03-17 10:25, Wolfgang Grandegger wrote:
> Am 07.03.2017 um 18:40 schrieb Arnout Vandecappelle:
>>
>>
[snip]
>>  So in that case we can't skip share. We certainly can skip include, I think,
>> though the benefit is perhaps limited.
>>
>>  Of course, if the entire staging can be skipped it's even easier :-)
> 
> Yep.

 I propose that you start with the simple option, but don't do it for staging
for the time being. Until Samuel comes with an argument why staging is necessary :-)

[snip]
>>> "patchelf --make-relative" will drop the rpath above, because the first
>>> two needed libs are not in the listed rpath but in
>>> "host/usr/x86_64-buildroot-linux-gnu/lib64".
>>
>>  That's the staging dir - it should certainly NOT use anything from there.
> 
> No, the staging dir is "host/usr/x86_64-buildroot-linux-gnu/sysroot/".

 My bad. Still, it's a cross-directory. It contains libgcc and other stuff from
the cross-compiler. So it is NOT meant to be used by the host binaries.

 It's easier to see when you do actual cross-compilation, then you'll see the
binaries there are for the target, not the host.


> 
>>> Running patchelf with "LD_DEBUG" tells me that it will take the libraries
>>> from the host (/usr/lib). Just wondering if that's correct!?
>>
>>  Yes it's correct, those 3 libraries are standard host libraries that can be
>> found in the standard paths.
> 
> Hm, what are the libraries in "host/usr/x86_64-buildroot-linux-gnu/lib64" then
> good for? They work if I use "LD_LIBRARY_PATH" to run the executable.

 Since your target is x86_64, just like your host, running a target binary will
just work as long as it can find the libraries (i.e. as long as you set
LD_LIBRARY_PATH).

[snip]
>>  To be evaluated if the speedup from using cmp is worth the false positives.
> 
> I wrote a little C program just checking the first 4 bytes of the file. The
> saving is 19 vs. 22 seconds. With "readelf" I have similar results. 

 You mean 19 seconds for the C program vs 22 seconds for cmp? That's what I
would expect indeed because cmp basically does the same. In my measurements,
readelf still was significantly slower - I didn't write down the numbers but
from memory it was like 25%.

> patchelf is
> written in C++... maybe that's the reason why it's slower.

 Well, it's rather because patchelf reads the entire file into a std::vector,
while readelf will just seek to the bits that are requested.



 By the way, did you already post your patches to the patchelf list?

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
