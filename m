From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 10 Jun 2015 13:24:20 +0200
Subject: [Buildroot] New version of Kconfiglib available
Message-ID: <CAFkk2KT==_HeF2ncQfoC0S9jc7MYHyC7Z7EK_jSVs3_SA250zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've done lots of internal cleanup and optimization and fixed a few small
bugs/incompatibilities in Kconfiglib (https://github.com/ulfalizer/Kconfiglib):

 - Unset user values when loading a zero-byte .config. (5e54e2c)
 - Ignore indented .config assignments. (f8a7510)
 - Do not require $srctree to be set for non-kernel projects. (d56e9c1)

Python 3 is supported now as well.

It should be a quick copy-paste update of kconfiglib.py. Just to be paranoid, I
verified that gen-manual-lists.py generates the same output with the new
version. It might run slightly faster too, though I guess that isn't very
important here. :P

https://github.com/ulfalizer/Kconfiglib/commit/d56e9c1d4c3e6f560382ac71fa2419b2a9bef1cb
summarizes of the last bug. There's no need to set $srctree in
gen-manual-lists.py if it isn't referenced in the Kconfigs. gen-manual-lists.py
could just do

self.config = kconfiglib.Config(os.path.join(self.base_dir,
                                             self.root_config),
                                base_dir = self.base_dir)

(That works with the old version too.)

I haven't run into the first two bugs in the wild by the way.

Cheers,
Ulf
