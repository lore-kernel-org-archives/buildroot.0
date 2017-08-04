From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 04 Aug 2017 16:43:42 +0000
Subject: [Buildroot] [Bug 10151] toolchain eclipse register : fails with a
 custom BR2_HOST_DIR
In-Reply-To: <bug-10151-163@https.bugs.busybox.net/>
References: <bug-10151-163@https.bugs.busybox.net/>
Message-ID: <bug-10151-163-xmEwKPN8tl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10151

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |arnout at mind.be
                   |.org                        |
             Status|NEW                         |ASSIGNED

--- Comment #4 from Arnout Vandecappelle <arnout@mind.be> ---
(In reply to Thomas Petazzoni from comment #2)
> I'm not really happy to add this host symlink just for the sake
> of making the eclipse-register-toolchain script work.

It's more that scripts in general (e.g. post-build scripts) may assume that
$(O)/host exists, and it just simplifies life in general if you can rely on it
being there. A bit like the staging symlink.

Note that things *will* break dramatically if you change BR2_HOST_DIR and try
to rebuild. So there can be no argument of "the symlink could dangle".

> Instead, we should pass $(HOST_DIR) as argument to eclipse-register-toolchain.

HOST_DIR is already exported, no need to add an argument.

However, if you look at the script, you'll see that it just checks that
${project_directory}/host exists, but this directory is *not* encoded in the
eclipse toolchains file. Since there is apparently no way to pass BR2_HOST_DIR
to eclipse, I guess a non-default BR2_HOST_DIR can't be supported without
changing both the eclipse plugin and the toolchains file. That, in turn,
requires a synchronised update, and old Buildroots won't run with the new
eclipse plugin and vice versa...

In short: I propose to add the symlink :-)
http://patchwork.ozlabs.org/patch/797910/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
