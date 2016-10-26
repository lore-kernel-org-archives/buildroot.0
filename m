From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Oct 2016 22:08:09 +0200
Subject: [Buildroot] [PATCH] core/download: remove support for special git
	refs
Message-ID: <1477512489-14710-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

f8b8251a (support/download: fetch all refs on full git clone) added
support for fetching so-called special refs, to retrieve changesets from
code-review tools like Gerrit or Github PRs.

However, the use-case for using those special refs is not entirely
clear, and is getting more and more complex (with still-pending patches
about that).

Those special refs are from code-review tools. As such, they are very
volatile in nature: re-pushing a rebased branch to github would change
the content fetched with such a ref (Gerrit seems to be more
conservative, but still). So, they cannot be used for reproducible
builds:
  - they can't be used in a .mk file (normal packages)
  - they can't be used in a .config file (linux, bootloader...)

So, going back to the black board, two main use-cases have been
identified:
  - a developper that wants to manually test a PR
  - an automated build farm that automatically builds a known
    configuration against PRs

In either case, there is a better solution that we've been advertising
all along: the override-srcdir mechanism.

Whether by a build farm or a developper, it looks like it would be much
easier to do the clone (or a fetch from an existing repo), write a
local.mk with an override-srcdir, and kick off the build, rather than do
the various tweaking (in .mk and/or .config).

(note: a developper that wants to test a PR is probably already active
on that project, so will already have a local clone, so the fetch would
only grab very few blobs, wo will be very fast).

So, just remove the support for such special refs altogether.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Henrique Marks <henrique.marks@datacom.ind.br>
---
 support/download/git | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/support/download/git b/support/download/git
index 7921411..c46422d 100755
--- a/support/download/git
+++ b/support/download/git
@@ -61,17 +61,6 @@ fi
 
 pushd "${basename}" >/dev/null
 
-# Try to get the special refs exposed by some forges (pull-requests for
-# github, changes for gerrit...). There is no easy way to know whether
-# the cset the user passed us is such a special ref or a tag or a sha1
-# or whatever else. We'll eventually fail at checking out that cset,
-# below, if there is an issue anyway. Since most of the cset we're gonna
-# have to clone are not such special refs, consign the output to oblivion
-# so as not to alarm unsuspecting users, but still trace it as a warning.
-if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
-    printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
-fi
-
 # Checkout the required changeset, so that we can update the required
 # submodules.
 _git checkout -q "'${cset}'"
-- 
2.7.4
