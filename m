From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  2 Jan 2018 11:33:29 -0500
Subject: [Buildroot] [PATCH 0/8] python: clean up host version logic.
Message-ID: <20180102163337.6334-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, packages that rely on host-python, and are compatible with both
python2 and 3, only build python3 if python3 is selected for the target.

This causes a problem in the following scenario:

- A user does not have a target python selected.
- Package A depends on host-python3
- Package B is compatible with host-python and host-python3

In this scenario, host-python is not needed, as package A and B are
both compatible with python3. However; both host-python and host-python3 will
be built because no target-python has been selected.

To fix this, the following patch series introduces a few minimal changes
that will allow the user to manually select a host version of python.
(Note: I have changed only the packages that I personally use and have tested.)

Adam Duskett (8):
  python: add host-entry
  python3: add host-entry
  python-setuptools: check host-python version
  pkg-waf.mk: check host-python version
  ninja: check host-python version
  libselinux: check host-python version
  setools: check host-python version
  libselinux: check host-python version

 package/Config.in.host                         |  2 ++
 package/libselinux/libselinux.mk               |  2 +-
 package/libsemanage/libsemanage.mk             |  2 +-
 package/ninja/ninja.mk                         |  2 +-
 package/pkg-waf.mk                             | 20 +++++++++++++-------
 package/python-setuptools/python-setuptools.mk | 10 +++++++++-
 package/python/Config.in.host                  |  6 ++++++
 package/python3/Config.in.host                 |  6 ++++++
 package/setools/setools.mk                     |  6 ++++++
 9 files changed, 45 insertions(+), 11 deletions(-)
 create mode 100644 package/python/Config.in.host
 create mode 100644 package/python3/Config.in.host

-- 
2.14.3
