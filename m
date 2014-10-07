From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Oct 2014 15:01:56 +0200
Subject: [Buildroot] [PATCH 1/1] .mk files: bulk aligment and whitespace
	cleanup of assignments
In-Reply-To: <1412665563-5103-1-git-send-email-patrickdepinguin@gmail.com>
 (Thomas De Schampheleire's message of "Tue, 7 Oct 2014 09:06:03
 +0200")
References: <1412665563-5103-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <871tqkhw3f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > The Buildroot coding style defines one space around make assignments and
 > does not align the assignment symbols.

 > This patch does a bulk fix of offending packages. The package
 > infrastructures (or more in general assignments to calculated variable
 > names, like $(2)_FOO) are not touched.

 > Alignment of line continuation characters (\) is kept as-is.

 > The sed command used to do this replacement is:
 > find * -name "*.mk" | xargs sed -i \
 >     -e 's#^\([A-Z0-9a-z_]\+\)\s*\([?:+]\?=\)\s*$#\1 \2#'
 >     -e 's#^\([A-Z0-9a-z_]\+\)\s*\([?:+]\?=\)\s*\([^\\]\+\)$#\1 \2 \3#'
 >     -e 's#^\([A-Z0-9a-z_]\+\)\s*\([?:+]\?=\)\s*\([^\\ \t]\+\s*\\\)\s*$#\1 \2 \3#'
 >     -e 's#^\([A-Z0-9a-z_]\+\)\s*\([?:+]\?=\)\(\s*\\\)#\1 \2\3#'

 > Brief explanation of this command:
 >     ^\([A-Z0-9a-z_]\+\)     a regular variable at the beginning of the line
 >     \([?:+]\?=\)            any assignment character =, :=, ?=, +=
 >     \([^\\]\+\)             any string not containing a line continuation
 >     \([^\\ \t]\+\s*\\\)     string, optional whitespace, followed by a
 >                             line continuation character
 >     \(\s*\\\)               optional whitespace, followed by a line
 >                             continuation character

 > Hence, the first subexpression handles empty assignments, the second
 > handles regular assignments, the third handles regular assignments with
 > line continuation, and the fourth empty assignments with line
 > continuation.

 > This expression was tested on following test text: (initial tab not
 > included)

 > 	FOO     = spaces before
 > 	FOO     =   spaces before and after
 > 	FOO	= tab before
 > 	FOO	  = tab and spaces before
 > 	FOO =	tab after
 > 	FOO =	   tab and spaces after
 > 	FOO =   	spaces and tab after
 > 	FOO =    \
 > 	FOO = bar \
 > 	FOO = bar space    \
 > 	FOO   =		   \
 > 	GENIMAGE_DEPENDENCIES   = host-pkgconf libconfuse
 > 	FOO     += spaces before
 > 	FOO     ?=   spaces before and after
 > 	FOO     :=
 > 	FOO     =
 > 	FOO	=
 > 	FOO	  =
 > 	FOO =
 > 	   $(MAKE1) CROSS_COMPILE=$(TARGET_CROSS) -C
 > 	AT91BOOTSTRAP3_DEFCONFIG = \
 > 	AXEL_DISABLE_I18N=--i18n=0

 > After this bulk change, following manual fixups were done:
 > - fix line continuation alignment in cegui06 and spice (the sed
 >   expression leaves the number of whitespace between the value and line
 >   continuation character intact, but the whitespace before that could have
 >   changed, causing misalignment.
 > - qt5base was reverted, as this package uses extensive alignment which
 >   actually makes the code more readable.

 > Finally, the end result was manually reviewed.

Committed, thanks. I verified with git diff -w that it only contains
white space changes.

-- 
Bye, Peter Korsgaard
