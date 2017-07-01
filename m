From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Jul 2017 17:24:34 +0200
Subject: [Buildroot] [RFC PATCH v5 01/11] package/patchelf: use most
 recent version as a base for rpath sanitation
In-Reply-To: <a30436db-052e-bc75-d727-1147a75da98f@mind.be>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-2-git-send-email-wg@grandegger.com>
 <80a1cf57-34bb-dc8f-e2b9-dd4001f7df6b@mind.be>
 <5b16af39-81af-9a19-dd28-9aebfde9e817@grandegger.com>
 <a30436db-052e-bc75-d727-1147a75da98f@mind.be>
Message-ID: <401fdb29-ce3a-f5a2-67d7-a03e2f785e87@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-07-17 11:40, Arnout Vandecappelle wrote:
> 
> 
> On 30-06-17 19:33, Wolfgang Grandegger wrote:
>> Am 30.06.2017 um 19:15 schrieb Arnout Vandecappelle:
>>>
>>> On 30-06-17 10:36, Wolfgang Grandegger wrote:
>>>> We would like to use "patchelf" to do rpath sanitation of all ELF files
>>>> in the "host", "staging" and "target" directory, mainly because a script
>>>> based solutions is too complex and slow.
>>>   Note that the bump is needed because some features were introduced since 0.9
>>> that we need for out rpath sanitization.
>> OK. Strictly speaking, we don't need/use the new stuff. The patch could also be
>> adapted to 0.0. I mainly used the most recent version because of the mainlining
>> process.
> 
>  Perhaps we should stick to 0.9 then. Since then, they have started using C++11
> features, and I am not sure they are supported by the gcc in RHEL5. Since we
> will always use patchelf, it will have to be buildable on any host that we
> support...

 OK, so we have a problem here: current patchelf master doesn't build with gcc
4.4 because of the use of C++11 constructs. Here are our options:

1. Base our patchelf on 0.9 still instead of current master.

2. Base on master and add patches to make it build again on gcc 4.4 (which at
least has *some* C++11 support). Most of these patches would not be upstreamable
though.

3. Like 1/2 but fork patchelf entirely, i.e. keep the patching we do outside of
Buildroot, in the forked repository. This is a bit easier to maintain than
patches within Buildroot, and is as easy for the users.

4. Require gcc 4.6 on the host (if that is indeed sufficient to build patchelf).
This means abandoning support for Debian squeeze (i.e. three releases before
current stable) and RHEL5 (Ubuntu 12.04, the previous-previous LTS, is still OK).

5. Replace patchelf with something else that fits better. Two options:
pyelftools and chrpath. Neither looks to promising: chrpath is simply worse than
patchelf (doesn't really abbreviate RPATH, it just fills it with zeroes, and
doesn't support making it longer). pyelftools looks interesting, but it's Python
so we would normally install it as a host-python-package which would complicate
things enormously.


 My feeling is that we should stick to option 1 and revisit when it turns out
that we really want some upstream features added later.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
