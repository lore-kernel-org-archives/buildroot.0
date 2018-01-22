From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Jan 2018 23:14:08 +0100
Subject: [Buildroot] linux-firmware hash mismatch (tar-1.30)
In-Reply-To: <87zi5adewm.fsf@dell.be.48ers.dk>
References: <20180109161531.47ec21e0.john@metanate.com>
 <87vag9plt1.fsf@dell.be.48ers.dk> <20180111105557.6f97bb46.john@metanate.com>
 <20180114133016.GA20105@scaer> <ef492963-bf3b-3fbb-f5b1-bba0126f3884@mind.be>
 <87zi5adewm.fsf@dell.be.48ers.dk>
Message-ID: <7f7d3f7b-0771-fff2-0b44-5c81686c9fb9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-01-18 22:40, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >>>> Gaah, what a mess :/
> 
>  >  Note that this also means our github hashes will break again...
> 
> Indeed, I also mentioned that earlier.
> 
>  >> Alas, this means that we can only depend on building our own tar...
> 
>  >  Nah, let's not go there.
> 
>  >> Even when we eventually support using a local git-clone cache, this we
>  >> not solve the issue has the hashes we store are on the generated
>  >> tarball...
> 
>  >  However, the way we create a git tarball can serve as a source of inspiration
>  > of how to solve it. Instead of hashing the tarball, we can hash the contents of
>  > the tarball instead, using --to-command and a support script (--to-command
>  > exists since 1.15.90 and our minimal tar version is 1.17). The support script
>  > would print the metadata and a hash of the contents. And the output of all that
>  > is piped into sort (to make sure the order of files in the tarball isn't
>  > relevant) and shasum.
> 
> Hmm, that is perhaps an option. It does make it somewhat more cumbersome
> to calculate the expected hash by hand, but maybe that is ok.

 There's still a patch floating around that doesn't remove the downloaded file
[1], and the calculated hash is already reported. So not much of an issue I think.


> Alternatively we don't do anything and instead ensure that tarballs on
> s.b.o matches the hashes we commit, and people using incompatible tar
> versions will fall back to the tarballs on s.b.o.

 But then they'll still be downloaded twice. Not very nice.

 Let's discuss it at the meeting in two weeks.


>  >  That way we don't rely on the way the user's tar behaves at all. We really
>  > check the contents of the tarball. It would also mean we can drop the complexity
>  > in the git download helper and directly use git archive.
> 
> I thought the main reason for our custom tarball handling was support
> for git submodules? I take it that git-archive still doesn't handle those?

 Right, I forgot about that.

 Regards,
 Arnout


[1] http://patchwork.ozlabs.org/patch/834425/

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
