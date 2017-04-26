From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 15:13:30 +0200
Subject: [Buildroot] [PATCH 1/1] setlocalversion: fix detection of hg
	revision for untagged versions
In-Reply-To: <20170426124311.11449-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 26 Apr 2017 14:43:11 +0200")
References: <20170426124311.11449-1-patrickdepinguin@gmail.com>
Message-ID: <87r30fmhvp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > By default, cut prints the entire line if the specified delimiter is not
 > present at all:

 >     $ printf "foo bar" | cut -d' ' -f2
 >     bar
 >     $ printf "foobar" | cut -d' ' -f2
 >     foobar

 > In setlocalversion, cut is presented with the output of 'hg id' which has
 > the format:

 >     "<revision> <tags-if-any>"

 > If the current revision is not tagged, the output of 'hg id' does not
 > contain the delimiter (space), cut prints the entire string, and
 > setlocalversion thinks the version is the tag.
 > As setlocalversion does not print anything for tagged versions, there is no
 > output overall, and no correct indication of the mercurial revision.

 > Fix by passing the extra cut option '--only-delimited', which suppresses
 > output if no delimiter is found.

 > This problem likely went unnoticed for so long, because the tag 'tip' (i.e.
 > most recent revision of the branch) is treated specially: in this case the
 > mercurial revision _is_ printed, i.e. the situation is treated as
 > 'untagged'.
 > The problem is only seen when you are _not_ at the most recent revision in
 > your branch.

setlocalversion comes from the kernel. Do you have the same problem
there?

I see this particular line changed back in 2010 in the kernel repo:


commit 8558f59edf935cf5ee5ffc29a9e9458fd9a71be1
Author: Michal Marek <mmarek@suse.cz>
Date:   Mon Aug 16 17:09:52 2010 +0200

    setlocalversion: Ignote SCMs above the linux source tree

    Dan McGee <dpmcgee@gmail.com> writes:
    > Note that when in git, you get the appended "+" sign. If
    > LOCALVERSION_AUTO is set, you will get something like
    > "eee-gb01b08c-dirty" (whereas the copy of the tree in /tmp still
    > returns "eee"). It doesn't matter whether the working tree is dirty or
    > clean.
    >
    > Is there a way to disable this? I'm building from a clean tarball that
    > just happens to be unpacked inside a git repository. One would think
    > setting LOCALVERSION_AUTO to false would do it, but no such luck...

    Fix this by checking if the kernel source tree is the root of the git or
    hg repository. No fix for svn: If the kernel source is not tracked in
    the svn repository, it works as expected, otherwise determining the
    'repository root' is not really a defined task.

    Reported-and-tested-by: Dan McGee <dpmcgee@gmail.com>
    Signed-off-by: Michal Marek <mmarek@suse.cz>


Perhaps synching with the kernel would be a better way forward than
adding local modifications?

-- 
Bye, Peter Korsgaard
