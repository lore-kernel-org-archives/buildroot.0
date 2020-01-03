From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Jan 2020 20:57:02 +0100
Subject: [Buildroot] [PATCH 0/2] package/linux-tools: add microsoft HyperV
 integration services (branch yem/hyperv)
Message-ID: <cover.1578081397.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series introduces the Microsoft HyperV (HV) integration
services daemons, as options to the linux-tools package.

The guts of the changes were done by Pascal, and Pascal deserve the most
kudos for their initial work. ;-)

However, I (Yann) have done quite some deep changes.

Where Pascal provided three init scripts, one for each daemon, all
identical save for the name of the daemon itself, I did gather the three
into a single one, which is responsible for starting all three daemons;
see the details in patch 2. On IRC, Pascal said they were not totally
very happy with this change. We need to come to a conclusion on this
(initial patch: https://patchwork.ozlabs.org/patch/1217243/).

Additionally, the initial work used three independent sub-packages, one
for each program. Again, they were mostly identical, save for the name
of the program, and a very trivial deviation for one of them. There
again, I aggregated the three into a single sub-package, and removed the
sub-menu in favour of three sub-options (like we already had for perf).

Finally, after discussions on IRC, Pascal and I concluded that we did
not need to install the helper scripts for one of the program, because
they do not make sense for Pascal's use-case (they would not be able to
test them), and the ones installed by the kernel are just templates that
would not even work in Buildroot's case anyway.

What I did not change, however, was the renaming of the programs.
Pascal's initial work did a rename of the programs upon installation,
and names them as RedHat/Ubuntu do. However, I checked that Ubuntu does
in fact not rename the tools, but Pascal has a good case that the names
are better, and at least matches the name of the runtime helpers
location directory. I kept the renaming, but still think this is up for
debate...

Now, I'd like to thank Pascal for their initial work, and for their
precious help and comments on IRC. Thanks! :-)


Regards,
Yann E. MORIN.


The following changes since commit 198bdaadd03f75fe959c21089c354d36c90069bc

  .gitlab-ci.yml: add missing python-avro test (2020-01-02 21:55:22 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 07a3e4666570e40666cc8dd518ffce582bbf7f38

  package/linux-tools: add hyperv integration services (2020-01-03 20:50:02 +0100)


----------------------------------------------------------------
Pascal de Bruijn (2):
      package/linux-tools: add support for installing init system files
      package/linux-tools: add hyperv integration services

 DEVELOPERS                               |  3 ++
 package/linux-tools/Config.in            | 37 ++++++++++++++++++
 package/linux-tools/S10hyperv            | 66 ++++++++++++++++++++++++++++++++
 package/linux-tools/hypervfcopyd.service | 11 ++++++
 package/linux-tools/hypervkvpd.service   | 11 ++++++
 package/linux-tools/hypervvssd.service   | 11 ++++++
 package/linux-tools/linux-tool-hv.mk.in  | 61 +++++++++++++++++++++++++++++
 package/linux-tools/linux-tools.mk       | 22 +++++++++++
 8 files changed, 222 insertions(+)
 create mode 100644 package/linux-tools/S10hyperv
 create mode 100644 package/linux-tools/hypervfcopyd.service
 create mode 100644 package/linux-tools/hypervkvpd.service
 create mode 100644 package/linux-tools/hypervvssd.service
 create mode 100644 package/linux-tools/linux-tool-hv.mk.in

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
