From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 13 Jun 2021 13:16:49 +0000
Subject: [Buildroot] [Bug 13836] package build failure when target install
 set to no on pkg-generic pkg types
In-Reply-To: <bug-13836-163@https.bugs.busybox.net/>
References: <bug-13836-163@https.bugs.busybox.net/>
Message-ID: <bug-13836-163-WpUqSZQsoe@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13836

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
             Status|NEW                         |ASSIGNED

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Matt, All,

> PACKAGE_A_INSTALL_TARGET = NO
> /bin/sh: /home/tbuild/myboard/build/package_a/.files-list.after: No such file or directory
> make[1]: *** [/home/tbuild/myboard/build/package_a/.stamp_installed] Error 1
> make: *** [_all] Error 2

I could indeed replicate with just;

    PACKAGE_A_SOURCE =
    PACKAGE_A_INSTALL_TARGET = NO
    $(eval $(generic-package))

However,m this is not specific to generic-package; it also happens with
autotools-package (I tested), and I suppose with any of our package
infras (untested, but I fail to see why it swould not).

Also, it occurs even if said package is not the last.

However, it only occurs in the situation where a package does not want
to be installed in target, but does not request being installed in
staging or images either. If the package installs to one or more of
those locations, then there is no error. That is, it's a package that
does not install anything at all, anywhere at all.

In this case, the package does not even get downloaded, patched,
configured, or built.

Does it even make sense at all to begin with? Shouldn't we detect that
situation instead, and error out with a better error message?

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
