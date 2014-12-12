From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 12 Dec 2014 21:04:45 +0100
Subject: [Buildroot] [PATCH v5 00/11] autobuild-run improvements
Message-ID: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This series against the buildroot-test repo makes some improvements to the
autobuild-run script.

v5:
- add two patches to handle kill/interrupt properly
- make the kwargs dictionary passing to Process more readable
- rebase

v4:
- rename do_send_results into upload (Peter)

v3:
- introduce missing usage of do_send_results (and move patch backwards)
- update TODO list

v2:
- reorder patches
- take into account comments on boolean logic in first patch
- place docopt directly in scripts/ instead of in a subdirectory
- remove patch adding --git (Yann, Thomas)
- some bug fixes in the first version of the patches

As you can see, this iteration still has the docopt patches. Thomas Petazzoni
has expressed his reservations against the introduction of docopt, because the
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
  scripts: add python module docopt
  autobuild-run: use docopt for argument parsing
  autobuild-run: add option --make-opts for custom Buildroot options
  autobuild-run: use **kwargs to avoid explicit parameter passthroughs
  autobuild-run: check-requirements does not need to know the login
    details
  autobuild-run: set LC_ALL=C to not use locale settings of host machine
  autobuild-run: improve the logic to generate build-end.log
  autobuild-run: save config.log files for failed package
  autobuild-run: extend TODO list
  autobuild-run: kill all children on SIGTERM
  autobuild-run: catch KeyboardInterrupt in the same way as SIGTERM

 scripts/autobuild-run      | 350 +++++++++++++++++++--------
 scripts/docopt.LICENSE-MIT |  23 ++
 scripts/docopt.py          | 581 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 851 insertions(+), 103 deletions(-)
 create mode 100644 scripts/docopt.LICENSE-MIT
 create mode 100644 scripts/docopt.py

-- 
1.8.5.1
