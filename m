From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2020 09:13:21 +0100
Subject: [Buildroot] [PATCH v2,3/3] package/parted: disable on uclibc
In-Reply-To: <20200213223644.2346193-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 13 Feb 2020 23:36:44 +0100")
References: <20200213223644.2346193-1-fontaine.fabrice@gmail.com>
 <20200213223644.2346193-3-fontaine.fabrice@gmail.com>
Message-ID: <87a75ld1su.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Like postgreSQL (and imagemagick), parted does not build against uClibc
 > with locales enabled, due to an uClibc bug, see
 > http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html:

 > In file included from atari.c:42:
 > atari.c: In function 'atr_part_correct':
 > atari.c:221:9: error: dereferencing pointer to incomplete type 'struct __uclibc_locale_struct'
 >   return isalnum_l(part->id[0], atr_c_locale)
 >          ^~~~~~~~~

 > So disable parted on uclibc

 > Fixes:
 >  - http://autobuild.buildroot.org/results/992518d340a9f32a0721d6e66936850c4c3ef2e4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Peter Korsgaard):
 >  - Update parted's reverse dependencies

Committed after fixing the white space issues, thanks.

check-package warns about this:

Applying: package/parted: disable on uclibc
package/python-pyparted/Config.in:15: line contains trailing whitespace
package/python-pyparted/Config.in:15: empty line at end of file
92 lines processed
2 warnings generated

Consider adding a post-commit hook with it, E.G. something like:

cat .git/hooks/post-commit
#!/bin/sh
#
# An example hook script that is called after a successful
# commit is made.
#
# To enable this hook, rename this file to "post-commit".

# check-package on added/changed files
git show --no-renames HEAD | \
        lsdiff -s | \
        awk '{ if ($1 != "-") print substr($2, 3) }' | \
        xargs -r ./utils/check-package

-- 
Bye, Peter Korsgaard
