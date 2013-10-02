From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 2 Oct 2013 16:06:13 +0200
Subject: [Buildroot] Some legal-info observations/problems
Message-ID: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am starting to use the legal-info infrastructure now, and this
resulted in a number of observations/problems, which I'll list below.

1. there is no longer a provision to 'hide' proprietary packages from
the manifest, and not get warnings on them. Previously you could mark
a package as license: PROPRIETARY, but this has been removed. I still
think that a similar feature is useful.

2. suppose FOO_LICENSE_FILES = subdir/COPYING, then the manifest also
contains the string 'subdir/COPYING'. However, the license is copied
into a flat structure output/legal-info/licenses/foo/, so I think that
the manifest should no longer mention the 'subdir'.
Of course, this may contradict with the needs of licenses.txt (the
flat representation of all licenses) that does not suffer from the
subdir problem.

3. partially related to point 2: if a package has multiple license
files with the same name but in subdirectories, e.g. a/COPYING and
b/COPYING, the copying of the license will copy both files on top of
each other. This is the case for xenomai-forge (not yet in buildroot),
which is the new strategy for xenomai [1]. I have brought up this
issue with the developers [2], but maybe there is something else we
can do.

[1] http://git.xenomai.org/?p=xenomai-forge.git;a=summary
[2] http://www.xenomai.org/pipermail/xenomai/2013-October/029262.html

4. Suppose that a package has no license files and explicitly declares
this with FOO_LICENSE_FILES =
In this case, you will still get a warning: "cannot save license
(FOO_LICENSE_FILES not defined)", but in fact it is simply empty.
I think it would be better to distinghuish the situation 'empty' and
'not defined'.

5. the manifest also lists all host packages, like automake, autoconf,
... while these are not distributed on target. Strictly speaking you
do not have to list these in the customer documentation of a product,
in my interpretation. I find it confusing that both target and host
packages are mixed like that.
Of course, it's probably difficult to change this, because some
packages can be built for host _and_ target, and the legal-info
infrastructure does not know which of these was used for a particular
project.

Best regards,
Thomas
