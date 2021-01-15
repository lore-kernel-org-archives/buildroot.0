From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Jan 2021 14:00:29 +0000
Subject: [Buildroot] =?utf-8?q?=5BBug_13321=5D_utils/scanpypi=3A_fails_wi?=
 =?utf-8?q?th_packages_that_define_a_package=E2=80=99s_metadata_in_setup?=
 =?utf-8?q?=2Ecfg?=
In-Reply-To: <bug-13321-163@https.bugs.busybox.net/>
References: <bug-13321-163@https.bugs.busybox.net/>
Message-ID: <bug-13321-163-RnpghupycU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13321

--- Comment #2 from Oliwia Zaremba <g.oliwia@gmail.com> ---
To provide more background on this issue: this is the result of PEP-517
(https://www.python.org/dev/peps/pep-0517/) getting a wider adoption. According
to the documentation:
https://setuptools.readthedocs.io/en/latest/setuptools.html#id4 the recommended
approach for Python packages is to define the dependencies decoratively in
setup.cfg. The deprecated calls to setup.py remain backwards compatible by
emulating a dummy setup.py with a setup() method call. In that case the method
is called without any arguments, and this is ultimately the reason
utils/scanpypi script fails for many packages that use this new approach. 

It seems to me that one possible solution to this would be to detect if the
setup.cfg exists and retrieve the package's metadata from it (e.g. using the
read_configuration method from setuptools.config). But I wonder if there exists
a Python native solution to retrieve the metadata (including install_requires
dependencies) from a Python package regardless whether PEP-517 convention is
used or not, and more importantly, without installing that package. Does anyone
know of such mechanism?

Also if anyone found a working solution to this, I would very much appreciate
if it can be shared.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
