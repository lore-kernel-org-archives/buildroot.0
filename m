From: Esben Nielsen <nielsen.esben@gmail.com>
Date: Sun, 31 Mar 2019 23:51:18 +0200
Subject: [Buildroot] Failed to build in a user namespace without the root
 user
Message-ID: <CA+gSDyRCnG0HuJ4QVsFoROqCHBkn+MR7H39BQBmzHfHRm2B5gA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I try to build in an unpriviliged container (using bubblewrap), where
I only have a single user id, not uid 0.

I found the issue was in fakeroot, which per default when it does
chown, it also asks the kernel if the id it does chown to actually
exists. This is the default behaviour.
Shouldn't it totally ignore the uid and gid map in the user namespace
in the kernel?

When I read the fakeroot code, it does that, when I set the
environment variable FAKEROOTDONTTRYCHOWN.

Shoudln't that be default in buildroot? It is totally irrelevant,
which is uids are mapped on the host when building a rootfs to run
somewhere else.

I solved it locally by setting that environment variable.

Esben Nielsen
