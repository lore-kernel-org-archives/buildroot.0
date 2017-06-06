From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 5 Jun 2017 21:39:18 -0500
Subject: [Buildroot] GIT download helper and submodules versioning
Message-ID: <CANQCQpY7E8F3ZVnXRKSBy4-rnAL3eOQ+jWRcUzeZH9ivwthpww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I believe the current submodule args needs an additional --remote arg.
This allows you to set versioning/branches to pull in your .gitmodules
file and the --remote forces it to fetch the latest tips of that
branch.

(from support/download/git)
# There might be submodules, so fetch them.
if [ ${recurse} -eq 1 ]; then
    _git submodule update --init --recursive --remote
fi

A .gitmodules example file might be (example taken from
repolicy-contrib submodule, part of the refpolicy package still in
patchworks)
[submodule "policy/modules/contrib"]
        path = policy/modules/contrib
        url = https://github.com/foobar/refpolicy-contrib.git
        branch = RELEASE_2_20170204_MagicStuff

Compared to what sunxi-mali currently uses and it doesn't version what
it retrieves as a submodule.
[submodule "lib/mali"]
        path = lib/mali
        url = https://github.com/linux-sunxi/sunxi-mali-proprietary.git


Any thoughts on this one?  I tested sunxi-mali with the update and the
same archives were created with/without the remote option.  I don't
think we want to customize the gitmodules file on existing packages,
but if a package does correctly describe a version to sync for the
submodule, I'm assuming it should be respected.


-- 
Matt
