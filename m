From: Paul Kasemir <paul.kasemir@ui.com>
Date: Thu, 9 Jan 2020 11:09:19 -0700
Subject: [Buildroot] Potential issue with per package directory hard link
Message-ID: <CA+Vmb_ebsMv-UQ8pJoOr0W-pwmU_rdwRJDRgE8hw2paVDE05-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas et. al,

Regarding this line in the per package directory core changes:
https://github.com/buildroot/buildroot/commit/c4e6d5c8be6ada8e7c60950e3b499c55d48761cb#diff-4ba3c73225b6850a34a3077526e4105cR146

Using hard links is a good idea, but it also lets you shoot yourself in the
foot a little bit.

Take this example
PackageA builds and installs FileA to staging
PackageB builds and modifies FileA is such a way that FileA doesn't work
anymore

Since it is a hardlink, FileA is now broken for all packages depending on
PackageA and you would need to rebuild both PackageA to get a working copy
again, even though PackageB was the one that corrupted the file.

Not sure if you can come up with another way that would enforce a new file
created if the file is modified. Using sed -i 'expr' FileA is fine, but
using echo "something" >> FileA will modify all versions.

I've thought of using unionfs, but that would probably add a lot more
complication than its worth and you would have tons of mounts you would
then need to manage. I've also tried inotify, but it didn't seem reliable
and is also a bit complicated to manage.

I just thought I would bring this to your attention in case you weren't
already aware of it.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200109/fe01f2f7/attachment.html>
