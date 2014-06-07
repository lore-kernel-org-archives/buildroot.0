From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Jun 2014 23:46:03 +0200
Subject: [Buildroot] [RFCv1 0/4] Generating a graph of the size installed by
	each package
Message-ID: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I gave a training this week, and one of the question I had was how to
analyze the size of the things that are present on the root
filesystem. And I thought that Buildroot was lacking a tool to help
with this. Therefore, the following set of commits implement a script
that generates a pie chart of the size contribution of each package to
the target root filesystem.

To see an example of the generated pie chart, see:

  http://free-electrons.com/~thomas/pub/buildroot/graph-size.pdf

The implementation consists in adding a global instrumentation hook
that registers which files are installed by each package. A limitation
of the current implementation is that when a file is installed by a
package A and then overriden by package B, the mechanism will assume
the file was installed by package A. Suggestions to welcome on how to
solve this in a reasonably simple way.

The size contribution of each package is not computed directly in the
global instrumentation hook, because all the stripping and cleanup
work takes place in target-finalize, after all packages are
installed. Therefore, the hook only registers the path of the files
that are installed.

The 'graph-size' make target then runs a Python scripts, that looks at
all files in $(TARGET_DIR) and is able to find out, thanks to the data
registered by the global instrumentation hook, to which package the
file belongs. Using this, it is quite simple to generate a pie chart.

Comments, ideas, suggestions are welcome.

Thomas

Thomas Petazzoni (4):
  toolchain-external: split target installation from staging
    installation
  pkg-generic: add step_pkg_size global instrumentation hook
  support/scripts: add graph-size script
  Makefile: implement a graph-size target

 Makefile                                           |   6 +
 package/pkg-generic.mk                             |  24 +++
 support/scripts/graph-size                         | 164 +++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |  36 ++++-
 4 files changed, 223 insertions(+), 7 deletions(-)
 create mode 100755 support/scripts/graph-size

-- 
2.0.0
