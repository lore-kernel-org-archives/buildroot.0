From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 26 Apr 2017 15:56:09 +0200
Subject: [Buildroot] [PATCH 1/1] setlocalversion: fix detection of hg
 revision for untagged versions
In-Reply-To: <87r30fmhvp.fsf@dell.be.48ers.dk>
References: <20170426124311.11449-1-patrickdepinguin@gmail.com>
 <87r30fmhvp.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LXJ-0s88_sFygm0A+wFOTeorqHvBx5xCvBM4vm-T_hNaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

2017-04-26 15:13 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  > By default, cut prints the entire line if the specified delimiter is not
>  > present at all:
>
>  >     $ printf "foo bar" | cut -d' ' -f2
>  >     bar
>  >     $ printf "foobar" | cut -d' ' -f2
>  >     foobar
>
>  > In setlocalversion, cut is presented with the output of 'hg id' which has
>  > the format:
>
>  >     "<revision> <tags-if-any>"
>
>  > If the current revision is not tagged, the output of 'hg id' does not
>  > contain the delimiter (space), cut prints the entire string, and
>  > setlocalversion thinks the version is the tag.
>  > As setlocalversion does not print anything for tagged versions, there is no
>  > output overall, and no correct indication of the mercurial revision.
>
>  > Fix by passing the extra cut option '--only-delimited', which suppresses
>  > output if no delimiter is found.
>
>  > This problem likely went unnoticed for so long, because the tag 'tip' (i.e.
>  > most recent revision of the branch) is treated specially: in this case the
>  > mercurial revision _is_ printed, i.e. the situation is treated as
>  > 'untagged'.
>  > The problem is only seen when you are _not_ at the most recent revision in
>  > your branch.
>
> setlocalversion comes from the kernel. Do you have the same problem
> there?
>
> I see this particular line changed back in 2010 in the kernel repo:
>
>
> commit 8558f59edf935cf5ee5ffc29a9e9458fd9a71be1
> Author: Michal Marek <mmarek@suse.cz>
> Date:   Mon Aug 16 17:09:52 2010 +0200
>
>     setlocalversion: Ignote SCMs above the linux source tree
>
>     Dan McGee <dpmcgee@gmail.com> writes:
>     > Note that when in git, you get the appended "+" sign. If
>     > LOCALVERSION_AUTO is set, you will get something like
>     > "eee-gb01b08c-dirty" (whereas the copy of the tree in /tmp still
>     > returns "eee"). It doesn't matter whether the working tree is dirty or
>     > clean.
>     >
>     > Is there a way to disable this? I'm building from a clean tarball that
>     > just happens to be unpacked inside a git repository. One would think
>     > setting LOCALVERSION_AUTO to false would do it, but no such luck...
>
>     Fix this by checking if the kernel source tree is the root of the git or
>     hg repository. No fix for svn: If the kernel source is not tracked in
>     the svn repository, it works as expected, otherwise determining the
>     'repository root' is not really a defined task.
>
>     Reported-and-tested-by: Dan McGee <dpmcgee@gmail.com>
>     Signed-off-by: Michal Marek <mmarek@suse.cz>
>
>
> Perhaps synching with the kernel would be a better way forward than
> adding local modifications?


I tried using the latest version from the kernel in Buildroot and
notice the following:

- the version from the kernel now expects to find
include/config/auto.conf and bails out otherwise. Commenting out this
test...
- the output of that script is now just a +   i.e. the actual output
of the scm version does not matter. This is due to following code:
        scm=$(scm_version --short)
        res="$res${scm:++}"

   which means: if scm is empty, don't change res -- if scm is not
empty, then the literal '+' is appended to res.
- if I ignore that point and check the actual content of the 'scm'
variable, I notice that this script suffers from the same problem as
the buildroot one. My fix solves that aspect also in the kernel
script.


The kernel script has evolved a lot from the version that Buildroot
once took, I don't know if the changes have real value for us.
I also assume that the kernel developers will not really want to
customize their version of the script to add more configuration
switches to tweak the behavior.
https://github.com/torvalds/linux/blob/master/scripts/setlocalversion

Based on this feedback, how do you think we should proceed?

Thanks,
Thomas
