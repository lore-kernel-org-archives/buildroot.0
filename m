From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 17 Mar 2020 21:58:11 +0200
Subject: [Buildroot] scripts invoking code outside the per-package directory
Message-ID: <CALFsTFUwPxA=-YP3TEQ=3nLG1UpONffiAs_NUXnzqOdpffh_qQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Recently, I upgraded my Buildroot version from 2019.11 to 2020.02 and
I tried to use per-package directories and parallel build.
My compilation has failed because:
* I have a host python package (let's call it "package A") which
installs a console script, which loads registered entry points and
does something.
* I have some other host python packages which register entry points
for package A.
* When a package wants to use the console script created by package A
- the registered entry points cannot be found.
After a little investigation I found out that the first line of the
console script instructs it to use the python interpreter of package A
(something like "#!<Package A per-package dir>/host/usr/bin/python). I
run a small grep and found it's not the only case (another one is the
easy_install utility, provided by setuptools).
I also managed to "solve" the problem by adding a configure step in
pkg-generic similar to the $(SED) we currently have on
PKG_PYTHON_FIXUP_SYSCONFIGDATA (scanning $(HOST_DIR)/bin and
$(HOST_DIR)/usr/bin), but I wonder if running this operation for
_every_ package is not too aggressive.

I think the problem is a little broader, because even without my
specific problem, which fails the compilation, we are probably running
console scripts which invokes code outside from the per-package
directory.
Any ideas for solving this issue?

Thanks,
Asaf.
