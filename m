From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Mar 2017 20:14:51 +0100
Subject: [Buildroot] [PATCH 2/2] Makefile: add check of binaries
 architecture
In-Reply-To: <20170312173119.qt6mcfxkalpzaeoj@tarshish>
References: <1489331191-32663-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489331191-32663-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170312151543.GC3739@free.fr> <20170312173119.qt6mcfxkalpzaeoj@tarshish>
Message-ID: <80833d58-c73c-9488-9dd3-f8713a3dfddc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-03-17 18:31, Baruch Siach wrote:
> Hi Yann,
> 
> On Sun, Mar 12, 2017 at 04:15:43PM +0100, Yann E. MORIN wrote:
>> On 2017-03-12 16:06 +0100, Thomas Petazzoni spake thusly:
>>> As shown recently by the firejail example, it is easy to miss that a
>>> package builds and installs binaries without actually cross-compiling
>>> them: they are built for the host architecture instead of the target
>>> architecture.
>>>
>>> This commit adds a small helper script, check-bin-arch, called from
>>> the main Makefile as a TARGET_FINALIZE_HOOKS, to verify that all ELF
>>> binaries have been built for the correct CPU architecture.
>>
>> That is not possible in all situations.
>>
>> For example, I have a board here with a kind of co-processor of a
>> different architecture; the firmware for that co-processor is loaded
>> at runtime. It is an ELF file, and it is in target/.
>>
>> So I don't think it is possible to check that all ELF files are for the
>> Buildroot-known target.
>>
>> We already discussed this a while ago and came to the same conclusiong
>> back then.
> 
> Maybe limiting the check to well knows target binary directories like 
> target/{bin,sbin,usr/bin,usr/sbin,...} would help. This check won't catch all 
> possible locations of target ELF binaries, but it's still a significant 
> improvement over the current situation.

 Since the problematic files are in /lib/firmware, we'd have to do it
non-recursively then, and thereby miss quite a lot of libraries (which are often
installed in subdirectories of /usr/lib). My first thought was that it's not a
big problem to not check all files, but there are important categories of
packages that install only in a subdirectory of /usr/lib, e.g. perl/python/...
modules with a .so file. And there are even a few .so files in /usr/share (e.g.
bash-completion helpers).

 So I think Yann's idea of just excluding /lib/firmware is the best option.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
