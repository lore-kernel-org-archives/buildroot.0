From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 19 Oct 2014 21:29:56 +0200
Subject: [Buildroot] [PATCHv2 buildroot-test 00/11] autobuild-run
	improvements
Message-ID: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This series against the buildroot-test repo makes some improvements to the
autobuild-run script. The changes that matter to me most are the support for
make-opts and a custom git wrapper, as I need this in order to run
autobuild-run in a corporate environment.

However, the series also includes some other changes:
- introduction of docopt to simplify the addition of new arguments/options
- general improvements to the script

v2:
- reorder patches
- take into account comments on boolean logic in first patch
- place docopt directly in scripts/ instead of in a subdirectory
- remove patch adding --git (Yann, Thomas)
- some bug fixes in the first version of the patches

As you can see, v2 still has the docopt patches. Thomas Petazzoni has
expressed his reservations against the introduction of docopt, because the
benefits wouldn't weigh out against the addition of an external Python module.
Thomas told me on IRC he would have a deeper look onto this before making a
final decision.
In case the final decision is not to introduce docopt, following improvements
could be done to the current code:
  - save the arguments from the command-line into a dictionary instead of plain
    variables
  - keep the added ini_config() method to also save the options in a dictionary,
    and use the added merge() method to merge both arguments and config options
    into one final configuration, without needing to handle it manually.


Thomas De Schampheleire (11):
  autobuild-run: check-requirements does not need to know the login
    details
  autobuild-run: convert regular function comments into docstrings
  autobuild-run: create main method to locally-scope all variables
  scripts: add python module docopt
  autobuild-run: use docopt for argument parsing
  autobuild-run: add option --make-opts for custom Buildroot options
  autobuild-run: use **kwargs to avoid explicit parameter passthroughs
  autobuild-run: set LC_ALL=C to not use locale settings of host machine
  autobuild-run: improve the logic to generate build-end.log
  autobuild-run: save config.log files for failed package
  autobuild-run: extend TODO list

 scripts/autobuild-run      | 382 +++++++++++++++++++----------
 scripts/docopt.LICENSE-MIT |  23 ++
 scripts/docopt.py          | 581 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 857 insertions(+), 129 deletions(-)
 create mode 100644 scripts/docopt.LICENSE-MIT
 create mode 100644 scripts/docopt.py

-- 
1.8.5.1
