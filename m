From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Nov 2019 20:07:04 +0100
Subject: [Buildroot] [PATCH v2 0/2] Support excluding .py files from removal
Message-ID: <20191129190707.710738-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a v2 of the patch series fixing the OpenCV3 issue due to the
removal of .py files when only .pyc files are kept on the target.

As reported by Peter, the v1 caused some check-package warnings due to
the PYTHON_KEEP_PY_FILES/PYTHON3_KEEP_PY_FILES variables that were set
in opencv3.mk: they have a prefix that doesn't match the package name.

So in the end, we go ahead and create a <pkg>_KEEP_PY_FILES variable,
that gets collected by pkg-generic.mk into a global
PYTHON_KEEP_PY_FILES, which in turn is observed by python.mk and
python3.mk.

Best regards,

Thomas

Thomas Petazzoni (2):
  package/{pkg-generic,python,python3}: add mechanism to exclude .py
    files from removal
  package/opencv3: ensure the python module works when
    BR2_PACKAGE_PYTHON{,3}_PYC_ONLY=y

 package/opencv3/opencv3.mk | 2 ++
 package/pkg-generic.mk     | 1 +
 package/python/python.mk   | 4 +++-
 package/python3/python3.mk | 4 +++-
 4 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.23.0
