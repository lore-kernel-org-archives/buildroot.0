From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Apr 2018 01:30:57 +0200
Subject: [Buildroot] [PATCH 3/4] download/git: ensure we can checkout
 repos with submodule conversions
In-Reply-To: <20180419195948.GD30285@scaer>
References: <a45b9ba78d527d29cfd5cc0daf4c767c7feb8643.1523983687.git.yann.morin.1998@free.fr>
 <5ad6b7cbf192b_23c22af60ee98304189d9@ultri4.mail>
 <627eaa46-0acb-9753-15a0-d805abb18164@mind.be> <20180419195948.GD30285@scaer>
Message-ID: <41022455-a486-da38-00fa-53c07432fa97@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-04-18 21:59, Yann E. MORIN wrote:
> Arnout, Ricardo, All,
> 
> On 2018-04-18 10:04 +0200, Arnout Vandecappelle spake thusly:
[snip]
>>  Note that git 1.7.1 also doesn't have the .git files in the submodules; the
>> submodules have .git directories, i.e. they're indistinguishable from normal
>> repos. I think that that is not a problem for this patch, since I think git
>> 1.7.1 *will* kill .git directories when doing git clean --ffdx, but I'm not
>> sure. Note that this implies that submodules will *not* be cached...
>>
>>  I'm liking the bare repos more and more :-)
> 
> But then, we can't have submodules stored in a bare repo, because we
> need a workign copy to have the list of submodules, and their
> versions...

 It's *possible* to do things fully "manually", e.g. with some plumbing commands:

export GIT_DIR=/path/to/bare/repo
blob=$(git ls-tree $cset .gitmodules | awk '{print $3}')
if [ "$blob" ]; then
  tmpfile=$(git unpack-file $blob)
  etc. etc.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
