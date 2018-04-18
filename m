From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Apr 2018 10:04:53 +0200
Subject: [Buildroot] [PATCH 3/4] download/git: ensure we can checkout
 repos with submodule conversions
In-Reply-To: <5ad6b7cbf192b_23c22af60ee98304189d9@ultri4.mail>
References: <a45b9ba78d527d29cfd5cc0daf4c767c7feb8643.1523983687.git.yann.morin.1998@free.fr>
 <5ad6b7cbf192b_23c22af60ee98304189d9@ultri4.mail>
Message-ID: <627eaa46-0acb-9753-15a0-d805abb18164@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-04-18 05:13, Ricardo Martincoski wrote:
> Hello,
> 
> Really sorry I did finished the review/tests today to send by tags.
> 
> Could you double-check the --force option for git 1.7.1? I am not sure we would
> have a workaround for this if it is not supported.

 The help of 1.7.1 says:

git submodule [--quiet] update [--init] [-N|--no-fetch] [--rebase] [--reference
<repository>] [--merge] [--recursive] [--] [<path>...]

No force there... Checking the code, I don't see any handling of -f or --force.

> Also a question and some typos.
> 
> On Tue, Apr 17, 2018 at 01:48 PM, Yann E. MORIN wrote:
[snip]
>> +# files after the checkout.
>> +find . -type f -name .git -exec rm {} +
> 
> In the unlikely case some user tries to abuse the git cache by first populating
> it using the 'git multiple working trees' feature the main
> dl/<package>/git/.git would be a file too. After this command all git commands
> will fail.
> But... well... that is expected! The user should not mess with the git cache,
> it is there to be used solely by buildroot.
> So we are good IMO.

 +1

 That said, IMO it would be better if the git cache were a bare repo, and that
we did the checkout outside of the repo. But I don't think that works well with
submodules. Submodules are annoying...

> 
>> +
>> +# Restore repository to the new, clean-checkout state.
>> +_git clean -ffdx
>> +_git checkout -- .
> 
> So it is needed to checkout the .git files again? Or did I miss something?

 I'm missing the point as well. Clearly needs a comment :-)

> 
> Long time since I developed using submodules, so I now forgot some catches.
> Anyway I will play with those commands tomorrow to try to understand.
> 
> [snip]
>> -    _git submodule update --init --recursive
>> +    _git submodule update --init --recursive --force
> 
> It seems --force does not exist on git 1.7.1.
> It is still possible I did something wrong when creating the docker image.
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/63519024

 No, it doesn't exist.

 Note that git 1.7.1 also doesn't have the .git files in the submodules; the
submodules have .git directories, i.e. they're indistinguishable from normal
repos. I think that that is not a problem for this patch, since I think git
1.7.1 *will* kill .git directories when doing git clean --ffdx, but I'm not
sure. Note that this implies that submodules will *not* be cached...

 I'm liking the bare repos more and more :-)

 Regards,
 Arnout

> It does work for git 1.8.3.
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/63525858
> 
> 
> Regards,
> Ricardo
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
