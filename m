From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 08:52:02 +0100
Subject: [Buildroot] [PATCH 1/2] package/{python,
 python3}: add mechanism to exclude .py files from removal
In-Reply-To: <20191127203404.291090-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 27 Nov 2019 21:34:03 +0100")
References: <20191127203404.291090-1-thomas.petazzoni@bootlin.com>
 <20191127203404.291090-2-thomas.petazzoni@bootlin.com>
Message-ID: <87blsvf7bx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When BR2_PACKAGE_PYTHON{,3}_PYC_ONLY=y, we force remove all .py files
 > from the system, as they have all been byte-compiled into their .pyc
 > variants.

 > However, it turns out that some packages (e.g: OpenCV) do some funky
 > things with a few .py files: they pass them through Python's
 > execfile() facility, which only works with .py files and not .pyc
 > files. It is used by OpenCV for example to read two small
 > configuration files.

 > In order to support such use cases, this commit introduces a very
 > simple mechanism by which packages can exclude some path patterns from
 > the .py removal. The mechanism is a simple global
 > PYTHON{,3}_KEEP_PY_FILES, that packages can append to.

 > This is necessary to be able to fix bug #12171.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > Due to this only being needed by OpenCV for now, I didn't think it was
 > really needed to have a per-package variable, which then gets
 > collected by the generic-package infrastructure into a global
 > variable. We can always revisit if this gets more widely.

I agree, but this does cause a check-package warning from opencv3.mk:

package/opencv3/opencv3.mk:331: possible typo: PYTHON_KEEP_PY_FILES -> *OPENCV3*
package/opencv3/opencv3.mk:343: possible typo: PYTHON3_KEEP_PY_FILES -> *OPENCV3*

-- 
Bye, Peter Korsgaard
