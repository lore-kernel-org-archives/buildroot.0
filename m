From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 22:13:52 +0200
Subject: [Buildroot] [PATCH v2] package/python-numpy: fix occasional
 build failure with lapack
In-Reply-To: <20190515210342.126951-1-giulio.benetti@micronovasrl.com>
References: <eb24ad7d-6de2-085d-d3e0-9037c3d5cf81@micronovasrl.com>
 <20190515210342.126951-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190518221352.0630eaa6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 May 2019 23:03:42 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> python-numpy build fails only if lapack is built before python-numpy
> itself, and this doesn't always happen because lapack dependency is
> missing in BR2_PYTHON_NUMPY_DEPENDENCIES. clapack is present
> instead, but it's wrong since we're checking $(BR2_PACKAGE_LAPACK) not
> $(BR2_PACKAGE_CLAPACK).

I don't follow here: in the current code, we're checking
BR2_PACKAGE_CLAPACK and adding clapack to PYTHON_NUMPY_DEPENDENCIES,
which is consistent.

In order to better understand the problem. Without this patch:

 - Does python-numpy builds fine when neither clapack nor lapack are
   enabled ?

 - Does python-numpy builds fine when clapack is enabled, but not
   lapack ?

 - What happens when both clapack and lapack are enabled ?

Also, perhaps we need:

	select BR2_PACKAGE_LAPACK_COMPLEX if BR2_PACKAGE_LAPACK

in the Config.in file, so that it's a bit easier for users: they don't
have to know they need that specific sub-option of lapack.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
